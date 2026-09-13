module tb;
  //logic [1:0]a,b;
  //logic [1:0] temp;
  
  task swap(input logic [1:0]a,b);
    logic [1:0] temp;
    temp=a;
    a=b;
    b=temp;
    $display ("After Task value of a:%0d and b:%0d",a,b);
  endtask
  
  logic [1:0]a;
  logic [1:0]b;
  
  initial begin
    a=1;
    b=2;
    $display("Before task: a=%0d b=%0d", a,b);
    swap(a,b);
   
  end
endmodule
  
