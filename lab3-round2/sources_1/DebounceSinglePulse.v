`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2024 11:01:53 PM
// Design Name: 
// Module Name: DebounceSinglePulse
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


module DebounceSinglePulse(
    output reg signal_out,
    input wire signal_in,
    input clk
    );
    
    wire debounced_signal;
    wire pulse_signal;
    
    Debouncer debouncer(debounced_signal, signal_in, clk);
    
    SinglePulser singlepulser(pulse_signal, debounced_signal, clk);
    
    always @(posedge clk) begin
        signal_out <= pulse_signal;
    end
    
endmodule
