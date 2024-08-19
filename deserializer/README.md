# Deserializer Module

## Overview
The **Deserializer** module is a SystemVerilog implementation that converts a serial bitstream into 16-bit parallel data. This module is essential for high-speed data communication systems where serially transmitted data needs to be converted back into parallel form for processing.

## Features
- **Serial Input**: Accepts a bitstream as serial data input.
- **16-bit Parallel Output**: Converts and outputs the data as 16-bit parallel data.
- **Start Control**: A `start` signal is used to initiate the deserialization process.
- **Clock Synchronous**: Operates synchronously with a clock signal.

## Module Interface

### Inputs
- `clk`: Clock signal used for synchronization.
- `reset_n`: Active-low reset signal to initialize the module.
- `sdata`: Serial data input, receiving the data bit by bit.
- `start`: Control signal to start the deserialization process.

### Outputs
- `pdata`: 16-bit parallel data output after deserialization.
- `valid`: Signal indicating when the parallel data output is valid and ready for use.

## How It Works
When the `start` signal is asserted, the Deserializer begins shifting in serial data (`sdata`) into an internal shift register. After 16 bits are received, the data is output as a 16-bit parallel word (`pdata`), and the `valid` signal is asserted to indicate that the data is ready.

## Example Usage
The Deserializer can be used in various applications, including:
- High-speed data reception over a single communication line.
- Interfacing with serial communication protocols.
- Converting serial data back into parallel form for processing by microcontrollers or FPGAs.

## Testbench

### Overview
A SystemVerilog testbench is provided to validate the functionality of the Deserializer module. The testbench simulates the Deserializer's operation by applying test vectors and verifying the parallel data output.

### Testbench Features
- **Clock Generation**: A 10ns clock signal drives the Deserializer.
- **Reset and Start Control**: Simulates the initialization and deserialization process.
- **Serial Data Patterns**: Tests with different serial data patterns to ensure correct deserialization.
- **Output Monitoring**: Monitors the parallel data output and checks for correct deserialization.

### Test Scenarios
1. **Basic Deserialization**: The testbench sends a known serial bitstream to the Deserializer and checks that the parallel output matches the expected 16-bit word.
2. **Multiple Data Patterns**: Tests with different serial data patterns to ensure the Deserializer handles various input data correctly.
