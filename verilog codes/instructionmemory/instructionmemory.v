`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:29 06/16/2022 
// Design Name: 
// Module Name:    instructionmemory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module instructionmemory( pc , ins, clk

    );
   input clk;
input [19:0] pc;
output [19:0] ins;
reg [19:0] ins;
      reg [19:0] memdata[19:0];  
    initial
        begin
      memdata[0] = 20'b00010001000000100010;
        memdata[1] = 20'b00100001100000100100;
        memdata[2] = 20'b00010011000000100101;
        memdata[3] = 20'b10010101000000100000;
        memdata[4] = 20'b00011001000000100000;
        memdata[5] = 20'b00010101000000100000;
        memdata[6] = 20'b00010001001000100000;
      memdata[7] = 20'b00000000000000000000;
        memdata[8] = 20'b00000000000000000000;
        memdata[9] = 20'b00000000000000000000;
              memdata[10] = 20'b00000000000000000000;
        memdata[11] = 20'b00000000000000000000;
        memdata[12] = 20'b00000000000000000000;
        memdata[13] = 20'b00000000000000000000;
        memdata[14] = 20'b00000000000000000000;
        memdata[15] = 20'b00000000000000000000;
        memdata[16] = 20'b00000000000000000000;
        memdata[17] = 20'b00000000000000000000;
        memdata[18] = 20'b00000000000000000000;
        memdata[19] = 20'b00000000000000000000;
        memdata[20] = 20'b00000000000000000000;

        
 end

always @(posedge clk)
        begin
                ins = memdata[pc];
        end

endmodule
