import 'package:cat_02_quizzet/data/question_list.dart';
import 'package:cat_02_quizzet/question_summary.dart';
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
    final summaryData = getSummaryData();
    final numTotalQuestions = questionList.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['chosen_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X out of Y questions correctly!'),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: summaryData),
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
