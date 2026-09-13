module tb;

  bit [3:0] a;
  bit [3:0] b;
  logic [4:0] y;
  bit clk = 0;

  // Clock generation
  always #5 clk = ~clk;


  // Task 1: Addition
  task add();
    y = a + b;
    $display("Time=%0t | a=%0d | b=%0d | y=%0d",$time, a, b, y);
  endtask


  // Task 2: Fixed stimulus
  task stim_a_b();

    a = 1;
    b = 3;
    add();

    #10;

    a = 5;
    b = 6;
    add();

    #10;

    a = 7;
    b = 8;
    add();

  endtask


  // Task 3: Random stimulus synchronized with clock
  task stim_clk();

    @(posedge clk);

    a = $random();
    b = $random();

    add();

  endtask


  // Main test
  initial begin

    // First use fixed stimulus
    stim_a_b();

    // Then use random stimulus
    for (int i = 0; i < 8; i = i + 1) begin
      stim_clk();
    end

    $finish;

  end

endmodule
