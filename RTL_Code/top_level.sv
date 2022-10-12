// top level module
// Watch out for case sensitivity when translating from VHDL.
// Also note that the .QSF is case sensitive.

module top_level
 (input  logic       clk,
  input  logic [1:0] KEY,
  input  logic [9:0] SW,
  output logic [9:0] LEDR,
  output logic [7:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
  
  logic [31:0] in1 [3:0];
  logic [31:0] in2 [3:0];
  logic [31:0] out;
  				
  DotProd #(32, 8, 4) DotProd_ins(.inarray1(in1),                    
											 .inarray2(in2), 
											 .dotprodout(out));

endmodule
