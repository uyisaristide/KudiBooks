import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/login.dart';
import 'package:kudibooks_app/screens/auth_screens/phone_login.dart';
import 'package:kudibooks_app/screens/auth_screens/phone_signup.dart';
import 'package:kudibooks_app/screens/auth_screens/signup.dart';
import 'package:kudibooks_app/screens/splash_screen/green_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GreenSplashScreen(),
      initialRoute: '/',
      routes: {
        '/login': (context) =>  Login(),
        '/phoneLogin': (context) =>  PhoneLogin(),
        '/signup': (context) => const SignUp(),
        '/phoneSignup': (context) => const PhoneSignup(),
      },
    );
  }
}
