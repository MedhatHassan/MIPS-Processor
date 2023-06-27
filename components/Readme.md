<h1>Components of a MIPS Processor</h1>
<p>This project provides a detailed description of the components that make up a MIPS (Microprocessor without Interlocked Pipeline Stages) processor. </p>
<p>Understanding the different components of a processor is important for anyone interested in computer architecture or embedded systems design.</p>

<h2>The components of a MIPS processor include:</h2>
<ul>
  <li>
    Hazard detection unit: The hazard detection unit is responsible for detecting hazards that may occur during the execution of instructions. It examines the current instruction and the previous instruction to determine if there is a hazard. Hazards can occur due to data dependencies, control dependencies, or structural dependencies.
  </li>
  
  <li>
    Arithmetic Logic Unit (ALU): The ALU performs basic arithmetic and logical operations on data stored in registers. These operations include addition (add) & immediate addition (addi).
  </li>
  <li>
    Memory: The memory unit that store data. During the Memory Access (MEM) stage, the processor reads or writes data to the memory.
  </li>
    <li>Registers</li>
    <ul class="registers">
      <li>
      Program Counter (PC): The PC is a register that contains the address of the next instruction to be executed.
      </li>
      <li>
        Instruction Register (IR): The IR is a register unit that stores the instructions to be executed. During the Instruction Fetch (IF) stage, the processor reads an instruction from the IM using the address stored in           the PC.
      </li>
    </ul>
</ul>
