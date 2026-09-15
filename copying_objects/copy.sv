/*The code modifies the `data` member of the `p1` object to 12. Because `p1` and `f1` point to two entirely 
separate instances in memory, changing `p1.data` has no effect on `f1.data`.
*/
class first;
  int data;
endclass
module tb;
  first f1;
  first p1;
  initial begin
    f1=new();//constructor
    f1.data=24;
    p1=new f1;//copying data from f1 to p1 (create a new object p1 by copying f1)
    $display("value of data member : %0d",p1.data);
    p1.data=12;
    //f1=new p1;//copying data form p1 to f1
    $display("value of data member : %0d",f1.data);
  end
endmodule
    
