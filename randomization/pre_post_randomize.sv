/*
pre_randomize:-is automatically called just before the solver attempt to generate random values.
uses:- 1.enable or disable constraints using constraint_mode()
       2.setup variable needed by constraints.
       3.allocate dynamic array or objects
       4.prepare the object for randomization

post_randomize:-is automatically called after a successfully randomize.
uses:- 1.compute derived fields
       2.perform checks or logging
       3.display the generated values
       4.update non-random variables based on randomize ones*/
class generator;
randc bit[3:0] a,b;
      bit[3:0] y;
      int min;
      int max;
function void set_range(input int min,input int max);
this.min=min;
this.max=max;
endfunction

constraint data{
a inside {[min:max]};
b inside {[min:max]};
}

function void post_randomize();
$display("value of a:%0d and b:%0d",a,b);
endfunction

endclass

module tb;
int i=0;
generator g;
initial begin
g=new();
for(i=0;i<16;i=i+1) begin
g.set_range(3,8);
g.randomize();
#10;
end
end
endmodule
