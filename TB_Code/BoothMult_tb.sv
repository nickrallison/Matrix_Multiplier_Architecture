module BoothTB;


    // Inputs
    reg [31:0] X;
    reg [31:0] Y;

    // Outputs
    wire [63:0] Z;

    // Instantiate the Unit Under Test (UUT)
    BoothMulti #(32, 8) uut (
        .X(X), 
        .Y(Y), 
        .Z(Z)
    );

    initial begin
        // Initialize Inputs
        X = 0;
        Y = 0;

        // Wait 100 ns for global reset to finish
        #100;
        X=32'b00000000_00000000_00000010_01000000;
        Y=32'b00000000_00000000_00000011_11010010;
		  #100;
        // Add stimulus here

    end
      
endmodule