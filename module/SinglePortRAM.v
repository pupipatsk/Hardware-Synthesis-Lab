`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 10:00:06 AM
// Design Name: 
// Module Name: SinglePortRAM
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


module SinglePortRAM(
    inout wire [7:0] data, // Data In and Out 8-bits
    input wire [7:0] addr, // Address 8-bits, 256 locations
    input oe, // output enable
    input we, // write enable
    input clk
    );
    
    (*synthesis, ram_block*) reg [7:0] mem[127:0]; // 256 loc * 8 bits
    
    // Write
    always @(posedge clk) begin
        if (we)
            mem[addr] <= data;
    end
    // Read
    assign d = (oe && !we) ? mem[addr] : 8'bZ;
    
endmodule
