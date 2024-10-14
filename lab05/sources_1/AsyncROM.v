`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 09:49:56 AM
// Design Name: 
// Module Name: AsyncROM
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


module AsyncROM(
    output wire [7:0] data_out, // Output Data 8-bits
    input wire [4:0] addr // Input Address 5-bits
    );
    
    (* rom_style = "block" *) reg[7:0] mem[31:0]; // 32 loc * 8 bits
    initial $readmemb("rom.mem", mem);
    
    assign data_out = mem[addr];
    
endmodule
