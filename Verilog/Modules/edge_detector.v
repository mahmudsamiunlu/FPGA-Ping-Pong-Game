`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2016 09:28:14 AM
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(clk,rst,in,out);
input in,rst,clk;
output out;
reg [4:0] shift_reg;
always @ (posedge clk or posedge rst)
 begin
 if(rst == 1) shift_reg <= 0;
 else shift_reg[4:0] <= {shift_reg[3:0],in};
 end
assign out = ~shift_reg[4] & shift_reg[3];

endmodule
