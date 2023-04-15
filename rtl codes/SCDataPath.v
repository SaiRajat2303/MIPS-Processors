`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 22:57:23
// Design Name: 
// Module Name: SCDataPath
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

module SCDataPath(output [31:0] ALU_output, output [31:0] PC , input clk , input reset);

wire[31:0] instr_code;
wire [31:0] X;
wire [4:0] Reg_dest_op;
wire [31:0] write_data;
wire [31:0] read_data1;
wire [31:0] read_data2;
wire [5:0] opcode;
wire [3:0] alu_control;
wire RegDst , branch , memRead , MemtoReg , memWrite , aluSrc , regwrite;
wire [1:0] aluOp;
wire [31:0] Y; // Y is the sign extended value used for load and store
wire [31:0] B; //second input to the ALU
wire [31:0] result ; //output of ALU
wire zero_flag;
wire [31:0] read_data;
wire jump;

assign opcode = instr_code[31:26];

wire [5:0] funct;
assign funct = instr_code[5:0];

PC_Value p1(PC ,branch ,zero_flag ,reset ,clk,X,jump,instr_code);

instruction_mem im1(PC,reset,instr_code);

main_control mc0(opcode, RegDst , branch , memRead , MemtoReg , aluOp , memWrite , aluSrc , regwrite ,jump);

mux2by1_5bit m0(instr_code[20:16], instr_code[15:11],RegDst,Reg_dest_op);

regfile r0(instr_code[25:21],instr_code[20:16],Reg_dest_op,write_data,read_data1,read_data2,regwrite,reset,clk);

Imm_gen im0(instr_code,X);

alu_control ac0(aluOp,funct,alu_control);

sign_extender se0(instr_code[15:0],Y);

mux2by1 m1(read_data2,Y,aluSrc,B);

alu32 al1(alu_control,read_data1,B,result,zero_flag);

data_mem d0(result,read_data2,read_data,memRead,memWrite,reset);

mux2by1 m2(result , read_data , MemtoReg , write_data);

assign ALU_output = result;

endmodule



