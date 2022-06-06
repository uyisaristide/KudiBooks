import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/splash_screen/white_splash_screen.dart';
import 'package:kudibooks_app/screens/splash_screen/widgets/splash.dart';

class GreenSplashScreen extends StatefulWidget {
  const GreenSplashScreen({Key? key}) : super(key: key);

  @override
  State<GreenSplashScreen> createState() => _GreenSplashScreenState();
}

class _GreenSplashScreenState extends State<GreenSplashScreen> {
 _GreenSplashScreenState(){
    Timer(const Duration(milliseconds: 3000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const WhiteSplashScreen()),
            (route) => false);
      });
    });

 }
  
  @override
  Widget build(BuildContext context) {
   
    return const Splash(
        backgroundColor:  Color(0Xff157253),
        logoImage: 'assets/images/kudibooks-WHITE-PNG-LOGO.png',versionTextColor: Colors.white,);
   
  }
}
