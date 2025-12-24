`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2025 09:14:13 AM
// Design Name: 
// Module Name: mult_unorm3
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


module mult_unorm3(
	input [2:0] a,
	input [2:0] b,
	output [2:0] c
	);

wire [5:0] prod = a*b;
wire [6:0] sum = prod + (prod >> 3) + 3'd4;
assign c = sum[5:3];
endmodule