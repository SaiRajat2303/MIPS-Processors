`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 22:49:37
// Design Name: 
// Module Name: PC_value
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

module PC_Value(output reg [31:0] PC ,
input branch ,
input zero_flag ,
input reset ,
input clk,
input [31:0]X,
input jump,
input [31:0]instr_code);
reg PCsrc;

always@(negedge reset)
begin
if(reset == 0)
PC = 0;
end

always@(posedge clk)
begin
if (jump == 1'b1)
PC = {4'b0000,instr_code[25:0],2'b00};
else
begin
PCsrc = branch & zero_flag;
if(reset == 1'b1 && PCsrc == 1'b0)
PC<= PC + 4;
else if(reset == 1 && PCsrc == 1'b1)
PC<= PC+4+X;
end
end

endmodule

