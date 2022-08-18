import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../classes/pie_chart_data.dart';
import '../pie_chart_indicators.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      // height: 400,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: PieChart(PieChartData(
                sections: getSelections(),
                borderData: FlBorderData(show: false),
                sectionsSpace: 0)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: IndicatorsWidget(),
              )
            ],
          )
        ],
      ),
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





// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:kudibooks_app/screens/dashboard/classes/pie_chart_data.dart';
// import 'package:kudibooks_app/screens/dashboard/pie_chart_indicators.dart';

// class CustomPieChart extends StatefulWidget {
//   const CustomPieChart({Key? key}) : super(key: key);

//   @override
//   State<CustomPieChart> createState() => _CustomPieChartState();
// }

// late int touchedIndex;

// class _CustomPieChartState extends State<CustomPieChart> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(20),
//       // height: 400,
//       child: Column(
//         children: [
//           SizedBox(
//             height: 200,
//             child: PieChart(PieChartData(
//                 pieTouchData: PieTouchData(touchCallback:(pieTouchData, pieTouchResponse) {
//                   setState(() {
//                     if (pieTouchResponse.touchInput is FlLongPressEnd ||
//                         pieTouchResponse.touchInput is FlPanEnd) {
//                       touchedIndex = -1;
//                     } else {
//                       touchedIndex = pieTouchResponse.touchedSectionIndex;
//                     }
//                   });
//                 }),
//                 sections: getSelections(touchedIndex),
//                 borderData: FlBorderData(show: false),
//                 sectionsSpace: getSelections(touchedIndex))),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: IndicatorsWidget(),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// List<PieChartSectionData> getSelections(int touchedIndex) => PieData.data
//     .asMap()
//     .map<int, PieChartSectionData>((index, data) {
//       final isTouched = index == touchedIndex;
//       final double fontsize = isTouched? 27:16;
//       final value = PieChartSectionData( 
//           color: data.color,
//           value: data.percent,
//           radius: isTouched?50:20,
//           title: data.month,
//           titleStyle:  TextStyle(
//               fontSize: fontsize, fontWeight: FontWeight.bold, color: Colors.white));
//       return MapEntry(index, value);
//     })
//     .values
//     .toList();
