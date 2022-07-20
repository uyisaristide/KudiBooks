import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/classes/pie_chart_data.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
    );
  }
}

// Map<int, PieChartSectionData> getSelections() => PieData.data
//     .asMap()
//     .map<int, PieChartSectionData>((index, data) {
//       final value = PieChartSectionData(
//           color: data.color, value: data.percent, title: data.month, titleStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: colors.blue));
//       return MapEntry(index, value);
//     })
//     .values
//     .toList;
