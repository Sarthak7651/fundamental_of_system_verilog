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


//another proper way of pass by refrence
//ref :- allows a task to directly access and modify the caller's original variable instead of receiving a copy.
//automatic :- means that each invocation of the task gets its own separate copy of local variables.
//is u use const on the plcae of bit then it is wronf bcz in swaping const is now allowed to swap

module tb;
  //logic [1:0]a,b;
  //logic [1:0] temp;
  
  task automatic swap(ref bit [1:0]a,b);
    logic [1:0] temp;
    temp=a;
    a=b;
    b=temp;
    $display ("After Task value of a:%0d and b:%0d",a,b);
  endtask
  
  bit [1:0]a;
  bit [1:0]b;
  
  initial begin
    a=1;
    b=2;
    $display("Before task: a=%0d b=%0d", a,b);
    swap(a,b);
   
  end
endmodule
  
