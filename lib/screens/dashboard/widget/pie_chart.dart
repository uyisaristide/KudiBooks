import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/classes/pie_chart_data.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 200,
      child: PieChart(PieChartData(
          sections: getSelections(),
          borderData: FlBorderData(show: false),
          // centerSpaceRadius: 50,
          sectionsSpace: 0)),
    );
  }
}

List<PieChartSectionData> getSelections() => PieData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      final value = PieChartSectionData(
          color: data.color,
          value: data.percent,
          title: data.month,
          titleStyle: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white));
      return MapEntry(index, value);
    })
    .values
    .toList();
