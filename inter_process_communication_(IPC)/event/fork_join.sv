module tb;
int i=0;
bit [7:0] data1,data2;
event done;
event next;

task generator();
for (i=0;i<10;i=i+1) begin
data1 = $urandom();
$display("data sent : %0d",data1);
#10;
wait(next.triggered);
end
->done;
endtask

task receiver();
forever begin
#10;
data2=data1;
$display("data rcvd : %0d",data2);
-> next;
end
endtask

task wait_event();
wait(done.triggered);
$display("completed sending");
$finish;
endtask

initial begin
fork
generator();
receiver();
wait_event();
join
end
endmodule



//another example
module tb;
task first();
$display("task1 started at %0t",$time);
#20;
$display("task1 completed at %0t",$time);
endtask

task second();
$display("task2 started at %0t",$time);
#30;
$display("task2 completed at %0t",$time);
endtask

task third();
#10;
$display("reached next to join at %0t",$time);
endtask

initial begin
fork
first();
second();
join //join_any //join_none
third();
end
endmodule
