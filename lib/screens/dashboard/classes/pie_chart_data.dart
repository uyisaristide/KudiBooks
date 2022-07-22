import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(month: 'Sales', color: Colors.orange, percent: 20),
    Data(month: 'Inventory', color: Colors.teal, percent: 35),
    Data(month: 'Load', color: Colors.yellow, percent: 25),
    Data(month: 'purchase', color: Colors.red, percent: 10),
    Data(month: 'aprl', color: Colors.green, percent: 10),
  ];
}

class Data {
  final String month;
  final Color color;
  final double percent;

  Data({required this.month, required this.color, required this.percent});
}
