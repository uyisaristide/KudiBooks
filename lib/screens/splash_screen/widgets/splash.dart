import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  final Color backgroundColor;
 final String logoImage;
 final Color? versionTextColor;
  const Splash(
      {required this.backgroundColor, required this.logoImage, this.versionTextColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
             Center(
              child: Image(
                image:
                    AssetImage(logoImage),
                width: 352,
                height: 352,
              ),
            ),
            const Positioned(
                top: 100,
                left: -100,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.amber,
                )),
             Positioned(
                top: 120,
                left: -80,
                child: CircleAvatar(
                  radius: 80,
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
                left: 200,
                bottom: 30,
                child: SizedBox(
                  child: Text(
                    'v1.0',
                    style: TextStyle(color: versionTextColor),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        )

       
        );
  }
}
