// top level module
// Watch out for case sensitivity when translating from VHDL.
// Also note that the .QSF is case sensitive.

module top_level
 (input  logic       clk,
  input  logic [1:0] KEY,
  input  logic [9:0] SW,
  output logic [9:0] LEDR,
  output logic [7:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
  
  logic [31:0] vec [1:0];
  logic [31:0] mat [1:0][1:0];
  logic [31:0] out [1:0];
  
  logic [31:0] vec1 [15:0];
  logic [31:0] vec2 [15:0];
  logic [31:0] outdot;

  				
	MatrixMultiplier #(32, 8, 2, 2) MatrixMultiplier_ins(.vectorin(vec), .matrixin(mat), .vectorout(out));
	//DotProd #(32, 8, 16) DotProd_ins(.inarray1(vec1), .inarray2(vec2), .dotprodout(outdot)); 
endmodule

