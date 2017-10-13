`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2017 12:21:01 PM
// Design Name: 
// Module Name: InstructionFetchUnit_tb
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


module InstructionFetchUnit_tb();

    reg Reset, Clk;
    wire [31:0] Instruction;
    
    InstructionFetchUnit IFU(Instruction, Reset, Clk);
    
    initial begin
        Clk <= 1'b0;
        forever #10 Clk <= ~Clk;
    end

    initial begin
        #5;
        Reset = 1;
        #10;
        Reset = 0;
    end
    
endmodule
