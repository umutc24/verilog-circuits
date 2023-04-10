module sum_product();
  //simple module to test string formatting (f-string in python)

  integer a,b;
  integer sum;

  real x,y;
  real prod_real;

  initial begin
    a=3;
    b=9;
    sum = a+b;
    //f-string
    $display("\n\t a = %0d, b = %0d, sum = %0d", a,b,sum);
    /* Syntax 
    \n = new line
    \t = 4 spaces
    %0d = decimal
    %0.2f = 10.24 
                */
  end
endmodule
