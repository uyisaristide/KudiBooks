import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/language_model.dart';

class LanguageList extends StatelessWidget {
  ChooseLanguages chooseLanguages;

  LanguageList({Key? key, required this.chooseLanguages}) : super(key: key);

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
              chooseLanguages.image,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            chooseLanguages.languageName,
            style: const TextStyle(
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
