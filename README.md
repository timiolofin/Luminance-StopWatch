# Luminance Stopwatch

## Description

 Luminance Stopwatch is a project that implements a digital timer using SystemVerilog for FPGA. The timer starts counting based on light detection and pauses upon subsequent light detection. It displays time in hours, minutes, and seconds on a seven-segment display. 

## Features

- Detects Lights 
- Displays time in hours, minutes, and seconds
- Utilizes binary to BCD conversion
- Drives a seven-segment display

## Technologies Used
### Hardware
- FPGA Development Board
- Seven-segment Display

### Software
- Intel Quartus Prime
- SystemVerilog

## Setup and Installation

### Prerequisites
- Intel Quartus Prime software
- FPGA development board compatible with the design
- Seven-segment display connected to the FPGA
- Light Sensor connected to the board

### Setup Instructions
1. Clone this Repository.
2. Launch the Quartus Prime software on your computer.
3. Open the project file (project.qsf) located in the main directory.

### Compilation and Programming
1. In Quartus Prime, click on Processing > Start Compilation and an sof file would be generated
2. Connect your FPGA development board to your computer.
3. In Quartus Prime, click on Tools > Programmer.
4. Click on Auto Detect to identify the FPGA device.
5. Click on Add File and select the generated .sof file.
6. Check the Program/Configure box.
7. Click on Start to program the FPGA.

