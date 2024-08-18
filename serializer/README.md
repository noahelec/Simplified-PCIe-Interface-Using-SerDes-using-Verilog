# Serializer Module

## Overview
The **Serializer** module is a SystemVerilog implementation that converts 16-bit parallel data into a serial bitstream. This module is essential for high-speed data communication systems where data needs to be transmitted serially over a single line.

## Features
- **16-bit Parallel Input**: Accepts 16-bit wide data as input.
- **Serial Output**: Converts and outputs the data bit by bit serially.
- **Load Control**: A `load` signal is used to latch the parallel data into the shift register.
- **Clock Synchronous**: Operates synchronously with a clock signal.

## Module Interface

### Inputs
- `clk`: Clock signal used for synchronization.
- `reset_n`: Active-low reset signal to initialize the module.
- `pdata`: 16-bit parallel data input.
- `load`: Control signal to load the parallel data into the shift register.

### Output
- `sdata`: Serial data output, transmitting the data bit by bit.

## How It Works
When the `load` signal is asserted, the 16-bit parallel data is loaded into an internal shift register. On each subsequent clock cycle, the data is shifted left, and the most significant bit is output via the `sdata` line. The serialization process continues until all 16 bits are transmitted.

## Example Usage
The Serializer can be used in various applications, including:
- High-speed data transmission over a single communication line.
- Interfacing with serial communication protocols.
- Converting parallel data from a microcontroller or FPGA to serial form for transmission.

## Testbench

### Overview
A SystemVerilog testbench is provided to validate the functionality of the Serializer module. The testbench simulates the Serializer's operation by applying test vectors and verifying the serialized output.

### Testbench Features
- **Clock Generation**: A 10ns clock signal drives the Serializer.
- **Reset and Load Control**: Simulates the initialization and data loading process.
- **Parallel Data Patterns**: Tests with different parallel data patterns to ensure correct serialization.
- **Output Monitoring**: Monitors the serial output and compares it with the expected bitstream.

### Test Scenarios
1. **Basic Serialization**: The testbench loads a known 16-bit pattern into the Serializer and checks that the serial output matches the expected bitstream.
2. **Multiple Data Patterns**: Tests with different 16-bit patterns to ensure the Serializer handles various input data correctly.

### Running the Testbench
To run the testbench:
1. Load the `Serializer.sv` and `Serializer_tb.sv` files into your SystemVerilog simulator (e.g., ModelSim, QuestaSim).
2. Compile the files.
3. Run the simulation and observe the output to verify that the serial data output matches the expected bitstream for each test case.

### Expected Output
The expected output of the testbench includes the correct serialization of the input data, with the serial output matching the MSB-first bitstream of the input parallel data.

## Example Output
Here is an example of what you might see in the simulation output:

