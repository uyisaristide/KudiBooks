import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/Users/user_model.dart';
import '../../../models/utilities/network_info.dart';
import '../../../providers/all_providers_list.dart';
import '../../auth_screens/widgets/login_button.dart';
import '../classes/snack_bars.dart';

import '../../../models/Users/user_profile_model.dart';

class Drawers extends ConsumerStatefulWidget {
  VoidCallback? dashboardScreen;
  UserProfile? userInfo;

  Drawers({this.dashboardScreen, required this.userInfo, Key? key})
      : super(key: key);

  @override
  ConsumerState<Drawers> createState() => _DrawersState();
}

class _DrawersState extends ConsumerState<Drawers> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(userInHiveProvider.notifier).getUserFromHive();
    ref.read(companyProvider.notifier).getCompanyFromHive();
  }

  @override
  Widget build(BuildContext context) {
    var userProfile = ref.watch(userInHiveProvider.notifier).currentUser;
    var company = ref.watch(companyProvider.notifier).myCompany;

    print('now in company ${company!.companyName}');
    // Box<UserProfile> loggMeOut = Hive.box(userProfileBoxName);
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
                    IconButton(
                        onPressed: () {
                          var mode =
                              Theme.of(context).brightness == Brightness.light
                                  ? ThemeMode.dark
                                  : ThemeMode.light;
                          ref.read(modeProvider.notifier).func(mode);
                        },
                        icon: const Icon(Icons.dark_mode))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${userProfile!.lastName}  ${userProfile.firstName} ",
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(userProfile.email,
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
                        title: Text("dashboard.bottom_nav.home".tr()),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => context.pushNamed('screenProducts'),
                        leading: const Icon(Icons.shopping_cart_outlined),
                        title: Text("dashboard.inventory_screen.product".tr()),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => context.pushNamed('loadsScreens'),
                        leading: const Icon(Icons.people),
                        title: Text("dashboard.drawer.load_inventory".tr()),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => context.pushNamed('clientList'),
                        leading: const Icon(Icons.people),
                        title: Text("dashboard.drawer.client".tr()),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
<<<<<<< HEAD
                        onTap: () => context.pushNamed('transactionsAll'),
=======
                        onTap: () {},
>>>>>>> 39b1895d71f9f30293927ea113498717da5f5883
                        leading: const Icon(Icons.credit_card),
                        title: Text("dashboard.drawer.transaction".tr()),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: ()=>context.pushNamed('vendors'),
                        leading: const Icon(Icons.shopping_bag_rounded),
                        title: const Text("dashboard.drawer.vendors").tr(),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => context.pushNamed('reports'),
                        leading: const Icon(Icons.bar_chart_outlined),
                        title: const Text("dashboard.drawer.reports").tr(),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        onTap: () => context.pushNamed('settingScreens'),
                        leading: const Icon(Icons.notifications),
                        title: Text("dashboard.account_screen.settings".tr()),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.help),
                        title: Text("dashboard.account_screen.help".tr()),
                        trailing: const Icon(
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
                    text: 'dashboard.account_screen.sign_out'.tr(),
                    actionField: () async {
                      var response =
                          await ref.read(logoutProvider.notifier).logout();
                      if (response.networkStatus == NetworkStatus.success) {
                        ref
                            .read(userInHiveProvider.notifier)
                            .deleUserFromHive();
                        context.goNamed('signin');
<<<<<<< HEAD
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBars.snackBars('${response.errorMessage}',
                                Colors.redAccent.shade400));
=======
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBars.snackBars(response.getErrorMessage, Colors.redAccent.shade400));
>>>>>>> 39b1895d71f9f30293927ea113498717da5f5883
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LoginButton(
                    text: 'switch company',
                    actionField: () {
                      context.pushNamed('companiesScreen');
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
