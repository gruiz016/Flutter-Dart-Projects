import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const rounteName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
