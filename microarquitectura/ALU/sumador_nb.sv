module sumador_nb #(parameter N = 4) (input logic [N-1:0] a, b,
													input logic ci,
												  output logic [N-1:0] sum,
												  output logic co);

generate
	if (N==1) begin
	sumador_1b sum1b1 (a[0],b[0],ci,sum[0],co);
	end
	
	else begin
		genvar i;
		wire c [N-1:1];
		sumador_1b sum1b2 (a[0],b[0],ci,sum[0],c[1]);					
			for( i=1;i<N-1;i++) begin: gen_loop
				sumador_1b sum1b3 (a[i],b[i],c[i],sum[i],c[i+1]);
			end
		sumador_1b sum1b14 (a[N-1],b[N-1],c[N-1],sum[N-1],co);	
		
	end
endgenerate

endmodule

