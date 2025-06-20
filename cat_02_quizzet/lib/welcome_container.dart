import 'package:flutter/material.dart';

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 400,
            height: 400,
          ),
          const Text(
            "Welcome to the Quiz App!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const ElevatedButton(
            onPressed: null,
            child: Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
