/*polymorphism:- same function call,different output depending on the object.
- a parent class handle can point to different child class object and the child class overridden method is called.
run time polymorphism:- when a parent class handle points to a child class object and using a "virtual" method, the child's
overridden method is called at runtime.
A virtual function allows a base-class handle pointing to a derived-class object to invoke the derived-class overridden function at runtime.


*/

class first;
  int data=12;
  virtual function void display();
    $display("FIRST:value of data is: %0d",data);
  endfunction
endclass

class second extends first;
  int temp=34;
  function void add();
    $display("Second:value after process is : %0d",temp+4);
  endfunction
  function void display();
    $display("Second:value of data :%0d",data);
  endfunction
endclass

module tb;
  first f;//classs handle
  second s;//class handle
  initial begin
    f=new();//object created
    s=new();//object created
    f=s;//This is allowed because a base-class handle can point to a derived-class object.
    f.display();
  end
endmodule
