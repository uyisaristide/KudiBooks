import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/providers/user_provider.dart';
import 'package:kudibooks_app/screens/dashboard/account_transfer.dart';
import 'package:kudibooks_app/screens/dashboard/chart_of_account.dart';
import 'package:kudibooks_app/screens/dashboard/settings_screen.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';
import 'package:provider/provider.dart';
import 'widget/bottom_navigation.dart';

class MyAccountScreen extends StatelessWidget {
  String loggedUser;

  MyAccountScreen({required this.loggedUser, Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);
    User? signedUser = _userProvider.allUsers
        .firstWhere((user) => user.phoneOrEmail == loggedUser);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => NavigationBottom(
                      loggedUser: loggedUser,
                    )));
        // Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        drawer: Drawers(userInfo: signedUser),
        appBar: AppBarCommon.preferredSizeWidget(context, 'My Account'),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(30.0),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffC4C4C4)),
                          height: 85,
                          width: 85,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              const Positioned(
                                  left: 60,
                                  top: 60,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.grey,
                                  )),
                              Positioned(
                                child: Image.asset(
                                  "assets/images/categories/restaurentIcon.png",
                                  height: 54.0,
                                  width: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Text("${signedUser.firstName} ${signedUser.lastName}",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text(
                          signedUser.phoneOrEmail == null
                              ? ""
                              : signedUser.phoneOrEmail!,
                          style: const TextStyle(
                            fontSize: 16,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => AccountTransfer())),
                  title: const Text('Billing details'),
                  leading: const Icon(Icons.inventory),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
                ListTile(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => AccountTransfer())),
                  title: const Text('Company profile'),
                  leading: const Icon(Icons.inventory),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
                ListTile(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const ChartAccount())),
                  title: const Text('Chart of account'),
                  leading: const Icon(Icons.inventory),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('Refer & Earn'),
                  leading: const Icon(Icons.inventory),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('Edit profile'),
                  leading: const Icon(Icons.inventory),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('Change password'),
                  leading: const Icon(Icons.inventory),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
                ListTile(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const Settings())),
                  title: const Text('Settings'),
                  leading: const Icon(Icons.inventory),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
                ListTile(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const Settings())),
                  title: const Text('Help'),
                  leading: const Icon(Icons.inventory),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
                ListTile(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const Settings())),
                  title: const Text(
                    "Sign out",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffD16262)),
                  ),
                  leading: const Icon(Icons.inventory),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
