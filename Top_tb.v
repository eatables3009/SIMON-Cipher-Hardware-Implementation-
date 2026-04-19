`timescale 1ns / 1ps

module Top_tb;

    // Parameters
    parameter N = 8;
    parameter M = 4;
    parameter C = 8;

    // Inputs
    reg clk_pad;
    reg reset_pad;
    reg [N-1:0] key_pad;
    reg [M-1:0] Plaintxt_pad;
    reg start_pad;

    // Outputs
    wire [M-1:0] cipher_pad;
    wire done_final_pad;
    wire [M-1:0] out_txt_pad;
    wire txt_done_final_pad;
    wire [5:0] test_pad;
    // Instantiate the DUT
    Top #(N, M, C) uut (
        .clk_pad(clk_pad),
        .reset_pad(reset_pad),
        .key_pad(key_pad),
        .Plaintxt_pad(Plaintxt_pad),
        .start_pad(start_pad),
        .cipher_pad(cipher_pad),
        .done_final_pad(done_final_pad),
        .out_txt_pad(out_txt_pad),
        .test_pad(test_pad),
        .txt_done_final_pad(txt_done_final_pad)
    );

    // Clock generation
    initial clk_pad = 0;
    always #5 clk_pad = ~clk_pad;

    // Test sequence
    initial begin
        // Initial state
        clk_pad = 0;
        reset_pad = 1;
        start_pad = 0;
        key_pad = 8'h00;
        Plaintxt_pad = 4'h0;

       

        // Hold reset_pad
        #20;
        reset_pad = 0;

        // Wait for one clock edge
        #20;

        // Start input
        start_pad = 1;

        // First input
        #10;
        key_pad = 8'h19;
        Plaintxt_pad = 4'h6;

        #10;
        key_pad = 8'h18;
        Plaintxt_pad = 4'h5;

        #10;
        key_pad = 8'h11;
        Plaintxt_pad = 4'h6;

        #10;
        key_pad = 8'h10;
        Plaintxt_pad = 4'h5;

        #10;
        key_pad = 8'h09;
        Plaintxt_pad = 4'h6;

        #10;
        key_pad = 8'h08;
        Plaintxt_pad = 4'h8;

        #10;
        key_pad = 8'h01;
        Plaintxt_pad = 4'h7;

        #10;
        key_pad = 8'h00;
        Plaintxt_pad = 4'h7;

        // Stop input
        #10;
        start_pad = 0;

        // Wait for done
        wait(done_final_pad == 1);

        $display("\n=========== Final Output ===========");
        $display("Cipher Nibble Out: %h", cipher_pad);
        $display("====================================\n");

        #50;
        $finish;
    end

endmodule
