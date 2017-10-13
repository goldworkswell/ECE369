`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 
// Module - InstructionMemory_tb.v
// Description - Test the 'InstructionMemory_tb.v' module.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_tb(); 

    wire [31:0] Instruction;

    reg [31:0] Address;

	InstructionMemory u0(
		.Address(Address),
        .Instruction(Instruction)
	);

	initial begin
	
	Address <= 32'd0;
	#20;
	Address <= 32'd4;
	#20;
	Address <= 32'd8;
    #20;
    Address <= 32'd12;
    #20;
   	Address <= 32'd16;
    #20;
    Address <= 32'd20;
    #20;
    /* Please fill in the implementation here... */
    
	
	end

endmodule

