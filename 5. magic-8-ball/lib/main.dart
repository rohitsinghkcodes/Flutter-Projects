import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          title: Center(
            child: Text('Ask Me Anything'),
          ),
          backgroundColor: Colors.pink,
        ),
        body: reload(),
      ),
    ),
  );
}

class reload extends StatefulWidget {
  @override
  _reloadState createState() => _reloadState();
}

class _reloadState extends State<reload> {
  int img = 1;
  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: FlatButton(
          onPressed: () {
            setState(() {
              img = random.nextInt(5) + 1;
            });
          },
          child: Image.asset('images/ball$img.png'),
        ),
      ),
    );
  }
}
