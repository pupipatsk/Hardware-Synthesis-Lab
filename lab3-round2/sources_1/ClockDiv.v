`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: ClockDiv
// Description: Divided InputClock (Hz) by 2^18
//////////////////////////////////////////////////////////////////////////////////


module ClockDiv(
    output targetClk, // Divided clk
    input clk // Input clk
    );
    
    reg [18:0] chainClk;
    initial begin
        chainClk = 0;
    end 
    
    // Binary Counter 19-bits
    always @(posedge clk) begin
        chainClk <= chainClk + 1;
    end
    
    assign targetClk = chainClk[18];
    
endmodule
