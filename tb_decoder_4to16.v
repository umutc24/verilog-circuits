`timescale 1us/1ns
module tb_decoder_4to16();
	
   reg [3:0] a;
   wire  [15:0] d;
   integer i;
   
    // Instantiate the DUT
    decoder_4to16 DEC4_16 (
      .a(a),
      .d(d)
    );
  
    // Create stimulus
    initial begin
        $monitor($time, " a = %d, d = %b", a, d);
        #1; a = 0;
        for (i = 0; i<16; i=i+1) begin
            #1; a = i;
        end
    end
  
endmodule