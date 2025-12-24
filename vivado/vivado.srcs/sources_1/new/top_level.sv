`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2025 12:15:29 PM
// Design Name: 
// Module Name: top_level
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


module top_level;
    RAM dev_ram (
        .CLK_IN (clock),
        .ADDR_IN (MAR_OUT),
        .DATA_IN (MDR_OUT_BUS),
        .WRITE_ENABLE_IN (ram_write_enable),
        .DATA_OUT (MDR_IN_BUS)
    );
    reg [31:0] periph_data_bus [21:0];
    wire [31:0] data_in;
    wire [21:0] addr_in;
    wire [31:0] data_out;
    wire [21:0] rom_addr_in;
    wire [22:0] ram_addr_in;
    wire [31:0] ram_data_in, ram_data_out, rom_data_out;
    wire ram_write_enable;
    processor_core dev_core0 (
        .CLK100MHZ (CLK_IN),
        .PERIPH_DATA_OUT (data_in),
        .PERIPH_ADDR_OUT (addr_in),
        .PERIPH_DATA_IN (data_out),
        .ROM_ADDR_OUT (rom_addr_in),
        .ROM_DATA_IN (rom_data_out),
        .RAM_ADDR_OUT (ram_addr_in),
        .RAM_DATA_OUT (ram_data_in),
        .RAM_DATA_IN (ram_data_out),
        .RAM_WRITE_ENABLE (ram_write_enable)
    );
    
    
endmodule
