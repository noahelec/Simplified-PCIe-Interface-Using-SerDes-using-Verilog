# Simplified-PCIe-Interface-Using-SerDes-using-Verilog

## Introduction

Welcome to the **Simplified PCIe Interface Using SerDes** project! This repository contains a SystemVerilog implementation of a simplified PCIe (Peripheral Component Interconnect Express) interface, leveraging Serializer/Deserializer (SerDes) technology for high-speed data transmission. PCIe is a popular high-speed interface used in modern computing systems, enabling efficient communication between various hardware components such as processors, memory, and peripheral devices.

This project aims to provide a basic yet functional implementation of the PCIe interface, focusing on key components such as the Transaction Layer, Data Link Layer, and Physical Layer (SerDes). Each layer is designed to handle specific tasks within the PCIe protocol, from managing data transactions to ensuring reliable data transfer and high-speed serial communication.

### Key Features:
- **Transaction Layer**: Manages data read and write requests, forming and processing Transaction Layer Packets (TLPs).
- **Data Link Layer**: Ensures reliable data transmission with flow control and error detection mechanisms using CRC.
- **Physical Layer (SerDes)**: Handles the serialization of parallel data for transmission and deserialization upon reception, using clock and data recovery techniques.
- **8b/10b Encoding/Decoding**: Implements data encoding and decoding to maintain signal integrity and facilitate error detection.
- **Comprehensive Testbenches**: Each module includes a dedicated testbench for validation, ensuring correctness and robustness of the design.

### Project Structure:
The project is organized into the following key modules:
- **Serializer**: Converts 16-bit parallel data into a serial bitstream for transmission.
- **Deserializer**: Converts the incoming serial bitstream back into 16-bit parallel data.
- **8b/10b Encoder**: Encodes 8-bit data into 10-bit symbols to maintain DC balance and facilitate error detection.
- **8b/10b Decoder**: Decodes 10-bit symbols back into 8-bit data, checking for errors.
- **Clock and Data Recovery (CDR)**: Extracts the clock signal from the incoming serial data and aligns the data for correct reception.
- **Transaction Layer**: Manages read/write transactions and communicates with the Data Link Layer.
- **Data Link Layer**: Adds reliability through flow control, CRC error detection, and manages communication between the Transaction and Physical Layers.
- **Physical Layer (SerDes Interface)**: Implements the SerDes functionality, handling serialization/deserialization and interfacing with the Data Link Layer.

### How to Use:
- **Clone the Repository**: Download the project files to your local machine.
- **Explore the Modules**: Each module is self-contained, with a corresponding testbench to validate its functionality.
- **Run the Simulations**: Use a SystemVerilog simulator (e.g., ModelSim, QuestaSim) to run the provided testbenches and observe the behavior of each module.
- **Integrate and Extend**: Feel free to integrate these modules into your own projects or extend them to support more complex PCIe functionalities.
