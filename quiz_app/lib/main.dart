import 'package:flutter/material.dart';

import 'questions.dart';
import 'answers.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  var _questionNumber = 0;

  void _questionAnswer() {
    setState(() {
      _questionNumber++;
    });
  }

  var questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': ['Black', 'Blue', 'Red', 'Green']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answer': ['Cat', 'Dog', 'Cow', 'Lion']
    },
    {
      'questionText': 'What is your favorite topping?',
      'answer': ['Peperoni', 'Chicken', 'Bacon', 'Cheese']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(
          children: <Widget>[
            Questions(
              questions[_questionNumber]['questionText'],
            ),
            ...(questions[_questionNumber]['answer'] as List<String>).map(
              (answer) {
                return Answer(_questionAnswer, answer);
              },
            ).toList()
          ],
        ),
      ),
    );
  }
}
