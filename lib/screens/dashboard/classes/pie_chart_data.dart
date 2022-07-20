import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(month: 'jan', color: Colors.black, percent: 20),
    Data(month: 'feb', color: Colors.blue, percent: 40),
    Data(month: 'mar', color: Colors.yellow, percent: 30),
    Data(month: 'aprl', color: Colors.red, percent: 10),
  ];
}

class Data {
  final String month;
  final Color color;
  final double percent;

  Data({required this.month, required this.color, required this.percent});
}
