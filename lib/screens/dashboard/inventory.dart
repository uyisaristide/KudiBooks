import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/widget/button_widget.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              bottomOpacity: .4,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.folder))
              ],
              elevation: 0.0,
              backgroundColor: const Color(0xff157253),
              centerTitle: true,
              title: const Text("Inventory",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BodyButton(
                  buttonTitle: 'Add Products',
                  suffixIcon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                    color: Color(0xff157253),
                  ),
                ),
                BodyButton(
                  buttonTitle: 'New load',
                  suffixIcon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                    color: Color(0xff157253),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
