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
        child: Container(
      decoration: const BoxDecoration(
        color: Colors.black38,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: indexCard == 0 ? 300 : 150,
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    ));
  }
}
