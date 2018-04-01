`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2016 09:44:15 AM
// Design Name: 
// Module Name: updown_counter
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
//
//  level = 00  Easy
//  level = 01  *
//  level = 10  *
//  level = 11  Hard
//////////////////////////////////////////////////////////////////////////////////
// Arka arkaya if yapinca clock hatasi veriyr

module updown_counter(up,down,btnC,level);
input up,down,btnC;
output reg [1:0]level;
reg emptybit; 

  always@(posedge up or posedge down or posedge btnC )
    begin 
    if(btnC)
    level<=2'b00;

     else if(up)
    level<=level+2'b01;
    
    else if(down)
   level<=level-2'b01;
  
   
    
        end 

endmodule
