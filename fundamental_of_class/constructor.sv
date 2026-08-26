class first;
  bit [2:0] data;
  bit [2:0] data2;
endclass

/*u u should creat not access clas just by handler u should create constructor */

module tb;
  first f;
  initial 
    begin
      f = new();//constructor , "new" keyword give memory space for class
      // f= null; //for delocation of memory
      f.data=3'b101;
      f.data2=3'b110;
      #1;
      $display ("value of data:%0b and data2:%0b",f.data,f.data2);
    end
endmodule
