import 'package:flutter/material.dart';

class CircledLogo extends StatelessWidget {
  final String navigateTo;
  final String logo;
  const CircledLogo({required this.navigateTo, required this.logo, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CircleAvatar(
        backgroundColor: const Color.fromRGBO(196, 196, 196, 0.15),
        radius: 25,
        child: TextButton(
          child: Image.asset(logo),
          onPressed: () {
            Navigator.pushNamed(context, navigateTo);
          },
        ),
      ),
    );
  }
}
