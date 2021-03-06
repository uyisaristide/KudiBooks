import 'package:flutter/material.dart';
import 'package:kudibooks_app/providers/expenses_provider.dart';
import 'package:kudibooks_app/providers/inventory_provider.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/providers/products_sale_provider.dart';
import 'package:kudibooks_app/providers/user_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/login.dart';
import 'package:kudibooks_app/screens/auth_screens/otp_verification.dart';
import 'package:kudibooks_app/screens/auth_screens/phone_login.dart';
import 'package:kudibooks_app/screens/auth_screens/phone_signup.dart';
import 'package:kudibooks_app/screens/auth_screens/signup.dart';
import 'package:kudibooks_app/screens/dashboard/loads.dart';
import 'package:kudibooks_app/screens/splash_screen/green_splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => ProductSalesProvider()),
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => InventoryProviders()),
    ChangeNotifierProvider(create: (_) => ExpensesProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'KudiBooks',
      home: const GreenSplashScreen(),
      initialRoute: '/',
      routes: {
        '/login': (context) => const Login(),
        '/phoneLogin': (context) => PhoneLogin(),
        '/signup': (context) => SignUp(),
        '/phoneSignup': (context) => PhoneSignup(),
        '/otp': (context) => const OtpVerification(),
        '/loadInventories': (context) => Loads(),
      },
    );
  }
}
