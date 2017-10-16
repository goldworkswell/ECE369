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


module MEMWBReg(Clk, Ctrl_WBIn, DataMemory_ReadIn, ALU_ResultIn, RegDst_MuxIn, 
	Ctrl_WBOut, DataMemory_ReadOut, ALU_ResultOut, RegDst_MuxOut);
	
	input Clk;
	input RegDst_MuxIn;
    input [1:0] Ctrl_WBIn;  //MemtoReg and RegWrite Control Signals
	input [31:0] DataMemory_ReadIn, ALU_ResultIn;
	
	output reg RegDst_MuxOut;
	output reg [1:0] Ctrl_WBOut;
	output reg [31:0] DataMemory_ReadOut, ALU_ResultOut;
	
	reg RegDst_Mux;
	reg [1:0] Ctrl_WB;
	reg [31:0] DataMemory_Read, ALU_Result;
	always @(posedge Clk) begin
		RegDst_Mux<=RegDst_MuxIn;
		Ctrl_WB<=Ctrl_WBIn;
		DataMemory_Read<=DataMemory_ReadIn;
		ALU_Result<=ALU_ResultIn;
	end
	always@(negedge Clk)begin
	RegDst_MuxOut <= RegDst_Mux;
	Ctrl_WBOut <= Ctrl_WB;
	DataMemory_ReadOut <= DataMemory_Read;
	ALU_ResultOut <= ALU_Result;
	end
	
endmodule
