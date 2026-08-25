module dynamic_array;

  int arr[];
  int farr[];

  initial begin

    arr = new[5];

    for (int i = 0; i < 5; i++) begin
      arr[i] = 5*i;
    end

    $display("value of arr is : %0p", arr);

    // Delete array
    arr.delete();

    // Allocate again
    arr = new[5];

    for (int i = 0; i < 5; i++) begin
      arr[i] = 5*i;
    end

    // Resize while preserving old values
    arr = new[30](arr);

    $display("value of arr (resized while preserving old value) : %0p", arr);

    // Copy dynamic array
    farr = arr;

    $display("value of farr : %0p", farr);

  end

endmodule
