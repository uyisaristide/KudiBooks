import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  const CustomFormField({required this.hintText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black12)),
        child: TextFormField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              hintText: hintText,
              border: InputBorder.none),
        ));
  }
}