`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: BCDCounter
// Description: Up/Down 1-digit BCD counter
//  up: (0)0000 -> (9)1001 -> 1(cout) 0000(0)
//  down: (9)1001 -> (0)0000 -> 1(bout) 1001(9)
//////////////////////////////////////////////////////////////////////////////////


module BCDCounter(
    output reg [3:0] outputs, // 4-bits: (0)0000-(9)1001
    output reg cout,
    output reg bout,
    input inc,
    input dec,
    input set9,
    input set0,
    input clk
    );
    
    initial outputs = 4'b0000;
    
    always @(posedge clk) begin
        cout = 0; bout = 0;
        case ({inc, dec, set9, set0})
            4'b1000: begin // increament
                cout = (outputs==9);
                outputs = (outputs + 1) % 10; end
            4'b0100: begin // decrement
                cout = (outputs==0);
                outputs = (outputs + 9) % 10; end
            4'b0010: outputs = 9; // set9
            4'b0001: outputs = 0; // set0
        endcase
    end
endmodule
