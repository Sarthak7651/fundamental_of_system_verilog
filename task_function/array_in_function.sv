module tb;

  bit [3:0] res[16];

  function automatic void init_arr(ref bit [3:0] a[16]);
    for (int i = 0; i < 16; i = i + 1) begin
      a[i] = i;
    end
  endfunction

  initial begin
    init_arr(res);

    for (int i = 0; i < 16; i = i + 1) begin
      $display("res[%0d]: %0d", i, res[i]);
    end
  end

endmodule
