// class LeftHandStack {
//   String innerShapeColor;
//   String outerShapeColor;
//   LeftHandStack({required this.innerShapeColor, required this.outerShapeColor})

// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeftHandStack extends StatelessWidget {
  String innerShapeColor;
  String outerShapeColor;
  LeftHandStack(
      {required this.innerShapeColor, required this.outerShapeColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          height: 200,
          top: -20,
          left: -100,
          child: Container(
            // height: 200,
            width: 200,
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
          )),
      Positioned(
          height: 200,
          top: -20,
          left: -130,
          child: Container(
            // height: 200,
            width: 200,
            decoration: const BoxDecoration(
              color: Colors.pink,
              shape: BoxShape.circle,
            ),
          )),
    ]);
  }
}
