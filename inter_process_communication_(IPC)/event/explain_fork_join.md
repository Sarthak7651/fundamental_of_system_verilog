# SystemVerilog Fork-Join

## What is `fork...join`?

In SystemVerilog, **`fork...join`** is used to execute multiple statements or processes **concurrently (in parallel)**.

### Simple Difference

* `begin...end` → statements execute **sequentially**
* `fork...join` → statements execute **concurrently**

---

## Basic Example

```systemverilog
module tb;

initial begin
    fork
        #10 $display("Process 1");
        #5  $display("Process 2");
        #15 $display("Process 3");
    join

    $display("All processes completed");
end

endmodule
```

### Output

```text
Process 2
Process 1
Process 3
All processes completed
```

The processes start concurrently, but they finish at different simulation times.

The parent process continues only after **all three processes have completed**.

---

# Types of Fork-Join

SystemVerilog provides **three types**:

1. `fork...join`
2. `fork...join_any`
3. `fork...join_none`

---

## 1. `fork...join`

The parent process waits until **all child processes finish**.

```systemverilog
initial begin

    fork
        #5  $display("Process 1");
        #10 $display("Process 2");
        #15 $display("Process 3");
    join

    $display("All processes completed");

end
```

### Execution

```text
Time 5  → Process 1
Time 10 → Process 2
Time 15 → Process 3
Time 15 → All processes completed
```

### Key Point

```text
join → Wait for ALL
```

---

# 2. `fork...join_any`

The parent process continues when **any one child process finishes**.

```systemverilog
initial begin

    fork
        #5  $display("Process 1");
        #10 $display("Process 2");
        #15 $display("Process 3");
    join_any

    $display("At least one process completed");

end
```

### Execution

```text
Time 5  → Process 1
Time 5  → At least one process completed
Time 10 → Process 2
Time 15 → Process 3
```

The important point is that **the remaining child processes continue running**.

### Key Point

```text
join_any → Wait for ANY ONE
```

---

# 3. `fork...join_none`

The parent process **does not wait** for the child processes.

```systemverilog
initial begin

    fork
        #5  $display("Process 1");
        #10 $display("Process 2");
        #15 $display("Process 3");
    join_none

    $display("Parent continues");

end
```

The parent immediately continues after starting the child processes.

### Concept

```text
Parent
   |
   +---- Process 1 --------> Time 5
   |
   +---- Process 2 --------------> Time 10
   |
   +---- Process 3 --------------------> Time 15
   |
   +---- Parent continues immediately
```

### Key Point

```text
join_none → Don't wait
```

---

# Comparison

| Type               | Parent waits for | Child processes              |
| ------------------ | ---------------- | ---------------------------- |
| `fork...join`      | All processes    | All continue                 |
| `fork...join_any`  | Any one process  | Remaining processes continue |
| `fork...join_none` | None             | All continue independently   |

---

# Simple Memory Trick

```text
fork...join
     ↓
    ALL
```

```text
fork...join_any
     ↓
    ANY
```

```text
fork...join_none
     ↓
    NONE
```

### Remember:

**JOIN → ALL**
**JOIN_ANY → ANY**
**JOIN_NONE → NONE**

---

# Why is Fork-Join Used?

`fork...join` is useful when multiple activities need to run **concurrently**.

For example, in a verification environment:

```text
                Testbench
                   |
        +----------+----------+
        |          |          |
     Driver     Monitor    Checker
        |          |          |
        +----------+----------+
             Concurrent
             execution
```

Multiple testbench components can perform their activities at the same time.

---

# Example: Generator and Driver

```systemverilog
module tb;

initial begin

    fork

        // Generator
        begin
            #5  $display("Generating data");
        end

        // Driver
        begin
            #10 $display("Driving data");
        end

        // Monitor
        begin
            #15 $display("Monitoring data");
        end

    join

    $display("All activities completed");

end

endmodule
```

Here, Generator, Driver, and Monitor execute concurrently.

---

# Interview Points

### Q1. What is `fork...join`?

**Answer:**

> `fork...join` is a SystemVerilog construct used to create and execute multiple processes concurrently.

### Q2. What are the types of fork-join?

**Answer:**

> There are three types: `fork...join`, `fork...join_any`, and `fork...join_none`.

### Q3. Difference between `join` and `join_any`?

> `join` waits for all child processes to complete, whereas `join_any` continues when any one child process completes.

### Q4. Difference between `join_any` and `join_none`?

> `join_any` waits for at least one child process to complete, whereas `join_none` does not wait for any child process.

---

# Quick Revision

```text
fork
   Process 1
   Process 2
   Process 3
join
```

➡️ Wait for **ALL**

```text
fork
   Process 1
   Process 2
   Process 3
join_any
```

➡️ Wait for **ANY ONE**

```text
fork
   Process 1
   Process 2
   Process 3
join_none
```

➡️ Wait for **NONE**

---

## Final Interview Statement

> **Fork-join is used in SystemVerilog to execute multiple processes concurrently. `join` waits for all processes, `join_any` waits for any one process, and `join_none` does not wait for the child processes.**
