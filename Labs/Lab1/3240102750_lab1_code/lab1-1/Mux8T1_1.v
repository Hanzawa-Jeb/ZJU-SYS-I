module Mux2T1_1(
   input [1:0] I,
   input S,
   output O
);

assign O = S ? I[1] : I[0];

endmodule


module Mux8T1_1( 
   input [7:0] I,
   input [2:0] S,
   output O 
);

wire [1:0] median;

Mux4T1_1 mux4_low(I[0], I[1], I[2], I[3], median[0], {S[1], S[0]});
Mux4T1_1 mux4_high(I[4], I[5], I[6], I[7], median[1], {S[1], S[0]});
Mux2T1_1 mux2_final(median, S[2], O);
   
endmodule
