import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bốn con mèo nhảy đầm'),
            const SizedBox(height: 30),
            const Text('Hẹ hẹ hẹ'),
            TextButton(
              onPressed: () {},
              child: const Text('Chơi lại nào'),
            ),
          ],
        ),
      ),
    );
  }
}
