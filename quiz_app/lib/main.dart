import 'package:flutter/material.dart';

import 'questions.dart';

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
    'Your favorite song is?',
    'You are hanging with ur bffs and one of your crew\'s bf comes along. He starts talking like they\'re the only ones there.  You?'
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
            Questions(questions[_questionNumber]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: _questionAnswer,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: _questionAnswer,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: _questionAnswer,
            ),
          ],
        ),
      ),
    );
  }
}
