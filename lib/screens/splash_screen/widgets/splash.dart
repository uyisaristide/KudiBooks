import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  final Color backgroundColor;
  final String logoImage;
  final Color? versionTextColor;

  const Splash(
      {required this.backgroundColor,
      required this.logoImage,
      this.versionTextColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            Center(
              child: Image(
                image: AssetImage(logoImage),
                // width: 352,
                // height: 352,
              ),
            ),
            const Positioned(
                top: 100,
                left: -80,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.amber,
                )),
            Positioned(
                top: 120,
                left: -60,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: backgroundColor,
                )),
            Positioned(
                top: -20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.amber,
                  ),
                  height: 100,
                  width: 50,
                )),
            Positioned(
              bottom: 25,
              right: 200,
              child: Row(
                children: [
                  Text(
                    'v1.0',
                    style: TextStyle(color: versionTextColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
