`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2017 02:14:51 PM
// Design Name: 
// Module Name: EXMEMReg
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


module IFIDReg(Clk, PCAdderIn, InstructionIn, IFID_PCAdderOut, IFID_InstructionOut);

    input Clk;
    input [31:0] PCAdderIn, InstructionIn;
    output reg [31:0] IFID_PCAdderOut, IFID_InstructionOut;
    reg [31:0] PCAdder,instruction;
	always @ (posedge Clk) begin
		PCAdder<=PCAdderIn;
		instruction<=InstructionIn;
	end
    always@(negedge Clk) begin
        IFID_PCAdderOut <= PCAdder;
        IFID_InstructionOut <= instruction;
    end
    
endmodule
