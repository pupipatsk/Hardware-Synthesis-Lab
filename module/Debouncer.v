`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2024 10:18:56 PM
// Design Name: 
// Module Name: Debouncer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Debouncer(
    output reg signal_out, // Debounced signal output
    input async_sinal_in, // Asynchronous signal input
    input clk
    );
    
    // Sychronization
    reg sync_signal, tmp;
    // similar as pass through 2 D-FlipFlop
    always @(posedge clk) begin
        tmp <= async_sinal_in;
//        sync_signal <= tmp;
        signal_out <= tmp;
    end
    
//    // TODO: fix
//    // Detect stable signal
//    // counter logic
//    parameter MAX_COUNT = 16'hFFFF; // 1.31 ms for 50 MHz
//    parameter WIDTH = 16;
//    reg [WIDTH-1:0] counter;
//    always @(posedge clk) begin
//        if (sync_signal == signal_out) begin // Stable signal
//            counter <= 0;
//            end
//        else begin // Signal change
//            counter <= counter + 1;
//            if (counter == MAX_COUNT) begin
//                signal_out <= sync_signal;
//                counter <= 0;
//                end
//            end
//    end
    
endmodule
