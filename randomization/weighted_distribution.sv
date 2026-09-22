/* two symbols
:= equal weight to all values inside Range,operator assign the specified weight to every individual value in the item or range
single value x dist {5:=10}; - value 5 get a weight 10
range value x dist {[1:3]:=10}; - value 1 get a weight of 10,value 2 get a weight of 10,value 3 get a weight of 10 : total weight=30

:/ Divide weight equally between values of a range,operator split the specified weight equally across all value in the range
single value : x dist {5:/10}; -value 5 get weight 10
range value : x dist {[1:3]:/12}; weight 12 divided bby 3 value and each value will get weight 4*/

/*
weight can be variable:- weight do not have to be hardcore number, they can be variable passed into the class allowing you to change your
testbench's distribution on the fly.

 x dist { 0 := read_weight , 1 := write_weight };

weight can not be negative :- weight must be non negative integers. a weight "0" means the values has 0% chance of being picked.

Conflict with other constraints:-
If another construint completely forbids a value (inside {[4:7]}:), but your "dist" comstraint give it a high weight, the umflicting value
get a weight of "0". SV constraint are "solve-before-distribute" Hard constraints always win over weight.

No randc allowed:You connot use dist constraints on rondc variables.cyclic variables Required uniform distribution across their cycle.
which fundamentally conflicts with weighted distribution.*/

class first;
rand bit wr;
rand bit rd;

constraint cntrl {
wr dist { 0 := 30 , 1 := 70};
rd dist { 0 :/30 , 1 :/ 70};
}

endclass

module tb;
first f;
initial begin
f=new();
for(int i=0;i<10;i=i+1) begin
f.randomize();
$display("value of wr:%0d an rd:%0d",f.wr,f.rd);
end
end
endmodule


//another example
class first;
rand bit wr;
rand bit rd;
rand bit [1:0] var1;
rand bit [1:0] var2;

constraint data {
var1 dist { 0 := 30 , [1:3] := 90};
var2 dist { 0 :/30 , [1:3] :/ 90};
}

constraint cntrl {
wr dist { 0 := 30 , 1 := 70};
rd dist { 0 :/30 , 1 :/ 70};
}
endclass

module tb;
first f;
initial begin
f=new();
for(int i =0;i<10;i=i+1) begin
f.randomize();
$display("value of var1(:=):%0d an var2(:/):%0d",f.var1,f.var2);
//$display("value of wr(:=):%0d an rd(:/):%0d",f.wr,f.rd);
end
end
endmodule
