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