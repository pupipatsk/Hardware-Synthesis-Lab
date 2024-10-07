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
    DebounceSinglePulse dbspSW0(switches[0], sw[0], newClk);
    DebounceSinglePulse dbspSW1(switches[1], sw[1], newClk);
    DebounceSinglePulse dbspSW2(switches[2], sw[2], newClk);
    DebounceSinglePulse dbspSW3(switches[3], sw[3], newClk);
    DebounceSinglePulse dbspSW4(switches[4], sw[4], newClk);

    // ROM
    wire [3:0] num3,num2,num1,num0;
    assign num3 = 0;
    assign num2 = 0;
    SyncROM rom({num1,num0}, sw[4:0], newClk);
    
    // Dislay
    QuadSevenSegmentDisplay display(seg, dp, an, num3, num2, num1, num0, newClk);

endmodule
