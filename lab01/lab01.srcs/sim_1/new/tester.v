`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2024 10:44:59 PM
// Design Name: 
// Module Name: tester
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tester(

    );
     reg a,b,cin;
    wire cout,s;
    fullAdder a1(cout,s,a,b,cin);
    initial
    begin
        //$dumpfile("time.dump");
        //$dumpvars(2,a1);
        $monitor("time%t:{%b%b}<-{%d%d%d}",$time,cout,s,a,b,cin);
         #0;
         a=0;
         b=0;
         cin=0;
         #10;
         a=1;
         #5;
         cin=1;
         #100;
         $finish;
    end
endmodule
