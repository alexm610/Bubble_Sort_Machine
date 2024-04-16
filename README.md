# Bubble_Sort_Machine
### An implementation of the Bubble Sort algorithm on an FPGA using SystemVerilog

## Notes
This project utilizes a keypad connected to the FPGA's GPIO pins. 
Four numbers in decimal form (each number must be between 0 and 15) must be entered to start the sorting algorithm. 
After each number is entered, the numbers converted to their hexadecimal representation will appear in the order they were entered on the FPGA's seven-segment display.
Once the fourth number has been entered, the numbers will move switch positions such that the smallest number is on the left of the display with the larger numbers to the right, assuming the user didn't enter the numbers in order initially.
