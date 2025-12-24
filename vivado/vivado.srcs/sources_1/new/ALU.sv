`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2025 11:34:25 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] REG_A,
    input [31:0] REG_B,
    input [3:0] OP_SEL,
    output [31:0] FLAGS,
    output [31:0] ACC,
    output [31:0] AUX
    );
    wire [31:0] add_out, sub_out, mul_out, upper_mul_out, div_out, rem_out, shl_out, shr_out;
    wire add_carry, sub_carry;
    
    assign {add_carry, add_out} = REG_A + REG_B;
    assign {sub_carry, sub_out} = REG_A - REG_B;
    assign {upper_mul_out, mul_out} = REG_A * REG_B;
    assign div_out = REG_A / REG_B;
    assign rem_out = REG_A % REG_B;
    assign shl_out = REG_A << REG_B;
    assign shr_out = REG_A >> REG_B;

    wire input_msb_1 = REG_A[31] & REG_B[31];
    wire input_msb_0 = !REG_A[31] & !REG_B[31];
    
    wire overflow = REG_A[31] == REG_B[31] && (REG_A[31] != add_out && OP_SEL == 0 || REG_A[31] != sub_out && OP_SEL == 1);
    assign ACC =    (OP_SEL == 4'd0) ? add_out : 
                    (OP_SEL == 4'd1) ? sub_out :
                    (OP_SEL == 4'd2) ? mul_out :
                    (OP_SEL == 4'd3) ? div_out :
                    (OP_SEL == 4'd4) ? REG_A & REG_B :
                    (OP_SEL == 4'd5) ? REG_A | REG_B :
                    (OP_SEL == 4'd6) ? REG_A ^ REG_B :
                    (OP_SEL == 4'd7) ? shl_out :
                    (OP_SEL == 4'd8) ? shr_out : 0;
    assign AUX = (OP_SEL == 4'd2)? upper_mul_out : (OP_SEL == 4'd3) ? rem_out : 0;
    assign FLAGS[0] = (OP_SEL == 4'd0) ? add_carry : (OP_SEL == 4'd1) ? sub_carry : 0;
    assign FLAGS[1] = overflow;
    assign FLAGS[2] = (ACC[31] != REG_A[31]);
    assign FLAGS[3] = (ACC == 4'd0) ? 1 : 0;
    assign FLAGS[31:4] = 0;
    
endmodule
