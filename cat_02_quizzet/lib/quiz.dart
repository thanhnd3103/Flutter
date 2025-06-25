import 'package:cat_02_quizzet/data/question_list.dart';
import 'package:cat_02_quizzet/question_container.dart';
import 'package:cat_02_quizzet/result_container.dart';
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
  //=========================================================
  // This is fine because list is not reassigned, only added in (modified)
  //=========================================================
  final List<String> selectedAnswers = [];
  var activeScreen = 'welcome-container';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-container';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questionList.length){
      setState(() {
        activeScreen = 'result-container';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = WelcomeContainer(switchScreen);

    switch (activeScreen) {
      case 'welcome-container':
        screenWidget = WelcomeContainer(switchScreen);
        break;
      case 'question-container':
        screenWidget = QuestionContainer(
          onSelectAnswer: chooseAnswer,
        );
        break;
      case 'result-container':
        screenWidget = ResultContainer(chosenAnswers: selectedAnswers,);
        break;
      default:
        screenWidget = WelcomeContainer(switchScreen);
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
          child: screenWidget,
        ),
      ),
    );
  }
}
