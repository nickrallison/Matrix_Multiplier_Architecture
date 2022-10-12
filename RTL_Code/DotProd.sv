module DotProd #(parameter N=32, B=8, LEN=4)
					 (input  logic [N-1:0] inarray1 [LEN-1:0],
				     input  logic [N-1:0] inarray2 [LEN-1:0],
					  output logic [N-1:0] dotprodout);
					  
	genvar gen_i; 
	integer j;
	integer k;
	integer j_odd;
	reg [N-1:0] multarray [LEN-1:0];
	reg [N-1:0] partialsumarray [LEN-1:0][$clog2(LEN):0];
	generate
		for (gen_i = 0; gen_i < LEN; gen_i = gen_i + 1) begin : multname
			BoothMulti #(N, B) BoothMulti_ins(.X(inarray1[gen_i]), .Y(inarray2[gen_i]), .out(multarray[gen_i]));
		end
	endgenerate
	
	always_comb begin
		for (k = 1; k < LEN; k = k + 2) begin
				partialsumarray[(k-1)/2] = multarray[k] + multarray[k-1];
				if ((LEN - 1) % 2 == 1) begin
					partialsumarray[LEN / 2] = multarray[LEN-1];
				end
		end
	end
		

					  
endmodule