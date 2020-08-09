import 'package:flutter/material.dart';
import 'questionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank quebank = QuestionBank();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //Making a sec for checks for scoretracker in list version
  List<Icon> check = [];

  int CorrectCount = 0;
  void checkAnswers(bool correctans) {
    setState(() {
      if (quebank.checkquerange()) {
        if (quebank.getAnswer() == correctans) {
          CorrectCount++;
          check.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          check.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "$CorrectCount/13\nCORRECT",
          desc: "No further questions available",
          buttons: [
            DialogButton(
              child: Text(
                "RESET",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                CorrectCount = 0;
                quebank.reset();
                check.clear();
                runApp(Quizzler());
              },
              width: 120,
            )
          ],
        ).show();
      }
      quebank.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    int questionNo = quebank.Currque();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quebank.setQueNo(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 100.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quebank.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswers(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswers(false);
              },
            ),
          ),
        ),

        // SCORETACKER SECTION
        Expanded(
          child: Row(
            children: check,
          ),
        )
      ],
    );
  }
}
