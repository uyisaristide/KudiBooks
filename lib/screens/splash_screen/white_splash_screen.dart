import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/models/Users/user_profile_model.dart';
import 'package:kudibooks_app/providers/all_providers_list.dart';
import 'package:kudibooks_app/providers/user_profile_provider.dart';
import 'package:kudibooks_app/screens/splash_screen/widgets/splash.dart';

class WhiteSplashScreen extends ConsumerStatefulWidget {
  const WhiteSplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WhiteSplashScreen> createState() => _WhiteSplashScreenState();
}

class _WhiteSplashScreenState extends ConsumerState<WhiteSplashScreen> {
  _WhiteSplashScreenState() {}

  @override
  Widget build(BuildContext context) {
    UserProfile? userStatus =
        ref.watch(userProfileProvider).data;

    // print(userStatus!.email);
    Timer(const Duration(milliseconds: 3000), () {
      setState(() {
        userStatus == null
            ? context.goNamed('welcome')
            : context.goNamed('dashboard');
        // directMe.isEmpty
        //     ? context.goNamed('welcome')
        //     : context.goNamed('dashboard');
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        //     (route) => false);

        print(userStatus);
      });
    });

    return const Splash(
      backgroundColor: Color(0XffE5E5E5),
      logoImage: 'assets/images/splash/kudibooksLogo2.png',
      versionTextColor: Colors.black,
    );
  }
}
