`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2016 09:31:37 AM
// Design Name: 
// Module Name: clk_sel
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


module clk_sel(clk_lf,level,btnC,clk_game);
input clk_lf,btnC;
input [1:0]level;
output reg clk_game;
reg [3:0] Fout;
always @ (posedge clk_lf or posedge btnC)
begin 
    if(btnC==1)
        begin
        Fout<=0;
        clk_game<=0;
    end
        else 
        begin
    Fout<=Fout+1;
    case (level)
    2'b00: clk_game <= Fout[3];         // Buray? 3 ile de?i?tir  (TestBenchte kolayl?k olsun diye )
    2'b01: clk_game <= Fout[2];
    2'b10: clk_game <= Fout[1];
    2'b11: clk_game <= Fout[0];         // Buray? 0 ile de?i?tir 
    endcase
   end
end


endmodule
