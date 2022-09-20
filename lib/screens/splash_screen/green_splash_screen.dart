import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import '../../main.dart';
import '../../providers/all_providers_list.dart';
import 'widgets/splash.dart';

class GreenSplashScreen extends ConsumerStatefulWidget {
  const GreenSplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<GreenSplashScreen> createState() => _GreenSplashScreenState();
}

class _GreenSplashScreenState extends ConsumerState<GreenSplashScreen> {
  _GreenSplashScreenState() {
    // Future openHiveBox() async {
    //   Box box = await Hive.openBox(userProfileBoxName);
    //   if(box.)
    // }

    // @override
    // void initState() async {
    //   super.initState();
    //   var user = await ref.read(userProfileProvider.notifier).getUserFromHive();
    //   print('start with: $user');
    // }
  }
  Future<bool> isLogged() async {
    await Hive.openBox(userProfileBoxName);

    var currentUser = Hive.box(userProfileBoxName);

    if (currentUser.containsKey('user')) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 3000), () {
      setState(() async {
        // var currentUser = ref.watch(userProfileProvider.notifier).currentUser;
        await Hive.openBox(userProfileBoxName);
        // var token = Hive.box('tokens').get('token');
        // if (token == null) {
        var currentUser = Hive.box(userProfileBoxName);
        // ref.watch(userProfileProvider.notifier).userProfileBox;
       Future  <bool> logged ;
       var isLogged= ref.read(userProfileProvider.notifier).isLogged();
       
        
        
        isLogged ==true
            ? context.goNamed('dashboard')
           
            :
        context.goNamed('signin');
        
      });
    });

    return const Splash(
      backgroundColor: Color(0Xff157253),
      logoImage: "assets/images/splash/kudibooks-WHITE-PNG-LOGO.png",
      versionTextColor: Colors.white,
    );
  }
}
