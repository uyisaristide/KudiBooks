import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'widgets/splash.dart';

class GreenSplashScreen extends StatefulWidget {
  const GreenSplashScreen({Key? key}) : super(key: key);

  @override
  State<GreenSplashScreen> createState() => _GreenSplashScreenState();
}

class _GreenSplashScreenState extends State<GreenSplashScreen> {
  _GreenSplashScreenState() {
    Timer(const Duration(milliseconds: 3000), () {
      setState(() {
        // var token = Hive.box('tokens').get('token');
        // if (token == null) {
          context.goNamed('signin');
        // } else {
          // context.goNamed('dashboard');
        // }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Splash(
      backgroundColor: Color(0Xff157253),
      logoImage: "assets/images/splash/kudibooks-WHITE-PNG-LOGO.png",
      versionTextColor: Colors.white,
    );
  }
}
