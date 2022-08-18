import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/Users/user_model.dart';
import '../../../providers/all_providers_list.dart';
import '../../auth_screens/widgets/login_button.dart';

class Drawers extends ConsumerWidget {
  VoidCallback? dashboardScreen;
  User? userInfo;

  Drawers({this.dashboardScreen, this.userInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
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
                  children: const [
                    Text(
                      "User Name",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text("Email", style: TextStyle(color: Colors.white))
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
                      const ListTile(
                        leading: Icon(Icons.home),
                        title: Text("Home"),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => context.pushNamed('screenProducts'),
                        leading: const Icon(Icons.shopping_cart_outlined),
                        title: const Text("Products"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => context.pushNamed('loadsScreens'),
                        leading: const Icon(Icons.people),
                        title: const Text("Load Inventory"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => context.pushNamed('clientList'),
                        leading: const Icon(Icons.people),
                        title: const Text("Clients"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => context.pushNamed('transactionAll'),
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
                        onTap: () => context.pushNamed('reports'),
                        leading: const Icon(Icons.bar_chart_outlined),
                        title: const Text("Reports"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => context.pushNamed('settingScreens'),
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
                    actionField: () async {
                      String response =
                      await ref.read(usersProvider.notifier).logout();
                      if (response == 'success') {
                        context.goNamed('signin');
                      } else {
                        debugPrint(response);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LoginButton(
                    text: 'Create Company',
                    actionField: () {
                      context.pushNamed('newCompany');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LoginButton(
                    text: 'Bank Login',
                    actionField: () {
                      context.pushNamed('signin');
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
