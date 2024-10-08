`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 12:08:58 PM
// Design Name: 
// Module Name: ClockDivCounter
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


module ClockDivCounter(
    output reg clk_out,
    input clk_in
    );
    
    reg [25:0] counter;
    always @(posedge clk_in) begin
        if (counter < 50000000)
            clk_out <= 1;
        else begin
            clk_out <= 0;
            if (counter == 100000000) 
                counter = 0; // reset counter
        end
    end
    
endmodule
