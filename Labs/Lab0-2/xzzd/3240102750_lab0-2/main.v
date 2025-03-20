//5-input OR gate module implementation
module OR_GATE_5_INPUTS(
   input I0,
   input I1, 
   input I2,
   input I3,
   input I4,
   output O
);

assign O = I0 | I1 | I2 | I3 | I4;

endmodule

module main( 
   input I0,
   input I1,
   input I2,
   input I3,
   output O 
);

wire wire1;
wire wire2;
wire wire3;
wire wire4;
wire wire5;
wire wire6;

assign wire1 = ~I1 & ~I2 & ~I3;
assign wire2 = ~I0 & I2 & ~I1;
assign wire3 = ~I0 & I1 & I3;
assign wire4 = I2 & I3;
assign wire5 = I0 & I2;

OR_GATE_5_INPUTS FINAL_GATE(
   .I0(wire1),
   .I1(wire2),
   .I2(wire3),
   .I3(wire4),
   .I4(wire5),
   .O(wire6)
);

assign O = wire6;
   
endmodule
