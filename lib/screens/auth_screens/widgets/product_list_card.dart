import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListCard extends StatelessWidget {
  int index;

  ProductListCard({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("\$ 4.5"),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          leading: Image.asset(
            "assets/images/itemImage.png",
          ),
          title: Text("Product ${++index}"),
          subtitle: Text("Product $index subtitle"),
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Divider(),
        )
      ],
    );
  }
}
