import 'package:flutter/material.dart';

class DoubleRowWidgets extends StatelessWidget {
  String rightSideText;
  Widget? leftSideWidget;
  bool borderSidebottom = true;

  DoubleRowWidgets(
      {required this.rightSideText,
      this.leftSideWidget,
      required this.borderSidebottom,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          border: Border(
        bottom: borderSidebottom
            ? const BorderSide(width: 1.0, color: Colors.grey)
            : BorderSide.none,
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              child: Text(
                rightSideText,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(alignment: Alignment.centerRight, child: leftSideWidget),
        ],
      ),
    );
  }
}
