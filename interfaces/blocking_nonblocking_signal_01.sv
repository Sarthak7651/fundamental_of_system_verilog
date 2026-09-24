/*
-interface with all reg type,we are not allowed to connect variables in interface to the output port of dut.
-interface with all wire type,we are not allowed to apply stimulus using initial or always block.
*/

//design code
module add(
input [3:0] a,b,
input clk,
output reg [4:0] sum);
always @(posedge clk)
begin
sum <= a+b;
end
endmodule

//interface
interface add_if;
logic [3:0]a;
logic [3:0]b;
logic [4:0]sum;
logic clk;
endinterface

module tb;
add_if aif();
add dut (.a(aif.a),.b(aif.b),.clk(aif.clk),.sum(aif.sum));
 
initial begin
$monitor("value of clk:%0b , a:%0d , b:%0d and sum:%0d",aif.clk,aif.a,aif.b,aif.sum);
aif.clk=0;
end
always #10 aif.clk=~aif.clk;
initial begin
aif.a=1;
aif.b=5;
#22;
aif.a=3;
#20;
aif.a=5;
#8;
aif.a=4;
end
endmodule

//by using repeat block
module tb;
add_if aif();
add dut (.a(aif.a),.b(aif.b),.clk(aif.clk),.sum(aif.sum));
 
initial begin
$monitor("value of clk:%0b , a:%0d , b:%0d and sum:%0d",aif.clk,aif.a,aif.b,aif.sum);
aif.clk=0;
end
always #10 aif.clk=~aif.clk;
initial begin
//repeat (3) begin
aif.a=1;
aif.b=5;
//#22;
repeat (3) @(posedge aif.clk);
aif.a=3;
//#20;
repeat (3) @(posedge aif.clk);
aif.a=5;
//#8;
repeat (3) @(posedge aif.clk);
aif.a=4;
end
initial begin
$dumpfile ("interface.vcd");
$dumpvars;
#100;
$finish;
end
endmodule
