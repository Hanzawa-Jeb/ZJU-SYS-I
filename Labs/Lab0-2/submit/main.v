/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : main                                                         **
 **                                                                          **
 *****************************************************************************/

module main( I0,
             I1,
             I2,
             O );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input I0;
   input I1;
   input I2;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output O;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet10;
   wire s_logisimNet2;
   wire s_logisimNet3;
   wire s_logisimNet4;
   wire s_logisimNet5;
   wire s_logisimNet6;
   wire s_logisimNet7;
   wire s_logisimNet8;
   wire s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet3 = I2;
   assign s_logisimNet6 = I1;
   assign s_logisimNet8 = I0;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign O = s_logisimNet9;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet2 = ~s_logisimNet8;

   // NOT Gate
   assign s_logisimNet5 = ~s_logisimNet6;

   // NOT Gate
   assign s_logisimNet7 = ~s_logisimNet3;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_1 (.input1(s_logisimNet8),
               .input2(s_logisimNet5),
               .input3(s_logisimNet7),
               .result(s_logisimNet1));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_2 (.input1(s_logisimNet2),
               .input2(s_logisimNet6),
               .input3(s_logisimNet7),
               .result(s_logisimNet10));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_3 (.input1(s_logisimNet2),
               .input2(s_logisimNet5),
               .input3(s_logisimNet3),
               .result(s_logisimNet4));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_4 (.input1(s_logisimNet8),
               .input2(s_logisimNet6),
               .input3(s_logisimNet3),
               .result(s_logisimNet0));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_5 (.input1(s_logisimNet1),
               .input2(s_logisimNet10),
               .input3(s_logisimNet4),
               .input4(s_logisimNet0),
               .result(s_logisimNet9));


endmodule
