import 'package:flutter/material.dart';

class AppBarCommon {
  static preferredSizeWidget( context, titleTransaction, {List<Widget>? actions}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(
            automaticallyImplyLeading: true,
            elevation: 0.0,
            backgroundColor: const Color(0xff157253),
            centerTitle: true,
            title: Text(titleTransaction, style: const TextStyle( fontSize: 20, )),
            actions: actions,
          ),
        ],
      ),
    );
  }
}
