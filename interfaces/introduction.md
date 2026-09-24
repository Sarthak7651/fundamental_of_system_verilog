# SystemVerilog Interface

In **SystemVerilog (SV)**, an **interface** is a powerful construct used to **encapsulate communication between modules**.

Instead of declaring dozens of wires and ports separately across multiple modules, an interface allows us to **group related signals into a single, clean, reusable package**.

For example, an interface can group all the signals of a bus such as **APB, AXI, or SPI**.

---

## Advantages of SystemVerilog Interfaces

### 1. Encapsulation

An interface groups all related signals together in one place.

For example, an SPI interface can contain:

```systemverilog
interface spi_if;

    logic clk;
    logic rst_n;
    logic mosi;
    logic miso;
    logic sclk;
    logic ss_n;

endinterface
```

Instead of passing each signal individually:

```systemverilog
module spi_master (
    input  logic clk,
    input  logic rst_n,
    output logic mosi,
    input  logic miso,
    output logic sclk,
    output logic ss_n
);
```

we can pass the interface:

```systemverilog
module spi_master (
    spi_if spi
);
```

This makes the connection much cleaner.

---

### 2. Maintainability

If a new signal needs to be added to the bus, it can be added directly inside the interface.

For example:

```systemverilog
interface spi_if;

    logic clk;
    logic rst_n;
    logic mosi;
    logic miso;
    logic sclk;
    logic ss_n;
    logic busy;       // New signal

endinterface
```

Instead of modifying multiple module port lists, the signal is managed within the interface.

This makes large designs easier to maintain.

---

### 3. Reusability

The same interface can be used by different components of the design and verification environment.

For e
