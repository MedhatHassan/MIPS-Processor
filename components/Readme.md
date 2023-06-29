<h1>Components of a MIPS Processor</h1>
<p>This project provides a detailed description of the components that make up a MIPS (Microprocessor without Interlocked Pipeline Stages) processor. </p>
<p>Understanding the different components of a processor is important for anyone interested in computer architecture or embedded systems design.</p>

<h2>The components of a MIPS processor include:</h2>
<ul>
  <li>
    Hazard detection unit: The hazard detection unit is responsible for detecting hazards <i>(data hazard & structure hazard)</i> that may occur during the execution of instructions. It examines the current instruction operation code (OPcode) to determine if there is a hazard.
  </li>
  
  <li>
    Arithmetic Logic Unit (ALU): The ALU performs basic arithmetic and logical operations on data stored in registers. These operations include addition (add) & immediate addition (addi).
  </li>
  <li>
    Memory: The memory unit that store data. During the Memory Access (MEM) stage, the processor reads or writes data to the memory.
  </li>
  <li>
    Control Unit: This component generates the control signals that are necessary for the decode stage and other stages of the pipeline.
  </li>
    <li>BUS:</li>
    <ul class = "bus">
      <li>
         Data Bus: is used to transfer data between the processor and memory or other <i>components</i>.  In a MIPS processor, the data bus is typically 32 bits wide.
      </li>
      <li>  
        Address Bus: is used to specify the memory address or <i>components</i> address for data transfer operations. In a MIPS processor, the address bus is typically 32 bits wide.
      </li>
      <li>
        Control Bus: is used to control load signals between different <i>components</i> of the processor, such as Registers, arithmetic logic unit, and memory unit.
      </li>
    </ul>
  <li>
    
  </li>
  <li>
    
  </li>
    <li>Registers</li>
    <ul class="registers">
      <li>
        Program Counter (PC): is a register that contains the address of the next instruction to be executed.
      </li>
      <li>
        Sequence counter (SC): is a register used to keep track of the number of instructions in one operation (OPcode).
        <br><b>NOTE: PC & SC have a hardware mechanism that is implemented at the microarchitecture level, and is not directly accessible to software programs running on the MIPS processor.</b>
      </li>
      <li>
        Instruction Register (IR): The IR is a register unit that stores the instructions to be executed. During the Instruction Fetch (IF) stage, the processor reads an instruction from the IM using the address stored in           the PC.
      </li>
      <li>
        Address register (AR): is used to specify the memory address where the operand is stored. rather than it is used to specify the memory address where the result of the operation should be stored.
      </li>
      <li>General Purpose Registers</li>
    <ul>
          <li>
            $s0 to $s4: These registers are saved registers that can be used to store values that need to be preserved across function calls.
          </li>
          <li>
            $t0 to $t4: These registers are temporary registers that can be used for any purpose. They are often used to hold intermediate values during calculations.
          </li>
          <li>  
            $v0 : a register is used to hold the return values of functions (User input).
          </li>
          <li>
            $a0 : a register is used to hold the return values of functions (User output).
          </li>
        </ul>
    </ul>
</ul>
