import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconContent.dart';
import 'ReusableCard.dart';
import 'Constants.dart';
import 'result.dart';
import 'calculatorBrain.dart';

//Enumeration function
enum GengerSelection { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GengerSelection genderSelected;
  int height = 120;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    //decoration for calculate button
    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: genderSelected == GengerSelection.male
          ? color6
          : genderSelected == GengerSelection.female ? color5 : color1,
    );

    //Decoration for other cards
    var toogleCardColor = genderSelected == GengerSelection.male
        ? color3
        : genderSelected == GengerSelection.female ? color2 : color1;

    var inverttoogleColor = genderSelected == GengerSelection.male
        ? color6
        : genderSelected == GengerSelection.female ? color5 : color1;

    var inverttoogleColortanns = genderSelected == GengerSelection.male
        ? colortanns6
        : genderSelected == GengerSelection.female ? colortrans5 : Colors.black;

//    var invertBtnColor = genderSelected == GengerSelection.male
//        ? Colors.blueGrey
//        : genderSelected == GengerSelection.female ? Colors.grey : color1;

    //MAIN SECTION STARTS HERE
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                //Male gender section
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        genderSelected = GengerSelection.male;
                      });
                    },
                    colorSelected: genderSelected == GengerSelection.male
                        ? color3
                        : color1,
                    cardChild: IconContent(
                      genicon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                  ),
                ),
                //Female gender section
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        genderSelected = GengerSelection.female;
                      });
                    },
                    colorSelected: genderSelected == GengerSelection.female
                        ? color2
                        : color1,
                    cardChild: IconContent(
                      genicon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Height change slider
          Expanded(
            child: ReusableCard(
              colorSelected: toogleCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabeltextStyle,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kChoseninput,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.grey,
                      thumbColor: inverttoogleColor,
                      activeTrackColor: color1,
                      overlayColor: inverttoogleColortanns,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                //4th section
                Expanded(
                  child: ReusableCard(
                    colorSelected: toogleCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabeltextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kChoseninput,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconBtn(
                              Btncolor: color1,
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                  if (weight < 0) {
                                    weight = 0;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconBtn(
                              Btncolor: color1,
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //fifth section
                Expanded(
                  child: ReusableCard(
                    colorSelected: toogleCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabeltextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kChoseninput,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconBtn(
                              Btncolor: color1,
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                  if (age < 0) {
                                    age = 0;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconBtn(
                              Btncolor: color1,
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Calculate Button
          GestureDetector(
            onTap: () {
              CalculatorBRain calc = CalculatorBRain(height, weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => finalPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        )),
              );
            },
            child: Container(
              decoration: boxDecoration,
              margin: EdgeInsets.all(12.0),
              width: double.infinity,
              height: kBottomContHeight,
              child: Center(
                child: Text(
                  'CALCULATE',
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
      ),
    );
  }
}

class RoundIconBtn extends StatelessWidget {
  RoundIconBtn({@required this.Btncolor, @required this.icon, this.onpressed});
  final Color Btncolor;
  final IconData icon;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
      ),
      onPressed: onpressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      fillColor: Btncolor,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
