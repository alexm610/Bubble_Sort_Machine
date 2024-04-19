// Seven segment display definitions 
`define ZERO  		7'b1000000
`define ONE   		7'b1111001
`define TWO   		7'b0100100
`define THREE 		7'b0110000
`define FOUR  		7'b0011001
`define FIVE  		7'b0010010
`define SIX   		7'b0000010
`define SEVEN 		7'b1111000
`define EIGHT 		7'b0000000
`define NINE  		7'b0011000
`define A           7'b0001000
`define b           7'b0000011
`define C           7'b1000110
`define d           7'b0100001
`define E     		7'b0000110
`define F           7'b0001110
`define r     		7'b0101111
`define o     		7'b0100011
`define OFF   		7'b1111111

module register (clock, reset, in, enable, out);
    parameter k = 32;
    input logic clock, reset, enable;
    input logic[k-1:0] in;
    output logic [k-1:0] out;

    always @(posedge clock) begin
        if (!reset) begin
            out = {k{1'b0}};
        end else if (enable) begin
            out = in;
        end
    end
endmodule: register

module multiplexer_two_input (A_in, B_in, select, C_out);
    parameter k = 32;
    input logic [k-1:0] A_in, B_in;
    output logic [k-1:0] C_out;
    input logic select;

    always @(*) begin
        case (select)
            1'b0: C_out = A_in;
            1'b1: C_out = B_in;
            default: C_out = {k{1'b0}};
        endcase
    end
endmodule: multiplexer_two_input

module multiplexer_four_input (A_in, B_in, C_in, D_in, select, E_out);
    parameter k = 32;
    input logic [k-1:0] A_in, B_in, C_in, D_in;
    input logic [1:0] select;
    output logic [k-1:0] E_out;

    always @(*) begin
        case (select)
            2'b00: E_out = A_in;
            2'b01: E_out = B_in;
            2'b10: E_out = C_in;
            2'b11: E_out = D_in;
            default: E_out = {k{1'b0}};
        endcase
    end
endmodule: multiplexer_four_input

module binary_to_hex (BINARY, HEX);
    input logic [3:0] BINARY;
    output logic [6:0] HEX;

    always @(*) begin
        case (BINARY)
            4'h0: HEX = `ZERO;
            4'h1: HEX = `ONE;
            4'h2: HEX = `TWO;
            4'h3: HEX = `THREE;
            4'h4: HEX = `FOUR;
            4'h5: HEX = `FIVE;
            4'h6: HEX = `SIX;
            4'h7: HEX = `SEVEN;
            4'h8: HEX = `EIGHT;
            4'h9: HEX = `NINE; 
            4'hA: HEX = `A;
            4'hB: HEX = `b;
            4'hC: HEX = `C;
            4'hD: HEX = `d;
            4'hE: HEX = `E;
            4'hF: HEX = `F;
        endcase
    end
endmodule: binary_to_hex

module two_to_four_decoder (two_bits, four_bits, enable);
    input logic enable;
    input logic [1:0] two_bits;
    output logic [3:0] four_bits;

    always @(*) begin
        if (enable == 1) begin
            case (two_bits)
                2'b00: four_bits = 4'b0001;
                2'b01: four_bits = 4'b0010;
                2'b10: four_bits = 4'b0100;
                2'b11: four_bits = 4'b1000;
                default: four_bits = 4'd0;
            endcase
        end else begin
            four_bits = 4'd0;
        end
    end
endmodule: two_to_four_decoder