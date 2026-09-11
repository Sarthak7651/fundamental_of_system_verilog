module tb;
  function bit[3:0] add (input bit [3:0] a,b);
    return a+b;
  endfunction
  bit[3:0] res;
  initial 
    begin
      res = add(4'b0100,4'b0010);
      $display ( "value of addition : %b",res);
    end
endmodule
  
