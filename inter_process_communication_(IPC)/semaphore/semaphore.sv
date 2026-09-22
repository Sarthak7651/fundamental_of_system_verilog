class first;
rand int data;
constraint data_c {data<10;data>0;}
endclass

class second;
rand int data;
constraint data_c { data>10;data<20;}
endclass

class main;
//A semaphore is used to control access to a shared resource.
semaphore sem;//"sem" is semaphore name user define
first f;
second s;
int data;
int i=0;

task send_first();
sem.get();//"Give me one semaphore key."
for(i=0;i<10;i=i+1)
begin
f.randomize();
data=f.data;
$display("first access semaphore and data sent : %0d",f.data);
#10;
end
sem.put(1);//This returns one key to the semaphore
$display("semphore uncopied");
endtask

task send_second();
sem.get();
for(int i=0; i<10; i++)
begin
assert(s.randomize());
$display("SECOND : semaphore acquired, data = %0d",s.data);
#10;
end
sem.put(1);
$display("SECOND : semaphore released");
endtask

task run();
sem=new(1);//constructor for semaphore
f=new();
s=new();
fork
send_first();
send_second();
join
endtask
endclass

module tb;
main m;
initial begin
m=new();
m.run();
end
initial begin
#250;
$finish();
end
endmodule
