import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
import 'InputPage.dart';

class finalPage extends StatelessWidget {
  finalPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black12,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('BMI CALCULATOR')),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: ReusableCard(
                  colorSelected: color1,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'YOUR RESULT',
                        style: kResultTitleStyle,
                      ),
                      Text(
                        resultText.toUpperCase(),
                        style: kresultTextColor,
                      ),
                      Text(
                        bmiResult,
                        style: kBMITextstyle,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kResultBodyTestStyle,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepOrange,
                  ),
                  margin: EdgeInsets.all(12.0),
                  width: double.infinity,
                  height: kBottomContHeight,
                  child: Center(
                    child: Text(
                      'CALCULATE AGAIN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
