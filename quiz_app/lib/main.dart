import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuizAppState();
  }
}

class QuizAppState extends State<QuizApp> {
  var questionNumber = 0;

  void questionAnswer() {
    setState(() {
      questionNumber++;
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
            Text(questions[questionNumber]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: questionAnswer,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: questionAnswer,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: questionAnswer,
            ),
          ],
        ),
      ),
    );
  }
}
