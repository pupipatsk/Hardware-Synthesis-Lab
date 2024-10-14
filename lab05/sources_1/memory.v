`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : memory.v
// Title        : Memory
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.

module memory(data, address, wr, clk, sw, seg, an, dp);

parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 16;
    
    inout [DATA_WIDTH-1:0] data;
    input [ADDR_WIDTH-1:0] address;
    input wr, clk;
    input [11:0] sw;
    output [6:0] seg;
    output [3:0] an;
    output dp;
    
    // Clock
    wire newClk;
    ClockDiv segDispClk(newClk, clk);
    // Display
    reg [3:0] num3,num2,num1,num0;
    QuadSevenSegmentDisplay display(seg, dp, an, num3, num2, num1, num0, newClk);
    
    reg	[3:0]	          mem[0:1<<ADDR_WIDTH-1];
    reg	[DATA_WIDTH-1:0]  data_out;
    // Tri-State buffer
    assign data=(wr==0) ? data_out : 32'bz;
    
    initial $readmemb("data.list",mem);
    
    // Memory-mapped I/o
    always @(address) begin
        case (address)
            default : data_out = mem[address];
            16'hFFF0 : data_out = num0;
            16'hFFF4 : data_out = num1;
            16'hFFF8 : data_out = num2;
            16'hFFFC : data_out = num3;
            16'hFFE0 : data_out = sw[3:0];
            16'hFFE4 : data_out = sw[7:4];
            16'hFFE8 : data_out = sw[11:8];
        endcase
    end
        
    always @(posedge clk)
    begin : MEM_WRITE
        if (wr) begin
           case (address)
           	    default : mem[address] = data;
                16'hFFF0 : num0 = data[3:0];
                16'hFFF4 : num1 = data[3:0];
                16'hFFF8 : num2 = data[3:0];
                16'hFFFC : num3 = data[7:4];
            endcase
        $display("%10d - MEM[%h] <- %h",$time, address, data);
        end
    end
    
endmodule