`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2016 07:21:32 PM
// Design Name: 
// Module Name: counter_to_led
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


module counter_to_led(counter,clk_game,led);
input [5:0]counter;
input clk_game;
output reg [15:0]led;

    always @ (*)
    begin
     case(counter)
     0:  led=16'b0001111111111000;
     1:  led=16'b0000000000000001;
     2:  led=16'b0000000000000010;
     3:  led=16'b0000000000000100;
     4:  led=16'b0000000000001000;
     5:  led=16'b0000000000010000;
     6:  led=16'b0000000000100000;
     7:  led=16'b0000000001000000;
     8:  led=16'b0000000010000000;
     9:  led=16'b0000000100000000;
     10: led=16'b0000001000000000;
     11: led=16'b0000010000000000;
     12: led=16'b0000100000000000;
     13: led=16'b0001000000000000;
     14: led=16'b0010000000000000;
     15: led=16'b0100000000000000;
     16: led=16'b1000000000000000;
     17: led=16'b0001111111111000;
default: led=16'b0001111001111000;
     endcase
    end

endmodule
