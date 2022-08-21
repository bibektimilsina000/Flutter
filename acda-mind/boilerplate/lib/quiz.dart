import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final VoidCallback answerQuestion;
  List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz(this.answerQuestion, this.questions, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'].toString()),
        ...(questions[questionIndex]['answer'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList()
      ],
    );
  }
}
