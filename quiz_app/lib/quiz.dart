import 'package:flutter/material.dart';

import 'answers.dart';
import 'questions.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function questionAnswer;
  final questionNumber;

  Quiz(
      {@required this.questionNumber,
      @required this.questions,
      @required this.questionAnswer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questions(
          questions[questionNumber]['questionText'],
        ),
        ...(questions[questionNumber]['answers'] as List<Map<String, Object>>)
            .map(
          (answer) {
            return Answer(
                () => questionAnswer(answer['score']), answer['text']);
          },
        ).toList()
      ],
    );
  }
}
