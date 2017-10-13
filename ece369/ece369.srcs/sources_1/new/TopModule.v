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
wire PCAddResult,Zero;
wire [31:0] writeData, readData1,readData2,signExtended,ALUInput, ALUResultLow,ALUResultHigh,readData;

//this stuff is controller inputs that i am not sure what todo with
wire RegDst;
wire RegWrite;
wire ALUSrc;
wire ALUOpCode;
wire MemWrite;
wire MemRead;
wire MemtoReg;

InstructionFetchUnit InstructionMem( instruction, Reset, Clk,PCAddResult);
Mux32Bit2To1 MuxToWriteReg(writeAddress,instruction[20:16],instruction[15:11], RegDst);
RegisterFile Registers(instruction[25:21],instruction[20:16],writeAddress,writeData,RegWrite,Clk,readData1,readData2);
SignExtension SignExtend(instruction[15:0],signExtended);
Mux32Bit2To1 MuxtoALU(ALUInput,readData2,signExtended,ALUSrc);
ALU32Bit ALU(ALUOpCode,readData1,ALUInput,ALUResultLow,ALUResultHigh,Zero);
//might have to change datamemory for multiplication output idk
DataMemory dataMemory(ALUResultLow,readData2,Clk,MemWrite,MemRead,readData);
Mux32Bit2To1 MuxMemToReg(writeData,ALUResultLow,readData,MemtoReg);
endmodule
