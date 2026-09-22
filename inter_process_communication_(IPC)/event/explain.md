# SystemVerilog Events — `@` vs `wait(event.triggered)`

In SystemVerilog, an **event** is used for synchronization between different processes. An event can be declared using the `event` keyword and triggered using the `->` operator.

For example:

```systemverilog
event a1;
```

Here, `a1` is an event. When we write:

```systemverilog
-> a1;
```

the event `a1` is triggered.

## Using `@(event)`

```systemverilog
@(a1);
```

means **wait for the next trigger of event `a1`**.

For example, if one process is already waiting using `@(a1)` and another process executes:

```systemverilog
-> a1;
```

the waiting process detects the event and continues execution.

However, if `a1` is triggered before the process starts waiting with `@(a1)`, the process can miss that event and continue waiting for the next trigger.

A simple way to remember this is:

> `@(event)` means "wait for the next time the event occurs."

## Using `wait(event.triggered)`

```systemverilog
wait(a1.triggered);
```

checks whether event `a1` has been triggered in the current simulation time slot.

Unlike `@(a1)`, the `triggered` property remains true during the current simulation time slot. Therefore, it can help prevent race conditions where an event is triggered before another process starts checking it.

A simple way to remember this is:

> `wait(event.triggered)` means "wait until the event has been triggered in this time slot."

## Example

Consider:

```systemverilog
module tb;

    event a1;

    initial begin
        -> a1;
    end

    initial begin
        @(a1);
        $display("Event a1 received");
    end

endmodule
```

Here, `a1` may be triggered before the second process reaches `@(a1)`. In that case, the second process can miss the event and wait indefinitely for another trigger.

Using:

```systemverilog
wait(a1.triggered);
```

can avoid this type of same-time-slot race condition.

## Easy Difference

| `@(event)`                                         | `wait(event.triggered)`                                     |
| -------------------------------------------------- | ----------------------------------------------------------- |
| Waits for the next event trigger                   | Waits/checks for the event's trigger status                 |
| Can miss an event triggered before the wait starts | Can recognize a trigger in the current simulation time slot |
| Useful for normal event synchronization            | Useful when avoiding same-time-slot race conditions         |

### Interview Point

The easiest way to remember the difference is:

**`@(event)` → "Wait for the next bell."**

**`wait(event.triggered)` → "Check whether the bell has rung in this time slot."**
