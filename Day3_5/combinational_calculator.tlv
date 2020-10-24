\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |calc
   $reset = *reset;
   
   // assigning random signals
   $in1[31:0] = $rand1[3:0];
   $in2[31:0] = $rand2[3:0];
   $opcode[1:0] = $rand3[1:0];
   
   // opcode : 2 bits -> can accomodate 4 operations
   // add, sub, mul, and div
   // computing output of all operations
   $sum[31:0]  = $in1[31:0] + $in2[31:0]; // add
   $diff[31:0] = $in1[31:0] - $in2[31:0]; // sub
   $prod[31:0] = $in1[31:0] * $in2[31:0]; // mul
   $quot[31:0] = $in1[31:0] / $in2[31:0]; // div

   // 4:1 mux to deocode the opcode and 
   //output the corresponding result
   $out[31:0] = ($op[1:0]==2'b00) ? $sum  : 
                ($op[1:0]==2'b01) ? $diff :
                ($op[1:0]==2'b10) ? $prod :
                $quot;
   //...

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
