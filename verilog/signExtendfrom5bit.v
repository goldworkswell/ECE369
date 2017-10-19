`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2017 05:20:06 PM
// Design Name: 
// Module Name: signExtendfrom5bit
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


module signExtendfrom5bit(in,out);
    
        /* A 16-Bit input word */
        input [4:0] in;
        
        /* A 32-Bit output word */
        output reg [31:0] out;
        
        /* Fill in the implementation here ... */
    always @(*)begin
        out[31:0]<={{27{in[4]}},in};
    end
endmodule
