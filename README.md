# Hardware-Design

Full Adder: The goal of this experiment was to become familiar with the simulation and analysis tools that Vivado offers to circuit designers.  In this lab, we implement a simple full adder circuit in Verilog and then perform RTL analysis, I/O planning, simulations, synthesis, implementation, and finally test the output on the FPGA.  Through these tests, we are able to see the operational aspects of the design, as well as its feasibility.  It was found that the simulations and implementations in Vivado were consistent with the actual outputs on the FPGA, and that the design of the circuit was very efficient, ultimately using up less than %3 of the FPGA's resources.


Multiplexers and Adders: The goal of this experiment was to build more complex circuits using simpler modules as building blocks.  In this lab we explore different methods of modeling, such as gate level modeling, data flow modeling, and behavioral modeling and we use these models to construct 2-to-1 multiplexers.  We then experiment building larger projects using simpler designs by first constructing a 3-to-2 multiplexer (using the previously implemented 2-to-1 multiplexers) and then constructing both a ripple carry adder and a carry look ahead adder.  We found that Vivado allows designers to use simple modules as building blocks for larger designs and that the operations of the designs we constructed were consistent with our predictions. 


Decoders and ROM: The goal of this experiment was to refine our skills in data flow modeling as well as learn about ROM capabilities that the FPGA offers.  Data flow modeling was used to design a 3-to-8 decoder, which was then used to mimic the functionality of the IC-74138 device.  Additionally, a 2-bit by 2-bit multiplier was implemented using the ROM features present in Vivado and the FPGA.  It was found that real-world devices could easily be simulated and implemented using data flow modeling on the FPGA, as seen by the implementation of the IC-74138 device.  In addition to this, it was found that ROM can be used to easily transfer large amounts of information to the FPGA, using minimal resources, making it a desirable tool for hardware designers.


Registers and Counters: The goal of this experiment was to become familiar with the modeling of sequential circuits in Verilog and Vivado.  We employ behavioral modeling to design a 4-bit register, a 4-bit left shift register, two 8-bit counters, and a 3-bit counter that counts in a special sequence.  By designing these circuits, we learned how to implement various sequential elements as well as how to properly test the designs of sequential circuits.  We found that the testing of sequential circuits takes additional care due to the fact that initial states must be accounted for and that timing must be taken into consideration when designing test benches.


32-Bit MIPS: In this project, we design six of the main functional blocks that make up the 32-bit processor, which can ultimately perform nine of the core MIPS instructions.  In order to test our design, we translate two C programs into machine language code and provide them as instructions for our processor.  It was found that the design was correctly able to perform the operations set forth in the instructions.  Additionally, it was found that the implementation of our design used up fewer than \%25 of the FPGA's resources, making it very efficient.
