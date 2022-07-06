import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BusinessMovement {
  final String months;
  final int amounts;
  final charts.Color barColor;

  BusinessMovement(
      {required this.months, required this.amounts, required this.barColor});

  static final List<BusinessMovement> data = [
    BusinessMovement(
      months: "Jan",
      amounts: 20,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BusinessMovement(
      months: "Feb",
      amounts: 40,
      barColor: charts.ColorUtil.fromDartColor(Colors.green.shade700),
    ),
    BusinessMovement(
      months: "Mars",
      amounts: 64,
      barColor: charts.ColorUtil.fromDartColor(Colors.red.shade500),
    ),
    BusinessMovement(
      months: "April",
      amounts: 89,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow.shade100),
    ),
    BusinessMovement(
      months: "Jun",
      amounts: 50,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown.shade200),
    ),
    BusinessMovement(
      months: "July",
      amounts: 50,
      barColor: charts.ColorUtil.fromDartColor(Colors.green.shade50),
    ),
    BusinessMovement(
      months: "Aug",
      amounts: 73,
      barColor: charts.ColorUtil.fromDartColor(Colors.cyanAccent),
    ),
    BusinessMovement(
      months: "Sept",
      amounts: 29,
      barColor: charts.ColorUtil.fromDartColor(Colors.deepOrangeAccent.shade400),
    ),
    BusinessMovement(
      months: "Oct",
      amounts: 84,
      barColor: charts.ColorUtil.fromDartColor(Colors.blueGrey.shade800),
    ),
    BusinessMovement(
      months: "Nov",
      amounts: 84,
      barColor: charts.ColorUtil.fromDartColor(Colors.green.shade500),
    ),
    BusinessMovement(
      months: "Dev",
      amounts: 69,
      barColor: charts.ColorUtil.fromDartColor(Colors.orange),
    ),
  ];
}

// class IncomeChart {
//   double amount;
//   String month;
//   charts.Color barColor;
//
//   IncomeChart(
//       {required this.barColor, required this.amount, required this.month});
//
// }
