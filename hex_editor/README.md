# FASM Hex Editor

A simple hex editor written in FASM (Flat Assembler) that allows you to inspect binary files in a hex dump format.

## Features

- Display binary files in hex dump format
- Show ASCII representation alongside hex values
- Support for large files through buffered reading
- Clear error handling and reporting
- Efficient memory usage

## Building

To build the hex editor:

```bash
fasm hex_editor.asm
```

## Usage

```bash
./hex_editor <filename>
```

Example:
```bash
./hex_editor test.bin
```

## Output Format

The hex editor displays output in the following format:
```
00000000  48 65 6C 6C 6F 20 57 6F  72 6C 64 21 0A 00 00 00  |Hello World!....|
```

- Left column: Offset in hex
- Middle section: Hex values (16 bytes per line)
- Right section: ASCII representation

## Implementation Details

The hex editor follows the FASM style guide and implements several key features:

1. **Safe File Operations**
   - Proper file descriptor handling
   - Error checking for all operations
   - Clean resource cleanup

2. **Efficient Memory Usage**
   - Page-sized buffer for reading
   - Optimized string conversions
   - Minimal stack usage

3. **Clear Display Format**
   - Fixed-width columns
   - ASCII representation
   - Offset tracking

4. **Error Handling**
   - File open errors
   - Read errors
   - Close errors

## Example Output

```
00000000  7F 45 4C 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
00000010  03 00 3E 00 01 00 00 00  78 00 40 00 00 00 00 00  |..>.....x.@.....|
00000020  40 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |@...............|
```

## Contributing

Feel free to submit issues and enhancement requests! 