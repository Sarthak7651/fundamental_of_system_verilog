/*
Pass by value passes a copy of the argument to the task/function, so modifications inside the task do not affect the original variable.
Pass by reference using ref gives the task direct access to the original variable, so modifications affect the original variable.
|                  | Pass by Value               | Pass by Reference             |
| ---------------- | --------------------------- | ----------------------------- |
| Memory           | 🟢 **Separate copy/memory** | 🔵 **Same original variable** |
| Keyword          | `input                      | `ref                          |
| Modify original? | ❌ No                      | ✅ Yes                         |

*/



module tb;

  // --------------------------------
  // Pass by value
  // --------------------------------
  task swap_value(input bit [1:0] a, b);
    bit [1:0] temp;

    temp = a;
    a = b;
    b = temp;

    $display("After Pass by value : a=%0d b=%0d", a, b);
  endtask


  // --------------------------------
  // Pass by reference
  // --------------------------------
  task automatic swap_ref(ref bit [1:0] a, b);
    bit [1:0] temp;

    temp = a;
    a = b;
    b = temp;

    $display("After Pass by ref   : a=%0d b=%0d", a, b);
  endtask


  // --------------------------------
  // Const reference
  // --------------------------------
  task automatic swap_const_ref(const ref bit [1:0] a,input bit [1:0] b);

    bit [1:0] temp;

    temp = a;
    // a = b;       // NOT allowed
    b = temp;       // allowed if u remove input bit "b" then it is also not allowed 

    $display("After Const ref : a=%0d b=%0d", a, b);
  endtask


  bit [1:0] a;
  bit [1:0] b;


  initial begin

    a = 1;
    b = 2;

    $display("Initial       : a=%0d b=%0d", a, b);

    swap_value(a, b);    

    swap_ref(a, b); 

    swap_const_ref(a, b);    

  end

endmodule
