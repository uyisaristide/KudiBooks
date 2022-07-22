import 'package:flutter/material.dart';

class LineChartIndicator extends StatelessWidget {
  const LineChartIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        ),
        const Text(
          'Loss',
          style: TextStyle(fontSize: 23),
        ),
        const SizedBox(
          width: 40,
        ),
        Container(
          width: 20,
          height: 20,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        ),
        const Text(
          'Profit',
          style: TextStyle(fontSize: 23),
        ),
      ],
    );
  }
}
