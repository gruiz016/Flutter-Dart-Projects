import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  final Function addTx;

  UserInput(this.addTx);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final textController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final textValue = textController.text;
    final amountValue = double.parse(amountController.text);

    if (textValue.isEmpty || amountValue <= 0) {
      return;
    }

    widget.addTx(
      textValue,
      amountValue,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: textController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
