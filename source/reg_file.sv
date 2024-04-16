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