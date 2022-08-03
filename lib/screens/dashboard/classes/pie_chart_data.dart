import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(month: '40%', color: Colors.orange, percent: 40),
    Data(month: '30%', color: Colors.teal, percent: 30),
    Data(month: '20%', color: Colors.yellow, percent: 20),
    Data(month: '10%', color: Colors.red, percent: 10),
    // Data(month: 'aprl', color: Colors.green, percent: 10),
  ];
}

class Data {
  final String month;
  final Color color;
  final double percent;

  Data({required this.month, required this.color, required this.percent});
}
