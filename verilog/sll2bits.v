`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2017 05:31:05 PM
// Design Name: 
// Module Name: control
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


module sll2bits(input_16, shifted_by_two);
    input [15:0] input_16;
    output reg [15:0] shifted_by_two;
    
    always @(input_16) begin
    shifted_by_two = input_16 << 2;
    end

endmodule
