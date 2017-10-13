`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1 
// Module - PCAdder_tb.v
// Description - Test the 'PCAdder.v' module.
////////////////////////////////////////////////////////////////////////////////

module PCAdder_tb();

    reg [31:0] PCResult;

    wire [31:0] PCAddResult;

    PCAdder u0(
        .PCResult(PCResult), 
        .PCAddResult(PCAddResult)
    );

	initial begin
	
    /* Please fill in the implementation here... */
    	PCResult = 32'd0;
		#20;
		PCResult = 32'd4;
		#20;
		PCResult = 32'd8;
		#20;
		PCResult = 32'd12;
		#20;	    
    	PCResult = 32'd16;
    	
	
	end

endmodule

