import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {

  String display = '0';

  double num1 = 0;
  double num2 = 0;
  String operator = '';

  void buttonPressed(String value) {
    setState(() {

      if (value == 'C') {
        display = '0';
        num1 = 0;
        num2 = 0;
        operator = '';
      } else if (value == '+' || value == '-' || value == '*' || value == '/') {
        num1 = double.parse(display);
        operator = value;
        display = '0';
      } else if (value == '=') {
        num2 = double.parse(display);
        if (operator == '+') {
          display = (num1 + num2).toString();
        } else if (operator == '-') {
          display = (num1 - num2).toString();
        } else if (operator == '*') {
          display = (num1 * num2).toString();
        } else if (operator == '/') {
          display = (num1 / num2).toString();
        }
        operator = '';
      } else {
        if (display == '0') {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }


  Widget buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(text),
        child: Text(text, style: TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Simples'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(
                display,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            children: [
              buildButton('C'),
              buildButton('0'),
              buildButton('='),
              buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }
}