`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 10:54:20 AM
// Design Name: 
// Module Name: Stack
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


module Stack(
    output reg [7:0] dout, // Data out 8-bits
    output reg [7:0] addr, // Address 8-bits, Stack Size(256loc)
    input wire [7:0] din,
    input push,
    input pop,
    input reset,
    input clk
    );
    
    reg [7:0] mem[255:0];
    
    initial begin
        dout = 0; // stack value
        addr = 0; // stack size
    end
    
    always @(posedge clk) begin
        if (reset) begin
            addr <= 0;
            dout <= 0;
        end
        if (push && (addr < 255)) begin
            addr <= addr + 1;
            mem[addr] <= din;
        end
        if (pop && (addr > 0)) begin
            dout <= mem[addr];
            mem[addr] <= 0;
            addr <= addr - 1;
        end
    end
    
endmodule
