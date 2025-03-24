import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:simple_calculator/widgets/buttons.dart';

class Homepage extends HookWidget {
  Homepage({super.key});

  var userQuiestion = "";
  var userAnswer = "";

  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    ".",
    "0",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(userQuiestion),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(userAnswer),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  if (buttons[index] == "C") {
                    return MyButtons(
                      buttonText: buttons[index],
                      color: Colors.greenAccent,
                      textColor: Colors.black,
                    );
                  } else if (buttons[index] == "DEL") {
                    return MyButtons(
                      buttonText: buttons[index],
                      color: Colors.redAccent,
                      textColor: Colors.black,
                    );
                  } else {
                    return MyButtons(
                      buttonText: buttons[index],
                      color:
                          isOperator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.white,
                      textColor:
                          isOperator(buttons[index])
                              ? Colors.white
                              : Colors.black,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == "%" || x == "/" || x == "x" || x == "-" || x == "+" || x == "=") {
      return true;
    } else {
      return false;
    }
  }
}
