module tb;
//int data1;//generated data
bit [7:0]data1;
//int data2;//rcvd data
bit [7:0]data2;
event done;//this used to tell another process that my work is finished
event data_ready;
int i=0;

//generator
initial begin
for (i=0;i<10;i=i+1)
begin
//data1=$urandom();
data1 = $urandom_range(100,1);
-> data_ready;
$display("data sent : %0d",data1);
#10;
//#5;
end
-> done;
end

//driver
initial begin
forever begin
//#5;
#10;
//@(data_ready);
data2 = data1;
$display ("data rcvd : %0d",data2);
end
end

initial begin
wait (done.triggered);
$finish;
end
endmodule
