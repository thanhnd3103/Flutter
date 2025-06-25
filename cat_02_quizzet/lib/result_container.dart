import 'package:cat_02_quizzet/data/question_list.dart';
import 'package:cat_02_quizzet/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key, required this.chosenAnswers, required this.onRestartQuiz});

  final List<String> chosenAnswers;

  final void Function() onRestartQuiz;

  //==========================================================
  // This should have returned a class that contains the summary data
  // Map is only used for demonstration purposes
  //==========================================================
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questionList[i].text,
        'correct_answer': questionList[i]
            .answers[0], // Assuming the first answer is always correct
        'chosen_answer': chosenAnswers[i],
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questionList.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['chosen_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              style: GoogleFonts.montserrat(
                color: Colors.purple.shade100,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestartQuiz,
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple.shade100,
                foregroundColor: Colors.purple.shade400,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Làm lại không em iu?'),
            ),
          ],
        ),
      ),
    );
  }
}
