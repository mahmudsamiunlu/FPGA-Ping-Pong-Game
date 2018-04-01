`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2016 09:27:40 AM
// Design Name: 
// Module Name: testbench
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


module testbench();
reg clk;
reg btnC;
wire clk_lf;
wire [1:0]level;
wire clk_game;
reg btnU, btnD;
wire up, down;

// clk_wiz_0 u1(clk,clk_lf,btnC); // S?n?r? 4 mhz 
   // clk_divider u1(clk,btnC,clk_lf); // Tamamd?r 10 Hz pulse 
  //  clk_sel u2(clk_lf,level,btnC,clk_game); // Tamamd?r 10 /2/4/8/16 
   edge_detector u1(clk,btnC,btnU,up);
  edge_detector u2(clk,btnC,btnD,down);
  updown_counter u3(up,down,btnC,level);
always  
#5 clk=~clk; 
initial 
begin
clk=0;
btnC=1;
#8
btnC=0;

#8000;
btnU=1'b1;
#100;
btnU=0;
#8000;
btnU=1'b1;
#100;
btnU=0;
#100;
#8000;

btnD=1'b1;
#100;
btnD=0;
#100;

end
/*
reg btnC, btnU, btnD;
reg clk;
reg sw0, sw15;
wire [6:0] seg;
wire [3:0] an;
wire dp;
wire [15:0] led;
topmodule u1(clk, sw0, sw15, btnU, btnC, btnD, an, seg, dp, led); */


 
endmodule
