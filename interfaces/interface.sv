
//====================================================
// Interface
//====================================================
interface handshake_if (input bit clk);

    logic       valid;
    logic       ready;
    logic [7:0] data;

endinterface


//====================================================
// Producer
//====================================================
module producer (handshake_if tx_if);

    always @(posedge tx_if.clk) begin

        if (tx_if.ready) begin
            tx_if.valid <= 1'b1;
            tx_if.data  <= $urandom_range(255, 0);
        end

    end

endmodule


//====================================================
// Consumer
//====================================================
module consumer (handshake_if rx_if);

    // Consumer is always ready
    assign rx_if.ready = 1'b1;

    always @(posedge rx_if.clk) begin

        if (rx_if.valid && rx_if.ready) begin
            $display("[%0t] Received data : %0d",$time, rx_if.data);
        end

    end

endmodule


//====================================================
// TOP TESTBENCH
//====================================================
module tb;

    // Clock
    bit clk;

    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Interface instance
    handshake_if h_if(clk);

    // DUT instances
    producer p1 (
        .tx_if(h_if)
    );

    consumer c1 (
        .rx_if(h_if)
    );

    // Simulation control
    initial begin

        // Initialize interface signals
        h_if.valid = 1'b0;
        h_if.data  = 8'b0;

        #100;

        $finish;

    end

endmodule

/*in the exampe above,all signal are accessible by both modules,which can lead to accidental driver conflict.to enforce directional rules
(who input and who output) we use modport (module port).*/

//interface modport
interface handshake_if (input bit clk);
  logic valid;
  logic ready;
  logic [7:0] data;
//modport for the transmissing module
  modport producer_mp (
    input clk,ready,
    output valid,data );
//modport for the receving module
  modport consumer_mp (
    input clk,valid,data,
    output ready );
endinterface

/*
interface :- the keyword used to define th ebundle of signal.
modport :- restrict signal direction inside the interface for specific modules.
clocking :- sync tb signal to a clock to avoid simulation race condition.
virtual interface :- a pointer to an interface used in oop-based verification (like uvm) to allow classes to talk to hardware wires.
*/
