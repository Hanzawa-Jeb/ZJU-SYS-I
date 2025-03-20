module Testbench;

    reg [7:0] I;
    reg [2:0] S;
    wire O;

    initial begin
        S = 3'b000; I = 8'b00000000;
        #5;
        S = 3'b000; I = 8'b00000001;
        #5;
        S = 3'b001; I = 8'b00000000;
        #5;
        S = 3'b001; I = 8'b00000010;
        #5;
        S = 3'b010; I = 8'b00000000;
        #5;
        S = 3'b010; I = 8'b00000100;
        #5;
        S = 3'b011; I = 8'b00000000;
        #5;
        S = 3'b011; I = 8'b00001000;
        #5;
        S = 3'b100; I = 8'b00000000;
        #5;
        S = 3'b100; I = 8'b00010000;
        #5;
        S = 3'b101; I = 8'b00000000;
        #5;
        S = 3'b101; I = 8'b00100000;
        #5;
        S = 3'b110; I = 8'b00000000;
        #5;
        S = 3'b110; I = 8'b01000000;
        #5;
        S = 3'b111; I = 8'b00000000;
        #5;
        S = 3'b111; I = 8'b10000000;
        #5;
    end

    Mux8T1_1 dut( 
        .I(I),
        .S(S),
        .O(O) 
    );

    `ifdef VERILATE
		initial begin
			$dumpfile({`TOP_DIR,"/Testbench.vcd"});
			$dumpvars(0,dut);
			$dumpon;
		end
    `endif
    
endmodule
