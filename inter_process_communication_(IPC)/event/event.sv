/*@(event)
    ↓
Waits for the event to be triggered.
Can miss the event if the trigger happened before the process starts waiting.

wait(event.triggered)
    ↓
Checks the event's triggered state.
Useful when you want to avoid missing an event due to scheduling within the same time step.

@(event):-waits for the next occurrence of the event, so it can miss an event that has already occurred.
wait(event.triggered):-checks the event's triggered status for the current simulation time slot and helps avoid this type of race condition.*/
module tb;

    event a;

    initial begin
        #10;
        -> a;
    end

    initial begin
        @(a);//Wait until event "a" occurs.
        $display("received event using @ at %0t", $time);

        wait(a.triggered);//Wait until the triggered property of event a becomes true.
        $display("received event using wait at %0t", $time);
    end

endmodule


//another example to see diffference between "@" and "wait"
/*@(event)= "Wait for the next event"
wait(event.triggered)= "Wait until the event is triggered in this time slot"*/
module tb;

    event a1,a2;

    initial begin
        -> a1;
        -> a2;
    end

    initial begin
        wait (a1.triggered);
        //@(a1);
        $display ("event a1 triggred");
        wait (a2.triggered);
        //@(a2);
        $display ("event a2 triggred");
    end

endmodule
