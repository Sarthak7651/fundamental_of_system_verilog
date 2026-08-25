module loop;
  
  int arr[10];
  int i=0;
 
  //for loop
  initial 
    begin
      $display ("\n for loop representation");
      for (i=0;i<10;i++)
        begin
          arr[i]=i;
        end
      $display ("value of arr is : %0p",arr);
    end


  //foreach loop
  
  initial 
    begin
      $display ("\n foreach loop representation");
      foreach (arr[j])
        begin
          arr[j]=j;
          $display ("value of arr is : %0d",arr[j]);
        end
    end
 
  //repeat loop
  initial 
    begin
      $display ("\n repeat loop representation");
      repeat (10)
        begin
          arr[i]=i;
          i++;//forrfully increment
        end
      $display ("value of arr is : %0p",arr);
    end
    
endmodule
  
