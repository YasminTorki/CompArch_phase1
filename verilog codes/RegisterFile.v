`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:44 05/03/2022 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile( input    clk,
 input    reg_write_en,
 input  [3:0] reg_write_dest, 
 input  [15:0] reg_write_data,
 //read port 1
 input  [3:0] reg_read_addr_1, 
 output  [15:0] reg_read_data_1,
 //read port 2
 input  [3:0] reg_read_addr_2, 
 output  [15:0] reg_read_data_2
    );
reg [15:0] reg_array [15:0];
 integer i;

 initial begin
  for(i=0;i<15;i=i+1)
   reg_array[i] <= 16'd0;
 end
 always @ (posedge clk ) begin
   if(reg_write_en) begin
    reg_array[reg_write_dest] <= reg_write_data;
   end
 end
 

 assign reg_read_data_1 = reg_array[reg_read_addr_1];
 assign reg_read_data_2 = reg_array[reg_read_addr_2];


endmodule
