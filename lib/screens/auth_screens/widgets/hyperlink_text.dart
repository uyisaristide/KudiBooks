import 'package:flutter/material.dart';

class HyperLinkText extends StatelessWidget {
  final String directingText;
  const HyperLinkText({required this.directingText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        onPressed: () {},
        child:  Text(
          directingText,
          style: const TextStyle(color: Color(0Xff6FCF97)),
        ),
      ),
    );
  }
}
