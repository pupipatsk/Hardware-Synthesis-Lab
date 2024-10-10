`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: SyncROM
// Description: Synchronous ROM
//////////////////////////////////////////////////////////////////////////////////


module SyncROM(
    output reg [7:0] data_out, // Output Data 8-bits
    input wire [4:0] addr, // Input Address 5-bits
    input clk
    );

    (* rom_style = "block" *) reg[7:0] mem[31:0]; // 32 loc * 8 bits
    initial $readmemb("rom.mem", mem);
    always @(posedge clk) begin
        data_out <= mem[addr];
    end

endmodule
