import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      paddingSize: 0.0,
      drawerWidget: Drawers(),
      screens: Container(height: 800),
    );
  }
}
