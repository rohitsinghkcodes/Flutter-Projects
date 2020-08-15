import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[800],
        appBar: AppBar(
          title: Center(
            child: Text('Dicee'),
          ),
          backgroundColor: Colors.teal[900],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNo = 1;
  int rightDiceNo = 2;

  void Dicerandom() {
    leftDiceNo = random.nextInt(6) + 1;
    rightDiceNo = random.nextInt(6) + 1;
  }

  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  Dicerandom();
                });
              },
              child: Image.asset(
                ('images/dice$leftDiceNo.png'),
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  Dicerandom();
                });
              },
              child: Image.asset(
                ('images/dice$rightDiceNo.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
