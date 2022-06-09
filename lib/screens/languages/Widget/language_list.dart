import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageList extends StatelessWidget {
  String image;
  String languageName;

  LanguageList({Key? key, required this.image, required this.languageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            languageName,
            style: const TextStyle(
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
