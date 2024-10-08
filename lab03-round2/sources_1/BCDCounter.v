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

    initial begin
        outputs = 4'b0000;
        cout = 0;
        bout = 0;
    end
    
    always @(posedge clk) begin
        cout = 0; 
        bout = 0;

        case ({inc, dec, set9, set0})
            4'b1000: begin // increment
                if (outputs == 9) begin
                    outputs = 4'b0000; // wrap around from 9 to 0
                    cout = 1; // generate carry out
                    end 
                else 
                    outputs = outputs + 1; // normal increment
            end
            
            4'b0100: begin // decrement
                if (outputs == 0) begin
                    outputs = 4'b1001; // wrap around from 0 to 9
                    bout = 1; // generate borrow out
                    end 
                else outputs = outputs - 1; // normal decrement
            end
            4'b0010: outputs = 4'b1001; // set9
            4'b0001: outputs = 4'b0000; // set0
        endcase
    end
endmodule
