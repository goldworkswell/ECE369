`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;

    wire [31:0] ReadData;
	integer i;
    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
		for(i=0;i<32;i=i+1)begin
			#100 Address<=32'di;WriteData<=32'b1;MemWrite<=1;MemRead<=0;
		end
		for(i=0;i<32;i=i+1)begin
			#100 Address<=32'di;WriteData<=32'd0;MemRead<=1;MemWrite<=0;
			#20 $display("ReadData=%h",ReadData);
		end
    /* Please fill in the implementation here... */
	
	end

endmodule

