`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: System
// Description: 
//////////////////////////////////////////////////////////////////////////////////


module System(
    output wire [6:0] seg,
    output wire dp,
    output wire [3:0] an,
    input [7:0] sw, // switch, inc/dec, 7 most-sig, 0 least-sig
    input btnU, // push
    input btnC, // pop
    input btnD, // reset
    input clk
    );
    
    // Clock Divider
    wire newClk;
    ClockDiv clockDivider(newClk, clk);
    
    // Debouncer
    wire push, pop, reset;
    DebounceSinglePulse dbspBtnU(push, btnU, newClk);
    DebounceSinglePulse dbspBtnC(pop, btnC, newClk);
    DebounceSinglePulse dbspBtnD(reset, btnD, newClk);
    // switch 0-7
    wire [7:0] switches; // down0, up0, down1, up1, down2, up2, down3, up3
    DebounceSinglePulse dbspSW0(switches[0], sw[0], newClk);
    DebounceSinglePulse dbspSW1(switches[1], sw[1], newClk);
    DebounceSinglePulse dbspSW2(switches[2], sw[2], newClk);
    DebounceSinglePulse dbspSW3(switches[3], sw[3], newClk);
    DebounceSinglePulse dbspSW4(switches[4], sw[4], newClk);
    DebounceSinglePulse dbspSW5(switches[5], sw[5], newClk);
    DebounceSinglePulse dbspSW6(switches[6], sw[6], newClk);
    DebounceSinglePulse dbspSW7(switches[7], sw[7], newClk);
    
    // Stack
    wire [3:0] num3, num2, num1, num0; 
    Stack stack({num3,num2}, {num1,num0}, switches, push, pop, reset, newClk);
    
    // Dislay
    QuadSevenSegmentDisplay display(seg, dp, an, num3, num2, num1, num0, newClk);

endmodule