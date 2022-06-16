`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:04:32 06/16/2022 
// Design Name: 
// Module Name:    Main 
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
module Main(clk

    );
	 wire[19:0] pc , 
	  wire[19:0]ins;
	  wire [19:0]instruction;
	  input clk;
instructionmemory insmem( pc , ins, clk);
     wire[3:0] opcode,
      wire [2:0] alu_op,
      wire  jump;
		wire beq;
		wire bne;
		wire mem_read;
		wire mem_write;
		wire alu_src;
		wire reg_dst;
		wire mem_to_reg;
		wire reg_write;
		ControlUnit conuni(instruction[19:15] ,alu_op, jump,beq,bne,mem_read,wiremem_write,alu_src, reg_dst, mem_to_reg, reg_write)
		wire[15:0]reg_read_data_1;
		wire[15:0] reg_read_data_2;
		 wire    reg_write_en;
 wire  [3:0] reg_write_dest; 
 wire  [15:0] reg_write_data;
		RegisterFile rgfile(clk,reg_write,instruction[15:12],data,instruction[11:8],reg_read_data_1 ,instruction[7:4],reg_read_data_2);
		wire [2:0]opsc;

		ALu_control aluc(instruction[3:0],alu_op,opsc);
		wire [15:0] out;
aluu alu(reg_read_data_1,reg_read_data_2,opsc,out);
dataMemory datmem(clk,out,reg_read_data_2,mem_read,mem_write,data);


endmodule
