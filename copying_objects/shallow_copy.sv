class first;
  int data;
endclass
module tb;
  first f1;
  first p1;
  initial begin
    f1=new();//constructor
    f1.data=24;
    //shallow copy methos
    //Shallow copy copies the handle/reference, so both handles point to the same object.
    p1 = f1;//it does nto creat a new object 
    /* 
    Now both f1 and p1 point to the same object 24
             ┌──────────────┐
f1 ─────────►│              │
             │    Object    │
p1 ─────────►│   data = 24  │
             │              │
             └──────────────┘          
    */
    $display("value of data member : %0d",p1.data);
    p1.data=12; //Now both f1 and p1 point to the same object 12
    $display("value of data member : %0d",f1.data);
  end
endmodule
    


//another example of shallow copy
class first;
  int data=12;
endclass

class second;
  int ds=34;
  first f1;
  function new();
    f1=new();
  endfunction
endclass

module tb;
  second s1,s2;
  initial begin
    s1=new();
    s1.ds=45;
    s2=new s1;//Create a new object s2 by copying the properties of object s1
    //s2 = s1; //true syntax for shallow copy
    $display("value of ds:%0d",s2.ds);
    s2.ds=78;
    $display("value of data:%0d",s1.ds);
    s2.f1.data=56;
    $display("value of data:%0d",s1.f1.data);
  end
endmodule
