import 'package:cat_02_quizzet/question_container.dart';
import 'package:cat_02_quizzet/welcome_container.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}
//=========================================================
// Extra shenanigans with lists and ternary expressions
//=========================================================
// final myList = [
//   1,
//   2,
//   condition ? 3 : 4 // if condition is true, add 3, else add 4
// ];
//=========================================================
// Can also be written as
//==========================================================
// final myList = [
//   1,
//   2,
//   if (condition)
//     3
//   else
//     4
// ];
//=========================================================
//Or remove the else part
//==========================================================

class _QuizState extends State<Quiz> {
  var activeScreen = 'welcome-container';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-container';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = WelcomeContainer(switchScreen);

    if (activeScreen == 'question-container') {
      screenWidget = const QuestionContainer();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade400,
                Colors.purple.shade600,
                Colors.purple.shade800,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //=========================================================
          //Ternary expression to switch between screens
          //=========================================================
          child: screenWidget,
        ),
      ),
    );
  }
}
