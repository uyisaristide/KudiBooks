import 'package:flutter/material.dart';

class ProgreeRow extends StatelessWidget {
  final String beginningText;
  final String endigText;
  final Color? textColor;

  const ProgreeRow(
      {required this.beginningText,
      required this.endigText,
      this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Text(beginningText),
            Expanded(child: Container()),
            Text(
              endigText,
              style: TextStyle(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
