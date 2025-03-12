import ctypes
import os

try:
    # Load the shared library
    lib = ctypes.CDLL('./libcoroutines.so')
except OSError as e:
    print(f"Error loading library: {e}")
    exit(1)

class GeneratorStruct(ctypes.Structure):
    _fields_ = [
        ("fresh", ctypes.c_bool),
        ("dead", ctypes.c_bool),
        ("_padding", ctypes.c_char * 6),  # Align to 8 bytes
        ("rsp", ctypes.c_void_p),
        ("stack_base", ctypes.c_void_p),
        ("func", ctypes.c_void_p),
    ]

lib.python_generator_init.argtypes = []
lib.python_generator_init.restype = None

lib.python_generator_next.argtypes = [ctypes.POINTER(GeneratorStruct), ctypes.c_void_p]
lib.python_generator_next.restype = ctypes.c_void_p

lib.python_generator_restore_context.argtypes = [ctypes.c_void_p]
lib.python_generator_restore_context.restype = None

lib.python_generator_restore_context_with_return.argtypes = [ctypes.c_void_p, ctypes.c_void_p]
lib.python_generator_restore_context_with_return.restype = None

lib.python_generator_yield.argtypes = [ctypes.c_void_p]
lib.python_generator_yield.restype = ctypes.c_void_p

# Direct access to assembly functions
lib.generator_yield.argtypes = [ctypes.c_void_p, ctypes.c_void_p]
lib.generator_yield.restype = ctypes.c_void_p

# Access to the generator stack
lib.generator_stack = ctypes.c_void_p.in_dll(lib, "generator_stack")

GENERATOR_FUNC = ctypes.CFUNCTYPE(None, ctypes.c_void_p)

STACK_CAPACITY = 1024 * os.sysconf('SC_PAGE_SIZE')  # Match the C implementation

class Generator(GeneratorStruct):
    def __init__(self, func):
        super().__init__()
        self.fresh = True
        self.dead = False
        self.func_obj = GENERATOR_FUNC(func)  # Keep reference to prevent GC
        self.func = ctypes.cast(self.func_obj, ctypes.c_void_p).value
        
        # Allocate stack - use a smaller stack for safety
        stack_size = 8192  # 8KB stack
        self.stack_memory = (ctypes.c_uint8 * stack_size)()
        self.stack_base = ctypes.addressof(self.stack_memory)
        
        # Print debug info
        print(f"DEBUG: Allocated stack at {hex(self.stack_base)} with size {stack_size}")
        
        # Initialize RSP to 0 - will be set by generator_next
        self.rsp = 0
    
    def next(self, arg=None):
        """Send a value to the generator and get the next yielded value."""
        if self.dead:
            return None
        
        try:
            if self.fresh:
                # First call, use generator_next
                # Pass self as the argument to the generator function
                return lib.python_generator_next(ctypes.byref(self), 
                                               ctypes.byref(self) if arg is None else ctypes.c_void_p(arg))
            else:
                # Resume with a value
                return lib.python_generator_yield(ctypes.c_void_p(arg) if arg is not None else None)
        except Exception as e:
            # Mark the generator as dead if an exception occurs
            self.dead = True
            print(f"Exception in generator: {e}")
            return None

def example_generator(arg):
    try:
        print("Generator started")
        print(f"Generator arg: {arg}")
        
        # Get the generator stack from the wrapper
        stack_ptr = ctypes.cast(lib.generator_stack, ctypes.c_void_p).value
        print(f"DEBUG: Generator stack at {hex(stack_ptr) if stack_ptr else 'NULL'}")
        
        if not stack_ptr:
            print("ERROR: Generator stack is NULL in generator function")
            return None
        
        # Call yield with the stack pointer
        result = lib.generator_yield(ctypes.c_void_p(1), ctypes.c_void_p(stack_ptr))
        print(f"Generator resumed with {result}")
        
        # Call yield with the stack pointer again
        result = lib.generator_yield(ctypes.c_void_p(2), ctypes.c_void_p(stack_ptr))
        print(f"Generator resumed with {result}")
        
        print("Generator finished")
        return None
    except Exception as e:
        print(f"Exception in generator function: {e}")
    finally:
        # Mark the generator as dead
        if arg:
            try:
                gen = ctypes.cast(arg, ctypes.POINTER(GeneratorStruct))
                if gen:
                    gen.contents.dead = True
            except Exception as e:
                print(f"Error marking generator as dead: {e}")

# Initialize the generator system
lib.python_generator_init()

# Create generator
gen = Generator(example_generator)

# Start generator
print("Starting generator")
try:
    result = gen.next(None)
    print(f"Main got {result}")

    # Resume generator twice
    print("Resuming generator")
    result = gen.next(42)
    print(f"Main got {result}")

    print("Resuming generator again")
    result = gen.next(84)
    print(f"Main got {result}")

    # One more call should return None since generator is finished
    print("Final call")
    result = gen.next(0)
    print(f"Main got {result}")
except Exception as e:
    print(f"Error in main: {e}")