import 'package:flutter/material.dart';

class CustomDevider extends StatelessWidget {
  final String middleText;
  const CustomDevider({required this.middleText,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Row(children:  <Widget>[
        const Expanded(
            child: Divider(
          thickness: 2,
        )),
        Text(middleText),
        const Expanded(
            child: Divider(
          thickness: 2,
        )),
      ]),
    );
  }
}