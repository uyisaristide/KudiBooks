import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarCommon {
  static preferredSizeWidget(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context)),
            automaticallyImplyLeading: true,
            elevation: 0.0,
            backgroundColor: const Color(0xff157253),
            centerTitle: true,
            title: const Text("All transactions",
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
        ],
      ),
    );
  }
}
