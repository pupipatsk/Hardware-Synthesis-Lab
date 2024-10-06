`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: System
// Description: 
//////////////////////////////////////////////////////////////////////////////////


module System(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input clk
    );
    
    //////////////////////////////
    // Number to display
    wire [4:0] num3, num2, num1, num0; // each is 4-bits(Hex) // msd->lsd
    // Assign value
    assign num3 = 1; // most significant digit
    assign num2 = 2;
    assign num1 = 3;
    assign num0 = 4; // least significant digit
    
    //////////////////////////////
    // Clock Divider
    wire targetClk;
    ClockDiv clockDivider(targetClk, clk);
    
    //////////////////////////////
    // Quad Seven Segment Dislay
    QuadSevenSegmentDisplay display(seg, dp, an, num3, num2, num1, num0, clk);

endmodule
