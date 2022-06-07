import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final String iconImage;
  final String text;
  final Color cardColor;
   const GridCard({required this.text,required this.cardColor,required this.iconImage,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cardColor

          // color: const Color.fromARGB(183, 223, 245, 1)
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconImage),
          Text(text)
        ],
      ),
    );
  }
}
