`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2024 10:05:42 PM
// Design Name: 
// Module Name: SinglePulser
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


module SinglePulser(
    output reg signal_out,
    input signal_in,
    input clk
    );
    
    reg signal_prev; // previous signal
    
    always @(posedge clk) begin
        signal_prev <= signal_in; // non-blocking, update at the end of time step(clk edge)
        
        // rising edge detection
        if (signal_in && !signal_prev)
            signal_out <= 1;
        else
            signal_out <= 0;
    end
    
endmodule
