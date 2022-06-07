import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;

  const LoginButton({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color(0Xff157253),
            borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child:  Text(
          text,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
