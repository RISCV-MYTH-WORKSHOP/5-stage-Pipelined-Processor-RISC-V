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
      @1
        $reset = *reset;
        
        $a_sq[31:0] = $a * $a;
        $b_sq[31:0] = $b * $b;
      @2
        $c_sq[31:0] = $a_sq + $b_sq;
      @3
        $c[31:0] = sqrt($c_sq);
   //...

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
