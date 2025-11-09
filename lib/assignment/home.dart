import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:module_12_assignment/assignment/widget/buttondesign.dart';

class home extends StatefulWidget {
  const home({super.key});

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

          _operator = _operator;
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
      } else if (value == '=') {
        _output = _output;
        if (value == '+/-') {
          if (_output.startsWith('-')) {
            _output = _output.substring(1);
          } else {
            _output = '-$_output';
          }
        }
        number1 = 0;
        _operator = '';
        number2 = 0;
      } else {
        if (_output.isNotEmpty && _operator.isEmpty && _input.isEmpty) {
          _output = '';
          _input = value;
        } else {
          _input += value;
        }
        //_output = _input;
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
    return Scaffold(
      backgroundColor: Colors.white50,
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
                      SizedBox(height:30),
                      //input value
                      Text(
                        '${number1 != 0 ? _formatNumber(number1) : ''} ${_operator} ${_input}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                
                      // calculation value
                      Text(
                        _output.isNotEmpty
                            ? _formatNumber(double.parse(_output))
                            : '',
                        style: TextStyle(
                          color: Colors.black,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttondesign(onclick: () => buttonPress('AC'), text: 'AC',color: Colors.white10,textStyle: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),),
                  buttondesign(onclick: () => buttonPress('%'), text: '%'),
                  buttondesign(onclick: () => buttonPress('+/-'), text: '+/-'),
                  buttondesign(
                    onclick: () => buttonPress('<'),
                    text: '<-',
                    color: Colors.red[500],
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
                    color: Colors.orange,
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
                    color: Colors.orange,
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
                    color: Colors.orange,
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
                    color: Colors.orange,
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
