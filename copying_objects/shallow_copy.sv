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
    
