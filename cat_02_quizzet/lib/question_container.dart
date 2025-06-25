import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cat_02_quizzet/answer_button.dart';
import 'package:cat_02_quizzet/data/question_list.dart';

class QuestionContainer extends StatefulWidget {
  const QuestionContainer({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  int currentQuestionIndex = 0;

  void nextQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      if (currentQuestionIndex < questionList.length - 1) {
        currentQuestionIndex++;
      } else {
        currentQuestionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questionList[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 238, 175, 233),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            //==========================================================
            // Using map and spread operator to create a list of AnswerButton widgets
            //==========================================================
            // Shuffle change the original list, while map does not
            //==========================================================
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(
                answerText: item,
                onTap: () {
                  nextQuestion(item);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
