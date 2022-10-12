// top level module
// Watch out for case sensitivity when translating from VHDL.
// Also note that the .QSF is case sensitive.

module top_level
 (input  logic       clk,
  input  logic [1:0] KEY,
  input  logic [9:0] SW,
  output logic [9:0] LEDR,
  output logic [7:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
  				
  BoothMulti #(32, 5) BoothMulti_ins(.X(SW[3:0]),                    
											.Y(SW[7:4]), 
											.Z(~LEDR));

endmodule
