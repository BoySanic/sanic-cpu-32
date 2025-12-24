`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2025 11:15:03 AM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu;
    
        reg [31:0] a;
        reg [31:0] b;
        reg [3:0] op_sel;
        wire [31:0] acc;
        wire [31:0] flags;
        wire [31:0] aux;
        ALU u0 (
            .REG_A (a),
            .REG_B (b),
            .ACC (acc),
            .OP_SEL (op_sel),
            .FLAGS (flags),
            .AUX (aux)
        );
        task checker (input [31:0] a, input [31:0] b, input [31:0] acc, input [3:0] op_sel, input [31:0] flags);
            if(a[31] && b[31] && op_sel == 0 && (!flags[1] || !flags[0])) begin
                $error("Carry/overflow/zero bit not set correctly when sign bits are both set during an add!");
            end else
            if(a[31] && b[31]&& acc[31] != a[31] && op_sel == 1 && !flags[2]) begin
                $error("Sign bit not set correctly when signs are the same during subtraction!");
            end else
            if(!a[31] && !b[31] && op_sel == 0 && !flags[2]) begin
                $error("Sign bit not set correctly when signs are different during addition!");
            end else
            if(a[31] != b[31] && op_sel == 1 && !flags[1]) begin
                $error("Overflow bit not set correctly when signs are diff during subtraction!");
            end else
            if(acc == 0 && !flags[3]) begin
                $error("Zero bit not set correctly!");
            end
        endtask
        task test_1;
            begin
                #10;
                a = -1;
                b = -1;
                op_sel = 0;
                #1;
                checker(a, b, acc, op_sel, flags);
                a = -1;
                b = -1;
                op_sel = 1;
                #1;
                checker(a, b, acc, op_sel, flags);
                a = -1;
                b =  1;
                op_sel = 0;
                #1;
                checker(a, b, acc, op_sel, flags);
                a = -1;
                b =  1;
                op_sel = 1;
                #1;
                checker(a, b, acc, op_sel, flags);
            end
        endtask
        initial begin
            a <= 0;
            b <= 0;
            test_1();
        end
        
endmodule