module MatrixMultiplier #(parameter N=32, B=8, LEN=4, WIDTH=4)
					 (input  logic [N-1:0] vectorin [LEN-1:0],
				     input  logic [N-1:0] matrixin [WIDTH-1:0][LEN-1:0],
					  output logic [N-1:0] vectorout [WIDTH-1:0]);
					  
	genvar gen_i;				  
					
	generate
		for (gen_i = 0; gen_i < WIDTH; gen_i = gen_i + 1) begin : multname
			DotProd #(N, B, LEN) DotProd_ins(.inarray1(matrixin[gen_i]), .inarray2(vectorin), .dotprodout(vectorout[gen_i]));
		end
	endgenerate
					  
endmodule