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

GENERATOR_FUNC = ctypes.CFUNCTYPE(None, ctypes.c_void_p)

STACK_CAPACITY = 1024 * os.sysconf('SC_PAGE_SIZE')  # Match the C implementation

class Generator(GeneratorStruct):
    def __init__(self, func):
        super().__init__()
        self.fresh = True
        self.dead = False
        self.func_obj = GENERATOR_FUNC(func)  # Keep reference to prevent GC
        self.func = ctypes.cast(self.func_obj, ctypes.c_void_p).value
        
        # Allocate stack
        self.stack_memory = (ctypes.c_uint8 * STACK_CAPACITY)()
        self.stack_base = ctypes.addressof(self.stack_memory)
        self.rsp = self.stack_base + STACK_CAPACITY - 16
        self.rsp = self.rsp - (self.rsp % 16)  # 16-byte alignment

def example_generator(arg):
    print("Generator started")
    result = lib.python_generator_yield(ctypes.c_void_p(1))
    print(f"Generator resumed with {result}")
    result = lib.python_generator_yield(ctypes.c_void_p(2))
    print(f"Generator resumed with {result}")
    print("Generator finished")

lib.python_generator_init()

# Create generator
gen = Generator(example_generator)

# Start generator
print("Starting generator")
result = lib.python_generator_next(ctypes.byref(gen), None)
print(f"Main got {result}")

# Resume generator twice
print("Resuming generator")
lib.python_generator_restore_context_with_return(gen.rsp, ctypes.c_void_p(42))
print("Resuming generator again")
lib.python_generator_restore_context_with_return(gen.rsp, ctypes.c_void_p(84))