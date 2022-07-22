import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/classes/fl_line_titles.dart';

class LignChartObject extends StatelessWidget {
  const LignChartObject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(right: 10),
      height: 300,
      child: LineChart(
        LineChartData(
            minX: 0,
            maxX: 11,
            minY: 1,
            maxY: 6,
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) =>
                  FlLine(color: Colors.grey, strokeWidth: 2),
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) =>
                  FlLine(color: Colors.grey, strokeWidth: 2),
            ),
            borderData: FlBorderData(show: true),
            backgroundColor: Colors.black12,
            titlesData: LineTitles.getTitleData(),
            lineBarsData: [
              LineChartBarData(
                  spots: [
                    const FlSpot(0, 3),
                    const FlSpot(1, 3),
                    const FlSpot(2, 4),
                    const FlSpot(3, 3),
                    const FlSpot(4, 4.3),
                    const FlSpot(5, 4.7),
                    const FlSpot(6, 3),
                    const FlSpot(7, 5),
                    const FlSpot(8, 5),
                    const FlSpot(9, 3),
                    const FlSpot(10, 4),
                    const FlSpot(11, 4.5),
                  ],
                  isCurved: true,
                  barWidth: 4,
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    //  colors: Colors.teal.withOpacity(0.5)
                  )),
            ]),
      ),
    );
  }
}

// SideTitles get _bottomTitles => SideTitles(
//       showTitles: true,
//       reservedSize: 22,
//       margin: 10,
//       interval: 1,
//       getTextStyles: (context, value) => const TextStyle(
//         color: Colors.blueGrey,
//         fontWeight: FontWeight.bold,
//         fontSize: 16,
//       ),
//       getTitles: (value) {
//         switch (value.toInt()) {
//           case 1:
//             return 'Jan';
//           case 3:
//             return 'Mar';
//           case 5:
//             return 'May';
//           case 7:
//             return 'Jul';
//           case 9:
//             return 'Sep';
//           case 11:
//             return 'Nov';
//         }
//         return '';
//       },
//     );
