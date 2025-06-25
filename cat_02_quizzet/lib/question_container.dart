import 'package:flutter/material.dart';
import 'package:cat_02_quizzet/answer_button.dart';
import 'package:cat_02_quizzet/data/question_list.dart';

class QuestionContainer extends StatefulWidget {
  const QuestionContainer({super.key});

  @override
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {

  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questionList[currentQuestionIndex];

    void nextQuestion() {
      setState(() {
        if (currentQuestionIndex < questionList.length - 1) {
          currentQuestionIndex++;
        } else {
          currentQuestionIndex = 0;
        }
      });
    }

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
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
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
                onTap: nextQuestion,
              );
            }),
          ],
        ),
      ),
    );
  }
}
