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
    genvar n;
    generate for(n=0;n<8;n=n+1) begin
        DebounceSinglePulse dbspSW(switches[n], sw[n], newClk);
    end endgenerate
    
    // Stack
    wire [3:0] num3, num2, num1, num0; 
    Stack stack({num3,num2}, {num1,num0}, switches, push, pop, reset, newClk);
    
    // Dislay
    QuadSevenSegmentDisplay display(seg, dp, an, num3, num2, num1, num0, newClk);

endmodule
