import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  void _resetQuiz() {
    setState(() {
      _questionNumber = 0;
      _totalScore = 0;
    });
  }

  var _questionNumber = 0;

  int _totalScore = 0;

  void _questionAnswer(int score) {
    _totalScore += score;

    setState(() {
      _questionNumber++;
    });
  }

  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Gio', 'score': 1},
        {'text': 'Taty', 'score': 1},
        {'text': 'Luci', 'score': 1},
        {'text': 'Gigi', 'score': 1},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionNumber < _questions.length
            ? Quiz(
                questionNumber: _questionNumber,
                questions: _questions,
                questionAnswer: _questionAnswer,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
