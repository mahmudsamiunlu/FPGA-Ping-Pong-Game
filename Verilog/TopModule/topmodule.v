//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2016 09:27:23 AM
// Design Name: 
// Module Name: topmodule
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

module topmodule (clk, sw0, sw15, btnU, btnC, btnD, an, seg, dp, led);

input btnC, btnU, btnD;
input clk;
input sw0, sw15;
output [6:0] seg;
output [3:0] an;
output dp;
output [15:0] led;
wire up, down;
wire [1:0] level; // counting for game-level selection
wire clk_lf,clk_BTN; // low frequency clk
wire clk_game; // clk of state machine
wire [3:0] score_P1; //scores
wire [3:0] score_P2;
// edge detection required here to set game level
edge_detector u1(clk_lf,btnC,btnU,up);
edge_detector u2(clk_lf,btnC,btnD,down);
updown_counter u3(up,down,btnC,level);
clk_divider u4(clk,btnC,clk_lf); // Obtaining 10Hz clk from 100MHz main oscillator
clk_sel u5(clk_lf,level,btnC,clk_game); // game-level selection
lamp_handball u6(clk,clk_game,btnC,sw15,sw0,led,score_P1,score_P2);
clk_divider u10(clk_lf,btnC,clk_BTN);                                // Butonun düzgün saymas? için buray? tekrar kontrol et calismazsa !!!

// Digit 3 - Score P1
// Digit 2 - Score P2
// Digit 1 - empty
// Digit 0 - Game-level from 0-3 (easy to hard)
// Digit positions can be modified so it is up to user
seg7_decoder u7(score_P1,score_P2,4'b1111,{2'b00,level},clk,btnC,seg,an,dp);

endmodule

