import 'package:flutter/cupertino.dart';
import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmiValue;

  CalculatorBrain({@required this.height, @required this.weight});

  String bmiValue() {
    _bmiValue = weight / pow(height / 100, 2);
    return _bmiValue.toStringAsFixed(1);
  }

  String bmiCategory() {
    if (_bmiValue >= 25) {
      return 'overweight';
    } else if (_bmiValue > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String bmiComment() {
    if (_bmiValue >= 25) {
      return 'You have a higher than normal bodyweight. Try to exercise more. :)';
    } else if (_bmiValue > 18.5) {
      return 'You have a normal bodyweight. Keep it up! :) ';
    } else {
      return 'You have a lower than normal bodyweight. Gotta eat more! :)';
    }
  }
}
