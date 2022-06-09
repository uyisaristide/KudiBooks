import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundBlur extends StatelessWidget {
  dynamic widgetContent;

  BackgroundBlur({Key? key, this.widgetContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 150,
            left: 250,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(color: Colors.green),
            )),
        Positioned(
            top: 30,
            left: 60,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(color: Colors.amber),
            )),
        Positioned(
            top: 200,
            left: -80,
            child: Container(
              height: 200,
              width: 100,
              decoration: const BoxDecoration(color: Colors.amber),
            )),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 90.0),
          child: Container(
            color: Colors.white.withOpacity(.2),
          ),
        ),
      ],
    );
  }
}
