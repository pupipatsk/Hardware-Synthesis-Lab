`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : rom.v
// Title        : Program Memory
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
parameter DATA_WIDTH=32;
parameter ADDR_WIDTH=16; // Address 16-bits

module rom(
    output [DATA_WIDTH-1:0] data,
    input [ADDR_WIDTH-1:0] address
    );
    
reg	[DATA_WIDTH-1:0] mem[0:1<<ADDR_WIDTH -1];

assign data=mem[address];

initial begin
	$readmemb("prog.list",mem);
end

endmodule