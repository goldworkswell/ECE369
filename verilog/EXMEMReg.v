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


module EXMEMReg(Clk, Ctrl_WBIn, Ctrl_MemIn, Adder_ResultIn, ALU_ResultIn, ALU_ZeroIn, Register2_ReadIn, RegDst_MuxIn,
	Ctrl_WBOut, Ctrl_MemOut, Adder_ResultOut, ALU_ResultOut, ALU_ZeroOut, Register2_ReadOut, RegDst_MuxOut);
	
	input Clk;
	input RegDst_MuxIn, ALU_ZeroIn;
    input [1:0] Ctrl_WBIn;  //MemtoReg and RegWrite Control Signals
    input [2:0] Ctrl_MemIn; //Branch, MemWrite, and MemRead Control Signals
	input [31:0] Adder_ResultIn, ALU_ResultIn, Register2_ReadIn;
	
	output reg RegDst_MuxOut, ALU_ZeroOut;
	output reg [1:0] Ctrl_WBOut;
	output reg [2:0] Ctrl_MemOut;
	output reg [31:0] Adder_ResultOut, ALU_ResultOut, Register2_ReadOut;
	
	reg RegDst_Mux,ALU_Zero;
	reg [1:0] Ctrl_WB;
	reg [2:0] Ctrl_Mem;
	reg [31:0] Adder_Result,ALU_Result,Register2_Read;
	always @(posedge Clk) begin
		RegDst_Mux<=RegDst_MuxIn;
		ALU_Zero<=ALU_ZeroIn;
		Ctrl_WB<=Ctrl_WBIn;
		Ctrl_Mem<=Ctrl_MemIn;
		Adder_Result<=Adder_ResultIn; 
		ALU_Result<=ALU_ResultIn;
		Register2_Read<=Register2_ReadIn;
	
	end
	always@(negedge Clk) begin
		RegDst_MuxOut <= RegDst_Mux;
		ALU_ZeroOut <= ALU_Zero;
		Ctrl_WBOut <= Ctrl_WB;
		Ctrl_MemOut <= Ctrl_Mem;
		Adder_ResultOut <= Adder_Result;
		ALU_ResultOut <= ALU_Result;
		Register2_ReadOut <= Register2_Read;
	end
	
endmodule
