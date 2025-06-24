import 'package:cat_02_quizzet/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:cat_02_quizzet/data/question_list.dart';

class QuestionContainer extends StatefulWidget {
  const QuestionContainer({super.key});

  @override
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  @override
  Widget build(BuildContext context) {
    final questions = questionList;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questions[0].text,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          for (var i = 0; i < questions[0].answers.length; i++)
            AnswerButton(
              answerText: questions[0].answers[i],
              onTap: () {
                
              },
            ),
        ],
      ),
    );
  }
}
