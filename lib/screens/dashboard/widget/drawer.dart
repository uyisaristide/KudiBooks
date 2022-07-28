import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/screens/auth_screens/login.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/dashboard/all_transaction.dart';
import 'package:kudibooks_app/screens/dashboard/client_list.dart';
import 'package:kudibooks_app/screens/dashboard/loads.dart';
import 'package:kudibooks_app/screens/dashboard/products.dart';
import 'package:kudibooks_app/screens/dashboard/reports.dart';
import 'package:kudibooks_app/screens/dashboard/settings_screen.dart';

class Drawers extends StatelessWidget {
  VoidCallback? dashboardScreen;
  User? userInfo;

  Drawers({this.dashboardScreen, this.userInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0Xff157253)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                      "assets/images/splash/kudibooks-WHITE-PNG-LOGO.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${userInfo!.firstName} ${userInfo!.lastName}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                        userInfo!.phoneOrEmail == null
                            ? ""
                            : userInfo!.phoneOrEmail!,
                        style: const TextStyle(color: Colors.white))
                  ],
                ),
              ],
            ),
          ),
          LimitedBox(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () => Navigator.pop(context),
                        leading: const Icon(Icons.home),
                        title: const Text("Home"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ProductsScreen())),
                        leading: const Icon(Icons.shopping_cart_outlined),
                        title: const Text("Products"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.push(context,
                            CupertinoPageRoute(builder: (context) => Loads())),
                        leading: const Icon(Icons.people),
                        title: const Text("Load Iventory"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ClientList())),
                        leading: const Icon(Icons.people),
                        title: const Text("Clients"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => AllTransaction())),
                        leading: const Icon(Icons.credit_card),
                        title: const Text("Transaction"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      const ListTile(
                        leading: Icon(Icons.shopping_bag_rounded),
                        title: Text("Vendors"),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const Reports())),
                        leading: const Icon(Icons.bar_chart_outlined),
                        title: const Text("Reports"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const Settings())),
                        leading: const Icon(Icons.notifications),
                        title: const Text("Settings"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      const ListTile(
                        leading: Icon(Icons.help),
                        title: Text("Help"),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      // const ListTile(
                      //   leading: Icon(Icons.info_outline),
                      //   title: Text("About"),
                      //   trailing: Icon(
                      //     Icons.arrow_forward_ios,
                      //     size: 15,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LoginButton(
                    text: 'Logout',
                    actionField: () {
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const Login()));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
