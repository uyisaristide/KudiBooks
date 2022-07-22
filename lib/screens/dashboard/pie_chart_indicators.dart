import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/classes/pie_chart_data.dart';

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: PieData.data
          .map((data) => Container(
              padding: const EdgeInsets.all(5),
              child: buildIndicator(color: data.color, text: data.month)))
          .toList(),
    );
  }
}

Widget buildIndicator(
        {@required Color? color,
        @required String? text,
        bool isSquare = false,
        double size = 16,
        Color textColor = const Color(0xff505050)}) =>
    Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              color: color),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          text!,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
