
//class example



//other class example
class first;
  int data;//class property
  function new(input int datain);//constructor
    data=datain;//store the input value into the object's "data"
  endfunction
endclass

module tb;
  first f;//handler of class
  initial begin
    f=new(32);//object creation + constructor call datain=32
    $display("Data:%0d",f.data);
  end
endmodule
