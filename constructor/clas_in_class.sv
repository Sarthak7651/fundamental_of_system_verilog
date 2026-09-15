/*class composition - known as "has-a" relationship,where one class contain an instance of another class.
by making "local" int data,this variable becomes completely hidden from outside classes or module. it can only be 
read or modified by task and function or methods written inside the first class. */

class first;
  //local int data=35;
  int data=35;
  task display();
    $display("value of data is %0d",data);
  endtask
endclass

class second;
  first f1;
  function new();
    f1=new();
  endfunction
endclass

module tb;
  second s;
  initial begin
    s=new();
    $display("value of data is %0d",s.f1.data);
    s.f1.display();
    s.f1.data=45;
    s.f1.display();
  end
endmodule
