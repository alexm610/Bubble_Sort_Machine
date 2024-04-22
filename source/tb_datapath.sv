module tb_datapath();
    logic clk, rst_n, write;
    logic [3:0] writedata, first_reg, second_reg, third_reg, fourth_reg;
    reg error;
    enum {IDLE, LOAD_A, DONE} state;

    datapath dut(.*);

    initial forever begin
        clk = 0; #1;
        clk = 1; #1;
    end

    initial begin
        $display("");
        $display("------ Begin datapath.sv testbench ------");
        $display("");
        
        error = 0;
        write = 0;
        rst_n = 1;
        #2;
        rst_n = 0;
        #20;

        $display("Begin Test 1: hold reset high, confirm state is IDLE");
        if (dut.state != IDLE) begin
            $display("ERROR: state not in IDLE as reset is held high");
            error = 1;
        end else begin
            $display("TEST 1 PASSED");
        end

        rst_n = 1;
        #20;
        $display("Begin Test 2: release reset, confirm state remains in IDLE");
        if (dut.state != IDLE) begin
            $display("ERROR: state not in IDLE");
            error = 1;
        end else begin
            $display("TEST 2 PASSED");
        end

        if (error == 1) begin
            $display("TESTBENCH FAILED: see waveform");
        end else begin
            $display("TESTBENCH PASSED");
        end
        $stop;
    end


endmodule: tb_datapath