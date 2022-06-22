import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';

class InventoryProductCard extends StatelessWidget {
  const InventoryProductCard({Key? key}) : super(key: key);

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
        child: Column(children: [
          TwoSideHeader(
            textFontSize: 16.0,
            leftSide: 'Product Name',
            fontWeight: FontWeight.bold,
            rightSide: IconButton(
              icon: const Icon(
                Icons.close,
                color: Color(0xffA34646),
              ),
              onPressed: () {},
            ),
            bottomSize: 10,
          ),
          TwoSideHeader(
            textFontSize: 14.0,
            textColor: Colors.grey,
            leftSide: 'Buying price',
            rightSide: const Text(
              "\$15.99",
              style: TextStyle(fontSize: 16.0),
            ),
            bottomSize: 0.0,
          ),
          const Divider(),
          TwoSideHeader(
              fontWeight: FontWeight.bold,
              bottomSize: 10,
              textFontSize: 14.0,
              leftSide: 'By sub-units',
              rightSide: const Text(
                "\$15.99",
                style: TextStyle(fontSize: 13.0),
              )),
          TwoSideHeader(
            textFontSize: 14.0,
            leftSide: 'Count',
            rightSide: const Text(
              "3",
              style: TextStyle(fontSize: 13.0),
            ),
            bottomSize: 0.0,
          ),
        ]),
      ),
    );
  }
}
