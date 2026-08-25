module copy_operation;
  int arr1[5];
  int arr2[5];
  /*array should be of same size and same data types.if any one of them is different then it shows compile error*/
  
  initial 
    begin
      for (int i=0; i<5; i++)
        begin
          arr1[i]=5*i;
        end
      arr2=arr1;
      $display("value of arr2 is :%0p",arr2);
    end
endmodule
  
