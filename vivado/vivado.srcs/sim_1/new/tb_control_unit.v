`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2025 03:25:08 PM
// Design Name: 
// Module Name: tb_control_unit
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


module tb_control_unit;

    reg clk;
    reg [31:0] IR;
    reg [1:0] cycle;
    reg [23:0] PC_IN;
    wire [31:0] REG_A_DATA_IN;
    wire [31:0] REG_B_DATA_IN;
    reg [31:0] RAM_IN;
    wire [31:0] ACC_IN;
    wire [31:0] ACC_OUT;
    wire [31:0] AUX_IN;
    wire [31:0] AUX_OUT;
    wire [31:0] FLAGS_OUT;
    wire [31:0] FLAGS_IN;
    wire [3:0] ALU_OP_OUT;
    wire MEM_WRITE_ENABLE, REG_CLEAR_ENABLE, REG_WRITE_ENABLE, ALU_WRITE_ENABLE;
    wire [31:0] ALU_OPER_1_OUT, ALU_OPER_2_OUT, RAM_OUT, REG_WRITE_DATA;
    wire [23:0] PC_DATA, MEM_ADDR_OUT;
    wire [4:0] REG_WRITE_SELECTOR, REG_READ_A_SELECTOR, REG_READ_B_SELECTOR;
    wire NEXT_INSTRUCTION, PC_WRITE_ENABLE;
    wire BS_STATE;
    
    protected_reg32 acc_reg (
        .data_in (ACC_OUT),
        .CLK_IN (clk),
        .write_enable (ALU_WRITE_ENABLE),
        .reset (0),
        .data_out (ACC_IN)
    );
    protected_reg32 flags_reg (
        .data_in (FLAGS_OUT),
        .CLK_IN (clk),
        .write_enable (ALU_WRITE_ENABLE),
        .reset (0),
        .data_out (FLAGS_IN)
    );
    protected_reg32 aux_reg (
        .data_in (AUX_OUT),
        .CLK_IN (clk),
        .write_enable (ALU_WRITE_ENABLE),
        .reset (0),
        .data_out (AUX_IN)
    );
    control_unit cu0 (
        .CLK_IN (clk),
        .IR_IN (IR),
        .CYCLE_IN (cycle),
        .PC_IN (PC_IN),
        .REG_A_IN (REG_A_DATA_IN),
        .REG_B_IN (REG_B_DATA_IN),
        .MEM_IN (RAM_IN),
        .ACC_IN (ACC_IN),
        .AUX_IN (AUX_IN),
        .FLAGS_IN (FLAGS_IN),
        .ALU_OP_OUT (ALU_OP_OUT),
        .MEM_WRITE_ENABLE (MEM_WRITE_ENABLE),
        .REG_CLEAR_ENABLE (REG_CLEAR_ENABLE),
        .REG_WRITE_ENABLE_OUT (REG_WRITE_ENABLE),
        .ALU_ENABLE (ALU_WRITE_ENABLE),
        .ALU_OPER_1_OUT (ALU_OPER_1_OUT),
        .ALU_OPER_2_OUT (ALU_OPER_2_OUT),
        .MEM_OUT (RAM_OUT),
        .REG_WRITE_DATA_OUT (REG_WRITE_DATA),
        .PC_DATA_OUT (PC_DATA),
        .MEM_ADDR_OUT (MEM_ADDR_OUT),
        .REG_WRITE_SELECTOR_OUT (REG_WRITE_SELECTOR),
        .REG_READ_A_SELECTOR_OUT (REG_READ_A_SELECTOR),
        .REG_READ_B_SELECTOR_OUT (REG_READ_B_SELECTOR),
        .BOOTSTRAP_STATE (BS_STATE),
        .PC_WRITE_ENABLE (PC_WRITE_ENABLE),
        .NEXT_INSTRUCTION_TRIGGER (NEXT_INSTRUCTION)
    );
    register_file rf0 (
        .REG_READ_SELECTOR_A (REG_READ_A_SELECTOR),
        .REG_READ_SELECTOR_B (REG_READ_B_SELECTOR),
        .REG_READ_DATA_B (REG_B_DATA_IN),
        .REG_READ_DATA_A (REG_A_DATA_IN),
        .REG_WRITE_SELECTOR (REG_WRITE_SELECTOR),
        .REG_WRITE_DATA_IN (REG_WRITE_DATA),
        .REG_WRITE_ENABLE (REG_WRITE_ENABLE),
        .REG_CLEAR_ENABLE (REG_CLEAR_ENABLE),
        .CLK_IN (clk)
    );
    ALU al0 (
        .REG_A (ALU_OPER_1_OUT),
        .REG_B (ALU_OPER_2_OUT),
        .OP_SEL (ALU_OP_OUT),
        .FLAGS (FLAGS_OUT),
        .ACC (ACC_OUT),
        .AUX (AUX_OUT)
    );
        task check_register_value(input [31:0] register_val, input [31:0] expected_val);
            begin
                if(register_val != expected_val) begin
                    $error("The reg value is wrong!");
                end
            end
        endtask
        task test1;
            begin
                #10;
                IR = 32'b00000000000010000000000001100010;
                cycle = 0;
                #5;
                cycle = 1;
                #5;
                IR = 32'b00000000000000000001000011100010;
                cycle = 0;
                #5
                cycle = 1;
                #5
                IR = 32'b00000000000000000001000001000000;
                cycle = 0;
                #5;
                cycle = 1;
                #5;
            end
        endtask
        initial begin
            IR = 0;
            cycle = 0;
            PC_IN = 0;
            RAM_IN = 0;
            clk = 1'b0;
            test1();
        end
        always begin
            #5 clk = ~clk;
        end
endmodule
