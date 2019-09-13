import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function answerSelector;

  Answer(this.answerSelector);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text('Answer 1'),
        onPressed: answerSelector,
        color: Colors.blue,
      ),
    );
  }
}
