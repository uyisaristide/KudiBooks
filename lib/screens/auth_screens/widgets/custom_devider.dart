import 'package:flutter/material.dart';

class CustomDevider extends StatelessWidget {
  final String middleText;
  double horizotalPadding;
  double verticalPadding;

  CustomDevider(
      {required this.middleText,
      required this.horizotalPadding,
      required this.verticalPadding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizotalPadding, vertical: verticalPadding),
      child: Row(children: <Widget>[
        const Expanded(
            child: Divider(
          thickness: 2,
        )),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(middleText),
        ),
        const Expanded(
            child: Divider(
          thickness: 2,
        )),
      ]),
    );
  }
}
