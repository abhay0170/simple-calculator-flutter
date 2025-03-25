import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:simple_calculator/widgets/buttons.dart';

class HomePage extends HookWidget {
  HomePage({super.key});

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
    final userQuestion = useState("");
    final userAnswer = useState("");

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: SizedBox()),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      userQuestion.value,
                      style: GoogleFonts.agdasima(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      userAnswer.value,
                      style: GoogleFonts.agdasima(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
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
                  // clear button
                  if (buttons[index] == "C") {
                    return MyButtons(
                      buttonTap: () {
                        userAnswer.value = "";
                        userQuestion.value = "";
                      },
                      buttonText: buttons[index],
                      color: Colors.greenAccent.shade200,
                      textColor: Colors.black,
                    );
                  }
                  // delete button
                  else if (buttons[index] == "DEL") {
                    return MyButtons(
                      buttonTap: () {
                        userQuestion.value = userQuestion.value.substring(
                          0,
                          userQuestion.value.length - 1,
                        );
                      },
                      buttonText: buttons[index],
                      color: Colors.greenAccent.shade200,
                      textColor: Colors.black,
                    );
                  }
                  // answer button
                  else if (buttons[index] == "ANS") {
                    return MyButtons(
                      buttonTap: () {
                        userQuestion.value = "";
                      },
                      buttonText: buttons[index],
                      color: Colors.redAccent,
                      textColor: Colors.black,
                    );
                  }
                  // equal button
                  else if (buttons[index] == "=") {
                    return MyButtons(
                      buttonTap: () {
                        ExpressionParser p = GrammarParser();
                        Expression exp = p.parse(
                          userQuestion.value.replaceAll("x", "*"),
                        );
                        ContextModel cm = ContextModel();

                        // Evaluate expression:
                        double eval = exp.evaluate(EvaluationType.REAL, cm);
                        userAnswer.value = eval.toString();
                      },
                      buttonText: buttons[index],
                      color: Colors.orangeAccent.shade400,
                      textColor: Colors.black,
                    );
                  }
                  // other buttons
                  else {
                    return MyButtons(
                      buttonTap: () {
                        userQuestion.value += buttons[index];
                      },
                      buttonText: buttons[index],
                      color:
                          isOperator(buttons[index])
                              ? Colors.orangeAccent.shade400
                              : Colors.white,
                      textColor: Colors.black,
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
    if (x == "%" || x == "/" || x == "x" || x == "-" || x == "+") {
      return true;
    } else {
      return false;
    }
  }
}
