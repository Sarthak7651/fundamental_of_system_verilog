class generator;
int data=12;
mailbox mbx;


function new (mailbox mbx);
this.mbx=mbx;
endfunction


task run();
mbx.put(data);
$display("[GEN]:data send from gen :%0d",data);
endtask
endclass

class driver;
mailbox mbx;
int data;


function new (mailbox mbx);
this.mbx=mbx;
endfunction


task run();
//mbx.get(data);
mbx.peek(data);
$display("[DVR]:data rcvd :%0d",data);
endtask
endclass

module tb;
generator gen;
driver drv;
mailbox mbx;

initial begin
/*
gen=new();
drv=new();
mbx=new();
*/

mbx=new();
gen=new(mbx);
drv=new(mbx);


gen.mbx=mbx;
//drv.mbx=mbx;
gen.run();
drv.run();
end
endmodule
