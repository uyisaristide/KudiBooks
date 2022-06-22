import 'package:flutter/material.dart';

class TwoSideHeader extends StatelessWidget {
  String leftSide;
  Widget rightSide;
  FontWeight? fontWeight;
  Color? textColor;
  double? textFontSize;
  double bottomSize;

  TwoSideHeader(
      {required this.bottomSize,
      required this.leftSide,
      required this.rightSide,
      this.fontWeight,
      this.textFontSize,
      this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomSize),
      child: Row(
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  leftSide,
                  style: TextStyle(
                      fontWeight: fontWeight,
                      fontSize: textFontSize,
                      color: textColor),
                )),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [rightSide],
                )),
          )
        ],
      ),
    );
  }
}
