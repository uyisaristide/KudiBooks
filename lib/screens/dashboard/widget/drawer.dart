import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/Users/user_model.dart';
import '../../../models/utilities/network_info.dart';
import '../../../providers/all_providers_list.dart';
import '../../auth_screens/widgets/login_button.dart';
import '../classes/snack_bars.dart';

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
                Row(
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
                    const Spacer(),
                    IconButton(onPressed: (){
                      var mode = Theme.of(context).brightness == Brightness.light ? ThemeMode.dark : ThemeMode.light;
                      ref.read(modeProvider.notifier).func(mode);
                    }, icon: const Icon(Icons.dark_mode))
                  ],
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
                      ListTile(
                        onTap: ()=>context.pushNamed('vendors'),
                        leading: const Icon(Icons.shopping_bag_rounded),
                        title: const Text("Vendors"),
                        trailing: const Icon(
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
                      var response = await ref.read(logoutProvider.notifier).logout();
                      if(response.networkStatus == NetworkStatus.success){
                        context.goNamed('signin');
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBars.snackBars('${response.getErrorMessage}', Colors.redAccent.shade400));
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
