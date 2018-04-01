`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2016 07:49:37 PM
// Design Name: 
// Module Name: tb_for_all
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

/*Dogru Simulasyon ?cin degismesi gerekenler 
clk_divider     For Simulation  count ==24'd625000  Simde ==24'd625  
clk_divider     For Simulation    Simulasyonda = 0 Reelde =2 
lamp_handball   always@(posedge clk_game or  posedge rst) 
*/

module tb_for_all();
reg btnC, btnU, btnD;
reg clk;
reg sw0, sw15;
wire [6:0] seg;
wire [3:0] an;
wire dp;
wire [15:0] led;
 topmodule u1(clk, sw0, sw15, btnU, btnC, btnD, an, seg, dp, led);
 always  
 #5 clk=~clk; 
 initial 
 begin
    btnU=1'b0;
    btnD=1'b0;
    sw0=1'b0;
    sw15=1'b0;
     btnC=1'b0;

 clk=1'b0;
 #7
 btnC=1'b1;
 #28
 btnC=1'b0;
 
 #8000;
    sw15=1'b1;
     #200000;
         sw15=1'b0;
      #640000;   
        sw0=1'b1;
     #50000;   
    sw0=1'b0;
    #675000; 
       sw15=1'b1;
      #50000;  
               sw15=1'b0; 
#1000000; 
 //btnC=1'b1;
#800
//btnC=1'b0;
#1000; 
 sw15=1'b1;
    #200000;
        sw15=1'b0;
        #620000;   
                sw0=1'b1;
             #50000;   
            sw0=1'b0;
#1000000; 

$stop;
 end
 
endmodule
