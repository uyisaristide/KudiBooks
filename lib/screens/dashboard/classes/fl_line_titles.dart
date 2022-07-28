import 'package:fl_chart/fl_chart.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        // leftTitles: AxisTitles(sideTitles: SideTitles(
        //   showTitles: true,
        //   getTitlesWidget: (value, data) {
        //     switch (value.toInt()) {
        //       case 1:
        //         return '10k';
        //       case 2:
        //         return '20k';
        //       case 3:
        //         return '30k';
        //       case 4:
        //         return '40k';
        //       case 5:
        //         return '50k';
        //       case 6:
        //         return '60k';
        //     }
        //     return '';
        //   },
        // ),),
        // bottomTitles: AxisTitles(sideTitles: SideTitles(reservedSize: 8,
        //     showTitles: true,
        //     getTitlesWidget:(value, data) {
        //       switch (value.toInt()) {
        //         case 0:
        //           return 'Jan';
        //         case 1:
        //           return 'Feb';
        //         case 2:
        //           return 'Mar';
        //         case 3:
        //           return 'Apr';
        //         case 4:
        //           return 'May';
        //         case 5:
        //           return 'Jun';
        //         case 6:
        //           return 'Jul';
        //         case 7:
        //           return 'Aug';
        //         case 8:
        //           return 'Sep';
        //         case 9:
        //           return 'Oct';
        //         case 10:
        //           return 'Nov';
        //         case 11:
        //           return 'Dec';
        //       }
        //       return '';
        //     })
      );
}
