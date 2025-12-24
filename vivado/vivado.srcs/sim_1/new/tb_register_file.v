`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2025 02:59:43 PM
// Design Name: 
// Module Name: tb_register_file
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


module tb_register_file;
    
        reg [4:0] read_a;
        reg [4:0] read_b;
        wire [31:0] read_a_data;
        wire [31:0] read_b_data;
        reg [4:0] write_selector;
        reg [31:0] write_data;
        reg write_enable;
        reg clk;
        register_file u0 (
            .REG_READ_SELECTOR_A (read_a),
            .REG_READ_SELECTOR_B (read_b),
            .REG_READ_DATA_A (read_a_data),
            .REG_READ_DATA_B (read_b_data),
            .REG_WRITE_SELECTOR (write_selector),
            .REG_WRITE_DATA_IN (write_data),
            .REG_WRITE_ENABLE (write_enable),
            .CLK_IN (clk)
        );
        task checker (input [31:0] a, input [31:0] b);
            begin
                if(a != 31'd1234) begin
                    $error("Register 0 wrong value: %d", a);
                end
                
                if(b != 31'd4321) begin
                    $error("Register 1 wrong value: %d", b);
                end
            end
        endtask
        task test_1;
            begin
                #10;
                write_selector = 0;
                write_data = 1234;
                write_enable = 1;
                #10;
                write_selector = 1;
                write_data = 4321;
                write_enable = 1;
                #10;
                read_a = 0;
                read_b = 1;
                write_enable = 0;
                #10;
                checker(read_a_data, read_b_data);
            end
        endtask
        initial begin
            clk = 1'b0;
            read_a = 0;
            read_b = 0;
            write_selector = 0;
            write_data = 0;
            write_enable = 0;
            test_1();
        end
        
        always begin
            #5 clk = ~clk;
        end
    
endmodule
