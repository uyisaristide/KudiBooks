import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../alert_screen.dart';
import '../dashboard.dart';
import '../inventory.dart';
import '../my_account.dart';

class NavigationBottom extends StatefulWidget {

  const NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  List<Widget> get screens =>
      [
        const Dashboard(),
        InventoryScreen(),
        AlertScreen(),
        MyAccountScreen(),
      ];
  static int _currentIndex = 0;
  late PageController _pageController;

  // TabBarView _tabBarView;
  @override
  void initState() {
    _currentIndex = 0;
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: PageView(
            controller: _pageController,
            children: screens,
            onPageChanged: (newPage) =>
                setState(() {
                  _currentIndex = newPage;
                })),
        // body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            fixedColor: const Color(0xff157253),
            currentIndex: _currentIndex,
            onTap: (index) {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.easeInOut);
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.inventory_2_outlined),
                label: 'dashboard.bottom_nav.home'.tr(),
              ),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.folder),
                  label: 'dashboard.bottom_nav.inventory'.tr()),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.add_moderator),
                  label: 'dashboard.bottom_nav.alerts'.tr()),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.person_outline),
                  label: 'dashboard.bottom_nav.account'.tr()),
            ]),
        extendBodyBehindAppBar: true,
      ),
    );
  }
}
