import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/screens/splash_screen/green_splash_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  // final router = GoRouter(
  //   routes: [
  //   GoRoute(
  //     path: '/',
  //     builder: (context, state) => const GreenSplashScreen(),
  //   )
  // ]);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final router = ref.watch(routerProvider);
    return MaterialApp(
      home: const GreenSplashScreen(),
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'KudiBooks',
      // routeInformationParser: router.routeInformationParser,
      // routerDelegate: router.routerDelegate,
      // routeInformationProvider: router.routeInformationProvider,
    );
  }
}
