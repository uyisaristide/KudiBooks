import 'package:flutter/material.dart';

class HyperLinkText extends StatelessWidget {
  final String directingText;
  final void Function()? actions;

  const HyperLinkText({required this.directingText, Key? key, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        onPressed: actions,
        child: Text(
          directingText,
          style: const TextStyle(color: Color(0Xff6FCF97)),
        ),
      ),
    );
  }
}
