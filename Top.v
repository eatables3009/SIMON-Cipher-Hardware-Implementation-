`timescale 1ns / 1ps

module Top #(parameter N=8, M=4, C=8)(
    input clk,
    input reset,
    input [N-1:0] key,         // 8-bit key per cycle (input_taker_3 expects N=8)
    input [M-1:0] Plaintxt,    // 4-bit plaintext per cycle
    input start_pad,
    output [M-1:0] cipher,
    output done_final,
    output [M-1:0] out_txt,
    output [5:0] test,
    output txt_done_final
);

    // Internal wires
    wire [31:0] data_from_input;
    wire [63:0] key_out_from_input;
    wire input_done;

    wire simon_done;
    wire [31:0] cipher_from_simon;

    wire output_done;


wire clk,reset,start,done_final,CLK,txt_done_final;
wire [N-1:0] key;     
wire [M-1:0] cipher,Plaintxt,out_txt;
wire [5:0] test;

assign test = {key_out_from_input[53:50], reset, clk};

 // Instantiate simon_newer
    simon_newer u_simon (
        .clk(clk),
        .reset(reset),
        .start(input_done), // Trigger when input_taker is done
        .key(key_out_from_input),
        .plain_text(data_from_input),
        .cipher_text(cipher_from_simon),
        .done(simon_done)
    );

    
endmodule
