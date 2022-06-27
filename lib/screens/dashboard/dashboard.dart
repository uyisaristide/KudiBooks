import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';

import 'widget/bottom_navigation.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      drawerWidget: Drawers(),
      appBars: AppBar(
          actions: [],
          iconTheme: const IconThemeData(color: Color(0xff157253)),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Image.asset(
            "assets/images/splash/kudibooksLogo2.png",
            height: 150,
          )),
      paddingSize: 10,
      screens: Container(
        height: 800,
      ),
    );
  }
}
