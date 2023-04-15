# MIPS-Processors
MIPS based Single Cycle Processor

This repository contains the code for Single Cycle MIPS processor that supports R - type instructions , I - type instructions and branch instructions (both conditional and unconditional)

One can refer to the computer architecture textbook to understand how datapaths work in case of a MIPS processor while trying to understand the codebase.

This has been a combined effort by Sai Rajat and Koustav Basu (students from Department of Electrical and Electronics Engineering) , as a part of our coursework at BITS Pilani Hyderabad Campus.

MIPS stands for Microcomputer without Interlocked Pipelined Stages. This has been a popular choice for processor designers , due to its standard ISA and has been widely used until now. However recent developments have brought up a new Instruction set Architecture known as RISC-V architecture , which is considered to be better than MIPS. A separate repository shall be put up based on RISC-V processors soon.

This repository is based on a single cycle processor. A single cycle processor tries to execute a single instruction within a single clock cycle. This method of implementation results in a simpler processor block diagram , however with a huge limitation on the time of execution.

The limitation of a single cycle processor is , that it has the same clock period for all kinds of instructions. Thus instructions that technically require lesser time to complete take the same time as the instruction that takes the longest time to complete.

In the mini instruction set that we have considered for designing the MIPS based processor , the instruction that takes the longest time is the LOAD instruction.
This is becaue load instruction performs the following operations : 

1.) Accessing Instruction Memory for fetching the Instruction code corresponding to the instruction.

2.) Reading Register Files

3.) Computing Address location to access in the Data Memory

4.) Accessing the Data Memory (Memory Access) to get the necessary value

5.) Writing back the value read from the data memory into the Register File

Almost all functionalities of the processor get used up , making this the longest instruction. Thus we have considered the time taken by Load instruction to be the clock cycle period for our single cycle processor.


The MIPS Datapath is as follows :

![](https://github.com/SaiRajat2303/MIPS-Processors/blob/main/images/Processor%20Datapath.png)

The program the has been loaded into the instrucion memory is as follows.
In the instrucion memory module, comments have been mentioned beside the instrucion 
codes to indicate which instruction code corresponds to which instruction

![](![](https://github.com/SaiRajat2303/MIPS-Processors/blob/main/images/Processor%20Datapath.png))

To get a detailed understanding about the datapath , a reading of Patterson and Henessy is recommended. Hope this helps !
