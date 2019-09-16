import 'package:flutter/material.dart';

import 'package:expense_tracker_app/widgets/new_transaction.dart';

class UserInput extends StatelessWidget {
  final textController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  UserInput(this.addTx);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {
                addTx(textController.text, double.parse(amountController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
