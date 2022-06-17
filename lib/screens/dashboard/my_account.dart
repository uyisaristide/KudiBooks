import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      paddingSize: 0.0,
      screens: Container(height: 800),
      drawerWidget: Drawers(),
    );
  }
}
