import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/services_model.dart';

class CarouselCard extends StatelessWidget {
  CarouselsCard carouselsCard;
  int? indexCard;

  CarouselCard({Key? key, required this.carouselsCard, this.indexCard})
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
              carouselsCard.image,
              height: indexCard == 0 ? 330 : 100,
            ),
          ),
          Flexible(
            child: SizedBox(
              height: indexCard == 0 ? 40 : 100,
            ),
          ),
          Text(
            carouselsCard.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Flexible(
            child: SizedBox(
              height: indexCard == 0 ? 40 : 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              carouselsCard.description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          )
        ],
      ),
    ));
  }
}
