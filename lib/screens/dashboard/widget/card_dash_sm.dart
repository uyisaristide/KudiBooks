import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/widget/horizontal_line_container.dart';

class CardDashSmall extends StatelessWidget {
  Color? lignColor;
  double? discount;
  double? price;
  Widget? containerIcon;
  Color? iconColor;
  Color? colorContainer;

  CardDashSmall(
      {this.lignColor,
      this.discount,
      this.price,
      this.containerIcon,
      this.colorContainer,
      this.iconColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 15,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          color: Colors.white),
      height: 150,
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Positioned(
            right: 1.0,
            left: 1.0,
            child: Center(
              child: HorizontalLine(
                lineColor: lignColor,
              ),
            ),
          ),
          Positioned(
            top: 40.0,
            left: 15,
            child: Text(
              "$price k",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Positioned(
            top: 44.0,
            left: 80,
            child: Text(
              "+$discount %",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 12.0),
            ),
          ),
          const Positioned(
            top: 70.0,
            left: 15,
            child: Text(
              "Total cost",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 16.0),
            ),
          ),
          Positioned(
            top: 100.0,
            right: 10,
            child: Container(
              height: 40,
              width: 40,
              child: containerIcon,
              decoration: BoxDecoration(
                color: colorContainer,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
