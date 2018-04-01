`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2016 09:29:16 AM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(clk,btnC,clk_LF);
input clk,btnC;
output reg clk_LF; 

reg [2:0] Fout;
//reg clk_LF;
reg clk1;
reg [23:0] count;
initial
begin
count=0;
end
// clk_wiz_0_clk_wiz (clk,clk_lf,btnC);

always @ (posedge clk or posedge btnC)
 begin
 if(btnC)
   begin 
 Fout=0;
 clk1=0;


 end 
else 
    begin 
    Fout <= Fout + 1'b1;
    clk1 <=Fout[2]; // For Simulation    Simulasyonda = 0 Reelde =2 
 end
end

always @ (posedge clk1 or posedge btnC )
begin
  count <= count + 1'b1;

 if(btnC==1)
  begin 
   count<=0;
    clk_LF<=0;
end 
else
 begin
if (count ==24'd320000)     // For Simulation  count ==24'd625000  Simde ==24'd625  // Yavas Oluyor diye d62500 yaptýk 
 begin 
 clk_LF<=~clk_LF; 
 count<=0;
  end 
  end
 
end

//assign clk_lf=clk_LF;  // E


endmodule
