/*
by default standard SV mailbox are typeless (generic)-they accept any data type.this can causes runtime error if you accendentally put
an integer into a mailbox meant for transaction class handles.
to prevent this always use parametrized mailbox to enforce type saftey at compile time.

//generic mailbox
mailbox mbx=new();

//parametrized mailbox
mailbox #(packet) pkt_mbx = new();
*/

class transaction;
bit[7:0] data;
endclass

class generator;
int data=12;

transaction t;
mailbox #(transaction) mbx;
logic [7:0] temp=3;

function new(mailbox #(transaction) mbx);
this.mbx=mbx;
endfunction

task run();
t=new();
t.data=45;
//mbx.put(temp);
mbx.put(t);
$display("[GEN] : DATA SEND FROM GEN : %0d",t.data);
endtask
endclass

class driver;
mailbox #(transaction) mbx;
transaction data;
function new (mailbox #(transaction) mbx);
this.mbx=mbx;
endfunction

task run();
mbx.get(data);
$display("[DRV] : DATA RCVD : %0d",data.data);
endtask
endclass

module tb;
generator gen;
driver drv;
mailbox #(transaction) mbx;
initial begin
mbx = new();
gen = new(mbx);
drv = new(mbx);

gen.run();
drv.run();
end
endmodule
