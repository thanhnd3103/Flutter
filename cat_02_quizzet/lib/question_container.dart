import 'package:cat_02_quizzet/answer_button.dart';
import 'package:flutter/material.dart';

class QuestionContainer extends StatefulWidget {
  const QuestionContainer({super.key});

  @override
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The question will go here',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 20),
          
          AnswerButton(
            answerText: 'Answer 1',
            onTap: () {},
          ),
          AnswerButton(
            answerText: 'Answer 2',
            onTap: () {},
          ),
          AnswerButton(
            answerText: 'Answer 3',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
