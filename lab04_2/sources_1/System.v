`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: System
// Description: 
//////////////////////////////////////////////////////////////////////////////////


module System(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input [7:0] sw, // switch
    input clk
    );
    
    // Clock Divider
    wire newClk;
    ClockDiv clockDivider(newClk, clk);
    
    // Debouncer
    // switch 0-4
    wire [4:0] switches;
    genvar n;
    generate for(n=0;n<5;n=n+1) begin
        DebounceSinglePulse dbspSW(switches[n], sw[n], newClk);
    end endgenerate
    
    // ROM
    wire [3:0] num3,num2,num1,num0;
    assign num3 = 0;
    assign num2 = 0;
    SyncROM rom({num1,num0}, switches, newClk);
    
    // Dislay
    QuadSevenSegmentDisplay display(seg, dp, an, num3, num2, num1, num0, newClk);

endmodule
