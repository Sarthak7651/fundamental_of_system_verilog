/*
1.add constructor to transaction in the custom constructor of generator
class generator
transaction trans;
function new (mailbox #(transaction) mbx);
this.mbx = mbx;
trans = new();
endfunction
-->single space for variable --> correct randc behaviour.

2. send deep copy of transaction object insted of original transaction object.
 -independent object for rach iteration
 -object can be used without worring about path delay

3.send deep copy
 -error could be injected with methods/constraints.*/

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
$display ("a:%0d | b:%0d | sum:%0d",a,b,sum);
endfunction

virtual function transaction copy();
copy=new();
copy.a=this.a;
copy.b=this.b;
copy.sum=this.sum;
endfunction

endclass

class error extends transaction;
constraint data_c { a == 0 ; b == 0; }

function transaction copy();
copy = new();
copy.a = 12;
copy.b = 12;
copy.sum = this.sum;
endfunction

endclass

class generator;
transaction trans;
mailbox #(transaction) mbx;
event done;

function new (mailbox #(transaction) mbx);
this.mbx=mbx;

trans=new();

endfunction

task run();
//trans=new(); 
for (int i=0 ; i<10; i=i+1) begin
trans.randomize(); 
mbx.put (trans.copy);
$display("[GEN] : data sent to driver");
trans.display();
#20;
end
-> done;
endtask
endclass

interface add_if;
logic [3:0] a;
logic [3:0] b;
logic [4:0] sum;
logic clk;
//modport DRV (input a,b , input sum,clk);
endinterface

class driver;
virtual add_if aif;
mailbox #(transaction) mbx;
transaction data;
//event next;

function new (mailbox #(transaction) mbx);
this.mbx=mbx;
endfunction

task run();
forever begin;
mbx.get(data);
@(posedge aif.clk);
aif.a <= data.a;
aif.b <= data.b;

$display ("[DRV] : Interfcae Trigger");
data.display();
end
endtask
endclass

module tb;
add_if aif();
driver drv;
generator gen;

error err;
event done;

mailbox #(transaction) mbx;
add dut (.a(aif.a),.b(aif.b),.sum(aif.sum),.clk(aif.clk));
initial begin
aif.clk <= 0;
end

always #10 aif.clk <= ~aif.clk; 

initial begin
mbx = new();
err = new();
drv = new(mbx);
gen = new(mbx);

drv.aif = aif;
done = gen.done;
end

initial begin
fork 
gen.run();
drv.run();
join_none
wait(done.triggered);
$finish;
end

initial begin
$dumpfile("error_inject.vcd");
$dumpvars;
end
endmodule
