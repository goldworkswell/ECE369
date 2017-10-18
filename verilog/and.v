`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2017 12:41:02 AM
// Design Name: 
// Module Name: and
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


module and1bit(A,B,Out);
    input A,B;
    output reg Out;
    always @(*)begin
        Out<=(A&&B);
    end



endmodule
