import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'widget/common_appBar.dart';
import 'widget/drawer.dart';

class MyAccountScreen extends ConsumerWidget {
  String? loggedUser;

  MyAccountScreen({this.loggedUser, Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef loadUser) {
    // User? signedUser = loadUser
    //     .watch(usersProvider)
    //     .firstWhere((user) => user.phoneOrEmail == loggedUser);
    return Scaffold(
      drawer: Drawers(),
      appBar: AppBarCommon.preferredSizeWidget(context, 'My Account'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                    // Text("${signedUser.firstName} ${signedUser.lastName}",
                    //     style: const TextStyle(
                    //         fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text("Firstname Lastname",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    // Text(
                    //     signedUser.phoneOrEmail == null
                    //         ? ""
                    //         : signedUser.phoneOrEmail!,
                    //     style: const TextStyle(
                    //       fontSize: 16,
                    //     )),
                    const Text("Phone and Email",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () => context.pushNamed('accountTransfer'),
                title: const Text('Billing details'),
                leading: const Icon(Icons.inventory),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                onTap: () => context.pushNamed('accountTransfer'),
                title: const Text('Company profile'),
                leading: const Icon(Icons.inventory),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                onTap: () => context.pushNamed('chartAccount'),
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
                onTap: () => context.pushNamed('settingScreens'),
                title: const Text('Settings'),
                leading: const Icon(Icons.inventory),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                onTap: () => context.pushNamed('settingScreens'),
                title: const Text('Help'),
                leading: const Icon(Icons.inventory),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                onTap: () => context.goNamed('signin'),
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
    );
  }
}
