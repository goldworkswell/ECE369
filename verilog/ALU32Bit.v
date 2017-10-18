`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: 4-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU behaviorally, so that it supports addition,  subtraction,
// AND, OR, and set on less than (SLT). The 'ALUResult' will output the 
// corresponding result of the operation based on the 32-Bit inputs, 'A', and 
// 'B'. The 'Zero' flag is high when 'ALUResult' is '0'. The 'ALUControl' signal 
// should determine the function of the ALU based on the table below:-
// Op   | 'ALUControl' value
// ==========================
// ADD  | 0010
// NOT  | 0100
// XOR  | 1000
// NOR  | 1001
// NAND | 1010
// SUB  | 0110
// MUL  | 0011 For 32 bit output
// MULT | 0101 For 64 bit output
// AND  | 0000
// OR   | 0001
// SLT  | 0111
//
// NOTE:-
// SLT (i.e., set on less than): ALUResult is '32'h000000001' if A < B.
// 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResultLow, ALUResultHigh, Zero);

	input [3:0] ALUControl; // control bits for ALU operation
	input [31:0] A, B;	    // inputs
	
	reg [63:0] ALU64BitResult;
		
	output reg [31:0] ALUResultLow;	// answer
	output reg [31:0] ALUResultHigh;
	output reg Zero;	    // Zero=1 if ALUResult == 0

    /* Please fill in the implementation here... */
    always @(*) begin
    case(ALUControl)
        4'b0010: begin
             ALUResultLow <= A + B;
			 ALUResultHigh <= 32'bz;
        end
		4'b0100: begin //NOT
			ALUResultLow <= ~A;
			ALUResultHigh <= 32'bZ;
		end
		4'b1000: //XOR
			ALUResultLow <= A^B;
		4'b1001: begin//NOR
			ALUResultLow <= ~(A||B);
			ALUResultHigh <= 32'bZ;
		end
		4'b1010: begin//NAND
			ALUResultLow <= ~(A&&B);
			ALUResultHigh <= 32'bZ;
			end
        4'b0110: begin
            ALUResultLow <= A - B;
			ALUResultHigh <= 32'bZ;
		end
		
		4'b0011: begin
			ALUResultLow <= A*B;
			ALUResultHigh <= 32'bZ;
		end
		
		4'b0101: begin
			{ALUResultHigh, ALUResultLow} = A*B;
		end	
		
        4'b0000: begin
              ALUResultLow <= A && B;
			  ALUResultHigh <= 32'bZ;
		end
		
        4'b0001: begin
            ALUResultLow <= A || B;
			ALUResultHigh <= 32'bZ;
		end
        4'b0111: begin
            if(A<B) begin
                ALUResultLow <= 32'd1;
				ALUResultHigh <= 32'bZ;
		    end
            else begin
                ALUResultLow <= 32'd0; 
				ALUResultHigh <= 32'bZ;	
			end
		end

   endcase
   //assign Zero = (ALUResultLow == 0);
   if(ALUResultLow==0)
		Zero<=1;
	else 
		Zero<=0;
   end

endmodule

