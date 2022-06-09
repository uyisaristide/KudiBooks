import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  Function? validate;
  final String text;

  LoginButton({required this.text, this.validate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            primary: const Color(0Xff157253),
            minimumSize: const Size(double.infinity, 50),
            padding: const EdgeInsets.all(2)),
        onPressed: () => validate!(),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
