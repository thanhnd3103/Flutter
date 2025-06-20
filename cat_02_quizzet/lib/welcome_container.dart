import 'package:flutter/material.dart';

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //========================================Use lots of resources========================================
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 400,
          //     height: 400,
          //   ),
          // ),
          //=====================================================================================================
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 400,
            height: 400,
            color: Colors.white.withAlpha(220)
          ),
          const SizedBox(height: 20),
          const Text(
            "Welcome to the Quiz App!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            icon: const Icon(Icons.play_arrow),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
