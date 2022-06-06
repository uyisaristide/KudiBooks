import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Category')),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(183, 223, 245, 1)),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(183, 223, 245, 1)),
          )
        ],
      ),
    );
  }
}
