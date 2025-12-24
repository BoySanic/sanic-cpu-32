`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2025 11:06:14 AM
// Design Name: 
// Module Name: processor_core
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


module processor_core(
        input clk,
        output [23:0] MEM_ADDR_OUT,
        output [31:0] MEM_DATA_OUT,
        input [31:0] MEM_DATA_IN,
        output RAM_WRITE_ENABLE,
        output [23:0] CURR_PC,
        output [31:0] CURR_IR
    );
    wire [31:0] REG_A_DATA_IN;
    wire [31:0] REG_B_DATA_IN;
    wire [31:0] ACC_IN;
    wire [31:0] ACC_OUT;
    wire [31:0] AUX_IN;
    wire [31:0] AUX_OUT;
    wire [31:0] FLAGS_OUT;
    wire [31:0] FLAGS_IN;
    wire [3:0] ALU_OP_OUT;
    wire MEM_WRITE_ENABLE, REG_CLEAR_ENABLE, REG_WRITE_ENABLE, ALU_WRITE_ENABLE;
    wire [31:0] ALU_OPER_1_OUT, ALU_OPER_2_OUT, REG_WRITE_DATA;
    wire [31:0] IR_CU;
    wire [23:0] PC_CU, CU_MUXPC, ADDER_MUXPC;
    wire [23:0] CU_MEM_ADDR;
    wire [4:0] REG_WRITE_SELECTOR, REG_READ_A_SELECTOR, REG_READ_B_SELECTOR;
    reg start_processor;
    wire NEXT_INSTRUCTION, PC_WRITE_ENABLE;
    wire BS_STATE;
    reg [23:0] MUX_PC;
    reg [31:0] MEM_IR;
    reg [4:0] cycle;
    assign MEM_ADDR_OUT = (NEXT_INSTRUCTION || start_processor) ? PC_CU : CU_MEM_ADDR;
    assign CURR_PC = PC_CU;
    assign CURR_IR = IR_CU;
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
    protected_reg24 pc_reg (
        .data_in (MUX_PC),
        .CLK_IN (clk),
        .write_enable(NEXT_INSTRUCTION),
        .reset (0),
        .data_out (PC_CU)
    );
    protected_reg32 ir_reg (
        .data_in (MEM_IR),
        .CLK_IN (clk),
        .write_enable(NEXT_INSTRUCTION),
        .reset (0),
        .data_out (IR_CU)
    );
    control_unit cu0 (
        .CLK_IN (clk),
        .IR_IN (IR_CU),
        .CYCLE_IN (cycle),
        .PC_IN (PC_CU),
        .REG_A_IN (REG_A_DATA_IN),
        .REG_B_IN (REG_B_DATA_IN),
        .MEM_IN (CU_MEM_IN),
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
        .MEM_OUT (MEM_DATA_OUT),
        .REG_WRITE_DATA_OUT (REG_WRITE_DATA),
        .PC_DATA_OUT (PC_DATA),
        .MEM_ADDR_OUT (CU_MEM_ADDR),
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
    initial begin
        start_processor = 1;
    end
    always @(posedge clk) begin
        if(start_processor) begin
            if(MEM_DATA_IN != 0) begin
                start_processor = 0;
            end
        end
        if(NEXT_INSTRUCTION || PC_WRITE_ENABLE) begin
            cycle = 5'd0;
            if(PC_WRITE_ENABLE) begin
                MUX_PC = CU_MUXPC;
            end 
            else if (NEXT_INSTRUCTION) begin
                MUX_PC = PC_CU + 1;
                MEM_IR = MEM_DATA_IN;
            end
        end
        else begin
            cycle = cycle + 1;
        end

    end
endmodule
