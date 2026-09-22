/*
1.IMPLICATION OPERATOR : ->
2.EQUIVALENCE OPERATOR : <->
3.IF ELSE OPERATOR

1.IMPLICATION OPERATOR : (->) the implication operator creat a conditional relationship between constraints.it means "IF CONDITION A IS TRUE 
THEN CONDITION B MUST ALSO BE TRUE".
syntax:- 
rand bit read_en;
rand bit [3:0] length;
constraint c_rad_len {
  (read_en == 1) -> (length == 0);
}
logic_trap :- implication only force length == 0 when read_en == 1,if read_en == 0 , length can be any value (including 0).*/

//example for implication operator
class generator;
randc bit[3:0]a;
rand bit ce;
rand bit rst;

constraint control_rst {
rst dist { 0:=80 , 1:=20 };
}

constraint control_ce {
(rst == 0) -> (ce == 1); // but if rst==1 then "ce" can be any value
}

endclass

module tb;
generator g;
initial begin
g=new();
for(int i=0;i<10;i=i+1) begin
assert (g.randomize()) else $display ("randomization failed");
$display ("value of rst :%0b and ce:%0b",g.rst,g.ce);
end
end
endmodule

/*
2.EQUIVALENCE OPERATOR : (<->) establishes a logical,bidirectional relationship between two expression.
"EXPRESSION A AND EXPRESSION B MUST EITHER BOTH BE TRUE OR BOTH BE FALSE"

is_write -> (byte_enable == 4'b1111);
if is_write == 1 : byte_enable must be 4'b1111.
if is_write == 0 : byte_enable can be anything(including 4'b1111).


is_write <-> (byte_enable == 4'b1111);
if is_write == 1 : byte_enable must be 4'b1111.
if is_write == 0 : byte_enable can not be 4'b1111(must be something else).
<-> operator has very low precedence is sv.if you mix it with arithmatic or logical operator without parantheses the simulator might parse
the constraint in a way you did not intend.

BAD : constraint c_bad { status == 2 <-> ready == 1;}
GOOD : constraint c_good { (status == 2) <-> (ready == 1):}
*/
//EQUIVALENCE OPERATOR
class generator;
randc bit[3:0]a;
rand bit wr;//write to mem
rand bit oe;//output enable

constraint wr_c {
wr dist { 1:=50 , 0:=50};
}

constraint oe_c {
oe dist { 1:=50 , 0:=50 };
}

constraint wr_oe_c {
(wr == 1) <-> (oe == 0); }//vice versa also true
endclass

module tb;
generator g;
initial begin
g=new();
for(int i=0;i<10;i=i+1) begin
assert (g.randomize()) else $display ("randomization failed");
$display ("value of wr:%0b and oe:%0b",g.wr,g.oe);
end
end
endmodule

//IF ELSE CONSTRAINT
class generator;
rand bit[3:0]raddr,waddr;
rand bit wr;//write to mem
rand bit oe;//output enable

constraint wr_c {
wr dist { 1:=50 , 0:=50};
}

constraint oe_c {
oe dist { 1:=50 , 0:=50 };
}

constraint wr_oe_c {
(wr == 1) <-> (oe == 0); }//vice versa also true

constraint write_read {
if(wr==1)
{ waddr inside {[11:15]};raddr == 0; }
else 
{ waddr == 0; raddr inside {[11:15]}; }
}

endclass

module tb;
generator g;
initial begin
g=new();
for(int i=0;i<10;i=i+1) begin
assert (g.randomize()) else $display ("randomization failed");
$display ("value of wr:%0b | oe:%0b | raddr:%0d | waddr:%0d ",g.wr,g.oe,g.raddr,g.waddr);
end
end
endmodule

//CONSTRAINT ON AND OFF
class generator;
rand bit[3:0]raddr,waddr;
rand bit wr;//write to mem
rand bit oe;//output enable

constraint wr_c {
wr dist { 1:=50 , 0:=50};
}

constraint oe_c {
oe dist { 1:=50 , 0:=50 };
}

constraint wr_oe_c {
(wr == 1) <-> (oe == 0); }//vice versa also true

endclass

module tb;
generator g;
initial begin
g=new();
g.wr_oe_c.constraint_mode(1); //1-constraint is on,0-constraint is off
$display("constraint status oe_c:%0d",g.wr_oe_c.constraint_mode());
for(int i=0;i<20;i=i+1) begin
assert (g.randomize()) else $display ("randomization failed");
$display ("value of wr:%0b | oe:%0b ",g.wr,g.oe);
end
end
endmodule
