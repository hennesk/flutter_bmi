import 'dart:math';

class BMIBrain {
  int height;
  int weight;
  double _bmi;

  BMIBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultString() {
    if (_bmi >= 25) {
      return "Overweight";
    }
    if (_bmi < 18.5) {
      return "Underweight";
    }
    return "Normal";
  }

  String interpret() {
    if (_bmi >= 25) {
      return "Above normal range, do more cardio.";
    }
    if (_bmi < 18.5) {
      return "Below normal range, eat more.";
    }
    return "Within the normal range!";
  }
}
