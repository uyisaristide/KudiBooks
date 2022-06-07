import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/categories/categories.dart';
import 'package:kudibooks_app/screens/splash_screen/widgets/splash.dart';

import '../welcome/welcome_screen.dart';

class WhiteSplashScreen extends StatefulWidget {
  const WhiteSplashScreen({Key? key}) : super(key: key);

  @override
  State<WhiteSplashScreen> createState() => _WhiteSplashScreenState();
}

class _WhiteSplashScreenState extends State<WhiteSplashScreen> {
  _WhiteSplashScreenState() {
    Timer(const Duration(milliseconds: 3000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            (route) => false);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Splash(
      backgroundColor: Color(0XffE5E5E5),
      logoImage: 'assets/images/splash/kudibooksLogo2.png',
      versionTextColor: Colors.black,
    );
  }
}
