import 'package:flutter/material.dart';

class CircledLogo extends StatelessWidget {
  final void Function()? navigateTo;
  final String logo;

  const CircledLogo({this.navigateTo, required this.logo, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 1,
              primary: Colors.white.withOpacity(.2),
              padding: const EdgeInsets.only(
                  top: 15, left: 10, right: 10, bottom: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
          onPressed: navigateTo,
          // child: Text("Icon"),
          child: Image.asset(
            logo,
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }
}
