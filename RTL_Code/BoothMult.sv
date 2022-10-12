// From here

module BoothMulti #(parameter N = 4, B = 0)
									  (X, Y, Z, out);
	input signed [N-1:0] X, Y;
	output signed [2*N-1:0] Z;
	output signed [N-1:0] out;
	reg signed [2*N-1:0] Z;
	reg signed [N-1:0] out;
	reg [1:0] temp;
	integer i;
	reg E1;
	reg [N-1:0] Y1;
	always @ (X, Y) begin
		out = 'd0;
		Z = 'd0;
		E1 = 1'd0;
		for (i = 0; i < N; i = i + 1) begin
			temp = {X[i], E1};
			Y1 = - Y;
			case (temp)
				2'd2 : Z [2*N-1:N] = Z [2*N-1:N] + Y1;
				2'd1 : Z [2*N-1:N] = Z [2*N-1:N] + Y;
				default : begin end
			endcase
			Z = Z >> 1;

			Z[2*N-1] = Z[2*N-2];
			E1 = X[i];
		end
	if (Y == 2**(N-1)) Z = - Z;
	out = Z[N+2*B:2*B];
	end 
endmodule
