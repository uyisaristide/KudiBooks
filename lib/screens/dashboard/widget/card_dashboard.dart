import 'package:flutter/material.dart';

import 'horizontal_line_container.dart';

class CardDashboard extends StatelessWidget {
  const CardDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 15,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          color: Colors.white),
      child: Column(
        children: [
          HorizontalLine(lineColor: const Color(0xff9DC2FF)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "31,466",
                        style: TextStyle(
                          fontSize: 32.0,
                          color: Color(0xff3A3A44),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        "166k Units",
                        style:
                            TextStyle(fontSize: 16.0, color: Color(0xff3A3A44)),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Products in stock",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.info_outline,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
