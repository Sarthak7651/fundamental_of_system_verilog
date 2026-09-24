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
endinterface
/*
A virtual interface is a handle to anactual SystemVerilog interface that allows class-based components such as drivers and monitors 
to access and drive DUT signals.
A class cannot directly access module signals.So we use a virtual interface as a bridge.*/
//driver
class driver;
virtual add_if aif;
task run();
forever begin
@(posedge aif.clk);
//input will apply to edge of clk
aif.a<=2;
aif.b<=3;
$display("[DRV] : interface trigger");
end
endtask
endclass

module tb;
add_if aif();
driver drv;//instance of driver
add dut (.a(aif.a),.b(aif.b),.clk(aif.clk),.sum(aif.sum));

initial begin
$monitor ("time=%0.3f | clk=%0b | a=%4d | b=%4d | sum=%5d",$realtime,aif.clk,aif.a,aif.b,aif.sum);
aif.clk <= 0;
end

always #10 aif.clk <= ~aif.clk;

initial begin
drv=new();
drv.aif = aif;
drv.run();//main task in driver
end

initial begin
$dumpfile("interface2.vcd");
$dumpvars;
#100;
$finish;
end
endmodule
