`timescale 1ns/1ps

module simon_top_wrapper (
    input  wire        clk,
    input  wire        reset,
    input  wire        start,          // External start pulse
    input  wire [63:0] key,            // 64-bit master key
    input  wire [31:0] plain_text,     // 32-bit plaintext block
    output wire [31:0] cipher_text,    // 32-bit ciphertext block
    output wire        done            // High when encryption completes
);

   
    simon_newer u_simon (
        .clk(clk),
        .reset(reset),
        .start(start),
        .key(key),
        .plain_text(plain_text),
        .cipher_text(cipher_text),
        .done(done)
    );

endmodule