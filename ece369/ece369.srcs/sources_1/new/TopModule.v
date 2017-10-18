`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2017 11:16:17 PM
// Design Name: 
// Module Name: TopModule
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


module TopModule(Clk, Reset );
input Clk, Reset;
wire[31:0] instruction; 
wire[4:0] writeAddress;
wire Zero,Zero_1;
wire [4:0] writeLoc,writeLoc_1,writeLoc_2;
wire [31:0] writeData, readData1,readData2,signExtended,ALUInput, ALUResultLow,ALUResultHigh,readData,instruc,addOut,addOut_1;
wire [31:0] shiftedBy2,PCResult,PCAddResult,PCAddResult_1,readData1_1,readData2_1,instruc20_16,instruc11_5,PCAddResult_2,ALUResult,ALUResult_1;
//pcresult is ouput from mux into pc unit
wire [31:0] readData2_2,signExtended_1,readData_1,ALUResult_2;

wire RegDst;
wire RegWrite;
wire ALUSrc;
wire ALUOpCode;
wire MemWrite;
wire MemRead;
wire MemtoReg;
wire [5:0] ALUOp;
wire Branch;
wire [1:0] WB,WB_1,WB_2;
wire [2:0] MEM,MEM_1;
wire [3:0] EX;
wire PCSrc;
InstructionFetchUnit InstructionMem(instruc, Reset, Clk,PCAddResult,PCResult);

IFIDReg FtoDReg(Clk,PCAddResult,instruc,PCAddResult_1,instruction);

RegisterFile Registers(instruction[25:21],instruction[20:16],writeAddress,writeData,WB_2[1],Clk,readData1,readData2);
//change stuff with sending intruction
control Controler(instruction, RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp);
SignExtension SignExtend(instruction[15:0],signExtended);

IDEXReg DtoEReg(Clk,{RegWrite,MemtoReg},{Branch,MemRead,MemWrite},{RegDst,ALUOp,ALUSrc},PCAddResult_1,readData1,readData2,signExtended,instruction[20:16],instruction[11:5],WB,MEM,EX,PCAddResult_2,readData1_1,readData2_1,
signExtended_1,instruc20_16,instruc11_5);

sll2bits ShiftLeft(signExtended,shiftedBy2);
Mux32Bit2To1 MuxtoALU(ALUInput,readData2_1,signExtended_1,EX[0]);
adder add(shiftedBy2,PCAddResult_2,addOut);
ALU32Bit ALU(ALUOpCode,readData1_1,ALUInput,ALUResultLow,ALUResultHigh,Zero);

//when change size of EX this index needs to change
Mux5bit2to1 MuxLoc(instruc20_16,instruc11_5,EX[3],writeLoc);

EXMEMReg EtoMReg(Clk,WB,MEM,addOut,ALUResult,Zero,readData2_1,writeLoc,WB_1,MEM_1,addOut_1,ALUResult_1,Zero_1,readData2_2,writeLoc_1);
and1bit brancher(Zero_1,MEM_1[2],PCSrc);
Mux32Bit2To1 MuxToPC(PCAddResult,addOut_1,PCSrc,PCResult);
DataMemory dataMemory(ALUResult_1,readData2_2,Clk,MemWrite,MemRead,readData);

MEMWBReg MemWbReg(Clk,WB_1,readData,ALUResult_1,writeLoc_1,WB_2,readData_1,ALUResult_2,writeLoc_2);

Mux32Bit2To1 MuxMemToReg(writeData,ALUResult_2,readData_1,WB_2[0]);
endmodule
