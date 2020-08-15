import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void plays(int i) {
    final player = AudioCache();
    player.play('note$i.wav');
  }

  Expanded buildkey(int playno, color) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          plays(playno);
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black45,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildkey(1, Colors.redAccent),
                buildkey(2, Colors.blue),
                buildkey(3, Colors.teal),
                buildkey(4, Colors.green),
                buildkey(5, Colors.lightGreen),
                buildkey(6, Colors.orange),
                buildkey(7, Colors.yellow),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
