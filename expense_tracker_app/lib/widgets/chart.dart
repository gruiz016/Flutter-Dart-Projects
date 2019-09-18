import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expense_tracker_app/models/transaction.dart';

class Chart extends StatelessWidget {
  final recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalSum = 0.0;

        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
        }

        return {
          'date': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionsValues.map((data) {
          return Text('${data['date']}: ${data['amount']}');
        }).toList(),
      ),
    );
  }
}
