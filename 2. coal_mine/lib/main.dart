import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          backgroundColor: Colors.amberAccent[400],
          title: Center(
            child: Text('Coal Mine'),
          ),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/coal_mine.png'),
          ),
        ),
      ),
    ),
  );
}
