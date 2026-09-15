//below is known as object handling assignment
class first;
  int data=12;
  function void display();
    $display("FIRST : VALUE OF DATA IS:- %0d",data);
  endfunction
endclass

module tb;
  first f1,f2;
  initial begin
    f1=new();
    f2=new();
    f1.data=34;
    f2=f1;
    f2.display();
  end
endmodule


/*polymorphism:- same function call,different output depending on the object.
- a parent class handle can point to different child class object and the child class overridden method is called.
run time polymorphism:- when a parent class handle points to a child class object and using a "virtual" method, the child's
overridden method is called at runtime.*/

