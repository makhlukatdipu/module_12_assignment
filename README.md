# module_12_assignment

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



---Features---

Light / Dark Mode Toggle
Light and Dark mode use
controlled by  _isDarkMode variable
ThemeData dynamically change

Basic Arithmetic Operations: 
Addition (+), 
Subtraction (-), 
Multiplication (*), 
Division (÷)

Advanced Operations: 
Decimal point support, 
Positive/Negative toggle (+/-),
Percentage calculations (%),
All clear, 
Backspace

UI Design:
Dark Mode: Black background with orange operator buttons
Light Mode: White background with gray/white number buttons
Operator Buttons: Distinct orange color for easy identification
Text Colors: Adaptive text colors for optimal contrast
Wrong input: back button handle incorrect input

Calculation Logic
Input Handling:
Numbers are accumulated in _input string
Operators trigger storage of first number and operator
Equal sign performs the calculation

State Management:
_input: Current number being entered
_output: Result of calculation
_operator: Current active operator
number1, number2: Operands for calculations

--Working Flow--

Number button:
value  stored  _input variable.


Operator button:
first number is saved into number1
operator is stored in _operator
_input is cleared for  second number

for = button:
second value is saved in number2
based on operator get the output 
user can use result as a input with others additional operation with the output result

Error Handling:
use back button for incorrect input
Division by zero returns an “Error” message.
For invalid inputs app didn't crash





