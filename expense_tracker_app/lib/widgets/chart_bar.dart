import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendAmount;
  final double spendPctAmount;

  ChartBar(
      {@required this.label,
      @required this.spendAmount,
      @required this.spendPctAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('\$${spendAmount.toStringAsFixed(0)}'),
      ],
    );
  }
}
