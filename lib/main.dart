import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      home: CalcBody(),
    ),
  );
}

class CalcBody extends StatefulWidget {
  const CalcBody({Key? key}) : super(key: key);

  @override
  _CalcBodyState createState() => _CalcBodyState();
}

class _CalcBodyState extends State<CalcBody> {
  String result = "0";
  String _result = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  onButtonPressed(String buttonText) {
    if (buttonText == "AC") {
      _result = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "DEL") {
      _result = _result.substring(0, _result.length - 1);
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/" ||
        buttonText == "%") {
      num1 = double.parse(_result);
      operand = buttonText;
      _result = "0";
    } else if (buttonText == ".") {
      if (_result.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        _result += buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(_result);
      if (operand == "+") {
        _result = (num1 + num2).toString();
      }
      if (operand == "-") {
        _result = (num1 - num2).toString();
      }
      if (operand == "x") {
        _result = (num1 * num2).toString();
      }
      if (operand == "/") {
        _result = (num1 / num2).toString();
      }
      if (operand == "%") {
        _result = (num1 * num2 * 0.01).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _result += buttonText;
    }
    print(_result);
    setState(() {
      result = double.parse(_result).toStringAsFixed(2);
    });
  }

  Widget createButton(String buttonText, Color buttonColor) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          onButtonPressed(buttonText);
        });
      },
      child: Text(
        "$buttonText",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        padding: EdgeInsets.all(10.0),
        minimumSize: Size(0.0, 95.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "The Calculator",
          style: TextStyle(fontSize: 24.0),
        ),
        backgroundColor: Color(0xff492F10),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(0.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "$result",
                      style: TextStyle(
                        fontSize: 80.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Table(
                children: [
                  TableRow(
                    children: [
                      createButton("AC", Color(0xffFF4848)),
                      createButton("DEL", Color(0xff9DDAC6)),
                      createButton("/", Color(0xff9DDAC6)),
                      createButton("%", Color(0xff9DDAC6)),
                    ],
                  ),
                  TableRow(
                    children: [
                      createButton("7", Color(0xff9DDAC6)),
                      createButton("8", Color(0xff9DDAC6)),
                      createButton("9", Color(0xff9DDAC6)),
                      createButton("+", Color(0xff9DDAC6)),
                    ],
                  ),
                  TableRow(
                    children: [
                      createButton("4", Color(0xff9DDAC6)),
                      createButton("5", Color(0xff9DDAC6)),
                      createButton("6", Color(0xff9DDAC6)),
                      createButton("-", Color(0xff9DDAC6)),
                    ],
                  ),
                  TableRow(
                    children: [
                      createButton("1", Color(0xff9DDAC6)),
                      createButton("2", Color(0xff9DDAC6)),
                      createButton("3", Color(0xff9DDAC6)),
                      createButton("x", Color(0xff9DDAC6)),
                    ],
                  ),
                  TableRow(
                    children: [
                      createButton(".", Color(0xff9DDAC6)),
                      createButton("0", Color(0xff9DDAC6)),
                      createButton("00", Color(0xff9DDAC6)),
                      createButton("=", Color(0xff9DDAC6)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
