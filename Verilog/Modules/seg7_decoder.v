`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2016 09:36:59 AM
// Design Name: 
// Module Name: seg7_decoder
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



module seg7_decoder(dig3,dig2,dig1,dig0,clk,rst,seg,an,dp);

input [3:0]dig3,dig2,dig1,dig0;
// input [15:0] in;
input clk,rst;
output reg [6:0] seg;
output reg [3:0] an;
output wire dp;

wire [1:0] select;
reg [3:0] digit;
reg [19:0] clkdiv;

assign select = clkdiv[19:18];
assign dp = 1;

// input multiplexer
always @ (*)
    begin
        if(rst == 0)
            begin
                case(select)
                    0:  digit = dig0;
                    1:  digit = dig1;
                    2:  digit = dig2;
                    3:  digit = dig3;
                endcase
            end
        else
            begin
                digit = 0;
            end
    end

//selecting anodes
always @(*)
    begin
        case(select)
            0:  an = 4'b1110;
            1:  an = 4'b1101;
            2:  an = 4'b1011;
            3:  an = 4'b0111;
        endcase
    end

// 7-segment ouptuts
always @ (*)
    begin
        if(rst == 0)
            begin
                case(digit)    //gfedcba//
                    0:  seg = 7'b1000000; // 0
                    1:  seg = 7'b1111001; // 1
                    2:  seg = 7'b0100100; // 2
                    3:  seg = 7'b0110000; // 3
                    4:  seg = 7'b0011001; // 4
                    5:  seg = 7'b0010010; // 5
                    6:  seg = 7'b0000010; // 6
                    7:  seg = 7'b1111000; // 7
                    8:  seg = 7'b0000000; // 8
                    9:  seg = 7'b0010000; // 9
                    10: seg = 7'b0001000; // A
                    11: seg = 7'b0000011; // B
                    12: seg = 7'b1000110; // C
                    13: seg = 7'b0100001; // D
                    14: seg = 7'b0000110; // E
                    15: seg = 7'b1111111; // Reserved for blank output so shall not display F           
                endcase
            end
        else
            begin
                seg = 7'b1111111; // close 7-seg
            end
    end
    
// clock division    
always @(posedge clk or posedge rst) 
    begin
        if ( rst == 1)
            clkdiv <= 0;
        else
            clkdiv <= clkdiv + 1;
    end

endmodule
