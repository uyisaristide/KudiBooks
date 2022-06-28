import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  Color? lineColor;

  HorizontalLine({this.lineColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: lineColor,
          // color: Color(0xff9DC2FF),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      margin: const EdgeInsets.all(10.0),
      height: 10,
      width: MediaQuery.of(context).size.width,
    );
  }
}
