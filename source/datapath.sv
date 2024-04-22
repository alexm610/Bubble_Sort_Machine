module datapath (input logic clk, input logic rst_n, input logic [3:0] writedata, input logic write, 
                 output logic [3:0] first_reg, output logic [3:0] second_reg, output logic [3:0] third_reg, output logic [3:0] fourth_reg);

    logic first_enable, second_enable, third_enable, fourth_enable, a_enable, b_enable, c_select, ab_select, reg_init, init;
    logic [1:0] reg_select;
    logic [3:0] first_out, second_out, third_out, fourth_out, a_out, b_out, m_out, data, data_through, init_data;
    int i, j;
    enum {IDLE, LOAD_A, INIT, DONE} state;

    assign first_reg    = first_out;
    assign second_reg   = second_out;
    assign third_reg    = third_out;
    assign fourth_reg   = fourth_out;

    register #(4) FIRST            (.clock(clk),
                                    .reset_n(rst_n),
                                    .in(data_through),
                                    .enable(first_enable),
                                    .out(first_out));

    register #(4) SECOND           (.clock(clk),
                                    .reset_n(rst_n),
                                    .in(data_through),
                                    .enable(second_enable),
                                    .out(second_out));

    register #(4) THIRD            (.clock(clk),
                                    .reset_n(rst_n),
                                    .in(data_through),
                                    .enable(third_enable),
                                    .out(third_out));

    register #(4) FOURTH           (.clock(clk),
                                    .reset_n(rst_n),
                                    .in(data_through),
                                    .enable(fourth_enable),
                                    .out(fourth_out));

    register #(4) A                (.clock(clk),
                                    .reset_n(rst_n),
                                    .in(m_out),
                                    .enable(a_enable),
                                    .out(a_out));

    register #(4) B                (.clock(clk),
                                    .reset_n(rst_n),
                                    .in(m_out),
                                    .enable(b_enable),
                                    .out(b_out));

    multiplexer_four_input #(4) MR (.A_in(first_out),
                                    .B_in(second_out),
                                    .C_in(third_out),
                                    .D_in(fourth_out),
                                    .select(reg_select),
                                    .E_out(m_out));
    
    multiplexer_two_input #(2) MC  (.A_in(i[1:0]),
                                    .B_in(j[1:0]),
                                    .select(c_select),
                                    .C_out(reg_select));

    multiplexer_two_input #(4) MAB (.A_in(a_out),
                                    .B_in(b_out),
                                    .select(ab_select),
                                    .C_out(data));  
    
    multiplexer_two_input #(4) MD  (.A_in(data),
                                    .B_in(init_data),
                                    .select(reg_init),
                                    .C_out(data_through));
    
    multiplexer_two_input #(4) MI  (.A_in(writedata),
                                    .B_in(4'h0),
                                    .select(init),
                                    .C_out(init_data));

    /*
    two_to_four_decoder DECODER     (.two_bits(reg_select),
                                     .four_bits({fourth_enable, third_enable, second_enable, first_enable}),
                                     .enable(reg_load));
    */

    always @(posedge clk) begin
        if (!rst_n) begin
            // Reset state machine
            state           <= IDLE;

            // Set sorting registers to zero
            first_enable    <= 1;
            second_enable   <= 1;
            third_enable    <= 1;
            fourth_enable   <= 1;
            init            <= 1;
            reg_init        <= 1;

            // Do not write anything to comparison registers
            a_enable        <= 0;
            b_enable        <= 0;

            // Reset counters
            i = 0;
            j = 0;
        end else begin
            case (state)
                IDLE: begin 
                    state           <= write ? INIT : IDLE;
                
                    // Set sorting registers to feed from user input (writedata)
                    init            <= 0;
                    reg_init        <= 1;
                    first_enable    <= 0;
                    second_enable   <= 0;
                    third_enable    <= 0;
                    fourth_enable   <= 0;


                    // Do not write to comparison registers
                    a_enable        <= 0;
                    b_enable        <= 0;


                end
                LOAD_A: begin

                end

            endcase
        end
    end


endmodule: datapath