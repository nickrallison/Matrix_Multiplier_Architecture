module PyramidAdder #(parameter N=32, B=8, LEN=4)
							(input  logic [N-1:0] inarray [LEN-1:0],
							output logic [N-1:0] result);
							
	logic [N-1:0] middlenum1;
	logic [N-1:0] middlenum2;	
	
	generate				
		if (LEN == 1) assign result = inarray[0];
		else if (LEN == 2) assign result = inarray[0] + inarray[1];
		else begin
			PyramidAdder #(N, B, LEN / 2 + LEN % 2) A1(.inarray(inarray[LEN/2+LEN%2-1:0]), .result(middlenum1));
			PyramidAdder #(N, B, LEN / 2) A2(.inarray(inarray[LEN-1:LEN/2+LEN%2]), .result(middlenum2));
			assign result = middlenum1 + middlenum2; 
		end 
	endgenerate			  
endmodule