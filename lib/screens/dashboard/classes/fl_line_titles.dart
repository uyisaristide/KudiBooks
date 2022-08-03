import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
      show: true,
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      
      leftTitles:AxisTitles( sideTitles: SideTitles(
        showTitles: true,
        
        getTitlesWidget: (double value, TitleMeta met) {

          

          switch (value.toInt()) {
            case 1:
              return const Text('10k');
            case 2:
              return const Text('20k');
            case 3:
              return const Text('30k');
            case 4:
              return const Text('40k');
            case 5:
              return const Text('50k');
            case 6:
              return const Text('60k');
          }
          return const Text('');
        },
      ),
       ),
       bottomTitles:AxisTitles(sideTitles: SideTitles(
          showTitles: true,
          
          getTitlesWidget: (double value, TitleMeta meta) {
            switch (value.toInt()) {
              case 0:
                return const Text('Jan');
              case 1:
                return const Text('Feb');
              case 2:
                return const Text('Mar');
              case 3:
                return const Text('Apr');
              case 4:
                return const Text('May');
              case 5:
                return const Text('Jun');
              case 6:
                return const Text('Jul');
              case 7:
                return const Text('Aug');
              case 8:
                return const Text('Sep');
              case 9:
                return const Text('Oct');
              case 10:
                return const Text('Nov');
              case 11:
                return const Text('Dec');
            }
            return const Text('');
          })));
}
