`timescale 1ns/1ps;
module tb;
  byte varl =-126;
  initial begin
    #10;
    $display ("value of var : %0d",varl);
  end
endmodule

module timescale;
  time fix_time=0;//store fixed point time value
  realtime real_time=0;//store floating point time value
  
  initial begin
    #12;
    fix_time = $time();
    $display ("current simulation time : %0t ps",fix_time);
    
    #12.23;
    real_time = $realtime();
    $display ("current simulation time : %0f ps",real_time);
  end
endmodule
