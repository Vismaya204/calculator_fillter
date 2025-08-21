import 'package:flutter/material.dart';

class Calcutepage extends StatefulWidget {
  const Calcutepage({super.key});

  @override
  State<Calcutepage> createState() => _CalcutepageState();
}

class _CalcutepageState extends State<Calcutepage> {
  String input = "";
  String output = "0";

  void buttonpressed(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        output = "0";
      } else if (value == "del") {
        input = input.isNotEmpty ? input.substring(0, input.length - 1) : "";
      } else if (value == "=") {
        try {
          output = calculation(input);
        } catch (e) {
          output = "Error";
        }
      } else {
        input += value;
      }
    });
  }

  String calculation(String operator) {
    try {
      double result = 0.0;
      if (operator.contains("+")) {
        var parts = operator.split("+");
        result = double.parse(parts[0]) + double.parse(parts[1]);
      } else if (operator.contains("-")) {
        var parts = operator.split("-");
        result = double.parse(parts[0]) - double.parse(parts[1]);
      } else if (operator.contains("*")) {
        var parts = operator.split("*");
        result = double.parse(parts[0]) * double.parse(parts[1]);
      } else if (operator.contains("÷")) {
        var parts = operator.split("÷");
        result = double.parse(parts[0]) / double.parse(parts[1]);
      }
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  Widget buildbutton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          buttonpressed(text);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(24),
          backgroundColor: text == "=" ? Colors.black : Colors.white,
          foregroundColor: text == "=" ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: TextStyle(color: Colors.grey, fontSize: 25),
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildbutton("C"),
                  buildbutton("%"),
                  buildbutton("del"),
                  buildbutton("÷"),
                ],
              ),
              Row(
                children: [
                  buildbutton("7"),
                  buildbutton("8"),
                  buildbutton("9"),
                  buildbutton("x"),
                ],
              ),
              Row(
                children: [
                  buildbutton("4"),
                  buildbutton("5"),
                  buildbutton("6"),
                  buildbutton("-"),
                ],
              ),
              Row(
                children: [
                  buildbutton("1"),
                  buildbutton("2"),
                  buildbutton("3"),
                  buildbutton("+"),
                ],
              ),
              Row(
                children: [
                  buildbutton("00"),
                  buildbutton("0"),
                  buildbutton("."),
                  buildbutton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
