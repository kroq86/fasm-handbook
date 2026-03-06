---
title: Handbook EN
permalink: /book-en/
---
<div class="book-shell">
<aside class="book-sidebar" markdown="1">
## Navigation

### Main sections
- [Part 1: CPU + ASM (12 chapters)](#part-1-core)
- [Part 2: FASM Reference](#part-2-fasm-reference)
- [Part 3: Example Catalog](#part-3-examples)
- [Part 4: Full Reference](#part-4-full-reference)
- [Part 5: AI FASM Rules](#part-5-ai-rules)
- [Part 6: Repository Map](#part-6-repo-map)

### CPU + ASM chapters
- [Chapter 1](#chapter-1)
- [Chapter 2](#chapter-2)
- [Chapter 3](#chapter-3)
- [Chapter 4](#chapter-4)
- [Chapter 5](#chapter-5)
- [Chapter 6](#chapter-6)
- [Chapter 7](#chapter-7)
- [Chapter 8](#chapter-8)
- [Chapter 9](#chapter-9)
- [Chapter 10](#chapter-10)
- [Chapter 11](#chapter-11)
- [Chapter 12](#chapter-12)

### FASM details
- [1. Program Structure](#en-fasm-1-structure)
- [2. System Calls](#en-fasm-2-syscalls)
- [3. File Operations](#en-fasm-3-files)
- [4. Data And Memory](#en-fasm-4-data)
- [5. Function Helpers](#en-fasm-5-helpers)
- [6. Register Conventions](#en-fasm-6-registers)
- [7. Error Handling](#en-fasm-7-errors)
- [8. Read Loop Pattern](#en-fasm-8-read-loop)
- [9. Number Printing Tricks](#en-fasm-9-numbers)
- [10. Optimization Notes](#en-fasm-10-opt)
- [11. Debugging](#en-fasm-11-debug)
- [12. Related Material](#en-fasm-12-related)
</aside>
<section class="book-content" markdown="1">
# Unified Book: CPU + FASM (EN)

This handbook combines processor fundamentals, assembly chapters, and full FASM reference material.

## Table of Contents

- [Part 1: Core Book (CPU + ASM, 12 chapters)](#part-1-core)
  - [Chapter 1: Understanding How Computers Work](#chapter-1)
  - [Chapter 2: CPU Basics](#chapter-2)
  - [Chapter 3: Introduction to Assembly](#chapter-3)
  - [Chapter 4: Control Flow in Assembly](#chapter-4)
  - [Chapter 5: From Machine Code to High-Level Languages](#chapter-5)
  - [Chapter 6: Understanding Program Execution](#chapter-6)
  - [Chapter 7: Introduction to Lisp](#chapter-7)
  - [Chapter 8: Functional Programming Concepts](#chapter-8)
  - [Chapter 9: Interpreter Fundamentals](#chapter-9)
  - [Chapter 10: Advanced Interpreter Features](#chapter-10)
  - [Chapter 11: Coroutines and Modern Programming](#chapter-11)
  - [Chapter 12: Bringing It All Together](#chapter-12)
- [Part 2: FASM Reference Guide](#part-2-fasm-reference)
- [Part 3: Example Catalog](#part-3-examples)
- [Part 4: Full Reference Guide](#part-4-full-reference)
- [Part 5: AI FASM Rules](#part-5-ai-rules)
- [Part 6: Repository Map](#part-6-repo-map)

---

<a name="part-1-core"></a>
# Part 1: Core Book (CPU + ASM, 12 chapters)

# Building a Computer from First Principles
## A Journey Through Computing, Assembly, and Lisp

*An educational guide based on practical implementation*

---

## Table of Contents

### Part 1: Computing Fundamentals
- [Chapter 1: Understanding How Computers Work](#chapter-1)
- [Chapter 2: CPU Basics](#chapter-2)
### Part 2: Assembly Language - The First Step
- [Chapter 3: Introduction to Assembly](#chapter-3)
- [Chapter 4: Control Flow in Assembly](#chapter-4)
### Part 3: Moving Up - Programming Language Concepts
- [Chapter 5: From Machine Code to High-Level Languages](#chapter-5)
- [Chapter 6: Understanding Program Execution](#chapter-6)
### Part 4: Lisp - A Beautiful Abstraction
- [Chapter 7: Introduction to Lisp](#chapter-7)
- [Chapter 8: Functional Programming Concepts](#chapter-8)
### Part 5: Building an Interpreter
- [Chapter 9: Interpreter Fundamentals](#chapter-9)
- [Chapter 10: Advanced Interpreter Features](#chapter-10)
### Part 6: Advanced Concepts
- [Chapter 11: Coroutines and Modern Programming](#chapter-11)
- [Chapter 12: Bringing It All Together](#chapter-12)

---

<a name="chapter-1"></a>
# Chapter 1: Understanding How Computers Work

## Learning Objectives
By the end of this chapter, you will:
- Understand the fundamental components of a computer
- Grasp how data is represented in binary
- Learn the basics of machine code
- Comprehend memory organization and processing concepts

## 1.1 The Basic Computer Architecture

At its core, a computer is a machine that processes information. This processing happens through the interaction of several key components:

### 1.1.1 Core Components
1. **Central Processing Unit (CPU)**
   - The "brain" of the computer
   - Executes instructions
   - Contains registers for temporary data storage
   - Performs arithmetic and logical operations

2. **Memory (RAM)**
   - Temporary storage for programs and data
   - Organized in addressable locations
   - Direct interaction with CPU
   - Volatile storage (clears when powered off)

3. **Input/Output (I/O)**
   - Interfaces with the outside world
   - Handles data input and output
   - Manages device communication

## 1.2 Binary and Data Representation

### 1.2.1 Understanding Binary
Binary is the fundamental language of computers. Let's explore why and how it works:

- **Binary Basics**
  - Uses only 0s and 1s
  - Each digit is called a "bit"
  - 8 bits = 1 byte

### 1.2.2 Number Representation
```
Decimal: 42
Binary:  00101010
Hex:     2A
```

### 1.2.3 Text Representation (ASCII)
```
'A' = 01000001
'B' = 01000010
'C' = 01000011
```

## 1.3 Introduction to Machine Code

Machine code is the lowest level of software programming and is executed directly by the CPU. Let's look at a simple example:

```assembly
; Simple machine code representation
10110000  ; Load value into register
00101010  ; The value 42
00000001  ; Store in memory
```

## 1.4 Memory and Processing

### 1.4.1 Memory Organization
- Memory is organized in a linear fashion
- Each location has a unique address
- Data is stored and retrieved using these addresses

### 1.4.2 Basic Processing Cycle
1. Fetch instruction from memory
2. Decode the instruction
3. Execute the instruction
4. Store the result
5. Repeat

## Practice Exercises

1. **Binary Conversion**
   - Convert the following numbers to binary:
     - 15
     - 127
     - 256

2. **Memory Addressing**
   - If you have 8 bits for addressing, how many unique memory locations can you reference?
   - How much memory can you address with 16 bits?

3. **Basic Machine Code**
   - Write the binary representation for:
     - Loading a value into a register
     - Adding two numbers
     - Storing a result in memory

## Review Questions

1. What are the primary components of a computer system?
2. How is data represented in binary?
3. What is the relationship between CPU and memory?
4. How does the basic instruction cycle work?

## Further Reading
- Computer Organization and Design (Patterson & Hennessy)
- Code: The Hidden Language of Computer Hardware and Software (Charles Petzold)

---

[Next Chapter: CPU Basics →](#chapter-2) 

<a name="chapter-2"></a>
# Chapter 2: CPU Basics

## Learning Objectives
By the end of this chapter, you will:
- Understand CPU architecture and components
- Learn how instructions are processed
- Implement a basic CPU simulator
- Work with registers and memory

## 2.1 CPU Architecture Deep Dive

### 2.1.1 The CPU's Core Components
Let's examine our `SimpleCPU` implementation to understand the essential components:

```python
# From our SimpleCPU implementation
class SimpleCPU:
    def __init__(self):
        self.registers = {'A': 0, 'PC': 0}  # Basic registers
        self.memory = [0] * 256             # 256 bytes of memory
```

Key components explained:
1. **Registers**
   - Program Counter (PC): Tracks current instruction
   - Accumulator (A): Primary calculation register
   - Why these are crucial for computation

2. **Memory Interface**
   - Direct memory access
   - Memory size and limitations
   - Memory-register interaction

## 2.2 Instruction Processing

### 2.2.1 The Instruction Set
From our implementation:
```python
# Basic instruction set
instructions = {
    "NOP": 0x00,  # No operation
    "LDA": 0x01,  # Load into accumulator
    "ADD": 0x02,  # Add to accumulator
    "HLT": 0xFF,  # Halt execution
}
```

### 2.2.2 Instruction Execution Cycle
```python
def execute(self):
    while True:
        if self.registers['PC'] >= len(self.memory):
            break  
        opcode = self.memory[self.registers['PC']]
        # Instruction processing...
```

## 2.3 Building a CPU Simulator

### 2.3.1 Implementation Steps
1. **Setting Up the Environment**
   - Register initialization
   - Memory allocation
   - Basic instruction set definition

2. **Implementing Instructions**
   ```python
   # Example instruction implementation
   elif opcode == 0x01:  # LDA immediate
       self.registers['A'] = self.memory[self.registers['PC'] + 1]
       self.registers['PC'] += 2
   ```

3. **Program Execution**
   - Fetch-decode-execute cycle
   - Program counter management
   - Handling different instruction types

## 2.4 Working with Assembly Code

### 2.4.1 Assembly to Machine Code
```python
def assemble(self, assembly_code):
    instructions = {
        "NOP": 0x00,
        "LDA": 0x01,
        "ADD": 0x02,
        "HLT": 0xFF,
    }
    # Assembly process...
```

### 2.4.2 Running Programs
Example program:
```assembly
LDA #5    ; Load 5 into accumulator
ADD #3    ; Add 3 to accumulator
HLT       ; Stop execution
```

## Practice Exercises

1. **CPU Simulator Enhancement**
   - Add a subtraction instruction
   - Implement a multiplication instruction
   - Add a new register for temporary storage

2. **Assembly Programming**
   - Write a program to add three numbers
   - Create a program that counts from 1 to 10
   - Implement a simple loop using your new instructions

3. **Debugging Practice**
   - Find the bug in this assembly code:
     ```assembly
     LDA #5
     ADD #3
     ADD #2
     ; Missing HLT instruction
     ```

## Review Questions

1. What are the primary components of our SimpleCPU?
2. How does the instruction execution cycle work?
3. Why do we need different types of registers?
4. How does assembly code get converted to machine code?

## Programming Challenges

1. Extend the SimpleCPU to include:
   - More registers
   - Additional instructions
   - Conditional branching

2. Create a program that:
   - Calculates Fibonacci numbers
   - Implements basic arithmetic
   - Uses multiple registers effectively

## Further Reading
- Computer Architecture: A Quantitative Approach
- Inside the Machine (Jon Stokes)
- The Elements of Computing Systems (Nisan & Schocken)

---

[← Previous Chapter](#chapter-1) | [Next Chapter: Introduction to Assembly →](#chapter-3) 

<a name="chapter-3"></a>
# Chapter 3: Introduction to Assembly

## Learning Objectives
By the end of this chapter, you will:
- Understand x86_64 assembly basics
- Write your first assembly programs
- Learn about system calls and I/O
- Implement mathematical algorithms in assembly

## 3.1 Understanding x86_64 Assembly

### 3.1.1 Basic Structure
Let's examine our Fibonacci implementation in assembly:

```nasm
format ELF64 executable   ; Specify the output format
entry main               ; Program entry point

; System call definitions
SYS_write equ 1         ; Write system call number
STDOUT equ 1            ; Standard output file descriptor
```

### 3.1.2 Registers and Their Purposes
Common registers in x86_64:
- `rax`: Accumulator, system call numbers
- `rdi`, `rsi`, `rdx`: Function/syscall parameters
- `r8`-`r15`: General purpose registers

From our implementation:
```nasm
mov     r10, a          ; Store first number
mov     r11, b          ; Store second number
mov     r12, 1          ; Counter
```

## 3.2 System Calls and I/O

### 3.2.1 Making System Calls
Our implementation shows clean system call handling:

```nasm
macro syscall3 number, a, b, c
{
    mov rax, number
    mov rdi, a
    mov rsi, b
    mov rdx, c
    syscall
}
```

### 3.2.2 Input/Output Operations
Example from our print function:
```nasm
print:
    mov     r9, -3689348814741910323
    sub     rsp, 40
    mov     BYTE [rsp+31], 10
    lea     rcx, [rsp+30]
```

## 3.3 Implementing Algorithms

### 3.3.1 The Fibonacci Sequence
Let's break down our implementation:

```nasm
macro fib a, b {
    mov r10, a         ; First number
    mov r11, b         ; Second number
    mov r12, 1         ; Counter

_loop:
    add r10, r11       ; Calculate next number
    mov r11, r10       ; Update sequence
    mov r10, r12       ; Update counter
    inc r12
    cmp r12, 5
    jle _loop
}
```

Key concepts:
1. Loop implementation
2. Register management
3. Arithmetic operations
4. Conditional branching

### 3.3.2 Memory and Stack Operations
```nasm
sub     rsp, 40        ; Allocate stack space
mov     BYTE [rsp+31], 10  ; Store newline
lea     rcx, [rsp+30]  ; Load effective address
```

## 3.4 Control Structures

### 3.4.1 Loops
From our implementation:
```nasm
loop_start:
    syscall3 SYS_write, STDOUT, greet_msg, greet_msg_len
    inc r8
    cmp r8, 10
    jle loop_start
```

### 3.4.2 Conditional Execution
```nasm
    cmp r12, 5         ; Compare counter with 5
    jle _loop          ; Jump if less or equal
```

## Practice Exercises

1. **Basic Assembly**
   - Write a program to add two numbers
   - Implement a counter program
   - Create a simple loop

2. **System Calls**
   - Write a program that prints "Hello, World!"
   - Read user input and echo it back
   - Implement file I/O operations

3. **Algorithm Implementation**
   - Write a program to calculate factorial
   - Implement a simple sorting algorithm
   - Create a number guessing game

## Programming Challenges

1. **Extended Fibonacci**
   - Modify the Fibonacci program to:
     - Handle larger numbers
     - Print the sequence
     - Allow user input for sequence length

2. **Mathematical Operations**
   - Implement division
   - Add floating-point operations
   - Create a simple calculator

## Review Questions

1. What are the main registers in x86_64 assembly?
2. How do system calls work in assembly?
3. What is the purpose of the stack?
4. How do you implement loops and conditions?

## Debugging Tips

1. **Common Issues**
   - Register value tracking
   - Stack alignment
   - System call parameters

2. **Debugging Tools**
   - Using GDB
   - Stack inspection
   - Register state examination

## Further Reading
- Professional Assembly Language (Richard Blum)
- Modern X86 Assembly Language Programming (Daniel Kusswurm)
- Linux System Programming (Robert Love)

## Solution Hints for Chapter 3 Exercises

### Basic Assembly Solutions
1. **Adding Two Numbers**:
```nasm
section .data
    num1 db 5
    num2 db 3
    
section .text
    mov al, [num1]    ; Load first number
    add al, [num2]    ; Add second number
    ; Result in al
```

2. **Counter Program**:
```nasm
    mov rcx, 0       ; Initialize counter
count_loop:
    inc rcx          ; Increment
    cmp rcx, 10      ; Compare with limit
    jl count_loop    ; Loop if less
```

3. **Simple Loop with I/O**:
```nasm
    mov r8, 0        ; Counter
print_loop:
    ; Your print routine here
    inc r8
    cmp r8, 5
    jle print_loop
```

### System Calls Solutions
1. **Hello World**:
```nasm
section .data
    msg db "Hello, World!", 10
    len equ $ - msg

section .text
    syscall3 SYS_write, STDOUT, msg, len
```

---

[← Previous Chapter](#chapter-2) | [Next Chapter: Control Flow in Assembly →](#chapter-4) 

<a name="chapter-4"></a>
# Chapter 4: Control Flow in Assembly

## Learning Objectives
By the end of this chapter, you will:
- Master complex control structures
- Implement conditional execution
- Understand function calls and stack frames
- Work with loops and branching

## 4.1 Advanced Control Structures

### 4.1.1 Conditional Branching
From our Fibonacci implementation:

```nasm
    cmp r12, 5         ; Compare counter with limit
    jle _loop          ; Jump if less or equal
    jmp exit           ; Jump to exit if greater
```

Common comparison instructions:
- `je/jz`: Jump if equal/zero
- `jne/jnz`: Jump if not equal/not zero
- `jg/jl`: Jump if greater/less
- `jge/jle`: Jump if greater or equal/less or equal

### 4.1.2 Complex Decision Making
```nasm
    cmp rax, 0
    je  handle_zero    ; If zero
    jl  handle_negative ; If negative
    ; Handle positive case
handle_zero:
    ; Zero handling code
handle_negative:
    ; Negative handling code
```

## 4.2 Function Implementation

### 4.2.1 Stack Frame Management
```nasm
my_function:
    push rbp           ; Save old base pointer
    mov rbp, rsp       ; Set up new base pointer
    sub rsp, 16        ; Allocate local variables
    
    ; Function body
    
    mov rsp, rbp       ; Restore stack
    pop rbp            ; Restore base pointer
    ret                ; Return to caller
```

### 4.2.2 Parameter Passing
x86_64 Linux calling convention:
```nasm
; Function parameters order:
; rdi, rsi, rdx, rcx, r8, r9
; Additional parameters on stack

call_example:
    mov rdi, first_param
    mov rsi, second_param
    call my_function
```

## 4.3 Loop Optimization

### 4.3.1 Loop Unrolling
```nasm
; Before unrolling
    mov rcx, 4
loop1:
    add rax, [rdi]
    add rdi, 8
    dec rcx
    jnz loop1

; After unrolling
    add rax, [rdi]
    add rax, [rdi+8]
    add rax, [rdi+16]
    add rax, [rdi+24]
```

### 4.3.2 Loop Conditions
From our implementation:
```nasm
_loop:
    add r10, r11       ; Main operation
    mov rdi, r11       ; Prepare for print
    call print         ; Print number
    
    mov r11, r10       ; Update sequence
    inc r12            ; Increment counter
    cmp r12, 5         ; Check condition
    jle _loop          ; Continue if needed
```

## 4.4 Error Handling

### 4.4.1 Error Checking
```nasm
    ; Check for division by zero
    cmp rdx, 0
    je error_handler
    
    ; Check for overflow
    jo overflow_handler
    
error_handler:
    mov rdi, error_msg
    call print_error
    ret
```

### 4.4.2 System Call Error Handling
```nasm
    syscall
    cmp rax, 0
    jl handle_error    ; Negative return = error
```

## Practice Exercises

1. **Control Flow Implementation**
   - Create a switch-case structure
   - Implement nested if-else conditions
   - Build a state machine

2. **Function Exercises**
   - Write a recursive function
   - Implement a function with local variables
   - Create a function that uses multiple parameters

3. **Advanced Loops**
   - Implement a nested loop structure
   - Create an optimized counting loop
   - Build a loop with multiple exit conditions

## Programming Challenges

1. **State Machine**
   - Implement a simple calculator
   - Create a text parser
   - Build a simple game loop

2. **Advanced Functions**
   - Recursive Fibonacci with stack management
   - Function pointer table implementation
   - Exception handling system

## Review Questions

1. How do you implement complex branching logic?
2. What is the purpose of stack frame management?
3. How do you optimize loops in assembly?
4. What are the best practices for error handling?

## Debugging Tips

1. **Control Flow Debugging**
   - Using breakpoints effectively
   - Tracking register states
   - Monitoring stack changes

2. **Common Issues**
   - Infinite loops
   - Stack corruption
   - Incorrect jump conditions

## Further Reading
- Low-Level Programming (Igor Zhirkov)
- Assembly Language Step-by-Step (Jeff Duntemann)
- Advanced x86 Programming (Ray Seyfarth)

## Solution Hints for Chapter 4 Exercises

### Control Flow Solutions
1. **Switch-Case Structure**:
```nasm
section .data
    jump_table: dq case_0, case_1, case_2, case_3
    
section .text
    ; Assuming value in rax
    cmp rax, 3          ; Check bounds
    ja default_case
    jmp [jump_table + rax * 8]
    
case_0:
    ; Handle case 0
    jmp end_switch
case_1:
    ; Handle case 1
    jmp end_switch
case_2:
    ; Handle case 2
    jmp end_switch
case_3:
    ; Handle case 3
    jmp end_switch
default_case:
    ; Handle default
end_switch:
```

2. **Nested If-Else**:
```nasm
    cmp rax, 10
    jg greater_than_10
    je equals_10
    ; Less than 10 case
    jmp end_if
greater_than_10:
    cmp rax, 20
    jg greater_than_20
    ; Between 10 and 20
    jmp end_if
greater_than_20:
    ; Greater than 20
end_if:
```

### Function Implementation Solutions
1. **Recursive Fibonacci**:
```nasm
fib:
    push rbp
    mov rbp, rsp
    
    cmp rdi, 2        ; n <= 2?
    jle base_case
    
    ; n-1
    dec rdi
    call fib
    mov rbx, rax      ; Save fib(n-1)
    
    ; n-2
    dec rdi
    call fib
    add rax, rbx      ; fib(n-1) + fib(n-2)
    
    jmp fib_end
base_case:
    mov rax, 1
fib_end:
    mov rsp, rbp
    pop rbp
    ret
```

### Advanced Debugging Scenarios

1. **Stack Corruption Debug**:
```nasm
; Problem: Unbalanced stack
bad_function:
    push rbx
    push r12
    ; ... code ...
    pop rbx      ; Oops! Wrong order
    pop r12
    ret

; Solution: Maintain stack order
good_function:
    push rbx
    push r12
    ; ... code ...
    pop r12      ; Correct order
    pop rbx
    ret
```

2. **Register Preservation**:
```nasm
; Problem: Register values lost
bad_code:
    mov rax, [data]
    call helper     ; helper modifies rax
    add rax, 5      ; Wrong result!

; Solution: Save registers
good_code:
    mov rax, [data]
    push rax
    call helper
    pop rax
    add rax, 5
```

## Additional Optimization Techniques

### 4.5 Advanced Optimization

#### 4.5.1 Register Usage Optimization
```nasm
; Poor register usage
mov rax, [data]
mov rbx, rax
add rbx, 5
mov [result], rbx

; Optimized version
mov rax, [data]
add rax, 5
mov [result], rax
```

#### 4.5.2 Memory Access Optimization
```nasm
; Poor memory access
mov al, [array]
inc al
mov [array], al
mov al, [array]
add al, 5
mov [array], al

; Optimized version
mov al, [array]
inc al
add al, 5
mov [array], al
```

#### 4.5.3 Branch Prediction Hints
```nasm
; Hint likely path
    cmp rax, 0
    jg likely_positive   ; Processor expects this path
    ; Handle negative case
likely_positive:
    ; Handle positive case
```

---

[← Previous Chapter](#chapter-3) | [Next Chapter: From Machine Code to High-Level Languages →](#chapter-5)

<a name="chapter-5"></a>
# Chapter 5: From Machine Code to High-Level Languages

## Learning Objectives
By the end of this chapter, you will:
- Understand the transition from assembly to high-level languages
- Learn about language abstraction layers
- Explore compilation and interpretation
- Implement basic language features

## 5.1 The Evolution of Programming Languages

### 5.1.1 From Machine Code to Assembly
```nasm
; Machine code
10110000 00000101   ; Load 5
00000011 00000011   ; Add 3

; Assembly equivalent
mov al, 5
add al, 3
```

### 5.1.2 Assembly to High-Level Constructs
```python
# High-level equivalent
x = 5
x += 3

# Our SimpleCPU implementation
def execute(self):
    while True:
        opcode = self.memory[self.registers['PC']]
        if opcode == 0x01:  # LDA
            self.registers['A'] = self.memory[self.registers['PC'] + 1]
```

## 5.2 Language Abstraction Layers

### 5.2.1 Memory Management
Low-level:
```nasm
section .data
    buffer: resb 1024
section .text
    mov rdi, buffer
    mov rcx, 1024
    call allocate
```

High-level:
```python
buffer = bytearray(1024)
```

### 5.2.2 Control Structures
Assembly vs High-level:
```nasm
; Assembly loop
    mov rcx, 0
loop_start:
    ; Loop body
    inc rcx
    cmp rcx, 10
    jl loop_start
```

```python
# Python equivalent
for i in range(10):
    # Loop body
```

## 5.3 Building Language Features

### 5.3.1 Variables and Types
```python
class Variable:
    def __init__(self, name, type, value):
        self.name = name
        self.type = type
        self.value = value
        
class Environment:
    def __init__(self):
        self.variables = {}
        
    def define(self, name, type, value):
        self.variables[name] = Variable(name, type, value)
```

### 5.3.2 Functions and Procedures
```python
class Function:
    def __init__(self, params, body, env):
        self.params = params
        self.body = body
        self.env = env
        
    def call(self, args):
        local_env = Environment()
        for param, arg in zip(self.params, args):
            local_env.define(param.name, param.type, arg)
        return evaluate(self.body, local_env)
```

## Practice Exercises

1. **Language Feature Implementation**
   - Implement a simple type system
   - Create a basic variable scope mechanism
   - Build a function call system

2. **Control Flow Translation**
   - Convert assembly loops to high-level constructs
   - Implement if-else statements
   - Create a basic exception handling system

3. **Memory Management**
   - Implement a simple garbage collector
   - Create a memory allocation system
   - Build a reference counting mechanism

## Review Questions

1. How do high-level languages abstract machine operations?
2. What are the trade-offs between assembly and high-level languages?
3. How does type system implementation work?
4. What role does memory management play in language design?

## Further Reading
- Programming Language Pragmatics (Michael Scott)
- Crafting Interpreters (Robert Nystrom)
- Types and Programming Languages (Benjamin Pierce)

## Solution Hints for Chapter 5 Exercises

### Language Feature Implementation Solutions
1. **Simple Type System**:
```python
class Type:
    def __init__(self, name, size):
        self.name = name
        self.size = size  # Size in bytes

# Basic types
INTEGER = Type("int", 4)
FLOAT = Type("float", 8)
CHAR = Type("char", 1)

class TypeChecker:
    def check_operation(self, op, left_type, right_type):
        if op in ['+', '-', '*', '/']:
            if left_type == INTEGER and right_type == INTEGER:
                return INTEGER
            elif left_type == FLOAT or right_type == FLOAT:
                return FLOAT
        raise TypeError(f"Invalid operation {op} between {left_type.name} and {right_type.name}")
```

2. **Variable Scope Mechanism**:
```python
class Scope:
    def __init__(self, parent=None):
        self.symbols = {}
        self.parent = parent
    
    def define(self, name, value):
        self.symbols[name] = value
    
    def resolve(self, name):
        if name in self.symbols:
            return self.symbols[name]
        if self.parent:
            return self.parent.resolve(name)
        raise NameError(f"Name '{name}' is not defined")

# Usage example
global_scope = Scope()
function_scope = Scope(global_scope)
block_scope = Scope(function_scope)
```

3. **Function Call System**:
```python
class CallFrame:
    def __init__(self, function, return_addr):
        self.local_vars = {}
        self.function = function
        self.return_addr = return_addr

class VirtualMachine:
    def __init__(self):
        self.call_stack = []
        self.current_frame = None
    
    def call_function(self, func, args):
        frame = CallFrame(func, self.instruction_pointer)
        self.call_stack.append(frame)
        self.current_frame = frame
        
        # Set up parameters
        for param, arg in zip(func.params, args):
            frame.local_vars[param] = arg
            
        # Execute function body
        result = self.execute(func.body)
        
        # Restore previous frame
        self.call_stack.pop()
        self.current_frame = self.call_stack[-1] if self.call_stack else None
        return result
```

### Additional Language Comparisons

1. **Conditional Statements**:
```nasm
; Assembly if-else
    cmp eax, 0
    jle is_negative
    ; positive code
    jmp end_if
is_negative:
    ; negative code
end_if:
```

```python
# Python equivalent
if x > 0:
    # positive code
else:
    # negative code
```

2. **Function Calls**:
```nasm
; Assembly function
calculate:
    push rbp
    mov rbp, rsp
    ; function body
    mov rsp, rbp
    pop rbp
    ret

; Call site
    call calculate
```

```python
# Python equivalent
def calculate():
    # function body
    return result

# Call site
result = calculate()
```

3. **Array Operations**:
```nasm
; Assembly array access
    mov rax, [array + rdi * 8]  ; array[i]
```

```python
# Python equivalent
value = array[i]
```

---

<a name="chapter-6"></a>
# Chapter 6: Understanding Program Execution

## Learning Objectives
By the end of this chapter, you will:
- Understand how programs are loaded and executed
- Learn about memory layout and management
- Master process and thread concepts
- Implement basic runtime systems

## 6.1 Program Loading and Execution

### 6.1.1 The Loading Process
```python
class ProgramLoader:
    def __init__(self):
        self.memory = bytearray(1024 * 1024)  # 1MB memory
        self.segments = {
            'text': 0x0000,
            'data': 0x4000,
            'heap': 0x8000,
            'stack': 0xF000
        }
    
    def load_program(self, code, data):
        # Load text segment
        self.load_segment(code, self.segments['text'])
        # Load data segment
        self.load_segment(data, self.segments['data'])
        # Initialize stack pointer
        self.registers['rsp'] = self.segments['stack']
```

### 6.1.2 Memory Layout
```
High Address  +------------------+
              |      Stack      |
              |        ↓        |
              |                 |
              |        ↑        |
              |      Heap       |
              |                 |
              |    Data (BSS)   |
              |    Data (Data)  |
              |    Text (Code)  |
Low Address   +------------------+
```

## 6.2 Runtime Memory Management

### 6.2.1 Stack Management
```python
class StackFrame:
    def __init__(self, return_addr, base_ptr):
        self.local_vars = {}
        self.saved_registers = {}
        self.return_addr = return_addr
        self.base_ptr = base_ptr

class Stack:
    def __init__(self, size=1024*1024):
        self.memory = bytearray(size)
        self.sp = size  # Stack grows down
        
    def push(self, value):
        self.sp -= 8  # 64-bit
        struct.pack_into('Q', self.memory, self.sp, value)
        
    def pop(self):
        value = struct.unpack_from('Q', self.memory, self.sp)[0]
        self.sp += 8
        return value
```

### 6.2.2 Heap Management
```python
class HeapManager:
    def __init__(self, start_addr, size):
        self.start = start_addr
        self.size = size
        self.blocks = [(start_addr, size, False)]  # (addr, size, used)
    
    def allocate(self, size):
        # First-fit allocation
        for i, (addr, block_size, used) in enumerate(self.blocks):
            if not used and block_size >= size:
                self.blocks[i] = (addr, size, True)
                if block_size > size:
                    # Split block
                    self.blocks.insert(i + 1, 
                        (addr + size, block_size - size, False))
                return addr
        return None  # Out of memory
```

## 6.3 Process and Thread Management

### 6.3.1 Process Control Block
```python
class ProcessControlBlock:
    def __init__(self, pid):
        self.pid = pid
        self.state = 'NEW'  # NEW, READY, RUNNING, WAITING, TERMINATED
        self.registers = {
            'rax': 0, 'rbx': 0, 'rcx': 0, 'rdx': 0,
            'rsp': 0, 'rbp': 0, 'rip': 0
        }
        self.memory_segments = {
            'text': None,
            'data': None,
            'heap': None,
            'stack': None
        }
```

### 6.3.2 Thread Implementation
```python
class Thread:
    def __init__(self, tid, entry_point):
        self.tid = tid
        self.state = 'NEW'
        self.stack = Stack()
        self.registers = {
            'rip': entry_point,
            'rsp': self.stack.sp
        }
        self.context = None
    
    def save_context(self):
        self.context = self.registers.copy()
    
    def restore_context(self):
        self.registers = self.context.copy()
```

## 6.4 System Calls and Interrupts

### 6.4.1 System Call Implementation
```python
class SystemCallHandler:
    def __init__(self):
        self.handlers = {
            1: self.sys_write,
            2: self.sys_read,
            3: self.sys_open,
            4: self.sys_close
        }
    
    def handle_syscall(self, number, *args):
        if number in self.handlers:
            return self.handlers[number](*args)
        raise Exception(f"Invalid syscall {number}")
    
    def sys_write(self, fd, buffer, size):
        # Implementation
        pass
```

### 6.4.2 Interrupt Handling
```python
class InterruptHandler:
    def __init__(self):
        self.interrupt_vector = [None] * 256
        self.setup_handlers()
    
    def setup_handlers(self):
        self.interrupt_vector[0x80] = self.syscall_handler
        self.interrupt_vector[0x0E] = self.page_fault_handler
        
    def handle_interrupt(self, number, error_code=None):
        handler = self.interrupt_vector[number]
        if handler:
            return handler(error_code)
        raise Exception(f"Unhandled interrupt {number}")
```

## Practice Exercises

1. **Memory Management Implementation**
   - Implement a simple memory allocator
   - Create a garbage collector
   - Build a reference counting system

2. **Process Management**
   - Implement a basic scheduler
   - Create a process creation mechanism
   - Build an inter-process communication system

3. **System Call Implementation**
   - Create file system calls
   - Implement process control calls
   - Build memory management calls

## Review Questions

1. How does program loading work?
2. What are the different memory segments used for?
3. How do system calls transition between user and kernel mode?
4. What is the role of the process control block?

## Further Reading
- Operating Systems: Three Easy Pieces
- Linux Kernel Development (Robert Love)
- Advanced Programming in the UNIX Environment

## Solution Hints for Chapter 6 Exercises

### Memory Management Solutions
1. **Simple Memory Allocator**:
```python
class MemoryBlock:
    def __init__(self, start, size):
        self.start = start
        self.size = size
        self.is_free = True
        self.next = None

class Allocator:
    def __init__(self, memory_size):
        self.memory = bytearray(memory_size)
        self.head = MemoryBlock(0, memory_size)
    
    def allocate(self, size):
        current = self.head
        while current:
            if current.is_free and current.size >= size:
                if current.size > size + 16:  # Split if enough space
                    new_block = MemoryBlock(current.start + size, 
                                          current.size - size)
                    new_block.next = current.next
                    current.size = size
                    current.next = new_block
                current.is_free = False
                return current.start
            current = current.next
        return None  # Out of memory
```

2. **Reference Counting GC**:
```python
class Object:
    def __init__(self):
        self.ref_count = 0
        self.references = []
    
    def inc_ref(self):
        self.ref_count += 1
    
    def dec_ref(self):
        self.ref_count -= 1
        if self.ref_count == 0:
            self.cleanup()
    
    def cleanup(self):
        for ref in self.references:
            ref.dec_ref()
        # Free memory
```

### Process Management Solutions
1. **Basic Scheduler**:
```python
class Scheduler:
    def __init__(self):
        self.ready_queue = []
        self.current_process = None
        self.quantum = 100  # Time slice
    
    def schedule(self):
        if self.current_process:
            self.current_process.save_state()
            self.ready_queue.append(self.current_process)
        
        if self.ready_queue:
            self.current_process = self.ready_queue.pop(0)
            self.current_process.restore_state()
            self.current_process.run(self.quantum)
```

---

<a name="chapter-7"></a>
# Chapter 7: Lisp - A Beautiful Abstraction

## Learning Objectives
By the end of this chapter, you will:
- Understand Lisp's fundamental concepts
- Implement core Lisp features
- Master functional programming principles
- Build a Lisp interpreter

## 7.1 Understanding Lisp's Beauty

### 7.1.1 Code as Data
```lisp
; In Lisp, code is data
(define factorial
  (lambda (n)
    (if (<= n 1)
        1
        (* n (factorial (- n 1))))))

; Our Python implementation
def parse_lisp(code):
    def tokenize(code):
        return code.replace('(', ' ( ').replace(')', ' ) ').split()
    
    def read_from_tokens(tokens):
        if not tokens:
            raise SyntaxError("Unexpected EOF")
        token = tokens.pop(0)
        if token == '(':
            L = []
            while tokens[0] != ')':
                L.append(read_from_tokens(tokens))
            tokens.pop(0)  # Remove ')'
            return L
        elif token == ')':
            raise SyntaxError("Unexpected )")
        else:
            return atom(token)
```

### 7.1.2 The Power of S-expressions
```python
class Expression:
    def __init__(self, operator, operands):
        self.operator = operator
        self.operands = operands
    
    def evaluate(self, env):
        fn = env.lookup(self.operator)
        args = [operand.evaluate(env) for operand in self.operands]
        return fn(*args)
```

## 7.2 Core Lisp Features

### 7.2.1 Lambda Functions
```lisp
; Lisp lambda
(lambda (x y) (+ x y))

; Our implementation
class Lambda:
    def __init__(self, params, body, env):
        self.params = params
        self.body = body
        self.env = env
    
    def __call__(self, *args):
        local_env = Environment(self.env)
        for param, arg in zip(self.params, args):
            local_env.define(param, arg)
        return self.body.evaluate(local_env)
```

### 7.2.2 List Processing
```python
class Cons:
    def __init__(self, car, cdr):
        self.car = car
        self.cdr = cdr

def car(cons):
    return cons.car

def cdr(cons):
    return cons.cdr

def list_(*args):
    result = None
    for arg in reversed(args):
        result = Cons(arg, result)
    return result
```

## 7.3 Building the Interpreter

### 7.3.1 The Evaluation Loop
```python
def eval(expr, env):
    if isinstance(expr, str):              # Variable reference
        return env.lookup(expr)
    elif not isinstance(expr, list):       # Constant literal
        return expr
    elif expr[0] == 'quote':              # Quotation
        return expr[1]
    elif expr[0] == 'if':                 # Conditional
        (_, test, conseq, alt) = expr
        return eval(conseq, env) if eval(test, env) else eval(alt, env)
    elif expr[0] == 'define':             # Definition
        (_, var, exp) = expr
        env.define(var, eval(exp, env))
    elif expr[0] == 'lambda':             # Procedure
        (_, params, body) = expr
        return Lambda(params, body, env)
    else:                                 # Procedure call
        proc = eval(expr[0], env)
        args = [eval(arg, env) for arg in expr[1:]]
        return proc(*args)
```

### 7.3.2 The Environment
```python
class Environment:
    def __init__(self, parent=None):
        self.bindings = {}
        self.parent = parent
    
    def lookup(self, name):
        if name in self.bindings:
            return self.bindings[name]
        if self.parent:
            return self.parent.lookup(name)
        raise NameError(f"Symbol '{name}' not found")
    
    def define(self, name, value):
        self.bindings[name] = value
```

## 7.4 Advanced Features

### 7.4.1 Macros
```python
class Macro:
    def __init__(self, transformer):
        self.transformer = transformer
    
    def expand(self, expr, env):
        expanded = self.transformer(expr)
        return eval(expanded, env)

def define_macro(name, transformer, env):
    env.define(name, Macro(transformer))
```

### 7.4.2 Tail Call Optimization
```python
def eval_tco(expr, env):
    while True:
        if isinstance(expr, str):
            return env.lookup(expr)
        elif not isinstance(expr, list):
            return expr
        elif expr[0] == 'if':
            (_, test, conseq, alt) = expr
            expr = conseq if eval_tco(test, env) else alt
        elif expr[0] == 'define':
            (_, var, exp) = expr
            env.define(var, eval_tco(exp, env))
            return None
        else:
            proc = eval_tco(expr[0], env)
            args = [eval_tco(arg, env) for arg in expr[1:]]
            if isinstance(proc, Lambda):
                expr = proc.body
                env = Environment(proc.env)
                for param, arg in zip(proc.params, args):
                    env.define(param, arg)
            else:
                return proc(*args)
```

## Practice Exercises

1. **Core Features Implementation**
   - Implement basic arithmetic operations
   - Create list manipulation functions
   - Build conditional expressions

2. **Advanced Features**
   - Implement a macro system
   - Add tail call optimization
   - Create a garbage collector

3. **Language Extensions**
   - Add pattern matching
   - Implement lazy evaluation
   - Create a module system

## Review Questions

1. What makes Lisp unique among programming languages?
2. How does Lisp handle code as data?
3. What is the role of S-expressions?
4. How do macros work in Lisp?

## Further Reading
- Structure and Interpretation of Computer Programs
- On Lisp (Paul Graham)
- Let Over Lambda (Doug Hoyte)

## Solution Hints for Chapter 7 Exercises

### Core Features Implementation Solutions
1. **Basic Arithmetic Operations**:
```lisp
; Lisp implementation
(define (add x y) (+ x y))
(define (subtract x y) (- x y))
(define (multiply x y) (* x y))
(define (divide x y) (/ x y))

; Python implementation
class LispPrimitive:
    def __init__(self, fn):
        self.fn = fn
    def __call__(self, *args):
        return self.fn(*args)

def setup_arithmetic(env):
    env.define('+', LispPrimitive(lambda x, y: x + y))
    env.define('-', LispPrimitive(lambda x, y: x - y))
    env.define('*', LispPrimitive(lambda x, y: x * y))
    env.define('/', LispPrimitive(lambda x, y: x / y))
```

2. **List Manipulation**:
```lisp
; Lisp implementation
(define (map fn lst)
  (if (null? lst)
      '()
      (cons (fn (car lst))
            (map fn (cdr lst)))))

; Python implementation
def lisp_map(fn, lst):
    if not lst:
        return []
    return Cons(fn(lst.car), lisp_map(fn, lst.cdr))

def setup_list_ops(env):
    env.define('map', Lambda(['fn', 'lst'], 
        ['if', ['null?', 'lst'],
         [], 
         ['cons', 
          ['fn', ['car', 'lst']], 
          ['map', 'fn', ['cdr', 'lst']]]]))
```

### Real-World Lisp Examples

1. **JSON Parser**:
```lisp
(define (parse-json str)
  (let ((tokens (tokenize str)))
    (parse-json-object tokens)))

(define (parse-json-object tokens)
  (case (car tokens)
    ('{' (parse-object (cdr tokens)))
    ('[' (parse-array (cdr tokens)))
    (else (parse-primitive tokens))))

; Python implementation
class JsonParser:
    def __init__(self, env):
        self.env = env
        
    def parse(self, tokens):
        if tokens[0] == '{':
            return self.parse_object(tokens[1:])
        elif tokens[0] == '[':
            return self.parse_array(tokens[1:])
        return self.parse_primitive(tokens)
```

2. **Web Router**:
```lisp
(define-macro (route path handler)
  `(add-route *router* ,path ,handler))

(route "/users/:id"
       (lambda (req)
         (let ((user-id (get-param req :id)))
           (find-user user-id))))

; Python implementation
class Router:
    def __init__(self):
        self.routes = {}
        
    def add_route(self, path, handler):
        self.routes[path] = handler
        
    def handle_request(self, path, request):
        handler = self.routes.get(path)
        if handler:
            return handler(request)
        raise NotFoundError(f"No route for {path}")
```

### Advanced Lisp Features Implementation

1. **Pattern Matching**:
```python
class Pattern:
    def __init__(self, type_pattern, value_pattern=None):
        self.type_pattern = type_pattern
        self.value_pattern = value_pattern
    
    def match(self, value):
        if not isinstance(value, self.type_pattern):
            return None
        
        if self.value_pattern is None:
            return {}
        
        if callable(self.value_pattern):
            return self.value_pattern(value)
        
        return {'value': value} if value == self.value_pattern else None

def define_pattern_macro(env):
    def match_macro(pattern, expr):
        return ['let', 
                [Pattern(pattern).match(expr, env)],
                 ['if', ['null?', 'bindings'],
                  'false',
                  'bindings']]
    env.define('match', Macro(match_macro))
```

2. **Lazy Evaluation**:
```python
class Promise:
    def __init__(self, expr, env):
        self.expr = expr
        self.env = env
        self.evaluated = False
        self.value = None
    
    def force(self):
        if not self.evaluated:
            self.value = eval(self.expr, self.env)
            self.evaluated = True
        return self.value

def define_lazy_primitives(env):
    env.define('delay', 
               lambda expr: Promise(expr, env))
    env.define('force',
               lambda promise: promise.force())
```

---

[← Previous Chapter](#chapter-6) | [Next Chapter: Functional Programming Concepts →](#chapter-8)

<a name="chapter-8"></a>
# Chapter 8: Functional Programming Concepts

## Learning Objectives
By the end of this chapter, you will:
- Master functional programming paradigms
- Understand immutability and pure functions
- Implement higher-order functions
- Work with monads and functors

## 8.1 Pure Functions and Immutability

### 8.1.1 Understanding Pure Functions
```python
# Impure function
total = 0
def add_to_total(x):
    global total
    total += x
    return total

# Pure function
def add_numbers(x, y):
    return x + y

# Implementation in our Lisp
def is_pure_function(fn, env):
    # Check if function modifies any external state
    original_env = env.copy()
    result1 = fn(1)
    env.restore(original_env)
    result2 = fn(1)
    return result1 == result2
```

### 8.1.2 Immutable Data Structures
```python
class ImmutableList:
    def __init__(self, items):
        self._items = tuple(items)
    
    def append(self, item):
        return ImmutableList(self._items + (item,))
    
    def remove(self, item):
        return ImmutableList(x for x in self._items if x != item)
```

## 8.2 Higher-Order Functions

### 8.2.1 Map, Filter, and Reduce
```lisp
; Map implementation
(define (map fn lst)
  (if (null? lst)
      '()
      (cons (fn (car lst))
            (map fn (cdr lst)))))

; Filter implementation
(define (filter pred lst)
  (cond ((null? lst) '())
        ((pred (car lst))
         (cons (car lst)
               (filter pred (cdr lst))))
        (else (filter pred (cdr lst)))))

; Reduce implementation
(define (reduce fn init lst)
  (if (null? lst)
      init
      (reduce fn
              (fn init (car lst))
              (cdr lst))))
```

### 8.2.2 Function Composition
```python
def compose(*fns):
    def composed(x):
        result = x
        for fn in reversed(fns):
            result = fn(result)
        return result
    return composed

# In our Lisp
(define (compose f g)
  (lambda (x)
    (f (g x))))
```

## 8.3 Advanced Functional Concepts

### 8.3.1 Currying
```python
def curry(fn):
    def curried(*args):
        if len(args) >= fn.__code__.co_argcount:
            return fn(*args)
        return lambda *more: curried(*(args + more))
    return curried

# Usage example
@curry
def add(x, y, z):
    return x + y + z

add_five = add(5)
add_five_and_ten = add_five(10)
result = add_five_and_ten(15)  # 30
```

### 8.3.2 Monads
```python
class Maybe:
    def __init__(self, value):
        self.value = value
    
    def bind(self, fn):
        if self.value is None:
            return Maybe(None)
        return fn(self.value)
    
    @staticmethod
    def unit(value):
        return Maybe(value)

# Usage example
def safe_divide(x, y):
    return Maybe(x / y if y != 0 else None)

def safe_sqrt(x):
    return Maybe(math.sqrt(x) if x >= 0 else None)
```

## Practice Exercises

1. **Pure Function Implementation**
   - Create pure versions of common functions
   - Implement immutable data structures
   - Write referentially transparent code

2. **Higher-Order Functions**
   - Implement map, filter, reduce
   - Create function composition utilities
   - Build a currying system

3. **Monadic Operations**
   - Implement the Maybe monad
   - Create the List monad
   - Build monadic transformations

## Review Questions

1. What makes a function pure?
2. How do higher-order functions enhance code reuse?
3. What are the benefits of immutability?
4. How do monads help manage side effects?

## Further Reading
- Introduction to Functional Programming (Bird & Wadler)
- Category Theory for Programmers (Bartosz Milewski)
- Functional Programming in Scala (Chiusano & Bjarnason)

## Solution Hints for Chapter 8 Exercises

### Pure Function Implementation Solutions
1. **Simple Type System**:
```python
class Type:
    def __init__(self, name, size):
        self.name = name
        self.size = size  # Size in bytes

# Basic types
INTEGER = Type("int", 4)
FLOAT = Type("float", 8)
CHAR = Type("char", 1)

class TypeChecker:
    def check_operation(self, op, left_type, right_type):
        if op in ['+', '-', '*', '/']:
            if left_type == INTEGER and right_type == INTEGER:
                return INTEGER
            elif left_type == FLOAT or right_type == FLOAT:
                return FLOAT
        raise TypeError(f"Invalid operation {op} between {left_type.name} and {right_type.name}")
```

2. **Variable Scope Mechanism**:
```python
class Scope:
    def __init__(self, parent=None):
        self.symbols = {}
        self.parent = parent
    
    def define(self, name, value):
        self.symbols[name] = value
    
    def resolve(self, name):
        if name in self.symbols:
            return self.symbols[name]
        if self.parent:
            return self.parent.resolve(name)
        raise NameError(f"Name '{name}' is not defined")

# Usage example
global_scope = Scope()
function_scope = Scope(global_scope)
block_scope = Scope(function_scope)
```

3. **Function Call System**:
```python
class CallFrame:
    def __init__(self, function, return_addr):
        self.local_vars = {}
        self.function = function
        self.return_addr = return_addr

class VirtualMachine:
    def __init__(self):
        self.call_stack = []
        self.current_frame = None
    
    def call_function(self, func, args):
        frame = CallFrame(func, self.instruction_pointer)
        self.call_stack.append(frame)
        self.current_frame = frame
        
        # Set up parameters
        for param, arg in zip(func.params, args):
            frame.local_vars[param] = arg
            
        # Execute function body
        result = self.execute(func.body)
        
        # Restore previous frame
        self.call_stack.pop()
        self.current_frame = self.call_stack[-1] if self.call_stack else None
        return result
```

### Additional Language Comparisons

1. **Conditional Statements**:
```nasm
; Assembly if-else
    cmp eax, 0
    jle is_negative
    ; positive code
    jmp end_if
is_negative:
    ; negative code
end_if:
```

```python
# Python equivalent
if x > 0:
    # positive code
else:
    # negative code
```

2. **Function Calls**:
```nasm
; Assembly function
calculate:
    push rbp
    mov rbp, rsp
    ; function body
    mov rsp, rbp
    pop rbp
    ret

; Call site
    call calculate
```

```python
# Python equivalent
def calculate():
    # function body
    return result

# Call site
result = calculate()
```

3. **Array Operations**:
```nasm
; Assembly array access
    mov rax, [array + rdi * 8]  ; array[i]
```

```python
# Python equivalent
value = array[i]
```

---

<a name="chapter-9"></a>
# Chapter 9: Interpreter Fundamentals

## Learning Objectives
By the end of this chapter, you will:
- Understand the basics of language interpretation
- Implement a lexer and parser
- Build an AST evaluator
- Create a basic symbol table

## 9.1 Lexical Analysis

### 9.1.1 Token Types and Recognition
```python
from enum import Enum, auto

class TokenType(Enum):
    NUMBER = auto()
    IDENTIFIER = auto()
    PLUS = auto()
    MINUS = auto()
    MULTIPLY = auto()
    DIVIDE = auto()
    LPAREN = auto()
    RPAREN = auto()
    EOF = auto()

class Token:
    def __init__(self, type, value, line, column):
        self.type = type
        self.value = value
        self.line = line
        self.column = column
```

### 9.1.2 Lexer Implementation
```python
class Lexer:
    def __init__(self, text):
        self.text = text
        self.pos = 0
        self.line = 1
        self.column = 1
        self.current_char = self.text[0] if text else None
    
    def advance(self):
        self.pos += 1
        if self.pos >= len(self.text):
            self.current_char = None
        else:
            self.current_char = self.text[self.pos]
            if self.current_char == '\n':
                self.line += 1
                self.column = 1
            else:
                self.column += 1
    
    def skip_whitespace(self):
        while self.current_char and self.current_char.isspace():
            self.advance()
    
    def number(self):
        result = ''
        while self.current_char and self.current_char.isdigit():
            result += self.current_char
            self.advance()
        if self.current_char == '.':
            result += self.current_char
            self.advance()
            while self.current_char and self.current_char.isdigit():
                result += self.current_char
                self.advance()
        return Token(TokenType.NUMBER, float(result), self.line, self.column)
```

## 9.2 Syntax Analysis

### 9.2.1 Abstract Syntax Tree
```python
class AST:
    pass

class BinOp(AST):
    def __init__(self, left, op, right):
        self.left = left
        self.token = self.op = op
        self.right = right

class Num(AST):
    def __init__(self, token):
        self.token = token
        self.value = token.value
```

### 9.2.2 Parser Implementation
```python
class Parser:
    def __init__(self, lexer):
        self.lexer = lexer
        self.current_token = self.lexer.get_next_token()
    
    def error(self):
        raise Exception('Invalid syntax')
    
    def eat(self, token_type):
        if self.current_token.type == token_type:
            self.current_token = self.lexer.get_next_token()
        else:
            self.error()
    
    def factor(self):
        token = self.current_token
        if token.type == TokenType.NUMBER:
            self.eat(TokenType.NUMBER)
            return Num(token)
        elif token.type == TokenType.LPAREN:
            self.eat(TokenType.LPAREN)
            node = self.expr()
            self.eat(TokenType.RPAREN)
            return node
```

## 9.3 Semantic Analysis

### 9.3.1 Symbol Table
```python
class Symbol:
    def __init__(self, name, type=None):
        self.name = name
        self.type = type

class SymbolTable:
    def __init__(self):
        self.symbols = {}
        self._init_builtins()
    
    def _init_builtins(self):
        self.define(Symbol('integer'))
        self.define(Symbol('real'))
    
    def define(self, symbol):
        self.symbols[symbol.name] = symbol
    
    def lookup(self, name):
        return self.symbols.get(name)
```

### 9.3.2 Type Checking
```python
class SemanticAnalyzer(NodeVisitor):
    def __init__(self):
        self.symbol_table = SymbolTable()
    
    def visit_BinOp(self, node):
        self.visit(node.left)
        self.visit(node.right)
        
        left_type = self.get_type(node.left)
        right_type = self.get_type(node.right)
        
        if not self.are_type_compatible(left_type, right_type):
            raise SemanticError(
                f"Type mismatch: {left_type} {node.op.value} {right_type}"
            )
```

## Practice Exercises

1. **Lexer Implementation**
   - Add support for keywords
   - Implement string literals
   - Handle comments

2. **Parser Enhancement**
   - Add function declarations
   - Implement control structures
   - Support error recovery

3. **Semantic Analysis**
   - Implement scope checking
   - Add type inference
   - Build symbol resolution

## Review Questions

1. What is the role of lexical analysis?
2. How does parsing create structure from tokens?
3. Why is semantic analysis important?
4. How do symbol tables assist in interpretation?

## Further Reading
- Compilers: Principles, Techniques, and Tools
- Writing An Interpreter In Go
- Language Implementation Patterns

## Solution Hints for Chapter 9 Exercises

### Lexer Implementation Solutions
1. **Keyword and String Support**:
```python
class TokenType(Enum):
    # ... existing tokens ...
    STRING = auto()
    IF = auto()
    ELSE = auto()
    WHILE = auto()

class Lexer:
    def __init__(self, text):
        # ... existing initialization ...
        self.keywords = {
            'if': TokenType.IF,
            'else': TokenType.ELSE,
            'while': TokenType.WHILE,
            'function': TokenType.FUNCTION
        }
    
    def string(self):
        result = ''
        self.advance()  # Skip opening quote
        while self.current_char and self.current_char != '"':
            if self.current_char == '\\':
                self.advance()
                result += self.handle_escape()
            else:
                result += self.current_char
                self.advance()
        self.advance()  # Skip closing quote
        return Token(TokenType.STRING, result, self.line, self.column)
    
    def identifier(self):
        result = ''
        while self.current_char and (self.current_char.isalnum() or self.current_char == '_'):
            result += self.current_char
            self.advance()
        token_type = self.keywords.get(result, TokenType.IDENTIFIER)
        return Token(token_type, result, self.line, self.column)
```

2. **Comment Handling**:
```python
class Lexer:
    def skip_comment(self):
        if self.current_char == '/':
            if self.peek() == '/':
                self.advance()  # Skip second '/'
                while self.current_char and self.current_char != '\n':
                    self.advance()
            elif self.peek() == '*':
                self.advance()  # Skip '*'
                while True:
                    if not self.current_char:
                        raise SyntaxError("Unterminated comment")
                    if self.current_char == '*' and self.peek() == '/':
                        self.advance()  # Skip '/'
                        self.advance()  # Skip '*'
                        break
                    self.advance()
```

### Parser Enhancement Solutions
1. **Function Declaration Parser**:
```python
class FunctionDecl(AST):
    def __init__(self, name, params, body):
        self.name = name
        self.params = params
        self.body = body

class Parser:
    def function_declaration(self):
        self.eat(TokenType.FUNCTION)
        name = self.current_token.value
        self.eat(TokenType.IDENTIFIER)
        
        self.eat(TokenType.LPAREN)
        params = []
        while self.current_token.type != TokenType.RPAREN:
            param = self.current_token.value
            self.eat(TokenType.IDENTIFIER)
            params.append(param)
            if self.current_token.type == TokenType.COMMA:
                self.eat(TokenType.COMMA)
        self.eat(TokenType.RPAREN)
        
        body = self.block()
        return FunctionDecl(name, params, body)
```

2. **Error Recovery**:
```python
class Parser:
    def synchronize(self):
        """Recover from parsing errors by skipping tokens until a safe point."""
        sync_tokens = {
            TokenType.SEMICOLON,
            TokenType.RBRACE,
            TokenType.FUNCTION,
            TokenType.CLASS
        }
        
        while self.current_token.type not in sync_tokens:
            self.advance()
    
    def statement(self):
        try:
            return self.statement_internal()
        except SyntaxError as e:
            self.synchronize()
            return ErrorNode(str(e))
```

### Real-World Interpreter Examples

1. **Calculator Interpreter**:
```python
class Calculator:
    def __init__(self):
        self.variables = {}
    
    def evaluate(self, expr):
        lexer = Lexer(expr)
        parser = Parser(lexer)
        tree = parser.parse()
        return self.visit(tree)
    
    def visit_BinOp(self, node):
        left = self.visit(node.left)
        right = self.visit(node.right)
        
        ops = {
            '+': operator.add,
            '-': operator.sub,
            '*': operator.mul,
            '/': operator.truediv
        }
        return ops[node.op.type](left, right)
    
    def visit_Num(self, node):
        return node.value

# Usage
calc = Calculator()
result = calc.evaluate("3 * (4 + 2)")  # Returns 18
```

2. **Simple Query Language**:
```python
class QueryInterpreter:
    def __init__(self, database):
        self.db = database
    
    def execute(self, query):
        lexer = Lexer(query)
        parser = Parser(lexer)
        ast = parser.parse()
        return self.visit(ast)
    
    def visit_Select(self, node):
        table = self.db.get_table(node.table)
        filtered = self.apply_where(table, node.where)
        return self.project_columns(filtered, node.columns)
    
    def visit_Where(self, node):
        left = self.visit(node.left)
        right = self.visit(node.right)
        ops = {
            '=': operator.eq,
            '>': operator.gt,
            '<': operator.lt
        }
        return ops[node.op](left, right)

# Usage
query = "SELECT name, age FROM users WHERE age > 18"
interpreter = QueryInterpreter(database)
results = interpreter.execute(query)
```

### Advanced Interpreter Components

1. **Symbol Resolution with Scopes**:
```python
class Scope:
    def __init__(self, parent=None):
        self.symbols = {}
        self.parent = parent
        self.children = []
    
    def define(self, name, symbol):
        self.symbols[name] = symbol
    
    def resolve(self, name):
        if name in self.symbols:
            return self.symbols[name]
        if self.parent:
            return self.parent.resolve(name)
        raise NameError(f"Symbol '{name}' not found")
    
    def enter_scope(self):
        child = Scope(self)
        self.children.append(child)
        return child
    
    def exit_scope(self):
        return self.parent

class SymbolResolver(NodeVisitor):
    def __init__(self):
        self.current_scope = Scope()
    
    def visit_Block(self, node):
        previous_scope = self.current_scope
        self.current_scope = self.current_scope.enter_scope()
        
        for statement in node.statements:
            self.visit(statement)
        
        self.current_scope = previous_scope
```

2. **Type Inference System**:
```python
class Type:
    def __init__(self, name, base=None):
        self.name = name
        self.base = base
    
    def is_subtype_of(self, other):
        current = self
        while current:
            if current == other:
                return True
            current = current.base
        return False

class TypeInferer(NodeVisitor):
    def __init__(self):
        self.type_table = {}
    
    def visit_BinOp(self, node):
        left_type = self.visit(node.left)
        right_type = self.visit(node.right)
        
        type_rules = {
            '+': {
                ('int', 'int'): 'int',
                ('float', 'float'): 'float',
                ('string', 'string'): 'string'
            }
        }
        
        op_rules = type_rules.get(node.op.type, {})
        result_type = op_rules.get((left_type.name, right_type.name))
        
        if not result_type:
            raise TypeError(f"Cannot apply '{node.op.type}' to types {left_type.name} and {right_type.name}")
        
        return self.type_table[result_type]
```

---

[← Previous Chapter](#chapter-8) | [Next Chapter: Advanced Interpreter Features →](#chapter-10)

<a name="chapter-10"></a>
# Chapter 10: Advanced Interpreter Features

## Learning Objectives
By the end of this chapter, you will:
- Understand advanced features of language interpretation
- Implement advanced language features
- Build complex language structures
- Create optimized interpreters

## 10.1 Advanced Language Features

### 10.1.1 Closure Implementation
```python
class ClosureEnvironment:
    def __init__(self, outer=None):
        self.values = {}
        self.outer = outer
    
    def get(self, name):
        if name in self.values:
            return self.values[name]
        if self.outer:
            return self.outer.get(name)
        raise NameError(f"Name '{name}' not found")
    
    def set(self, name, value):
        if name in self.values:
            self.values[name] = value
        elif self.outer:
            self.outer.set(name, value)
        else:
            self.values[name] = value

class Function:
    def __init__(self, params, body, env):
        self.params = params
        self.body = body
        self.env = env
    
    def __call__(self, *args):
        new_env = ClosureEnvironment(self.env)
        for param, arg in zip(self.params, args):
            new_env.set(param, arg)
        return evaluate(self.body, new_env)

# Usage example
def make_counter():
    env = ClosureEnvironment()
    env.set('count', 0)
    return Function(
        [], 
        ['begin',
         ['set!', 'count', ['+', 'count', 1]],
         'count'],
        env
    )
```

### 10.1.2 Pattern Matching with Types
```python
class Pattern:
    def __init__(self, type_pattern, value_pattern=None):
        self.type_pattern = type_pattern
        self.value_pattern = value_pattern
    
    def match(self, value):
        if not isinstance(value, self.type_pattern):
            return None
        
        if self.value_pattern is None:
            return {}
        
        if callable(self.value_pattern):
            return self.value_pattern(value)
        
        return {'value': value} if value == self.value_pattern else None

def define_pattern_macro(env):
    def match_macro(pattern, expr):
        return ['let', 
                [Pattern(pattern).match(expr, env)],
                ['if', ['null?', 'bindings'],
                 'false',
                 'bindings']]
    env.define('match', Macro(match_macro))
```

## 10.2 Complex Language Structures

### 10.2.1 Advanced Language Structures
```python
class AdvancedLanguageStructure:
    def __init__(self, feature):
        self.feature = feature

def setup_advanced_language_structures(env):
    env.define('advanced_structure', AdvancedLanguageStructure)
```

## Practice Exercises

1. **Advanced Language Feature Implementation**
   - Implement advanced language features
   - Build complex language structures
   - Create optimized interpreters

2. **Language Structure Optimization**
   - Implement language-specific optimizations
   - Build efficient interpreter components
   - Create language-aware code generation

## Review Questions

1. How do advanced language features enhance code reuse?
2. What is the role of language-specific optimizations?
3. How do complex language structures assist in interpretation?
4. What are the best practices for language-aware code generation?

## Further Reading
- Advanced Programming Languages (Michael Scott)
- Language-Specific Optimization Techniques (John D. Mitchell)
- Language-Aware Code Generation (Robert Nystrom)

## Solution Hints for Chapter 10 Exercises

### Advanced Language Feature Implementation Solutions
1. **Closure Implementation**:
```python
class ClosureEnvironment:
    def __init__(self, outer=None):
        self.values = {}
        self.outer = outer
    
    def get(self, name):
        if name in self.values:
            return self.values[name]
        if self.outer:
            return self.outer.get(name)
        raise NameError(f"Name '{name}' not found")
    
    def set(self, name, value):
        if name in self.values:
            self.values[name] = value
        elif self.outer:
            self.outer.set(name, value)
        else:
            self.values[name] = value

class Function:
    def __init__(self, params, body, env):
        self.params = params
        self.body = body
        self.env = env
    
    def __call__(self, *args):
        new_env = ClosureEnvironment(self.env)
        for param, arg in zip(self.params, args):
            new_env.set(param, arg)
        return evaluate(self.body, new_env)

# Usage example
def make_counter():
    env = ClosureEnvironment()
    env.set('count', 0)
    return Function(
        [], 
        ['begin',
         ['set!', 'count', ['+', 'count', 1]],
         'count'],
        env
    )
```

2. **Pattern Matching with Types**:
```python
class Pattern:
    def __init__(self, type_pattern, value_pattern=None):
        self.type_pattern = type_pattern
        self.value_pattern = value_pattern
    
    def match(self, value):
        if not isinstance(value, self.type_pattern):
            return None
        
        if self.value_pattern is None:
            return {}
        
        if callable(self.value_pattern):
            return self.value_pattern(value)
        
        return {'value': value} if value == self.value_pattern else None

# Usage example
patterns = [
    (Pattern(int, lambda x: x > 0), lambda x: f"Positive: {x}"),
    (Pattern(int, lambda x: x < 0), lambda x: f"Negative: {x}"),
    (Pattern(str), lambda s: f"String: {s}"),
    (Pattern(list, lambda l: len(l) > 0), lambda l: f"Non-empty list: {l}")
]

def match_value(value):
    for pattern, handler in patterns:
        if result := pattern.match(value):
            return handler(value)
    return "No match"
```

### Real-World Interpreter Examples

1. **SQL Query Interpreter**:
```python
class SQLInterpreter:
    def __init__(self, database):
        self.db = database
        self.optimizations = [
            self.push_down_predicates,
            self.merge_projections,
            self.optimize_joins
        ]
    
    def execute(self, query):
        ast = self.parse(query)
        for optimization in self.optimizations:
            ast = optimization(ast)
        return self.evaluate(ast)
    
    def push_down_predicates(self, node):
        """Push WHERE clauses down to individual tables"""
        if isinstance(node, Join):
            if node.condition:
                left_refs = self.get_column_refs(node.condition.left)
                right_refs = self.get_column_refs(node.condition.right)
                if not (left_refs & right_refs):
                    # Split condition between tables
                    node.left = Select(node.left, node.condition.left)
                    node.right = Select(node.right, node.condition.right)
                    node.condition = None
        return node
    
    def optimize_joins(self, node):
        """Reorder joins for optimal execution"""
        if isinstance(node, Join):
            # Estimate costs and reorder based on table sizes
            left_cost = self.estimate_cost(node.left)
            right_cost = self.estimate_cost(node.right)
            if right_cost < left_cost:
                node.left, node.right = node.right, node.left
        return node
```

2. **Regular Expression Engine**:
```python
class RegexCompiler:
    def __init__(self):
        self.optimizations = [
            self.combine_literals,
            self.simplify_quantifiers,
            self.optimize_character_classes
        ]
    
    def compile(self, pattern):
        ast = self.parse(pattern)
        bytecode = self.generate_bytecode(ast)
        return self.optimize_bytecode(bytecode)
    
    def combine_literals(self, bytecode):
        """Combine consecutive literal characters"""
        result = []
        current_literal = []
        
        for instr in bytecode:
            if instr.type == 'MATCH_CHAR':
                current_literal.append(instr.char)
            else:
                if current_literal:
                    result.append(Instruction('MATCH_STRING', ''.join(current_literal)))
                    current_literal = []
                result.append(instr)
        
        return result
    
    def optimize_character_classes(self, bytecode):
        """Convert character classes to bit vectors for faster matching"""
        for i, instr in enumerate(bytecode):
            if instr.type == 'MATCH_CLASS':
                bytecode[i] = self.convert_to_bitvector(instr.chars)
        return bytecode
```

### Advanced Optimization Techniques

1. **Common Subexpression Elimination**:
```python
class CSEOptimizer:
    def __init__(self):
        self.expression_table = {}
    
    def optimize(self, node):
        if isinstance(node, BinaryOp):
            # Hash the expression
            expr_hash = self.hash_expression(node)
            
            # Check if we've seen this expression before
            if expr_hash in self.expression_table:
                return self.expression_table[expr_hash]
            
            # Optimize children
            node.left = self.optimize(node.left)
            node.right = self.optimize(node.right)
            
            # Store for future use
            self.expression_table[expr_hash] = node
            
        return node
    
    def hash_expression(self, node):
        if isinstance(node, BinaryOp):
            return hash((node.op, 
                        self.hash_expression(node.left),
                        self.hash_expression(node.right)))
        return hash(node.value)
```

2. **Loop Optimization**:
```python
class LoopOptimizer:
    def optimize(self, node):
        if isinstance(node, WhileLoop):
            # Loop invariant code motion
            invariant_code = self.find_invariant_code(node.body)
            if invariant_code:
                return Block([
                    *invariant_code,
                    WhileLoop(node.condition, 
                             self.remove_invariant_code(node.body))
                ])
            
            # Loop unrolling for constant iterations
            if self.is_constant_iteration(node):
                return self.unroll_loop(node)
        
        return node
    
    def find_invariant_code(self, body):
        """Find expressions that don't change within the loop"""
        invariant = []
        for stmt in body:
            if not self.has_loop_dependencies(stmt):
                invariant.append(stmt)
        return invariant
    
    def unroll_loop(self, node):
        """Unroll loop for better instruction cache usage"""
        if not self.should_unroll(node):
            return node
            
        unrolled = []
        for i in range(self.get_iteration_count(node)):
            unrolled.extend(self.clone_and_substitute(node.body, i))
        return Block(unrolled)
```

---

[← Previous Chapter](#chapter-9) | [Next Chapter: Coroutines and Modern Programming →](#chapter-11)

<a name="chapter-11"></a>
# Chapter 11: Coroutines and Modern Programming

## Learning Objectives
By the end of this chapter, you will:
- Understand coroutine concepts
- Implement basic coroutine systems
- Explore advanced coroutine features
- Build efficient concurrency models

## 11.1 Coroutine Basics

### 11.1.1 Understanding Coroutines
```python
# Impure function
total = 0
def add_to_total(x):
    global total
    total += x
    return total

# Pure function
def add_numbers(x, y):
    return x + y

# Implementation in our Lisp
def is_pure_function(fn, env):
    # Check if function modifies any external state
    original_env = env.copy()
    result1 = fn(1)
    env.restore(original_env)
    result2 = fn(1)
    return result1 == result2
```

### 11.1.2 Immutable Data Structures
```python
class ImmutableList:
    def __init__(self, items):
        self._items = tuple(items)
    
    def append(self, item):
        return ImmutableList(self._items + (item,))
    
    def remove(self, item):
        return ImmutableList(x for x in self._items if x != item)
```

## 11.2 Advanced Coroutine Features

### 11.2.1 Generators
```python
def generator():
    yield 1
    yield 2
    yield 3

# Usage
for value in generator():
    print(value)
```

### 11.2.2 Async/Await
```python
async def async_function():
    await asyncio.sleep(1)
    return "Hello, World!"

# Usage
result = async_function()
```

### 11.2.3 Coroutine Objects
```python
class Coroutine:
    def __init__(self, target, *args):
        self.target = target
        self.args = args
        self.done = False
        self.result = None
        self._context = None
    
    async def __call__(self):
        if not self.done:
            try:
                self._context = self.target(*self.args)
                self.result = next(self._context)
            except StopIteration as e:
                self.done = True
                self.result = e.value
        return self.result
    
    def send(self, value):
        if not self.done:
            try:
                self.result = self._context.send(value)
            except StopIteration as e:
                self.done = True
                self.result = e.value
        return self.result
```

### 11.2.4 Event Loop
```python
class EventLoop:
    def __init__(self):
        self.ready = deque()
        self.tasks = {}
        self.current = None
    
    def create_task(self, coro):
        task = Task(coro)
        self.tasks[task.id] = task
        self.ready.append(task)
```

## Solution Hints for Chapter 11 Exercises

### Coroutine Implementation Solutions
1. **Basic Coroutine System**:
```python
class Coroutine:
    def __init__(self, target, *args):
        self.target = target
        self.args = args
        self.done = False
        self.result = None
        self._context = None
    
    def run(self):
        if not self.done:
            try:
                self._context = self.target(*self.args)
                self.result = next(self._context)
            except StopIteration as e:
                self.done = True
                self.result = e.value
        return self.result
    
    def send(self, value):
        if not self.done:
            try:
                self.result = self._context.send(value)
            except StopIteration as e:
                self.done = True
                self.result = e.value
        return self.result
```

2. **Event Loop Implementation**:
```python
class EventLoop:
    def __init__(self):
        self.ready = deque()
        self.tasks = {}
        self.current = None
    
    def create_task(self, coro):
        task = Task(coro)
        self.tasks[task.id] = task
        self.ready.append(task)
        return task
    
    def run_forever(self):
        while True:
            self._run_once()
            if not self.ready and not self.tasks:
                break
    
    def _run_once(self):
        while self.ready:
            task = self.ready.popleft()
            self.current = task
            try:
                result = task.run()
                if isinstance(result, Future):
                    result.add_done_callback(
                        lambda _: self.ready.append(task))
                elif not task.done():
                    self.ready.append(task)
            finally:
                self.current = None
```

### Real-World Examples

1. **Async Web Server**:
```python
class AsyncWebServer:
    def __init__(self, host='localhost', port=8080):
        self.host = host
        self.port = port
        self.loop = EventLoop()
        self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.server_socket.setblocking(False)
        
    async def handle_client(self, client_socket):
        try:
            request = await self.receive_request(client_socket)
            response = await self.process_request(request)
            await self.send_response(client_socket, response)
        finally:
            client_socket.close()
    
    async def serve_forever(self):
        self.server_socket.bind((self.host, self.port))
        self.server_socket.listen()
        
        while True:
            client_socket, addr = await self.accept_client()
            self.loop.create_task(self.handle_client(client_socket))
```

2. **Async Database Client**:
```python
class AsyncDBClient:
    def __init__(self, connection_pool):
        self.pool = connection_pool
    
    async def execute(self, query, *params):
        conn = await self.pool.acquire()
        try:
            return await conn.execute(query, *params)
        finally:
            await self.pool.release(conn)
    
    async def transaction(self):
        conn = await self.pool.acquire()
        try:
            await conn.execute('BEGIN')
            yield conn
            await conn.execute('COMMIT')
        except Exception:
            await conn.execute('ROLLBACK')
            raise
        finally:
            await self.pool.release(conn)
```

### Advanced Coroutine Features

1. **Custom Awaitable Objects**:
```python
class Timeout:
    def __init__(self, timeout):
        self.timeout = timeout
    
    def __await__(self):
        yield ('sleep', self.timeout)

class Lock:
    def __init__(self):
        self._locked = False
        self._waiters = deque()
    
    async def acquire(self):
        if not self._locked:
            self._locked = True
            return True
        
        waiter = Future()
        self._waiters.append(waiter)
        await waiter
        self._locked = True
        return True
    
    def release(self):
        if not self._locked:
            raise RuntimeError('Lock is not acquired')
        
        self._locked = False
        if self._waiters:
            waiter = self._waiters.popleft()
            waiter.set_result(True)
```

2. **Task Scheduling and Priorities**:
```python
class PriorityEventLoop(EventLoop):
    def __init__(self):
        super().__init__()
        self.ready = PriorityQueue()
    
    def create_task(self, coro, priority=0):
        task = Task(coro, priority)
        self.tasks[task.id] = task
        self.ready.put((priority, task))
        return task
    
    def _run_once(self):
        while not self.ready.empty():
            priority, task = self.ready.get()
            self.current = task
            try:
                result = task.run()
                if isinstance(result, Future):
                    result.add_done_callback(
                        lambda _: self.ready.put((priority, task)))
                elif not task.done():
                    self.ready.put((priority, task))
            finally:
                self.current = None
```

---

<a name="chapter-12"></a>
# Chapter 12: Bringing It All Together

## Learning Objectives
By the end of this chapter, you will:
- Understand how to integrate different programming paradigms
- Build a complete interpreter with modern features
- Implement practical applications using the concepts learned
- Create efficient and maintainable code

## 12.1 Integrating Different Paradigms

### 12.1.1 Combining Functional and Imperative Styles
```python
class IntegratedSystem:
    def __init__(self):
        self.data = []
        self.operations = []
    
    def add_operation(self, operation):
        """Add operation in functional style"""
        self.operations.append(operation)
        return self
    
    def process(self, data):
        """Process data using composition"""
        return reduce(
            lambda acc, op: op(acc),
            self.operations,
            data
        )
    
    async def process_async(self, data):
        """Process data asynchronously"""
        result = data
        for op in self.operations:
            if asyncio.iscoroutinefunction(op):
                result = await op(result)
            else:
                result = op(result)
        return result
```

## 12.2 Building a Complete Interpreter

### 12.2.1 Modern Language Features
```python
class ModernInterpreter:
    def __init__(self):
        self.symbol_table = SymbolTable()
        self.type_checker = TypeChecker()
        self.optimizers = [
            ConstantFolder(),
            DeadCodeEliminator(),
            TailCallOptimizer()
        ]
    
    async def evaluate(self, ast):
        # Type checking
        self.type_checker.check(ast)
        
        # Optimization
        for optimizer in self.optimizers:
            ast = optimizer.optimize(ast)
        
        # Evaluation
        return await self.eval_node(ast)
    
    async def eval_node(self, node):
        if isinstance(node, AsyncFunction):
            return await self.eval_async_function(node)
        elif isinstance(node, Function):
            return self.eval_function(node)
        # ... other node types
```

## 12.3 Practical Applications

### 12.3.1 Building a Language Server
```python
class LanguageServer:
    def __init__(self):
        self.workspace = Workspace()
        self.analyzer = CodeAnalyzer()
        self.completer = Completer()
    
    async def handle_request(self, request):
        if request.method == 'textDocument/completion':
            return await self.handle_completion(request)
        elif request.method == 'textDocument/definition':
            return await self.handle_definition(request)
        # ... other request types
    
    async def handle_completion(self, request):
        document = self.workspace.get_document(request.params.uri)
        position = request.params.position
        return await self.completer.complete(document, position)
```

### 12.3.2 Implementing a Build System
```python
class BuildSystem:
    def __init__(self):
        self.tasks = {}
        self.dependencies = {}
        self.event_loop = EventLoop()
    
    def add_task(self, name, action, deps=None):
        self.tasks[name] = action
        self.dependencies[name] = deps or []
    
    async def build(self, target):
        # Build dependency graph
        graph = self.build_graph(target)
        
        # Execute tasks in correct order
        for task in graph.topological_sort():
            if asyncio.iscoroutinefunction(self.tasks[task]):
                await self.tasks[task]()
            else:
                self.tasks[task]()
```

## Practice Exercises

1. **Integration Exercise**
   - Combine functional and async programming
   - Implement a reactive system
   - Create a type-safe async pipeline

2. **Interpreter Enhancement**
   - Add modern language features
   - Implement optimizations
   - Create development tools

3. **Application Development**
   - Build a complete language server
   - Create a build system
   - Implement a package manager

## Review Questions

1. How do different programming paradigms complement each other?
2. What are the key considerations when building modern interpreters?
3. How can we ensure maintainability in large systems?
4. What role do development tools play in language implementation?

## Further Reading
- Domain-Specific Languages (Martin Fowler)
- Implementing Domain-Specific Languages with LLVM
- Language Server Protocol Specification

[← Previous Chapter](#chapter-11)


---

<a name="part-2-fasm-reference"></a>
# Part 2: FASM Reference Guide



# FASM Reference Guide

This page adapts the repository reference into a GitHub Pages handbook format.

## Full Chapters

- [Full Reference Guide]({{ '/reference-guide/' | relative_url }})
- [AI FASM Rules]({{ '/ai-fasm-rules/' | relative_url }})
- [Example catalog]({{ '/examples/' | relative_url }})

<a name="en-fasm-1-structure"></a>
## 1. Program Structure

```nasm
format ELF64 executable
entry main
```

- Use `format ELF64 executable` for Linux executables.
- Keep segments explicit and predictable.

```nasm
segment readable writeable
segment readable executable
```

<a name="en-fasm-2-syscalls"></a>
## 2. System Calls

```nasm
SYS_read  equ 0
SYS_write equ 1
SYS_close equ 3
SYS_exit  equ 60
```

- `RAX` holds the syscall number.
- `RDI`, `RSI`, `RDX`, `R10`, `R8`, `R9` hold arguments in that order.

<a name="en-fasm-3-files"></a>
## 3. File Operations

```nasm
mov rax, 2
mov rdi, filename
mov rsi, 0
syscall
```

- Check syscall return values immediately.
- Negative values indicate an error on Linux.

<a name="en-fasm-4-data"></a>
## 4. Data And Memory

```nasm
file_handle dq 0
filename db 'lol.txt', 0
buffer_size equ 1024
buffer rb buffer_size
```

- Declare constants first.
- Keep strings zero-terminated.
- Reserve buffers explicitly with `rb`, `rw`, `rd`, or `rq`.

<a name="en-fasm-5-helpers"></a>
## 5. Function Helpers

```nasm
macro funcall1 func, a
{
    mov rdi, a
    call func
}
```

- Wrapper macros reduce boilerplate.
- Still preserve registers carefully when building reusable routines.

<a name="en-fasm-6-registers"></a>
## 6. Register Conventions

- `RAX` is used for syscall numbers and return values.
- `RDI`, `RSI`, `RDX`, `RCX` commonly carry parameters.
- `RAX`, `RCX`, `RDX`, `R8` to `R11` should be treated as volatile.

<a name="en-fasm-7-errors"></a>
## 7. Error Handling

```nasm
syscall
test rax, rax
js error_handler
```

- Test after every syscall that can fail.
- Centralize cleanup in one error path when possible.

<a name="en-fasm-8-read-loop"></a>
## 8. Common Pattern: Read Loop

```nasm
read_loop:
    mov rax, SYS_read
    mov rdi, [file_handle]
    mov rsi, buffer
    mov rdx, buffer_size
    syscall
```

- This is the core pattern behind `mycat.asm`.
- Follow it with zero-byte EOF handling and error checks.

<a name="en-fasm-9-numbers"></a>
## 9. Number Printing Tricks

The repository includes compact arithmetic techniques, especially in `fib.asm`, for converting integers into ASCII digits efficiently.

<a name="en-fasm-10-opt"></a>
## 10. Optimization Notes

- Prefer registers over memory traffic.
- Keep stack alignment at 16 bytes before calls.
- Use simple flag-based tests such as `test rax, rax` when appropriate.

<a name="en-fasm-11-debug"></a>
## 11. Debugging

- Insert breakpoints with `int3` when needed.
- Use `readelf -h <binary>` to inspect ELF entry details.
- A graphical frontend such as `gf` can make GDB easier to navigate.

<a name="en-fasm-12-related"></a>
## 12. Related Material

- [English overview]({{ '/en/' | relative_url }})
- [Russian handbook]({{ '/book-ru/' | relative_url }})
- [Full Reference Guide]({{ '/reference-guide/' | relative_url }})
- [AI FASM Rules]({{ '/ai-fasm-rules/' | relative_url }})


---


---

<a name="part-3-examples"></a>
# Part 3: Example Catalog

# Example Catalog

This page is the canonical map of executable and wrapper-based examples in the repository.

## Basic Examples

| Example | Focus | Files |
| --- | --- | --- |
| `mycat.asm` | file reading and writing | root |
| `arg.asm` | command-line argument handling | root |
| `fib.asm` | integer math and output | root |
| `two_sum.asm` | algorithmic search pattern | root |
| `file_ops.asm` | lower-level file operations | root |
| `quicksort.asm` | sorting example | root |

## Integrated Examples

| Example | Focus | Files |
| --- | --- | --- |
| `add/` | FASM function exposed through C and Python | `add.asm`, `wrapper.c`, `add.py` |
| `binary_search/` | standalone binary search and wrapper variant | `bin_s.asm`, `bin_s.py`, `wrapper/` |
| `coroutines/` | coroutine/context switch experiment | `switch.asm`, `wrapper.c`, `coroutine.py` |
| `vec/` | vector math and dot product via shared library | `dot_product.asm`, `wrapper.c`, `vec.py` |
| `cadd/` | pure C shared-library bridge example | `add.c`, `add.py` |
| `hex_editor/` | practical binary inspection utility | `hex_editor.asm` |
| `oop_game/` | OOP-style state model in FASM driven from Python | `game.asm`, `wrapper.c`, `game.py` |

## Core Support Files

- `common.inc` for reusable macros and helper routines.
- `linux.inc` for Linux syscall constants and wrappers.
- `AI_FASM_RULES.md` for repository-specific FASM generation conventions.
- `FASM_REFERENCE_GUIDE.md` for low-level reference material.

## Suggested Reading Order

1. Start with `fib.asm`, `arg.asm`, and `mycat.asm`.
2. Move to `binary_search/`, `add/`, and `cadd/`.
3. Continue with `coroutines/`, `vec/`, `hex_editor/`, and `oop_game/`.
4. Use the handbook pages for concepts and the full reference pages for details.


---

<a name="part-4-full-reference"></a>
# Part 4: Full Reference Guide

# FASM (Flat Assembler) Reference Guide

## 1. SYSTEM CALLS AND FILE OPERATIONS
From linux.inc and mycat.asm:

### System Call Numbers
```nasm
SYS_read  equ 0    ; Read from file
SYS_write equ 1    ; Write to file
SYS_exit  equ 60   ; Exit program
SYS_close equ 3    ; Close file
```

### File Operations
Opening Files:
```nasm
mov rax, 2        ; sys_open
mov rdi, filename ; File path
mov rsi, 0        ; O_RDONLY
syscall
```

### Standard Descriptors
```nasm
STDOUT   equ 1
STDERR   equ 2
```

## 2. FUNCTION MACROS
From linux.inc:

### Function Call Wrappers
```nasm
macro funcall1 func, a
{
    mov rdi, a
    call func
}

macro funcall2 func, a, b
{
    mov rdi, a
    mov rsi, b
    call func
}
```

## 3. MEMORY AND DATA
From mycat.asm:

### Data Definitions
```nasm
file_handle dq 0         ; Quad-word (64-bit)
filename db 'lol.txt', 0 ; Null-terminated string
buffer_size equ 1024     ; Constant
buffer rb buffer_size    ; Reserve bytes
```

### Segments
```nasm
segment readable executable
segment readable writeable
```

## 4. ARITHMETIC AND NUMBER PROCESSING
From fib.asm:

### Number Printing
```nasm
mov r9, -3689348814741910323
mul r9
shr rdx, 3
lea rsi, [rdx+rdx*4]
add rsi, rsi
sub rax, rsi
add eax, 48
```

## 5. CONTROL FLOW

### Program Entry
```nasm
format ELF64 executable
entry main
```

### Error Checking
```nasm
test rax, rax     ; Check error
js error_handler  ; Jump if negative
```

## 6. REGISTER USAGE

### System Calls
- RAX: System call number
- RDI: First argument
- RSI: Second argument
- RDX: Third argument

### Function Parameters
- RDI: First parameter
- RSI: Second parameter
- RDX: Third parameter
- RCX: Fourth parameter

## 7. MEMORY MANAGEMENT

### Buffer Operations
- Fixed-size buffers
- Dynamic allocation
- Stack operations

## 8. EXIT CODES
```nasm
EXIT_SUCCESS equ 0
EXIT_FAILURE equ 1
```

## 9. DEBUGGING

### Common Debug Points
- Error checking after syscalls
- Buffer overflow prevention
- Memory alignment

## 10. OPTIMIZATION

### Register Usage
- Minimize memory access
- Use registers efficiently
- Proper alignment

## 11. COMMON PATTERNS

### File Reading Loop
From mycat.asm:
```nasm
read_loop:
    mov rax, SYS_read
    mov rdi, [file_handle]
    mov rsi, buffer
    mov rdx, buffer_size
    syscall
```

### Function Structure
```nasm
function_name:
    ; Preserve registers if needed
    ; Function body
    ; Restore registers
    ret
```

## 12. SYSTEM INTEGRATION

### Process Control
- Program exit
- File operations
- Standard I/O

## 13. BEST PRACTICES

### Code Organization
- Clear sections
- Consistent naming
- Error handling
- Resource cleanup

## 14. QUICK REFERENCE

### Essential Instructions
- mov: Data movement
- syscall: System calls
- call/ret: Function calls
- push/pop: Stack operations

### Common Registers
- rax: System calls, return values
- rdi, rsi, rdx: Parameters
- rsp: Stack pointer

## 15. FUNDAMENTAL CONCEPTS

### Registers
#### General Purpose Registers (64-bit)
- RAX: Accumulator, function return value
- RBX: Base register, preserved across function calls
- RCX: Counter register, loop/string operations
- RDX: Data register, I/O operations
- RSI: Source index, string operations
- RDI: Destination index, string operations
- RBP: Base pointer, frame reference
- RSP: Stack pointer

#### 32-bit Versions
- EAX, EBX, ECX, EDX
- ESI, EDI, EBP, ESP

#### 16-bit Versions
- AX, BX, CX, DX
- SI, DI, BP, SP

#### 8-bit Access
- High: AH, BH, CH, DH
- Low: AL, BL, CL, DL

### Memory Segments
- Text (Code) Segment: Instructions
- Data Segment: Initialized data
- BSS Segment: Uninitialized data
- Stack Segment: Runtime stack

### Data Types
- Byte (db): 8 bits
- Word (dw): 16 bits
- Double Word (dd): 32 bits
- Quad Word (dq): 64 bits
- Ten Bytes (dt): 80 bits

## 16. INSTRUCTION SET

### Data Movement
- MOV: Basic data transfer
- XCHG: Exchange data
- PUSH: Push to stack
- POP: Pop from stack
- LEA: Load effective address

### Arithmetic Operations
- ADD: Addition
- SUB: Subtraction
- MUL: Unsigned multiply
- IMUL: Signed multiply
- DIV: Unsigned divide
- IDIV: Signed divide
- INC: Increment
- DEC: Decrement

### Logical Operations
- AND: Bitwise AND
- OR: Bitwise OR
- XOR: Bitwise XOR
- NOT: Bitwise NOT
- SHL/SAL: Shift left
- SHR: Logical shift right
- SAR: Arithmetic shift right
- ROL: Rotate left
- ROR: Rotate right

### Control Flow
- JMP: Unconditional jump
- CALL: Function call
- RET: Return from function
- Conditional Jumps:
  - JE/JZ: Equal/Zero
  - JNE/JNZ: Not equal/Not zero
  - JG/JNLE: Greater
  - JGE/JNL: Greater or equal
  - JL/JNGE: Less
  - JLE/JNG: Less or equal

## 17. MEMORY AND ADDRESSING

### Addressing Modes
- Immediate: Direct value
- Register: Register content
- Direct: Memory location
- Register Indirect: [register]
- Base+Index: [base+index]
- Scale: [base+index*scale]
- Displacement: [base+displacement]

### Memory Directives
- DB: Define byte
- DW: Define word
- DD: Define double
- DQ: Define quad
- DT: Define ten bytes
- RB: Reserve bytes
- RW: Reserve words
- RD: Reserve doubles
- RQ: Reserve quads

## 18. SYSTEM INTERFACE

### Linux System Calls
- System Call Numbers
- Parameter Passing
- Return Values
- Error Handling

### File Operations
- Opening Files
- Reading
- Writing
- Closing
- Error Checking

### Process Control
- Program Termination
- Process Creation
- Signal Handling
- Memory Management

## 19. OPTIMIZATION TECHNIQUES

### Code Optimization
- Register Usage
- Memory Access
- Loop Optimization
- Branch Prediction
- Instruction Selection

### Memory Optimization
- Alignment
- Caching
- Memory Access Patterns
- Buffer Management

## 20. DEBUGGING AND TOOLS

### Debugging
- GDB Commands
- Breakpoints
- Memory Inspection
- Register Examination
- Stack Tracing

### Common Tools
- FASM Assembler
- Linker
- Debugger
- Binary Utilities


---

<a name="part-5-ai-rules"></a>
# Part 5: AI FASM Rules

# FASM Code Generation Rules for AI

## 1. Program Structure Rules

### 1.1 Required Header
ALWAYS start with:
```nasm
format ELF64 executable    ; For executables
format ELF64              ; For libraries
include "common.inc"      ; Common macros and patterns
```

### 1.2 Segment Order
ALWAYS define segments in this order:
```nasm
segment readable writeable    ; Data first
    ; Constants and variables here

segment readable executable   ; Code second
entry main                   ; Entry point
```

## 2. Memory and Data Rules

### 2.1 Data Declarations
```nasm
; CORRECT order:
buffer_size equ 1024     ; 1. Constants first
error_msg db 'Error', 0  ; 2. Initialized data
buffer rb buffer_size    ; 3. Reserved space last
```

### 2.2 Size Constants
ALWAYS use predefined sizes:
```nasm
BUFFER_TINY   equ 128    ; For small strings
BUFFER_SMALL  equ 1024   ; Standard buffer
BUFFER_MEDIUM equ 4096   ; Page size
BUFFER_LARGE  equ 8192   ; Large operations
```

### 2.3 String Declarations
ALWAYS include terminators:
```nasm
db 'Message', 0      ; Null-terminated
db 'Line', 0xA, 0   ; With newline and null
```

## 3. Register Usage Rules

### 3.1 System Call Parameters
NEVER mix up this order:
```nasm
RAX : System call number
RDI : First argument
RSI : Second argument
RDX : Third argument
R10 : Fourth argument
R8  : Fifth argument
R9  : Sixth argument
```

### 3.2 Register Preservation
ALWAYS preserve in this order:
```nasm
; On entry:
push rbp
push rbx        ; If used
push r12-r15    ; If used

; On exit (REVERSE order):
pop r15-r12
pop rbx
pop rbp
```

### 3.3 Volatile Registers
NEVER assume these preserve values:
```nasm
RAX, RCX, RDX    ; Always volatile
R8-R11           ; Caller-saved
```

## 4. Error Handling Rules

### 4.1 System Calls
ALWAYS check returns:
```nasm
syscall
test rax, rax    ; Check result
js error         ; Negative = error
```

### 4.2 Error Handler Structure
ALWAYS include these components:
```nasm
error_handler:
    ; 1. Print error message
    ; 2. Clean up resources
    ; 3. Exit with failure
```

## 5. Function Implementation Rules

### 5.1 Function Structure
ALWAYS follow this pattern:
```nasm
function_name:
    ; 1. Save registers
    ; 2. Setup stack frame
    ; 3. Function body
    ; 4. Restore stack
    ; 5. Restore registers
    ; 6. Return
```

### 5.2 Parameter Access
PREFER registers over stack:
```nasm
; First 6 parameters in registers
; Additional parameters at [rbp+16], [rbp+24], etc.
```

## 6. Memory Safety Rules

### 6.1 Buffer Operations
ALWAYS check bounds:
```nasm
cmp rax, buffer_size    ; Check size
jae error_handler      ; Handle overflow
```

### 6.2 String Operations
ALWAYS set maximum length:
```nasm
mov rcx, BUFFER_SMALL   ; Set max length
rep movsb              ; Safe copy
```

## 7. Macro Usage Rules

### 7.1 System Call Macros
PREFER safe versions:
```nasm
; Use these:
syscall3_safe SYS_write, STDOUT, msg, len

; Instead of:
mov rax, SYS_write
mov rdi, STDOUT
mov rsi, msg
mov rdx, len
syscall
```

### 7.2 Function Macros
USE provided helpers:
```nasm
funcall2 print_string, message, length
```

## 8. File Operation Rules

### 8.1 File Opening
ALWAYS check mode and permissions:
```nasm
; Reading
open_file filename, O_RDONLY

; Writing (with create)
open_file filename, O_WRONLY or O_CREAT, 0644o
```

### 8.2 File Handling
ALWAYS follow this sequence:
1. Open file
2. Check handle
3. Perform operations
4. Close file
5. Handle errors

## 9. Memory Management Rules

### 9.1 Stack Alignment
ALWAYS maintain 16-byte alignment:
```nasm
sub rsp, 32    ; Align to 16 bytes
```

### 9.2 Memory Access
PREFER structured access:
```nasm
mov eax, [rbx + 4*rcx]    ; Indexed
mov eax, [rbx + struct.field]  ; Structure
```

## 10. Optimization Rules

### 10.1 Loop Optimization
```nasm
; PREFER:
xor rcx, rcx    ; Clear counter
rep movsb      ; Use string ops
```

### 10.2 Condition Codes
PREFER flags over comparisons:
```nasm
test rax, rax    ; Instead of cmp rax, 0
```

## 11. Debug Support Rules

### 11.1 Debug Points
```nasm
debug_break    ; Insert breakpoint
```

### 11.2 Debug Messages
```nasm
print_debug msg, len
```

## 12. Common Patterns

### 12.1 Command Line Arguments
```nasm
main:
    mov r9, [rsp + 16]    ; argv[1]
    test r9, r9           ; Check exists
```

### 12.2 Buffer Processing
```nasm
read_loop:
    read_file fd, buffer, buffer_size
    test rax, rax
    jz done
```

## 13. Safety Checklist

### 13.1 Before System Calls
1. ✓ Correct registers loaded
2. ✓ Valid pointers
3. ✓ Buffer space available
4. ✓ Error handling ready

### 13.2 Before Functions
1. ✓ Parameters in order
2. ✓ Stack aligned
3. ✓ Registers preserved
4. ✓ Return value location clear

## 14. Code Generation Template

### 14.1 Basic Program
```nasm
format ELF64 executable

include "common.inc"

segment readable writeable
    ; Data here

segment readable executable
entry main

main:
    ; Code here
    program_exit EXIT_SUCCESS

error_handler:
    handle_error error_msg, error_msg_len
```

### 14.2 Library Module
```nasm
format ELF64

public function_name

segment readable executable

function_name:
    function_start
    ; Implementation
    function_end
```

## 15. Testing Rules

### 15.1 Function Testing
1. Test null/empty inputs
2. Test maximum sizes
3. Test error conditions
4. Verify register preservation

### 15.2 System Testing
1. Test file operations
2. Test memory operations
3. Test error handling
4. Verify cleanup

## 16. Documentation Requirements

### 16.1 Function Headers
```nasm
; Function: name
; Input:   RDI - first parameter
;          RSI - second parameter
; Output:  RAX - result
; Affects: RCX, RDX
; Notes:   Any special considerations
```

### 16.2 Error Messages
```nasm
error_msg db 'Error: specific description', 0xA, 0
error_msg_len = $ - error_msg
```

## 17. Number Printing Rules

### 17.1 Integer to String Conversion
ALWAYS use this optimized pattern for printing numbers:
```nasm
print:
    mov     r9, -3689348814741910323    ; Magic number for division optimization
    sub     rsp, 40                      ; Reserve stack space
    mov     BYTE [rsp+31], 10           ; Store newline at end
    lea     rcx, [rsp+30]               ; Point to buffer end

.convert_loop:
    mov     rax, rdi                    ; Number to convert in RDI
    lea     r8, [rsp+32]               ; End of buffer pointer
    mul     r9                         ; Optimized division by 10
    mov     rax, rdi
    sub     r8, rcx                    ; Calculate length
    shr     rdx, 3                     ; Quick divide by 8
    lea     rsi, [rdx+rdx*4]           ; Multiply by 5
    add     rsi, rsi                   ; Multiply by 2 (total *10)
    sub     rax, rsi                   ; Get remainder
    add     eax, 48                    ; Convert to ASCII
    mov     BYTE [rcx], al             ; Store digit
    mov     rax, rdi                   ; Preserve number
    mov     rdi, rdx                   ; Move quotient for next iteration
    mov     rdx, rcx                   ; Save current position
    sub     rcx, 1                     ; Move buffer pointer
    cmp     rax, 9                     ; Check if more digits
    ja      .convert_loop              ; Continue if number > 9

    lea     rax, [rsp+32]              ; Calculate string length
    mov     edi, 1                     ; STDOUT
    sub     rdx, rax                   ; Calculate length
    xor     eax, eax                   ; Clear RAX
    lea     rsi, [rsp+32+rdx]          ; Point to start of number
    mov     rdx, r8                    ; Length to write
    mov     rax, 1                     ; SYS_write
    syscall                            ; Write number
    add     rsp, 40                    ; Restore stack
    ret
```

### 17.2 Number Printing Rules
1. ALWAYS use the optimized division method with magic number
2. NEVER use division instruction for base 10 conversion
3. ALWAYS handle the full range of 64-bit integers
4. PREFER stack buffer over static buffer for thread safety
5. ALWAYS include newline handling option
6. ALWAYS preserve all registers except RAX (syscall)

### 17.3 Optimization Techniques
1. Use magic number `-3689348814741910323` for division by 10
2. Use `shr rdx, 3` instead of division for quotient
3. Use `lea` for multiplication by 10 (multiply by 5 then 2)
4. Build string in reverse order for efficiency
5. Combine digit conversion with ASCII adjustment in one step

### 17.4 Buffer Management
1. ALWAYS allocate sufficient stack space (40 bytes standard)
2. PREFER stack allocation over static buffers
3. ALWAYS handle buffer boundaries safely
4. CALCULATE final string length correctly
5. INCLUDE space for newline if needed

### 17.5 Register Usage for Print
```nasm
RDI : Input number to print
R9  : Magic number constant
RAX : Working register / syscall
RCX : Buffer pointer
RDX : Division result / length
RSI : Multiplication result / buffer pointer
R8  : Length calculation
```

### 17.6 Print Function Integration
ALWAYS follow this pattern when using print:
```nasm
; Before calling print:
mov rdi, number_to_print    ; Load number in RDI
call print                  ; Call print function

; For multiple numbers:
push rdi                    ; Save current number if needed
call print
pop rdi                     ; Restore for next operation
```

## 14. Array Handling Rules

### 14.1 Array Declarations
```nasm
; CORRECT array declarations:
array dq 64, 34, 25    ; Initialized array
buffer rb 1024         ; Reserved buffer
array_size equ ($ - array) / 8  ; Size calculation
```

### 14.2 Array Access Patterns
```nasm
; ALWAYS use proper indexing:
mov rax, [array + rdi*8]    ; 64-bit elements
mov eax, [array + rdi*4]    ; 32-bit elements
mov al, [array + rdi]       ; 8-bit elements

; ALWAYS check bounds:
cmp rdi, array_size
jae error_handler
```

### 14.3 Array Iteration
```nasm
; Forward iteration
xor rbx, rbx           ; Clear counter
.loop:
    cmp rbx, length
    jge .done
    ; Process array[rbx]
    inc rbx
    jmp .loop

; Reverse iteration
mov rbx, length
.loop:
    dec rbx
    ; Process array[rbx]
    test rbx, rbx
    jnz .loop
```

## 15. Number Formatting Rules

### 15.1 Integer to String
```nasm
; ALWAYS reserve sufficient buffer:
number_buffer rb 32    ; For 64-bit integers

; CORRECT conversion pattern:
mov rax, number        ; Number to convert
mov r12, 10           ; Base (decimal)
.convert:
    xor rdx, rdx
    div r12           ; Divide by base
    add dl, '0'       ; Convert to ASCII
    mov [buffer + rbx], dl
    dec rbx
    test rax, rax
    jnz .convert
```

### 15.2 Output Formatting
```nasm
; ALWAYS include spacing:
msg db ' '            ; Space between numbers
newline db 0xA        ; Line endings

; String length calculation:
msg_len = $ - msg     ; Without null terminator
```

## 16. Recursive Function Rules

### 16.1 Register Preservation
```nasm
; ALWAYS save used registers:
push rbp
push rbx              ; Callee-saved
push r12-r15         ; If used
mov rbp, rsp

; ALWAYS restore in reverse order:
mov rsp, rbp
pop r15-r12
pop rbx
pop rbp
```

### 16.2 Parameter Passing
```nasm
; First 6 parameters:
rdi - First parameter
rsi - Second parameter
rdx - Third parameter
rcx - Fourth parameter
r8  - Fifth parameter
r9  - Sixth parameter

; Additional parameters on stack:
[rbp + 16] - Seventh parameter
[rbp + 24] - Eighth parameter
```

### 16.3 Recursive Calls
```nasm
; ALWAYS save parameters before recursive call:
mov r12, rdi          ; Save first param
mov r13, rsi          ; Save second param
call recursive_func
mov rdi, r12          ; Restore params
mov rsi, r13
```

## 17. Safety Guidelines

### 17.1 Buffer Operations
```nasm
; ALWAYS initialize buffers:
mov rcx, buffer_size
xor rax, rax
rep stosb            ; Zero buffer

; ALWAYS check buffer space:
lea rax, [rbx + 1]   ; Calculate needed space
cmp rax, buffer_size
ja error_handler
```

### 17.2 Error Handling
```nasm
; ALWAYS check system calls:
syscall
test rax, rax
js error_handler

; ALWAYS provide error messages:
error_msg db 'Error: Buffer overflow', 0
```

## Array Handling Rules

### Array Declaration and Access
1. Always declare array size as a constant or computed value
2. Use proper element size multipliers (1, 2, 4, 8 bytes)
3. Validate array indices before access
4. Use macros for common array operations

Example:
```nasm
; Good - Clear size and element type
array_size equ 100
array rq array_size    ; quad-word array

; Good - Index validation
cmp rax, array_size
jae error_handler
mov rbx, [array + rax*8]

; Bad - No size checking
mov rbx, [array + rax*8]  ; Potential buffer overflow
```

### Array Iteration
1. Initialize counters to zero or array bounds
2. Use appropriate comparison instructions
3. Preserve array bounds in registers
4. Clear loop registers after use

Example:
```nasm
; Good - Clear initialization and bounds checking
xor rcx, rcx          ; Clear counter
mov rdx, array_size   ; Load bound once
.loop:
    mov rax, [array + rcx*8]
    inc rcx
    cmp rcx, rdx
    jb .loop
xor rcx, rcx          ; Clear after use

; Bad - Inefficient and unsafe
mov rcx, 0
.loop:
    mov rax, [array + rcx*8]
    inc rcx
    cmp rcx, array_size  ; Reloads size each iteration
    jb .loop
```

## Recursive Function Rules

### Stack Frame Management
1. Always set up and restore stack frames
2. Align stack to 16 bytes
3. Save and restore all used registers
4. Clear registers after use

Example:
```nasm
; Good - Complete frame management
function:
    push rbp
    mov rbp, rsp
    push rbx
    push r12
    push r13
    
    ; Function body
    
    pop r13
    pop r12
    pop rbx
    mov rsp, rbp
    pop rbp
    ret

; Bad - Incomplete frame
function:
    push rbp
    ; Missing register saves
    ; Function body
    pop rbp
    ret
```

### Parameter Passing
1. Use standard registers (rdi, rsi, rdx, rcx, r8, r9)
2. Save parameters in callee-saved registers
3. Restore parameters for recursive calls
4. Document parameter usage

Example:
```nasm
; Good - Clear parameter handling
quicksort:            ; (array, low, high)
    ; Parameters:
    ; rdi = array base
    ; rsi = low index
    ; rdx = high index
    
    push rbp
    mov rbp, rsp
    push r12         ; Save array
    push r13         ; Save low
    push r14         ; Save high
    
    mov r12, rdi
    mov r13, rsi
    mov r14, rdx

; Bad - Unclear parameters
quicksort:
    push rbp
    mov rbp, rsp
    ; No parameter documentation
    ; No parameter saving
```

## Number Formatting Rules

### Integer Conversion
1. Handle special cases first (zero, negative)
2. Use appropriate buffer sizes
3. Validate input ranges
4. Clear temporary registers

Example:
```nasm
; Good - Complete number handling
convert_number:
    test rax, rax
    jz .zero_case
    js .negative_case
    
    mov r12, 10          ; Base
    lea rbx, [buffer+31] ; End of buffer
    mov byte [rbx], 0    ; Null terminator
    
    ; Conversion loop
    
    xor r12, r12        ; Clear temp register

; Bad - Incomplete handling
convert_number:
    div r12             ; No special cases
    add dl, '0'
    mov [buffer], dl
```

## Error Handling Rules

### System Call Errors
1. Check return values
2. Handle specific error codes
3. Provide error messages
4. Clean up resources

Example:
```nasm
; Good - Complete error handling
    mov rax, SYS_write
    syscall
    test rax, rax
    js .error
    
.error:
    neg rax
    mov rdi, error_msg
    call print_error
    jmp cleanup

; Bad - No error checking
    mov rax, SYS_write
    syscall
    ; Continue without checking
```

## Memory Safety Rules

### Buffer Operations
1. Check buffer sizes before operations
2. Use bounds-checked copy operations
3. Maintain null termination
4. Clear sensitive data

Example:
```nasm
; Good - Safe buffer handling
    mov rcx, dst_size
    cmp rcx, src_size
    jb .buffer_overflow
    
    rep movsb
    mov byte [rdi-1], 0
    
    ; Clear sensitive data
    push rcx
    mov rcx, src_size
    xor rax, rax
    rep stosb
    pop rcx

; Bad - Unsafe copy
    mov rcx, src_size
    rep movsb           ; No size check
```

## Register Usage Rules

### Register Allocation
1. Use caller-saved registers for temporary values
2. Save and restore callee-saved registers
3. Clear sensitive data from registers
4. Document register usage

Example:
```nasm
; Good - Clear register usage
    ; rax = loop counter
    ; rbx = array element
    ; r12 = array base
    push rbx
    push r12
    
    ; Function body
    
    xor rax, rax    ; Clear sensitive data
    pop r12
    pop rbx

; Bad - Unclear usage
    push rbx
    ; No documentation
    ; No clearing
    pop rbx
```

## Code Organization Rules

### Function Structure
1. Group related functions
2. Document dependencies
3. Maintain consistent calling conventions
4. Use meaningful labels

Example:
```nasm
; Good - Clear structure
section .text
; Array manipulation functions
array_init:
array_sort:
array_search:

; String handling functions
string_copy:
string_compare:

; Bad - Mixed functions
function1:
string_func:
array_func:
helper: 
```

## 1. Symbol Conflict Prevention Rules

### 1.1 Common Include Files
ALWAYS check for symbol conflicts with common.inc:
```nasm
; DON'T redefine these symbols (they're in common.inc):
; - System calls (SYS_*)
; - File descriptors (STDOUT, STDIN, etc.)
; - Exit codes (EXIT_SUCCESS, EXIT_FAILURE)
; - Common constants (SPACE, NEWLINE)
; - Common functions (print_string, etc.)
```

### 1.2 Symbol Naming
ALWAYS use unique prefixes for local symbols:
```nasm
; CORRECT - Unique prefixes
msg_program_name db 'MyProgram', 0
array_buffer rb 1024
number_temp dq 0

; WRONG - Generic names that might conflict
msg db 'MyProgram', 0    ; Too generic
buffer rb 1024           ; Could conflict
temp dq 0               ; Too generic
```

### 1.3 Function Naming
ALWAYS use descriptive, specific names:
```nasm
; CORRECT - Specific function names
print_array_numbers:     ; Clear purpose
convert_number_decimal:  ; Specific conversion

; WRONG - Generic names that might conflict
print:                  ; Too generic
convert:                ; Too vague
```

## 2. Array Handling Rules

### 2.1 Array Declarations
ALWAYS declare size constants and use proper alignment:
```nasm
ARRAY_SIZE equ 10              ; Size constant
array dq 64, 34, 25, 12       ; Aligned data
array_buffer rb ARRAY_SIZE * 8 ; Aligned buffer
```

### 2.2 Array Access
ALWAYS use proper indexing and bounds checking:
```nasm
; Check bounds before access
cmp rsi, ARRAY_SIZE
jae error_handler

; Use correct scaling
mov rax, [array + rsi*8]  ; For qwords
mov eax, [array + rsi*4]  ; For dwords
```

### 2.3 Array Parameters
ALWAYS pass array parameters consistently:
```nasm
; Standard parameter order:
; rdi = array base address
; rsi = array size or low index
; rdx = high index (for range operations)
```

## 3. Recursive Function Rules

### 3.1 Register Preservation
ALWAYS preserve registers in recursive functions:
```nasm
recursive_function:
    push rbp
    push rbx
    push r12-r15    ; Save all used registers
    mov rbp, rsp

    ; Function body

    mov rsp, rbp
    pop r15-r12     ; Restore in reverse order
    pop rbx
    pop rbp
    ret
```

### 3.2 Parameter Handling
ALWAYS save parameters before recursive calls:
```nasm
    mov r12, rdi    ; Save array pointer
    mov r13, rsi    ; Save low index
    mov r14, rdx    ; Save high index

    call recursive_function  ; Recursive call

    mov rdi, r12    ; Restore parameters
    mov rsi, r13
    mov rdx, r14
```

## 4. Number Formatting Rules

### 4.1 Buffer Management
ALWAYS use safe buffer practices:
```nasm
number_buffer rb 32        ; Sufficient size for 64-bit
add rbx, 31               ; Start from end
mov byte [rbx], 0         ; Null terminator
mov byte [rbx-1], SPACE   ; Use constants from common.inc
```

### 4.2 Number Conversion
ALWAYS handle special cases:
```nasm
    test rax, rax
    jz .zero_case     ; Handle zero
    js .negative      ; Handle negative
```

## 5. Common Include Usage Rules

### 5.1 Include Order
ALWAYS include common files first:
```nasm
format ELF64 executable
include 'common.inc'      ; First include
; ... other includes if needed
```

### 5.2 Using Common Functions
ALWAYS use common functions when available:
```nasm
; Use these from common.inc:
call print_string         ; For string output
syscall3_safe SYS_write  ; For safe syscalls
```

### 5.3 Constants Usage
ALWAYS use common constants:
```nasm
mov rdi, STDOUT          ; Use standard FD
mov rdi, EXIT_SUCCESS    ; Use exit codes
mov byte [rbx], NEWLINE  ; Use character constants
```

## 6. Error Handling Rules

### 6.1 Array Bounds
ALWAYS check array bounds:
```nasm
    cmp rsi, ARRAY_SIZE
    jae .error_handler
    
.error_handler:
    mov rdi, error_msg
    call print_string
    jmp exit_error
```

### 6.2 Buffer Overflow Prevention
ALWAYS validate buffer sizes:
```nasm
    lea rax, [rbx + 1]   ; Calculate needed space
    cmp rax, buffer_size
    ja .error_handler
```

## 7. Documentation Rules

### 7.1 Function Headers
ALWAYS document parameters and effects:
```nasm
; Function: sort_array
; Input:   rdi = array pointer
;          rsi = array size
; Output:  sorted array in-place
; Affects: rax, rbx, rcx, rdx
```

### 7.2 Complex Algorithms
ALWAYS document key steps:
```nasm
quicksort:
    ; 1. Base case check
    cmp rsi, rdx
    jge .done

    ; 2. Partition array
    call partition

    ; 3. Recursive sort left partition
    ; ... comments explaining the logic
```

## 18. Coroutines and Generators Implementation

### 18.1 Generator Structure
```nasm
; ALWAYS define a clear generator structure
struc Generator {
    .fresh db 0         ; Is this a fresh generator?
    .dead db 0          ; Is this generator dead?
    align 8             ; Ensure proper alignment
    .rsp dq 0           ; Saved stack pointer
    .stack_base dq 0    ; Base of generator's stack
    .func dq 0          ; Function pointer
}
```

### 18.2 Generator Stack Management
```nasm
; ALWAYS define a clear stack structure
struc GeneratorStack {
    .items dq 0         ; Array of generator pointers
    .count dq 0         ; Number of generators
    .capacity dq 0      ; Capacity of items array
}

; ALWAYS initialize the stack properly
generator_stack: dq 0   ; Global pointer to stack
```

### 18.3 Generator Function Implementation
```nasm
; ALWAYS check generator state first
generator_next:
    ; Check if generator is dead
    cmp byte [rdi + Generator.dead], 0
    jne .dead_generator
    
    ; Check if generator is fresh
    cmp byte [rdi + Generator.fresh], 0
    jne .fresh_generator
    
    ; Handle existing generator
    ; ...

.fresh_generator:
    ; Mark generator as not fresh
    mov byte [rdi + Generator.fresh], 0
    
    ; Save generator pointer before calling function
    push rdi
    
    ; Get and validate function pointer
    mov rax, [rdi + Generator.func]
    test rax, rax
    jz .func_error
    
    ; Call function with argument
    mov rdi, rsi
    call rax
    
    ; Restore generator pointer
    pop rdi
    
    ; Mark as dead after completion
    mov byte [rdi + Generator.dead], 1
```

### 18.4 Yield Implementation
```nasm
; ALWAYS keep yield implementation simple
generator_yield:
    ; Just return the argument for simplicity
    mov rax, rdi
    ret
```

### 18.5 Error Handling in Generators
```nasm
; ALWAYS handle error cases
.func_error:
    ; Pop saved generator pointer
    pop rdi
    
    ; Mark generator as dead
    mov byte [rdi + Generator.dead], 1
    
    ; Return NULL
    xor rax, rax
    ret

.dead_generator:
    ; Return NULL for dead generators
    xor rax, rax
    ret
```

### 18.6 Debug Messages
```nasm
; ALWAYS include debug messages for complex operations
section '.rodata' writeable
    dbg_next db 'DEBUG: generator_next called', 0xA, 0
    dbg_next_len = $ - dbg_next
    
    dbg_yield db 'DEBUG: generator_yield called', 0xA, 0
    dbg_yield_len = $ - dbg_yield

; Use debug print macro
debug_print dbg_next, dbg_next_len
```

### 18.7 Foreign Function Interface
```nasm
; ALWAYS export symbols for FFI
public generator_init
public generator_next
public generator_yield
public generator__finish_current

; ALWAYS use standard calling convention
; RDI: First argument (generator pointer)
; RSI: Second argument (value/argument)
; RAX: Return value
```


---

<a name="part-6-repo-map"></a>
# Part 6: Repository Map

# Repository Map

The repository follows a simple split: root-level standalone examples, folder-based integrated projects, and Pages-backed documentation.

## Root

- `common.inc`, `linux.inc`: shared include files and syscall helpers.
- `*.asm`: standalone learning examples and algorithms.
- `AI_FASM_RULES.md`, `FASM_REFERENCE_GUIDE.md`: source docs mirrored into the Pages handbook.
- `docs/`: GitHub Pages site.

## Project Folders

- `add/`: minimal shared-library example with Python and C interop.
- `binary_search/`: algorithm sample plus wrapper variant.
- `cadd/`: pure C bridge example.
- `coroutines/`: context switching and coroutine bindings.
- `hex_editor/`: standalone utility with its own README.
- `oop_game/`: OOP-style game state experiment in FASM.
- `vec/`: vector math example focused on dot products.

## Documentation Layers

- `README.md`: short repository entry point.
- `docs/index.md`: website landing page.
- `docs/examples.md`: example catalog.
- `docs/repository-map.md`: structural overview.
- `docs/book-en.md` and `docs/book-ru.md`: handbook overview pages.
- `docs/reference-guide-full.md` and `docs/ai-fasm-rules.md`: full chapter pages.

## Planned Consolidation

- Keep examples in their current paths to avoid breaking commands.
- Normalize README files and build instructions across example folders.
- Pull only FASM-specific material from other repositories, not unrelated Lisp or database content.

</section>
</div>
