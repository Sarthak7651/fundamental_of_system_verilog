module array;
  
  bit arr [7:0]; //in verilog
  bit arr1 [8]; //in sv 8 element 
  bit arr2 []={1,0,1,1};//initialisation of array
  
  initial 
    begin
      $display ("size of arr1 : %0d",$size(arr1));
      $display ("size of arr2 : %0d",$size(arr2));
    end
  
  initial 
    begin
      $display ("value of first element : %0d", arr1[0]);
      arr1[1]=1; //to update the vaue of an array
      $display ("value of first element : %0d",arr1[1]);
      
      $display ("value of all element of arr2 : %0p",arr2);
    end
endmodule

/*if u want to declare a null array like arr2[]; only without initialize it want to update that array it show error*/
