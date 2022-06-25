import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/alert_screen.dart';
import 'package:kudibooks_app/screens/dashboard/dashboard.dart';
import 'package:kudibooks_app/screens/dashboard/inventory.dart';
import 'package:kudibooks_app/screens/dashboard/my_account.dart';

class NavigationBottom extends StatefulWidget {
  NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  List<Widget> get screens => [
        Dashboard(
            callBack: () => setState(() {
                  currentIndex = 0;
                })),
        InventoryScreen(),
        const AlertScreen(),
        MyAccountScreen(),
      ];

  static int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          fixedColor: const Color(0xff157253),
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.inventory_2_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder), label: 'Inventory'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_moderator), label: 'Alerts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Account'),
          ]),
      extendBodyBehindAppBar: true,
    );
  }
}
