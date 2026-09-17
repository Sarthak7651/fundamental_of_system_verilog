/*Extern:- i will write function here but i will write its actul code somewhere else.*/

class generator;
randc bit [3:0]a,b;
bit [3:0]y;

  //define its implementation outside class
extern constraint data;
extern function void display();
endclass

constraint generator :: data {
a inside {[0:15]};
b inside {[3:5]}; }

function void generator :: display();
$display ("value of a:%0d and b:%0d",a,b);
endfunction

module tb;
generator g;
int i=0;
int status=0;
initial begin
g=new();
for(i=0;i<16;i=i+1) begin
assert (g.randomize()) else $display("Randommize Failed");
g.display();
#10;
end
end
endmodule
