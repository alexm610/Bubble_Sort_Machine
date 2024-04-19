module bubble_sort (input logic CLOCK_50, input logic [3:0] KEY, input logic [9:0] SW, 
                    output logic [36:0] GPIO_0, output logic [9:0] LEDR, 
                    output logic [6:0] HEX0, output logic [6:0] HEX1, 
                    output logic [6:0] HEX2, output logic [6:0] HEX3, 
                    output logic [6:0] HEX4, output logic [6:0] HEX5);

    logic [3:0] hex_one, hex_two, hex_three, hex_four;

    datapath DATAPATH (.clk(CLOCK_50),
                       .rst_n(KEY[3]),
                       .data(SW[3:0]),
                       .start(KEY[0]),
                       .first_reg(hex_one),
                       .second_reg(hex_two),
                       .third_reg(hex_three),
                       .fourth_reg(hex_four));

    binary_to_hex B2H_0 (.BINARY(hex_one), 
                         .HEX(HEX0));
    binary_to_hex B2H_1 (.BINARY(hex_two), 
                         .HEX(HEX1));
    binary_to_hex B2H_2 (.BINARY(hex_three), 
                         .HEX(HEX2));
    binary_to_hex B2H_3 (.BINARY(hex_four), 
                         .HEX(HEX3));
    HEX4 = 7'b1111111;
    HEX5 = 7'b1111111;


endmodule: bubble_sort