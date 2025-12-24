`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2025 10:26:34 AM
// Design Name: 
// Module Name: tb_core
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


module tb_core;

       reg clk;
       reg [31:0] memory [0:16777215];
       wire [23:0] mem_addr;
       wire [31:0] mem_data_in, mem_data_out;
       wire mem_write_enable;
       wire [23:0] curr_pc;
       wire [31:0] curr_ir;
       assign mem_data_out = memory[mem_addr];
       processor_core dev_core(
            .clk (clk),
            .MEM_ADDR_OUT(mem_addr),
            .MEM_DATA_OUT(mem_data_in),
            .MEM_DATA_IN(mem_data_out),
            .RAM_WRITE_ENABLE(mem_write_enable),
            .CURR_IR (curr_ir),
            .CURR_PC (curr_pc)
       );

        task test1;
            begin
                //mem[0]
                //Clock pulse 1
                #5;
                //Clock pulse 2
                #5;
                //mem[1]
                //Clock pulse 3
                #5;
                //Clock pulse 4
                #5;
                //mem[2]
                //Clock pulse 5
                #5;
                //Clock pulse 6
                #5;
                //mem[3]
                //Clock pulse 7
                #5;
                //Clock pulse 8
                #5;
                //mem[4]
                //Clock pulse 9
                #5;
                //Clock pulse 10
                #5;
                if(memory[8] != 32'd2) begin
                    $error("Oops!");
                end
            end
        endtask;
        integer i;
        initial begin
          memory[0] = 32'b00000000000000000001000001100011;
          memory[1] = 32'b00000000000000000001000011100011;
          memory[2] = 32'b00000000000000001000000101100011;
          memory[3] = 32'b00000000000000000001000001000000;
          memory[4] = 32'b00000000000000000010000001100001;
          for (i = 5; i < 16777216; i = i + 1)
            memory[i] = 32'd0;
          clk = 1'b0;
          test1();
        end

        always begin
            #5 clk = ~clk;
            if(mem_write_enable) begin
                assign memory[mem_addr] = mem_data_in;
            end
        end
endmodule
