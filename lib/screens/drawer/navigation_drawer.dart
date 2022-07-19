import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/drawer/widgets/drawer_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              DrawerListItem(
                  itemName: 'Home',
                  leadingIcon: Icons.home_repair_service_outlined,
                  navigateTo: () {}),
              DrawerListItem(
                  itemName: 'Products',
                  leadingIcon: Icons.shopping_cart,
                  navigateTo: () {}),
              DrawerListItem(
                  itemName: 'Clients',
                  leadingIcon: Icons.people_alt,
                  navigateTo: () {}),
              DrawerListItem(
                  itemName: 'Transactions',
                  leadingIcon: Icons.now_widgets,
                  navigateTo: () {}),
              DrawerListItem(
                  itemName: 'Vendors',
                  leadingIcon: Icons.shopping_bag,
                  navigateTo: () {}),
              DrawerListItem(
                  itemName: 'Reports',
                  leadingIcon: Icons.bar_chart,
                  navigateTo: () {}),
              DrawerListItem(
                  itemName: 'Setting',
                  leadingIcon: Icons.notifications,
                  navigateTo: () {}),
              DrawerListItem(
                  itemName: 'Help', leadingIcon: Icons.help, navigateTo: () {}),

            ],
          ),
        ),
      ),
    );
  }
}
