<h1>MIPS Processor Implementation in VHDL</h1>
<p>The MIPS (Microprocessor without Interlocked Pipeline Stages) processor is a type of Reduced Instruction Set Computer<b> (RISC) </b>microprocessor architecture. It was developed by MIPS Technologies in the 1980s and has since been used in a variety of embedded systems, such as routers, gaming consoles, and digital cameras.

The MIPS processor is characterized by its simplicity, high performance, and low power consumption. It has a fixed instruction length of 32 bits and a simple instruction set that consists of only a few basic instructions. This allows the processor to execute instructions quickly and efficiently, making it well-suited for high-performance applications.</p>
<br>
<h2>Description:</h2>
<ul>
<li>This project contains the implementation of a MIPS (Microprocessor without Interlocked Pipeline Stages) processor using the Verilog hardware description language. The processor contains five stages: instruction fetch (IF), instruction decode (ID), execute (EX), memory access (MEM), and write back (WB).</li>
<li>The processor supports the following instructions: add, addi, sub, and, andi, or, ori, slt, slti, lw, sw, beq, and j. <b>The processor also supports pipelining , data hazards and overflow detection to improve performance.</b></li>
<li>The project includes a testbench that uses a set of assembly programs to verify the functionality of the processor. The testbench also includes automated tests to check the correctness of the processor's output.</li>
<li>Overall, this project provides a useful resource for those interested in MIPS processor design and implementation, and can be a valuable addition to any hardware design or computer architecture portfolio.</li>
</ul>
<br>

<h2>Processor Architecture</h2>
<img src="https://github.com/MedhatHassan/MIPS-Processor/blob/main/Images/mipsProject-1.png">

<br>
<h2 id = "Instruction_Structure">Instruction Structure</h2>
<img src="https://github.com/MedhatHassan/MIPS-Processor/blob/main/Images/Instruction%20Structure.png">
<P>
<b>Note: OPcode : for operation code R1 : is the destenation Register R2, R3 : is Operands registers </b>
</P>
<h2>Opertions & Registers</h2>
<img src="https://github.com/MedhatHassan/MIPS-Processor/blob/main/Images/Opertions%26Registers.png">
<P>
<b>Note: Number of operations & Registers can be easly updated by cahnging Instruction Structure.</b>
</P>
<br>
<p><i>This implementation can be used as a starting point for anyone interested in learning about MIPS processors or implementing their own MIPS processor. The project is open-source and contributions are welcome</i> 😃.</p>
