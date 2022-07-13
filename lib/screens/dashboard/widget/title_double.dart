import 'package:flutter/material.dart';

class DoubleHeader extends StatelessWidget {
  String rightSide;
  Widget iconButton;
  IconButton iconButton2;

  DoubleHeader(
      {required this.rightSide,
      required this.iconButton,
      required this.iconButton2,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, top: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  rightSide,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                )),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    iconButton,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
