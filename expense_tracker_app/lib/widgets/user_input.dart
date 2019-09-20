import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserInput extends StatefulWidget {
  final Function addTx;

  UserInput(this.addTx);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final _textController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime dateSelected;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final textValue = _textController.text;
    final amountValue = double.parse(_amountController.text);

    if (textValue.isEmpty || amountValue <= 0 || dateSelected == null) {
      return;
    }

    widget.addTx(
      textValue,
      amountValue,
      dateSelected,
    );

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((datePicked) {
      if (datePicked == null) {
        return;
      }

      setState(() {
        dateSelected = datePicked;
      });
    });
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
              controller: _textController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    dateSelected == null
                        ? 'No Date Choose'
                        : DateFormat.yMd().format(dateSelected),
                  ),
                  Container(
                    width: 145,
                    child: FlatButton(
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).textTheme.button.color,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _showDatePicker,
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).accentColor,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
