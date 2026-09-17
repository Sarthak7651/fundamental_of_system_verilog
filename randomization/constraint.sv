class generator;
  randc bit [ 3:0] a,b;//randc
  bit[3:0] y;
  
  /*constraint data_a {a>3;a<7;}
  constraint data_b {b == 3;}*/ 

  //constraint data {a>3;a>7;b>0;}

  /*constraint data {
    a inside {[0:8],[10:11],15};
    b inside {[3:11]};} */

  constraint data {
     !(a inside {[3:7]});
     !(b inside {[5:9]}); }
 //wnat to skip a=3:7 and b=5:9 value
endclass

module tb;
  generator g;
  int i = 0;
  int status=0;
  initial begin
    g=new();
    for(i=0;i<10;i=i+1) begin
      assert(g.randomize()) else $display("Randomization is failed");
      $display("value of a : %0d and b : %0d",g.a,g.b);
    end
  end
endmodule
