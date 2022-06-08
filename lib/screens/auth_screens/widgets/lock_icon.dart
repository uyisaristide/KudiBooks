import 'package:flutter/material.dart';

class LockIcon extends StatelessWidget {
  const LockIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        alignment: Alignment.center,
        child: Image.asset('assets/images/categories/lockIcon.png'));
  }
}
