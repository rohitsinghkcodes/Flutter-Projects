import 'dart:math';

class CalculatorBRain {
  CalculatorBRain(this.height, this.weight);
  final int height;
  final int weight;

  double _BMI;

  //Calculate BMI
  String calculateBMI() {
    _BMI = weight / pow(height / 100, 2);
    return _BMI.toStringAsFixed(1);
  }

  //Result
  String getResult() {
    if (_BMI >= 25) {
      return 'Overweight';
    } else if (_BMI >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  //Suggestion
  String getInterpretation() {
    if (_BMI >= 25) {
      return 'I am sorry, but you are OVERWEIGHT.\nYou should do Some EXERCISE.';
    } else if (_BMI >= 18.5) {
      return 'Congratulations you are perfectly FIT.\nKeep it up';
    } else {
      return 'I am sorry, but you are UNDERWEIGHT.\nYou should have something to EAT.';
    }
  }
}
