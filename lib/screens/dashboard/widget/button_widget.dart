import 'package:flutter/material.dart';

class BodyButton extends StatelessWidget {
  Icon suffixIcon;
  String buttonTitle;

  BodyButton({required this.buttonTitle, required this.suffixIcon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 15,
            offset: const Offset(0, 3),
          )
        ]),
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 15, bottom: 15)),
            onPressed: () {},
            label: Text(
              buttonTitle,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            icon: suffixIcon),
      ),
    );
  }
}
