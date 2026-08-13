# Universal Shift Register

## Description

This project implements a simple 4-bit Universal Shift Register using Verilog HDL.

A Universal Shift Register can perform four operations:

1. Hold the current data
2. Shift right
3. Shift left
4. Parallel load

## Inputs

| Input | Description |
|------|-------------|
| `clk` | Clock signal |
| `reset` | Resets the register |
| `mode` | Selects the operation |
| `parallel_in` | 4-bit parallel input |
| `serial_left` | Serial input for left shift |
| `serial_right` | Serial input for right shift |

## Output

| Output | Description |
|--------|-------------|
| `q` | 4-bit register output |

## Mode Selection

| Mode | Operation |
|------|-----------|
| `00` | Hold |
| `01` | Shift Right |
| `10` | Shift Left |
| `11` | Parallel Load |

## Working

### Hold

The register keeps its current value.

### Shift Right

Data moves one position to the right.

Example:

    1011 → 0101

### Shift Left

Data moves one position to the left.

Example:

    1011 → 0110

### Parallel Load

All four bits are loaded at the same time.

Example:

    parallel_in = 1100
    q = 1100

## Files

- `universal_shift_register.v` - Main Verilog code
- `universal_shift_register_tb.v` - Testbench
- `output.vcd` - Simulation waveform
- `README.md` - Project documentation

## How to Run

Compile:

    iverilog -o usr_sim universal_shift_register.v universal_shift_register_tb.v

Run:

    vvp usr_sim

Open waveform:

    gtkwave output.vcd

## Conclusion

The Universal Shift Register successfully performs hold, shift-right, shift-left, and parallel-load operations.