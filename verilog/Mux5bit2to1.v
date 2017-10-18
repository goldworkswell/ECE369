`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2017 11:44:56 PM
// Design Name: 
// Module Name: Mux5bit2to1
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


module Mux5bit2to1(A,B,sel,Out);
	input [4:0] A,B;
	output reg [4:0]Out;
	input sel;
	
	always @(*)begin
		if(sel==0)begin
			Out<=A;
		end
		else begin
			Out<=B;
		end
	end
endmodule
