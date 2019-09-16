import 'package:flutter/material.dart';

import 'package:expense_tracker_app/widgets/transaction_list.dart';
import 'package:expense_tracker_app/widgets/user_input.dart';
import 'package:expense_tracker_app/models/transaction.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      amount: 69.99,
      date: DateTime.now(),
      id: 't1',
      title: 'Gas',
    ),
    Transaction(
      amount: 99.99,
      date: DateTime.now(),
      id: 't2',
      title: 'Groceries',
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      amount: txAmount,
      title: txTitle,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UserInput(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
