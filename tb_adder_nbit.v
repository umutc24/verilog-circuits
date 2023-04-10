module tb_adder_nbit();

  parameter ADDER_WIDTH = 10;
  reg [ADDER_WIDTH-1:0] a;
  reg [ADDER_WIDTH-1:0] b;
  wire[ADDER_WIDTH:0] sum;

  //instantiate the parameterized DUT
  adder_nbit
  # (.N(ADDER_WIDTH))
  ADDER 1 
  (        .a(a),
           .b(b),
           .sum(sum)
   );


   initial begin
    $monitor($time, " a=%d, b=%d, sum =%d", a,b,sum);
    #1 a=0, b=0;
    #1 a=2, b=2;
    #1 a=3, b=0;
    #1 a=1, b=5;
    #1 a=100, b=20;
    #1 a=45, b=22; $stop
   end
endmodule
