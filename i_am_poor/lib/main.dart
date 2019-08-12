import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.redAccent,
          appBar: AppBar(
            title: Text('I Am Poor'),
            backgroundColor: Colors.deepOrangeAccent,
          ),
          body: Center(
            child: Image(
              image: AssetImage('images/cat.png'),
            ),
          ),
        ),
      ),
    );
