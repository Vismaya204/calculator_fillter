import 'package:flutter/material.dart';

class IosCalculator extends StatefulWidget {
  const IosCalculator({super.key});

  @override
  State<IosCalculator> createState() => _IosCalculatorState();
}

class _IosCalculatorState extends State<IosCalculator> {
  String input = "";
  String output = "";
  void buttonpressed(String value) {
    setState(() {
      if (value == "AC") {
        input = "";
        output = "";
      } else if (value == "+/-") {
        output = "-" + input;
      } else if (value == "=") {
        try {
          output = calculate(input);
        } catch (e) {
          output = "Error";
        }
      } else {
        input += value;
      }
    });
  }

  String calculate(String operator) {
    try {
      double result = 0.0;
      if (operator.contains("+")) {
        var items = operator.split("+");
        result = double.parse(items[0]) + double.parse(items[1]);
      } else if (operator.contains("-")) {
        var items = operator.split("-");
        result = double.parse(items[0]) - double.parse(items[1]);
      } else if (operator.contains("x")) {
  var items = operator.split("x");
  result = double.parse(items[0]) * double.parse(items[1]);
}
 else if (operator.contains("÷")) {
        var items = operator.split("÷");
        result = double.parse(items[0]) / double.parse(items[1]);
      }
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  Widget buildbut(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          buttonpressed(text);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(80, 80),
          backgroundColor:
              text == "=" ||
                  text == "+" ||
                  text == "-" ||
                  text == "x" ||
                  text == "÷"
              ? Colors.deepOrange
              : text == "AC" || text == "%" || text == "+/-"
              ? const Color.fromARGB(255, 97, 97, 97)
              : const Color.fromARGB(255, 58, 49, 49),
          foregroundColor: Colors.white,
          shape: CircleBorder(),
        ),
        child: Text(text, style: TextStyle(fontSize: 30)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: TextStyle(fontSize: 27, color: Colors.grey),
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 8),
              Row(
                children: [
                  buildbut("AC"),
                  buildbut("+/-"),
                  buildbut("%"),
                  buildbut("÷"),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  buildbut("7"),
                  buildbut("8"),
                  buildbut("9"),
                  buildbut("x"),
                ],
              ),
              SizedBox(height: 8),
               Row(
                children: [
                  buildbut("4"),
                  buildbut("5"),
                  buildbut("6"),
                  buildbut("-"),
                ],
              ),    SizedBox(height: 8),
              Row(
                children: [
                  buildbut("1"),
                  buildbut("2"),
                  buildbut("3"),
                  buildbut("+"),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  buildbut("00"),
                  buildbut("0"),
                  buildbut("."),
                  buildbut("="),
                ],
              ),
              SizedBox(height: 45),
            ],
          ),
        ],
      ),
    );
  }
}
