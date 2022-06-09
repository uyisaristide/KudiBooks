import 'dart:ui';

import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  String image;
  String title;
  String description;
  int? indexCard;

  CarouselCard(
      {Key? key,
      required this.image,
      required this.title,
      this.indexCard,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: indexCard == 0 ? 100 : 50,
            ),
            child: Image.asset(
              image,
              height: indexCard == 0 ? 330 : 100,
            ),
          ),
          SizedBox(
            height: indexCard == 0 ? 40 : 100,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          SizedBox(
            height: indexCard == 0 ? 40 : 100,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          )
        ],
      ),
    ));
  }
}
