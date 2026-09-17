# SystemVerilog: Constructor, `this` and `super.new()` — Interview-Oriented Notes

## 1. What is a constructor in SystemVerilog?

A constructor is a special function named `new()` that is used to initialize a class object.

Example:

```systemverilog
class first;
  int data;

  function new(input int data);
    this.data = data;
  endfunction
endclass
```

When we create an object:

```systemverilog
first f;
f = new(67);
```

the constructor is called automatically and `data` gets initialized to `67`.

---

## 2. What is `this` in SystemVerilog?

`this` refers to the **current object**.

In:

```systemverilog
this.data = data;
```

there are two `data`s:

* `this.data` → class/instance variable
* `data` → constructor argument

Therefore:

```systemverilog
this.data = data;
```

means:

> Assign the constructor argument `data` to the `data` variable of the current object.

### Interview Answer

**Q: What is the purpose of `this`?**

**Answer:**
`this` is a handle that refers to the current class object. It is commonly used to distinguish class properties from local variables or function arguments having the same name.

---

# 3. What is `super`?

`super` is used to access members of the **parent/base class** from the child/derived class.

One important use is:

```systemverilog
super.new();
```

which calls the parent class constructor.

---

# 4. Why do we use `super.new()`?

Consider:

```systemverilog
class first;
  int data;

  function new(input int data);
    this.data = data;
  endfunction
endclass

class second extends first;
  int temp;

  function new(int data, int temp);
    super.new(data);
    this.temp = temp;
  endfunction
endclass
```

The `second` class inherits `data` from `first`.

The child constructor receives:

```text
data = 67
temp = 45
```

When we write:

```systemverilog
super.new(data);
```

the parent constructor is called:

```text
second.new(67,45)
       |
       ↓
super.new(67)
       |
       ↓
first.new(67)
```

The parent constructor then executes:

```systemverilog
this.data = data;
```

so:

```text
data = 67
```

After returning to the child constructor:

```systemverilog
this.temp = temp;
```

sets:

```text
temp = 45
```

Therefore the final object contains:

```text
second object
│
├── data = 67
└── temp = 45
```

---

# 5. What happens when we execute `s = new(67,45)`?

Given:

```systemverilog
second s;

initial begin
  s = new(67,45);
end
```

the following sequence occurs:

```text
s = new(67,45)
      ↓
second.new(67,45)
      ↓
super.new(67)
      ↓
first.new(67)
      ↓
this.data = 67
      ↓
return to second.new()
      ↓
this.temp = 45
```

Final values:

```text
s.data = 67
s.temp = 45
```

Output:

```text
value of data:67 and temp:45
```

---

# 6. Complete Code

```systemverilog
class first; // parent class
  int data;

  function new(input int data);
    this.data = data;
  endfunction
endclass


class second extends first; // child class
  int temp;

  function new(int data, int temp);
    super.new(data);
    this.temp = temp;
  endfunction
endclass


module tb;
  second s;

  initial begin
    s = new(67,45);

    $display("value of data:%0d and temp:%0d",
             s.data, s.temp);
  end
endmodule
```

Output:

```text
value of data:67 and temp:45
```

---

# 7. Important Interview Questions

### Q1. What is `new()`?

`new()` is the constructor of a SystemVerilog class. It is used to create and initialize a class object.

---

### Q2. What is `this`?

`this` refers to the current object.

Example:

```systemverilog
this.data = data;
```

It distinguishes the class member `data` from the constructor argument `data`.

---

### Q3. What is `super`?

`super` is used to access the parent-class members from the child class.

---

### Q4. What does `super.new(data)` do?

It calls the constructor of the parent class and passes `data` to it.

```systemverilog
super.new(data);
```

is equivalent to saying:

> Call the parent class constructor with this value of `data`.

---

### Q5. Is `super.new()` mandatory?

Not always.

If the parent class has a default constructor, SystemVerilog can automatically call the parent constructor when the child constructor executes.

However, if you need to pass arguments to a parameterized parent constructor, you explicitly call:

```systemverilog
super.new(arguments);
```

For example:

```systemverilog
super.new(data);
```

---

### Q6. What is the difference between `this.new()` and `super.new()`?

**`this`** refers to the current class/object, while **`super`** refers to the parent class.

```text
this
 ↓
current class/object

super
 ↓
parent class
```

Therefore:

```systemverilog
this.temp = temp;
```

operates on the current object.

```systemverilog
super.new(data);
```

calls the parent constructor.

---

### Q7. Can the child class access `data`?

Yes.

Because:

```systemverilog
class second extends first;
```

`second` inherits the members of `first`.

Therefore:

```systemverilog
s.data
```

is valid.

---

# 8. One-Line Interview Summary

Remember these four points:

```text
new()       → Constructor used to initialize an object
this        → Refers to the current object
super       → Refers to the parent class
super.new() → Calls the parent-class constructor
```

### Best interview answer

> In SystemVerilog, when a derived class has its own constructor, `super.new()` is used to initialize the inherited part of the object by calling the base-class constructor. `this` refers to the current object and is commonly used to distinguish class members from constructor arguments with the same name.
