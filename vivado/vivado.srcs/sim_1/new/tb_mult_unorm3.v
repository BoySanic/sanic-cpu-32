`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2025 09:56:00 AM
// Design Name: 
// Module Name: tb_mult_unorm3
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


module tb_mult_unorm3;
    
        reg [2:0] a;
        reg [2:0] b;
        wire [2:0] c;
        mult_unorm3 u0 (
            .a (a),
            .b (b),
            .c (c)
        );
        
        task test_1;
            integer i, j;
            begin
                $display(" a  b |  c ");
                $display("-----------");
                for (i = 0; i < 8; i = i + 1) begin
                    for (j = 0; j < 8; j = j + 1) begin
                        a = i;
                        b = j;
                        #1;
                        $display(" %0d  %0d | %0d", a, b, c);
                    end
                end
            end
        endtask
        
        
        function checker (input [2:0] a, input [2:0] b, input [2:0] c);
            
        endfunction
        initial begin
            a <= 0;
            b <= 0;
            test_1();
        end
        
endmodule
