/*Randomization :- generate different random value using "rand randc and randomize()" 
mainly to create different test scenario during verification"*/

class generator;
  rand bit [ 3:0] a,b;//randc
  bit[3:0] y;
endclass

module tb;
  generator g;
  int i = 0;
  int status=0;
  initial begin
    g=new();
    for(i=0;i<10;i=i+1) begin
      g.randomize();
      $display("value of a : %0d and b : %0d",g.a,g.b);
    end
  end
endmodule

module dut(
  input [3:0]a,b,
  output [3:0]y);
endmodule
