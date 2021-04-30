import 'dart:math';

class CalculateBmi {
  final height;
  final weight;
  double _bmi;

  CalculateBmi(this.height, this.weight);

  String calculateBMI() {
     _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return "Overweight";
    } else if (_bmi > 18.5)
      return "Normal";
    else return "Underweight";
  }

  String getAdvice() {
    if (_bmi >= 25) {
      return "You have a higher body weight. Excercise More";
    } else if (_bmi > 18.5) {
      return "Good Job , You have a prfect body weight";
    } else {
      return "Oops, You should eat a bit more";
    }
  }
}
