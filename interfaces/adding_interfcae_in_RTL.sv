//design  code
module and4 (
input [3:0]a,
input [3:0]b,
output [3:0]y);
assign y=a&b;
endmodule

//interface and TB
interface and_if;
logic [3:0] a;
logic [3:0] b;
logic [3:0] y;
endinterface

module tb;
and_if aif();
and4 dut (.a(aif.a),.b(aif.b),.y(aif.y));//maping by name
//and4 dut (aif.a,aif.b,aif.y); //positional mapping

initial begin
aif.a=4'b0100;
aif.b=4'b1100;
#10;
$display("a:%4b,b:%4b and y:%4b",aif.a,aif.b,aif.y);
end
endmodule
