in sv an interface is a powerfull construct that  encapsulate the communication between modules.insted of bundle-declaring dozens
of wire and ports across multiple modules,an interface allow you to group these into a single,clean package.

Encapsulation :- Group related signals (APB.AXI,SPI bus signals) together.
Maintainability :- if you need to add a signal to a bus,you only change it inside the interface,not in every module port list.
Reusability :- the same interface can be used for design modules testbench,verification,components and monitors.
Modports :- Allow you to define different signals direction for different modules using the same bus.
