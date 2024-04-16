module datapath (input logic clk, rst_n, input logic [1:0] address, input logic [3:0] data, 
                 output logic [3:0] first_reg, output logic [3:0] second_reg, output logic [3:0] third_reg, output logic [3:0] fourth_reg);

    logic first_enable, second_enable, third_enable, fourth_enable;

    enum {IDLE, DONE} state;

    register #(4) FIRST     (.clk(clk),
                             .reset(rst_n),
                             .in(data),
                             .enable(first_enable),
                             .out());

    register #(4) SECOND    (.clk(clk),
                             .reset(rst_n),
                             .in(data),
                             .enable(second_enable),
                             .out());

    register #(4) THIRD     (.clk(clk),
                             .reset(rst_n),
                             .in(data),
                             .enable(third_enable),
                             .out());

    register #(4) FOURTH    (.clk(clk),
                             .reset(rst_n),
                             .in(data),
                             .enable(fourth_enable),
                             .out());
        
    register #(4) A         (.clk(clk),
                             .reset(rst_n),
                             .in(),
                             .enable(),
                             .out());

    register #(4) B         (.clk(clk),
                             .reset(rst_n),
                             .in(),
                             .enable(),
                             .out());



endmodule: datapath