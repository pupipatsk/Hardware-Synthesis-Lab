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
    input btnU,
    input btnC,
    input clk
    );
    
    // Clock Divider
    wire newClk;
    ClockDiv clockDivider(newClk, clk);
    
    // Debouncer
    wire newBtnU, newBtnC; // set9, set0
    DebounceSinglePulse dbspBtnU(newBtnU, btnU, newClk);
    DebounceSinglePulse dbspBtnC(newBtnC, btnC, newClk);
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
    
    // Counter
    wire [3:0] num3, num2, num1, num0;
    wire cout3, cout2, cout1, cout0;
    wire bout3, bout2, bout1, bout0;
    BCDCounter counter0(num0, cout0, bout0, switches[1], switches[0], newBtnU|cout3, newBtnC|cout3, newClk);
    BCDCounter counter1(num1, cout1, bout1, switches[3]|cout0, switches[2]|bout0, newBtnU|cout3, newBtnC|cout3, newClk);
    BCDCounter counter2(num2, cout2, bout2, switches[5]|cout1, switches[4]|bout1, newBtnU|cout3, newBtnC|cout3, newClk);
    BCDCounter counter3(num3, cout3, bout3, switches[7]|cout2, switches[6]|bout2, newBtnU|cout3, newBtnC|cout3, newClk);
    
    // Quad Seven Segment Dislay
    QuadSevenSegmentDisplay display(seg, dp, an, num3, num2, num1, num0, newClk);

endmodule
