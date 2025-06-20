import 'package:cat_02_quizzet/question_container.dart';
import 'package:cat_02_quizzet/welcome_container.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'welcome-container';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-container';
    });
  }

  @override
  Widget build(context) => MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade200,
              Colors.blue.shade400,
              Colors.blue.shade600,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        //=========================================================
        //Ternary expression to switch between screens
        //=========================================================
        child: activeScreen == 'welcome-container'
            ? WelcomeContainer(switchScreen)
            : const QuestionContainer(),
      ),
    ),
  );
}
