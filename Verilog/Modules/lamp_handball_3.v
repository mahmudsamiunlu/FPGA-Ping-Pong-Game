{\rtf1\ansi\ansicpg1252\cocoartf1504
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;\csgray\c100000;}
\paperw11900\paperh16840\margl1440\margr1440\vieww26280\viewh13940\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs26 \cf0 \
\
\
`timescale 1ns / 1ps\
//////////////////////////////////////////////////////////////////////////////////\
// Company: \
// Engineer: \
// \
// Create Date: 12/29/2016 09:36:35 AM\
// Design Name: \
// Module Name: lamp_handball\
// Project Name: \
// Target Devices: \
// Tool Versions: \
// Description: \
// \
// Dependencies: \
// \
// Revision:\
// Revision 0.01 - File Created\
// Additional Comments:\
// \
//////////////////////////////////////////////////////////////////////////////////\
\
\
module lamp_handball_2(clk_game,rst,LeftSw,RightSw,Led,Score_Left,Score_Right );\
input clk_game,rst,LeftSw,RightSw;\
output   [15:0]Led;\
output [3:0] Score_Left,Score_Right;\
\
reg GameDirection;       // 1 = >  :   0 = <  \
reg GameStart;\
reg LeftBorder; \
reg RightBorder; \
reg LeftPass;\
reg RightPass;\
reg Center;\
reg [5:0]Counter;\
reg [3:0] score_Left,score_Right;\
reg [15:0]led;\
reg donoting;;\
    \
 /* C\'b8nk\'b8 ?cerde outputlar var ve outputlar? ile clocksuz bi?eye e?itliyemiyor sadece D letchleri alwaysin icinde yap?p bitiriyor bundan sonra \
 d?sarda o gelen outputa esitliyebiliyor \
  */\
    //  always @ (pose=dge clk_game ) // For Real   \
     always @ ( posedge clk_game or  posedge rst)      // For Sim    \
begin\
    if(rst==1)\
    begin\
        Counter=17;\
        GameStart=0; \
        GameDirection=1;\
        score_Right=0;\
        score_Left=0;\
    end\
    else \
begin\
    if(GameDirection&GameStart)\
        Counter=Counter-1;\
        \
    else if(!GameDirection&GameStart)\
       Counter=Counter+1;\
    \
    else if(~GameStart&LeftBorder&LeftSw)             // 4. Durum ile ayn? durum oluyor \
    begin\
        GameStart=1; \
        GameDirection=1;\
        Counter =17;\
    end\
    \
   else  if(RightPass&RightSw)\
        GameDirection=0;\
\
    else if(LeftPass&LeftSw)\
        GameDirection=1;\
    \
    else if (RightBorder&GameStart&GameDirection)\
    begin\
        score_Left=score_Left+1; \
        GameStart=0;\
       end   \
    else if (LeftBorder&GameStart&!GameDirection)                //  4. Durum \
    begin\
        score_Right=score_Right +1; \
        GameStart=0;\
    end\
    \
    else if (Center&GameStart&RightSw)\
    begin\
        score_Left=score_Left+1; \
        GameStart=0;\
    end\
   else if(Center&GameStart&LeftSw)\
    begin\
        score_Right=score_Right +1; \
        GameStart=0;\
     end                                               \
	else \
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 	donoting=0; \
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \
                                  \
                                  \
     case(Counter)\
          0:  led=16'b0000000000000101;\
          1:  led=16'b0000000000000001;\
          2:  led=16'b0000000000000010;\
          3:  led=16'b0000000000000100;\
          4:  led=16'b0000000000001000;\
          5:  led=16'b0000000000010000;\
          6:  led=16'b0000000000100000;\
          7:  led=16'b0000000001000000;\
          8:  led=16'b0000000010000000;\
          9:  led=16'b0000000100000000;\
          10: led=16'b0000001000000000;\
          11: led=16'b0000010000000000;\
          12: led=16'b0000100000000000;\
          13: led=16'b0001000000000000;\
          14: led=16'b0010000000000000;\
          15: led=16'b0100000000000000;\
          16: led=16'b1000000000000000;\
          17: led=16'b1010000000000000;\
     default: led=16'b0001111001111000;\
          endcase\
        end                          \
\
end\
\
always @ (posedge clk_game)\
begin \
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0    \
// Burasi    Topun Nerede oldugunu belirliyor    			    ||         __       _______        __          ||    \
//                                             		    			       LeftBorder  LeftPass    Center      RightPass   RightBorder\
// Counter                                  					         17         16-15   14-------3       2-1          0\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \
\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0    if(Counter==17)  			LeftBorder=1;\
   else if(Counter!=17) 		LeftBorder=0;\
\
   else if (Counter==0)  		RightBorder=1;\
   else if (Counter!=0)       	RightBorder=0;\
    \
    else if(Counter==16|Counter==15)	 LeftPass=1;\
    else if(Counter!=16|Counter!=15)	 LeftPass=0;\
    \
    else if(Counter==2|Counter==1)   		RightPass=1;\
    else if(Counter!=2|Counter!=1)          		RightPass=0;\
    \
    else if(Counter<15&Counter>2) 			 Center=1;\
    else if(!(Counter<15&Counter>2))         		 Center=0;\
    \
    else if(Counter>17) 					 Counter=17;\
    else if(Counter<0)  					 Counter=17;\
       else\
	donoting=0; \
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \
end\
\
assign Led = led; \
assign Score_Left  = score_Left;\
assign Score_Right = score_Right;\
\
endmodule\
}