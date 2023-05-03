`timescale 1us/1ns
module tb_seq_det_overlap();

    reg clk = 0;
	reg rst_n;
	reg seq_in;
	wire detected;
	wire [1:0] state_out;
   
    reg [0:13] test_vect = 14'b00_1100_0101_0101;
	integer i;
	
    // Instantiate the module
    seq_det_overlap SEQ_DET0(
        .clk      (clk      ),
		.rst_n    (rst_n    ),
		.seq_in   (seq_in   ),
		.detected (detected ),
		.state_out(state_out)
        );
	
    initial begin // Create the clock signal
        forever begin 
		    #1 clk = ~clk;
	    end
    end

    initial begin
	    $monitor($time, " seq_in = %b, detected = %b", seq_in, detected);
		
	    rst_n = 0; #2.5; rst_n = 1; // reset sequence
	    repeat(2) @(posedge clk);   // wait some time
		
		for(i=0; i<14; i=i+1) begin
		    seq_in = test_vect[i];
			@(posedge clk);
		end
		
		for(i=0; i<15; i=i+1) begin
		    seq_in = $random;
			@(posedge clk);
		end
		
		// Enable the semaphore again
	    repeat(10) @(posedge clk); 
        @(posedge clk);

	    #40 $stop;
	end       
endmodule