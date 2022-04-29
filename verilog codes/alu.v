`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:34:21 04/20/2022 
// Design Name: 
// Module Name:    aluu 
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
module aluu(a,b,op,out
    );
input [15:0] a,b;
input [2:0] op;
output reg [15:0] out;
always@(*)
begin 
case(op)
15'b000:out=a&b;
15'b001:out=a|b;
15'b010:out=a^b;
15'b011:out=a~^b;
15'b100:out=a+b;
15'b101:out=a-b;
15'b110:out=a*b;
15'b111:out=a/b;
default:out=0;
endcase
end

endmodule
