import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/inventory_model.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';

class LoadCard extends StatelessWidget {
  InventoryModel inventoryModel;

  LoadCard({required this.inventoryModel, Key? key}) : super(key: key);

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
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(children: [
                TwoSideHeader(
                  textFontSize: 16.0,
                  leftSide: inventoryModel.bulkName,
                  fontWeight: FontWeight.bold,
                  rightSide: const Text(
                    "20 April 2022",
                    style: TextStyle(color: Color(0xffA70C4A), fontSize: 13),
                  ),
                  bottomSize: 10,
                ),
                TwoSideHeader(
                  textFontSize: 14.0,
                  textColor: Colors.grey,
                  leftSide: 'Total',
                  rightSide: Text(
                    inventoryModel.amountPaid.toString(),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  bottomSize: 0.0,
                ),
                const Divider(),
                TwoSideHeader(
                    bottomSize: 10,
                    textFontSize: 14.0,
                    leftSide: 'Product name 1',
                    rightSide: const Text(
                      "\$1.99",
                      style: TextStyle(fontSize: 13.0, color: Colors.grey),
                    )),
                TwoSideHeader(
                  textFontSize: 14.0,
                  leftSide: 'Product name 2',
                  rightSide: const Text(
                    "\$1.99",
                    style: TextStyle(fontSize: 13.0, color: Colors.grey),
                  ),
                  bottomSize: 0.0,
                ),
              ])),
        ));
  }
}
