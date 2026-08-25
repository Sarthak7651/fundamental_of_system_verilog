module array_compare;
  int arr1[5]={1,2,3,4,5};
  int arr2[5]={1,2,3,4,5};
  
  int status;
  initial 
    begin
      status = (arr1 == arr2); //compare and give value
      $display ("value of status : %0d",status);
    end
endmodule
/*if array equal valueis true=1 otherwise false=0*/
