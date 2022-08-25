<<<<<<< HEAD
// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:kudibooks_app/models/transition_chart.dart';

// class DeveloperCharts extends StatelessWidget {
//   final List<BusinessMovement> data;

//   const DeveloperCharts({required this.data, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<BusinessMovement, String>> series = [
//       charts.Series(
//         id: "businessMovement",
//         data: data,
//         domainFn: (BusinessMovement series, _) => series.months,
//         measureFn: (BusinessMovement series, _) => series.amounts,
//         colorFn: (BusinessMovement series, _) => series.barColor,
//       )
//     ];
//     return charts.BarChart(
//       series,
//       animate: true,
//     );
//   }
// }
=======
import 'package:flutter/material.dart';

class DeveloperCharts extends StatelessWidget {
  // final List<BusinessMovement> data;

  // const DeveloperCharts({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<charts.Series<BusinessMovement, String>> series = [
    //   charts.Series(
    //     id: "businessMovement",
    //     data: data,
    //     domainFn: (BusinessMovement series, _) => series.months,
    //     measureFn: (BusinessMovement series, _) => series.amounts,
    //     colorFn: (BusinessMovement series, _) => series.barColor,
    //   )
    // ];
    // return charts.BarChart(
    //   series,
    //   animate: true,
    // );
    return Container();
  }
}
>>>>>>> 4fa982bd7a709896c57fdbb1d145786bac93220f
