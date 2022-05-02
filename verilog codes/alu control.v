`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:50:02 05/02/2022 
// Design Name: 
// Module Name:    alucontrol 
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
module alucontrol(
      input [3:0] func,
		input [2:0] aluop,
		output reg[2:0] opselector
    );
	// integer temp;
	 always @*
	 begin
	 if(aluop[0]==1)
	    opselector<=3'b100;
	 else if(aluop[1]==1)
	    opselector<=3'b101;
	 else if(aluop[2]==1)
	 begin
	    opselector[0]<=func[0] ;
		 opselector[1]<=func[1] ;
		 opselector[2]<=func[2] ;
		 end
	 
	 end


endmodule
