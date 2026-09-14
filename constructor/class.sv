
//class example
class first;
  int data;
  function new();//constructor without argument
    data=32;//value is hard-coded inside the constructor
  endfunction
endclass

module tb;
  first f;
  initial begin
    f=new();//constructror call
    $display("Data:%0d",f.data);
  end
endmodule


//other class example
class first;
  int data;//class property
  function new(input int datain);//constructor with argumet
    data=datain;//store the input value into the object's "data" , data va;ue come from outside
  endfunction
endclass

module tb;
  first f;//handler of class
  initial begin
    f=new(32);//object creation + constructor call datain=32
    $display("Data:%0d",f.data);
  end
endmodule

//data member name and argument name are same
class first;
  int data1;//data members
  bit [7:0] data2;
  shortint data3;
  function new(input int data1=0,
               input  bit [7:0] data2=8'h00,
               input shortint data3=0);//arguments
    //if name of data mebers and arguments are same then use "this" keyword
    this.data1=data1;
    this.data2=data2;
    this.data3=data3;
  endfunction
endclass

module tb;
  first f1;
  initial begin
    f1=new();//if not given any value then take its default value
    $display("data1=%0d,data2=%0d,data3=%0d",f1.data1,f1.data2,f1.data3);
    f1=new(23,35,33);//constructor call and value distributed by position
    $display("data1=%0d,data2=%0d,data3=%0d",f1.data1,f1.data2,f1.data3);
    f1=new(.data2(22),.data3(15),.data1(16));//named argument
    $display("data1=%0d,data2=%0d,data3=%0d",f1.data1,f1.data2,f1.data3);
  end
endmodule


//using "TASK" in class
class first;
  int data1;//data members
  bit [7:0] data2;
  shortint data3;
  function new(input int data1=0,
               input  bit [7:0] data2=8'h00,
               input shortint data3=0);//arguments
    //if name of data mebers and arguments are same then use "this" keyword
    this.data1=data1;
    this.data2=data2;
    this.data3=data3;
  endfunction
  
  task display();
    $display("Value of Data1=%0d,Data2=%0d,Data3=%0d",data1,data2,data3);
  endtask
  
endclass

module tb;
  first f1;
  initial begin
    f1=new();//if not given any value then take its default value
    f1.display();
    f1=new(23,35,33);//constructor call and value distributed by position
    f1.display();
    f1=new(.data2(22),.data3(15),.data1(16));
    f1.display();
  end
endmodule
