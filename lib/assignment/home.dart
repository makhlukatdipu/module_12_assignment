

import 'package:flutter/material.dart';
import 'package:module_12_assignment/assignment/widget/buttondesign.dart';

class home extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;
  const home({super.key, required this.isDarkMode, required this.toggleTheme});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String _output = '';
  String _input = '';
  String _operator = '';
  double number1 = 0;
  double number2 = 0;

  void buttonPress(String value) {
    print('Button press $value');

    setState(() {
      if (value == 'AC') {
        _output = '';
        _input = '';
        _operator = '';
        number1 = 0;
        number2 = 0;
        return;
      } else if (value == '<') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
        return;
      } else if (value == '%') {
        if (_input.isNotEmpty) {
          double num = double.parse(_input);
          _output = (num / 100).toString();
        } else if (_output.isNotEmpty) {
          double num = double.parse(_output);
          _output = (num / 100).toString();
        }
        return;
      } else if (value == '+/-') {
        if (_input.isNotEmpty) {
          if (_input.startsWith('-')) {
            _output = _input.substring(1);
          } else {
            _output = '-$_input';
          }
        } else if (_output.isNotEmpty && _operator.isNotEmpty) {
          if (_output.startsWith('-')) {
            _output = _output.substring(1);
          } else {
            _output = '-$_output';
          }
        }
        return;
      } else if (value == '=') {
        if (_operator.isNotEmpty && _input.isNotEmpty) {
          number2 = double.parse(_input);
          if (_operator == '+') {
            _output = (number1 + number2).toString();
          } else if (_operator == '-') {
            _output = (number1 - number2).toString();
          } else if (_operator == '*') {
            _output = (number1 * number2).toString();
          } else if (_operator == '÷') {
            _output = number2 != 0 ? (number1 / number2).toString() : 'Error';
          }

        }
      } else if (['+', '-', '*', '÷'].contains(value)) {
        if (value == '-' && _input.isEmpty) {
          _input = '-';
        } else if (_input.isNotEmpty) {
          number1 = double.parse(_output.isNotEmpty ? _output : _input);
          _operator = value;
          _input = '';
          _output = '';
        } else if (_output.isNotEmpty && _operator.isEmpty) {
          number1 = double.parse(_output);
          _operator = value;
          _input = '';
          _output = '';
        }
        return;
      }  else {
        if (_output.isNotEmpty && _operator.isEmpty && _input.isEmpty) {
          _output = '';
          _input = value;
        } else {
          _input += value;
        }
      }
    });
  }

  String _formatNumber(double num) {
    if (num % 1 == 0) {
      return num.toInt().toString();
    } else {
      return num.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDarkMode;
    final operatorButon = isDark ? Colors.orange[100] : Colors.orange;
    final textColor = isDark ? Colors.black : Colors.red[400];

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: isDark
                ? Icon(
                    Icons.wb_sunny,
                    color: isDark ? Colors.white : Colors.black,
                  )
                : Icon(
                    Icons.nightlight_round,
                    color: isDark ? Colors.white : Colors.black,
                  ),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 10),

                      //input value
                      Text(
                        '${number1 != 0 ? _formatNumber(number1) : ''} ${_operator} ${_input}',
                        style: TextStyle(
                          color: isDark ? Colors.grey : Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),

                      // calculation value
                      Text(
                        _output.isNotEmpty
                            ? (double.tryParse(_output) != null
                            ? _formatNumber(double.parse(_output))
                            : _output)
                            : '',
                        style: TextStyle(
                          color: isDark ? Colors.grey : Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),

              Row(
                children: [
                  buttondesign(
                    onclick: () => buttonPress('AC'),
                    text: 'AC',
                    color: isDark ? Colors.orange[100] : Colors.grey[300],
                    textStyle: TextStyle(
                      color: textColor,
                    ),
                  ),
                  buttondesign(onclick: () => buttonPress('%'), text: '%'),
                  buttondesign(onclick: () => buttonPress('+/-'), text: '+/-'),
                  buttondesign(
                    onclick: () => buttonPress('<'),
                    text: '⌫',
                    color: isDark ? Colors.orange[100] : Colors.grey[300],
                    textStyle: TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  buttondesign(onclick: () => buttonPress('7'), text: '7'),
                  buttondesign(onclick: () => buttonPress('8'), text: '8'),
                  buttondesign(onclick: () => buttonPress('9'), text: '9'),
                  buttondesign(
                    onclick: () => buttonPress('÷'),
                    text: '÷',
                    color: operatorButon,
                  ),
                ],
              ),
              Row(
                children: [
                  buttondesign(onclick: () => buttonPress('4'), text: '4'),
                  buttondesign(onclick: () => buttonPress('5'), text: '5'),
                  buttondesign(onclick: () => buttonPress('6'), text: '6'),
                  buttondesign(
                    onclick: () => buttonPress('*'),
                    text: '*',
                    color: operatorButon,
                  ),
                ],
              ),
              Row(
                children: [
                  buttondesign(onclick: () => buttonPress('1'), text: '1'),
                  buttondesign(onclick: () => buttonPress('2'), text: '2'),
                  buttondesign(onclick: () => buttonPress('3'), text: '3'),
                  buttondesign(
                    onclick: () => buttonPress('-'),
                    text: '-',
                    color: operatorButon,
                  ),
                ],
              ),
              Row(
                children: [
                  buttondesign(onclick: () => buttonPress('0'), text: '0'),
                  buttondesign(onclick: () => buttonPress('.'), text: '.'),
                  buttondesign(onclick: () => buttonPress('='), text: '='),
                  buttondesign(
                    onclick: () => buttonPress('+'),
                    text: '+',
                    color: operatorButon,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
