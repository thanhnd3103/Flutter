import 'package:cat_02_quizzet/data/question_list.dart';
import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  //==========================================================
  // This should have returned a class that contains the summary data
  // Map is only used for demonstration purposes
  //==========================================================
  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questionList[i].text,
        'correct_answer': questionList[i].answers[0], // Assuming the first answer is always correct
        'chosen_answer': chosenAnswers[i],
      });
    }

    return summaryData;
  }

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
