`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: ClockDivCounter
// Description: 1 Hz clock
//////////////////////////////////////////////////////////////////////////////////


module ClockDivCounter(
    output reg clk_out,
    input clk_in
    );

    reg [25:0] counter;
    always @(posedge clk_in) begin
        if (counter < 50000000)
            clk_out <= 1;
        else begin
            clk_out <= 0;
            if (counter == 100000000)
                counter = 0; // reset counter
        end
    end

endmodule
