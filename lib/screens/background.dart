import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  Widget? screens;
  double paddingSize;
  Widget? buttonWidget;
  PreferredSizeWidget? appBars;
  Widget? drawerWidget;
  Widget? bottomNavigation;

  BackgroundScreen(
      {Key? key,
      this.screens,
      required this.paddingSize,
      this.buttonWidget,
      this.appBars,
      this.drawerWidget,
      this.bottomNavigation})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBars,
      bottomNavigationBar: bottomNavigation,
      drawer: drawerWidget,
      body: SingleChildScrollView(
        child: Stack(
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
                color: Colors.white.withOpacity(.0),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 30),
                child: buttonWidget,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddingSize),
              child: screens,
            )
          ],
        ),
      ),
    );
  }
}
