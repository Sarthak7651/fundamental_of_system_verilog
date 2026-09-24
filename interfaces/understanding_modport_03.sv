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

//interface
interface add_if;
logic [3:0]a;
logic [3:0]b;
logic clk;
logic [4:0] sum;

modport DRV (
input a,b,clk,
output sum );

endinterface

//driver
class driver;
virtual add_if.DRV aif;
task run();
forever begin
@(posedge aif.clk);
aif.a<=2;
aif.b<=3;
$display("[DRV] : interface trigger");
end
endtask
endclass

module tb;
add_if aif();
driver drv;
add dut (.a(aif.a),.b(aif.b),.clk(aif.clk),.sum(aif.sum));

initial begin
$monitor ("time=%0.3f | clk=%0b | a=%4d | b=%4d | sum=%5d",$realtime,aif.clk,aif.a,aif.b,aif.sum);
aif.clk <= 0;
end

always #10 aif.clk <= ~aif.clk;

initial begin
drv=new();
drv.aif = aif;
drv.run();
end

initial begin
$dumpfile("interface2.vcd");
$dumpvars;
#100;
$finish;
end
endmodule
