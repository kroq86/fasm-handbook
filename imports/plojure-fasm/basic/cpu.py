class SimpleCPU:
    def __init__(self):
        self.registers = {'A': 0, 'PC': 0}
        self.memory = [0] * 256

    def load_program(self, program):
        self.memory[:len(program)] = program

    def execute(self):
        while True:
            if self.registers['PC'] >= len(self.memory):
                break  
            opcode = self.memory[self.registers['PC']]
            if opcode == 0x00:  # NOP
                self.registers['PC'] += 1
            elif opcode == 0x01:  # LDA immediate
                self.registers['A'] = self.memory[self.registers['PC'] + 1]
                self.registers['PC'] += 2
            elif opcode == 0x02:  # ADD (with Carry)
                self.registers['A'] += self.memory[self.registers['PC'] + 1]
                self.registers['PC'] += 2
            elif opcode == 0xFF:  # HALT
                break

    def assemble(self, assembly_code):
        instructions = {
            "NOP": 0x00,
            "LDA": 0x01,
            "ADD": 0x02,
            "HLT": 0xFF,
        }
        
        program = []
        for line in assembly_code.splitlines():
            parts = line.split()
            if parts:
                opcode = instructions.get(parts[0])
                if opcode is not None:
                    program.append(opcode)
                    if len(parts) > 1:
                        operand = parts[1]
                        if operand.startswith('#'):
                            program.append(int(operand[1:]))
                        else:
                            raise ValueError(f"Invalid operand: {operand}")
        
        return program

assembly_code = """
LDA #5
ADD #3
HLT
"""

cpu = SimpleCPU()
program = cpu.assemble(assembly_code)
cpu.load_program(program)
cpu.execute()

print(f"Result = {cpu.registers['A']}")
