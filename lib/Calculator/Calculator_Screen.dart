import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';
  String result = "0";
  String operation = '';
  double num1 = 0;
  double num2 = 0;

  calculations(String btntxt) {
    setState(() {
      if (btntxt == "AC") {
        input = "";
        result = "0";
        operation = "";
        num1 = 0;
        num2 = 0;
      } else if (btntxt == "+" ||
          btntxt == "-" ||
          btntxt == "x" ||
          btntxt == "/" ||
          btntxt == "%") {
        if (input.isNotEmpty || result != "0") {
          num1 = double.tryParse(input) ?? num1;
          operation = btntxt;
          input = "";
        }
      } else if (btntxt == "=") {
        if (input.isNotEmpty && operation.isNotEmpty) {
          num2 = double.tryParse(input) ?? 0;
          switch (operation) {
            case "+":
              num1 += num2;
              result = num1.toStringAsFixed(0);
              break;
            case "-":
              num1 -= num2;
              result = num1.toStringAsFixed(0);
              break;
            case "x":
              num1 *= num2;
              result = num1.toStringAsFixed(0);
              break;
            case "/":
              if (num2 != 0) {
                num1 = num1 / num2;
                result = num1.toStringAsFixed(1);
              } else {
                result = "Error"; // Show error if division by zero
              }
              break;
            case "%":
              num1 %= num2;
              result = num1.toStringAsFixed(2);
              break;
          }
          input = "";
          operation = "";
        }
      } else {
        input += btntxt;
        result = input;
      }
    });
  }

  calculatorbutton(String btntext, Color btnclr, Color btntextclr,
      {double width = 80, shape = BoxShape.circle}) {
    return InkWell(
      onTap: () => calculations(btntext),
      child: Container(
        height: 80,
        width: width,
        decoration: BoxDecoration(
          shape: shape,
          color: btnclr,
        ),
        child: Center(
          child: Text(
            btntext,
            style: TextStyle(color: btntextclr, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  result,
                  style: const TextStyle(fontSize: 60, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                calculatorbutton("AC", Colors.grey, Colors.black),
                calculatorbutton("+/-", Colors.grey, Colors.black),
                calculatorbutton("%", Colors.grey, Colors.black),
                calculatorbutton("/", Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                calculatorbutton("7", Colors.grey.shade900, Colors.white),
                calculatorbutton("8", Colors.grey.shade900, Colors.white),
                calculatorbutton("9", Colors.grey.shade900, Colors.white),
                calculatorbutton("x", Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                calculatorbutton("4", Colors.grey.shade900, Colors.white),
                calculatorbutton("5", Colors.grey.shade900, Colors.white),
                calculatorbutton("6", Colors.grey.shade900, Colors.white),
                calculatorbutton("-", Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                calculatorbutton("1", Colors.grey.shade900, Colors.white),
                calculatorbutton("2", Colors.grey.shade900, Colors.white),
                calculatorbutton("3", Colors.grey.shade900, Colors.white),
                calculatorbutton("+", Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                calculatorbutton("0", Colors.grey.shade900, Colors.white,
                    width: 160, shape: BoxShape.rectangle),
                calculatorbutton(".", Colors.grey.shade900, Colors.white),
                calculatorbutton("=", Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
