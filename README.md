# SystemVerilog Fundamentals

A hands-on collection of **SystemVerilog examples and concepts** focused on RTL design and functional verification fundamentals.

This repository documents my learning and practice of SystemVerilog through small, focused examples covering **data types, arrays, classes, object-oriented programming, randomization, interfaces, inter-process communication, tasks/functions, and verification-oriented concepts**.

---

## 📌 About This Repository

The goal of this repository is to build a strong foundation in **SystemVerilog programming and verification concepts** through practical code examples.

Instead of keeping the concepts purely theoretical, each topic is explored through simple SystemVerilog programs that demonstrate how the language features work in simulation.

### Topics Covered

* SystemVerilog Classes
* Constructors
* Object Copying
* Inheritance
* Polymorphism
* Arrays
* Randomization
* Interfaces
* Inter-Process Communication (IPC)
* Tasks and Functions
* Error Injection
* `timescale` Directive
* Basic Object-Oriented Programming concepts

---

## 📂 Repository Structure

```text
fundamental_of_system_verilog/
│
├── array/
│   └── Array examples
│
├── constructor/
│   └── Constructor examples
│
├── copying_objects/
│   └── Object copying examples
│
├── error_injection/
│   └── Error injection examples
│
├── fundamental_of_class/
│   └── SystemVerilog class fundamentals
│
├── inheritance/
│   └── Inheritance examples
│
├── inter_process_communication_(IPC)/
│   └── IPC concepts and examples
│
├── interfaces/
│   └── SystemVerilog interface examples
│
├── poly_morphism/
│   └── Polymorphism examples
│
├── randomization/
│   └── Randomization and constraint examples
│
├── task_function/
│   └── Tasks and functions
│
├── timescale_directive/
│   └── `timescale examples
│
└── README.md
```

---

## 🧠 Concepts in Detail

### 1. Arrays

Examples demonstrating SystemVerilog array concepts and syntax.

**Key concepts:**

* Array declaration
* Array manipulation
* Accessing array elements
* SystemVerilog array features

---

### 2. Classes

Introduction to SystemVerilog's Object-Oriented Programming capabilities.

**Key concepts:**

* Class declaration
* Properties
* Methods
* Objects
* Object creation

---

### 3. Constructors

Examples demonstrating how constructors are used to initialize SystemVerilog objects.

**Key concepts:**

* `new()`
* Constructor arguments
* Object initialization

---

### 4. Object Copying

Examples exploring how SystemVerilog objects can be copied and the difference between copying object handles and object contents.

**Key concepts:**

* Object handles
* Shallow copying
* Deep copying
* Object relationships

---

### 5. Inheritance

Examples demonstrating inheritance and reuse of class properties and methods.

**Key concepts:**

* Base class
* Derived class
* `extends`
* Method overriding
* Code reuse

---

### 6. Polymorphism

Examples demonstrating how a base-class handle can refer to derived-class objects.

**Key concepts:**

* Base-class handles
* Derived-class objects
* Virtual methods
* Method overriding
* Dynamic behavior

---

### 7. Randomization

SystemVerilog randomization examples used to generate stimulus for verification.

**Key concepts:**

* `rand`
* `randc`
* Constraints
* `randomize()`
* Constraint-based stimulus generation

Randomization is an important foundation for developing more advanced verification environments.

---

### 8. Interfaces

Examples demonstrating SystemVerilog interfaces for grouping related signals and simplifying communication between design and testbench components.

**Key concepts:**

* Interface declaration
* Signal grouping
* Modularity
* Design/Testbench connectivity

---

### 9. Inter-Process Communication (IPC)

Examples demonstrating communication and synchronization between concurrent SystemVerilog processes.

**Key concepts include:**

* Processes
* Synchronization
* Communication mechanisms
* Concurrent execution

These concepts are particularly relevant when moving toward advanced SystemVerilog verification and UVM.

---

### 10. Tasks and Functions

Examples demonstrating procedural abstraction in SystemVerilog.

**Key concepts:**

* Tasks
* Functions
* Arguments
* Pass-by-value
* Pass-by-reference
* `const ref`
* Returning values
* Reusable procedural code

---

### 11. Error Injection

Examples demonstrating the concept of intentionally introducing errors during simulation for verification purposes.

**Purpose:**

Error injection can be used to verify whether a design or verification environment correctly detects unexpected or faulty behavior.

---

### 12. `timescale` Directive

Examples demonstrating the use of the SystemVerilog/Verilog `timescale` directive.

**Key concepts:**

```systemverilog
`timescale 1ns/1ps
```

* Simulation time unit
* Simulation precision
* Delay interpretation

---

## 🛠️ Tools & Technologies

| Technology        | Purpose                               |
| ----------------- | ------------------------------------- |
| **SystemVerilog** | RTL design and verification           |
| **Verilog HDL**   | Hardware description fundamentals     |
| **Simulation**    | Functional verification and debugging |
| **Git**           | Version control                       |
| **GitHub**        | Source-code management and portfolio  |

---

## 🎯 Learning Objectives

This repository is intended to develop practical understanding of:

* SystemVerilog syntax and constructs
* Object-Oriented Programming in SystemVerilog
* Constrained randomization
* Testbench-oriented programming
* Concurrent processes
* Interfaces
* Tasks and functions
* Basic verification concepts
* Reusable verification code

---

## 🚀 Why SystemVerilog?

SystemVerilog extends Verilog with powerful features for both **RTL design and functional verification**.

The language provides features such as:

```text
Verilog
   │
   ├── RTL Design
   │
   └── Hardware Modeling
          │
          ▼
     SystemVerilog
          │
          ├── Object-Oriented Programming
          ├── Randomization
          ├── Assertions
          ├── Interfaces
          ├── Functional Coverage
          ├── Advanced Testbenches
          └── UVM
```

The concepts practiced in this repository form a foundation for progressing toward **advanced verification methodologies such as UVM**.

---

## 📈 Learning Path

A recommended progression through the concepts in this repository is:

```text
SystemVerilog Basics
        │
        ▼
Arrays
        │
        ▼
Tasks & Functions
        │
        ▼
Classes
        │
        ├── Constructors
        │
        ├── Object Copying
        │
        ├── Inheritance
        │
        └── Polymorphism
        │
        ▼
Randomization & Constraints
        │
        ▼
Interfaces
        │
        ▼
Inter-Process Communication
        │
        ▼
Verification Fundamentals
        │
        ▼
UVM
```

---

## 💡 Future Improvements

Planned areas for extending this repository include:

* SystemVerilog Assertions (SVA)
* Functional Coverage
* Advanced Constraint Randomization
* Mailbox
* Semaphore
* Events
* Clocking Blocks
* Virtual Interfaces
* Advanced Testbench Architecture
* UVM Fundamentals
* UVM Components and Phases
* TLM Communication

---

## 👨‍💻 Author

**Sarthak Pandey**

Aspiring **VLSI / RTL Design / Design Verification Engineer**

* GitHub: [Sarthak7651](https://github.com/Sarthak7651)
* LinkedIn: [Sarthak Pandey](https://www.linkedin.com/in/sarthak-pandey-47a349236/)

---

## ⭐ Repository

If you find this repository useful for learning SystemVerilog fundamentals, consider giving it a ⭐.

**Repository:**
https://github.com/Sarthak7651/fundamental_of_system_verilog
