import 'package:flutter/material.dart';

class MyAccountLIstTiles extends StatelessWidget {
  final String title;
  final Color? color;
  const MyAccountLIstTiles({this.color, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          title: Text(
            title,
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.w400,
                fontSize: 18,
                fontFamily: 'Rubik'),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Colors.black,
          ),
        ),
        const Divider()
      ],
    );
  }
}
