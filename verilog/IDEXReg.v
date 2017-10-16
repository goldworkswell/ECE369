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


module IDEXReg(Clk,Ctrl_WBIn, Ctrl_MemIn, Ctrl_ExIn, PCAdderIn, Register1_ReadIn, Register2_ReadIn, SignExtendIn, Instruction16_20In, Instruction5_11In, 
    Ctrl_WBOut, Ctrl_MemOut, Ctrl_ExOut, PCAdderOut, Register1_ReadOut, Register2_ReadOut, SignExtendOut, Instruction16_20Out, Instruction5_11Out);
    input Clk;
    input [1:0] Ctrl_WBIn;  //MemtoReg and RegWrite Control Signals
    input [2:0] Ctrl_MemIn; //Branch, MemWrite, and MemRead Control Signals
    input [3:0] Ctrl_ExIn;        //RegDst, ALUSrc, and ALUOp Control Signals
    input [31:0] PCAdderIn, Register1_ReadIn, Register2_ReadIn, SignExtendIn;
    input [4:0]  Instruction16_20In, Instruction5_11In;
    output reg [1:0] Ctrl_WBOut;
    output reg [2:0] Ctrl_MemOut;
    output reg [3:0] Ctrl_ExOut;
    output reg [31:0] PCAdderOut, Register1_ReadOut, Register2_ReadOut, SignExtendOut;
    output reg [4:0] Instruction16_20Out, Instruction5_11Out;
	
	reg [1:0] Ctrl_WB;
	reg [2:0] Ctrl_Mem;
	reg [3:0] Ctrl_Ex;
	reg [31:0] PCAdder,Register1_Read,Register2_Read,SignExtend;
	reg [4:0] instruction16_20,instruction5_11;
always @(posedge Clk) begin
	Ctrl_WB<=Ctrl_WBIn;
	Ctrl_Mem<=Ctrl_MemIn;
	Ctrl_Ex<=Ctrl_ExIn;
	PCAdder<=PCAdderIn;
	Register1_Read<=Register1_ReadIn;
	Register2_Read<=Register2_ReadIn;
	SignExtend<=SignExtendIn;
	instruction16_20<=Instruction16_20In;
	instruction5_11<=Instruction5_11In;	
end
always@(negedge Clk) begin
    Ctrl_WBOut <= Ctrl_WB;
    Ctrl_MemOut <= Ctrl_Mem;
    Ctrl_ExOut <= Ctrl_Ex;
    PCAdderOut <= PCAdder;
    Register1_ReadOut <= Register1_Read;
    Register2_ReadOut <= Register2_Read;
    SignExtendOut <= SignExtend;
    Instruction16_20Out <= Instruction16_20;
    Instruction5_11Out <= Instruction5_11;
end
endmodule
