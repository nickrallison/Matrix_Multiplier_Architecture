module DotProd #(parameter N=32, B=8, LEN=4)
					 (input  logic [N-1:0] inarray1 [LEN-1:0],
				     input  logic [N-1:0] inarray2 [LEN-1:0],
					  output logic [N-1:0] dotprodout);
					  
	genvar gen_i; 
	integer k;
	genvar a;
	genvar b;
	integer j_odd;
	integer leng;
	reg [N-1:0] multarray [LEN-1:0];
	reg [N-1:0] partialsumarray [LEN-1:0][$clog2(LEN):0];
	
	generate
		for (gen_i = 0; gen_i < LEN; gen_i = gen_i + 1) begin : multname
			BoothMulti #(N, B) BoothMulti_ins(.X(inarray1[gen_i]), .Y(inarray2[gen_i]), .out(multarray[gen_i]));
		end
		PyramidAdder #(N, B, LEN) Pyramid_Adder_ins(.inarray(multarray), .result(dotprodout));
	endgenerate
					  
endmodule