`timescale 1ns/1ps

module universal_shift_register_tb;

    reg clk;
    reg reset;
    reg [1:0] mode;
    reg [3:0] parallel_in;
    reg serial_left;
    reg serial_right;

    wire [3:0] q;

    // Connect Universal Shift Register
    universal_shift_register uut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .parallel_in(parallel_in),
        .serial_left(serial_left),
        .serial_right(serial_right),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Create waveform
        $dumpfile("output.vcd");
        $dumpvars(0, universal_shift_register_tb);

        // Initial values
        clk = 0;
        reset = 1;
        mode = 2'b00;
        parallel_in = 4'b0000;
        serial_left = 0;
        serial_right = 0;

        #10;

        // Release reset
        reset = 0;

        // Parallel Load: 1010
        mode = 2'b11;
        parallel_in = 4'b1010;
        #10;

        // Shift Right
        mode = 2'b01;
        serial_right = 1;
        #10;

        // Shift Left
        mode = 2'b10;
        serial_left = 0;
        #10;

        // Hold
        mode = 2'b00;
        #10;

        // Parallel Load: 1100
        mode = 2'b11;
        parallel_in = 4'b1100;
        #10;

        $finish;

    end

endmodule