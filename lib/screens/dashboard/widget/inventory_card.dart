import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/Users/ProductInLoad.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';

class InventoryProductCard extends StatelessWidget {
  Widget? widgetPadding;

  InventoryProductCard({this.widgetPadding, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.grey),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: widgetPadding,
        ));
  }
}
