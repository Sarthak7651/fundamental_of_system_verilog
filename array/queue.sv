
module queue;
  int arr[$];
  int j;
  initial 
    begin
      arr={1,2,3};
      $display("value of arr:%0p",arr);
      
      //writing data at index 0 or at starting
      arr.push_front(7);
      $display("value of arr after push_front(7):%0p",arr);
      
      //writing data at last right hand side
      arr.push_back(9);
      $display("value of arr after push_back (9):%0p",arr);
      
      //at index 2 write 10
      arr.insert(2,10);
      $display("value of arr after value 10 at index 2:%0p",arr);
      
      j=arr.pop_front();
      $display("arr : %0p",arr);
      $display("value of j front : %0d",j);
      
      j=arr.pop_back();
      $display("arr : %0p",arr);
      $display("value of j back: %0d",j);
      
      arr.delete(1);
      $display("value of arr after deleting 1st value : %0p",arr);
      
    end
endmodule
      
      
      
      
      
      
