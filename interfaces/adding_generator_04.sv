//design code
module add(
input [3:0] a,b,
output reg [4:0] sum,
input clk);
always @(posedge clk)
begin
sum <= a+b;
end
endmodule

class transaction;
randc bit [3:0] a;
randc bit [3:0] b;
bit [4:0] sum;

function void display();
$display ("a:%0d | b:%0d ",a,b);
endfunction

function transaction copy();
copy=new();
copy.a=this.a;
copy.b=this.b;
endfunction

endclass

class generator;
transaction trans;
mailbox #(transaction) mbx;
int i=0;

function new (mailbox #(transaction) mbx);
this.mbx=mbx;
trans=new();
endfunction

task run(); 
for (int i=0 ; i<20; i=i+1) begin
assert (trans.randomize()) else $display("randomization failed");
$display("[GEN] : data sent to driver");
trans.display();
mbx.put(trans.copy);
end
endtask
endclass

module tb;
generator gen;
mailbox #(transaction) mbx;
initial begin
mbx=new();
gen=new(mbx);
gen.run();
end
endmodule 
