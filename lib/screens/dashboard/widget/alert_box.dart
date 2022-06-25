import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  Color? topLignColor;
  String cardTitle;
  String bodyCard;
  Widget? actionButton;
  Widget? cancelButton;

  AlertCard(
      {this.actionButton,
      this.cancelButton,
      required this.bodyCard,
      required this.cardTitle,
      this.topLignColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 1.0, color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: topLignColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                )),
            height: 10,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Text(
              cardTitle,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Text(
              bodyCard,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  child: actionButton,
                ),
                Container(child: cancelButton),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
