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


module control(Opcode, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp,ALUSrc2);
    input [31:0] Opcode;
    output reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,ALUSrc2;
    output reg [1:0] ALUOp;
    
    always @(Opcode) begin
    case(Opcode)
        6'b000000: begin //R-type Arithmetic/Logic
			RegDst <= 1;
			ALUSrc <= 0;
			MemtoReg <= 0;
			RegWrite <= 1;
			MemRead <= 0;
			MemWrite <= 0;
			Branch <= 0;
			ALUOp <= 2'b10;
        end
        6'b100011: begin //Load
			RegDst <= 0;
			ALUSrc <= 1;
			MemtoReg <= 1;
			RegWrite <= 1;
			MemRead <= 1;
			MemWrite <= 0;
			Branch <= 0;
			ALUOp <= 00;
        
        end
        6'b101011: begin //Store;
			ALUSrc <= 1;
			RegWrite <= 0;
			MemRead <= 0;
			MemWrite <= 1;
			Branch <= 0;
			ALUOp <= 00;
        end
        6'b000100: begin //Branch
			ALUSrc <= 0;
			RegWrite <= 0;
			MemRead <= 0;
			MemWrite <= 0;
			Branch <= 1;
			ALUOp <= 0;
			ALUOp <= 1;
        end
    endcase
      
    end
    
endmodule
