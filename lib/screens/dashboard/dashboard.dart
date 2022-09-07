import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:kudibooks_app/providers/all_providers_list.dart';
// import 'package:kudibooks_app/screens/dashboard/widget/action_card.dart';
// import 'package:kudibooks_app/screens/dashboard/widget/business_movement_cart.dart';
// import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';
// import 'package:kudibooks_app/screens/dashboard/widget/line_chart.dart';
// import 'package:kudibooks_app/screens/dashboard/widget/pie_chart.dart';
import '../../providers/all_providers_list.dart';
import '../../providers/user_provider.dart';
import 'widget/title_double.dart';

import 'package:hive/hive.dart';
import 'widget/action_card.dart';
import 'widget/drawer.dart';
import 'widget/line_chart.dart';
import 'widget/pie_chart.dart';
import 'widget/title_double.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  // final List<BusinessMovement> chartData = BusinessMovement.data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ref.read(userInHiveProvider.notifier).getUserFromHive();
  }

  @override
  Widget build(BuildContext context) {
    var currentux = ref.read(userInHiveProvider.notifier).getUserFromHive();
    var signedUser = ref.watch(userProfileProvider).data;
    var currentUser = ref.watch(userInHiveProvider.notifier).currentUser;
    myToken = currentUser!.token;
    debugPrint(myToken);
    ref.read(companyProvider.notifier).getCompaniesList();

    // var signedUser=currentux
    // debugPrint("Logged user is: ${signedUser!.userName}");

    // debugPrint("Logged user is: ${Hive.box('tokens').get('token')}");

    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: Drawers(userInfo: signedUser),
        body: Stack(children: [
          Positioned(
              top: 150,
              left: 250,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(color: Colors.green),
              )),
          Positioned(
              top: 30,
              left: 60,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(color: Colors.amber),
              )),
          Positioned(
              top: 200,
              left: -80,
              child: Container(
                height: 200,
                width: 100,
                decoration: const BoxDecoration(color: Colors.amber),
              )),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 90.0),
            child: Container(
              color: Colors.white.withOpacity(.0),
            ),
          ),
          NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                      pinned: innerBoxIsScrolled ? true : false,
                      iconTheme: IconThemeData(
                          color: innerBoxIsScrolled
                              ? Colors.white
                              : const Color(0xff157253)),
                      elevation: 0.0,
                      backgroundColor: innerBoxIsScrolled
                          ? const Color(0xff157253)
                          : Colors.transparent,
                      centerTitle: true,
                      title: innerBoxIsScrolled
                          ? Image.asset(
                              "assets/images/splash/kudibooks-WHITE-PNG-LOGO.png",
                              height: 150,
                            )
                          : Image.asset(
                              "assets/images/splash/kudibooksLogo2.png",
                              height: 150,
                            )),
                ];
              },
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 15.0, bottom: 10.0, top: 30),
                      alignment: AlignmentDirectional.centerStart,
                      child: const Text(
                        "dashboard.home.action",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ).tr(),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ActionCard(
                            actionClick: () => context.pushNamed('sell'),
                            cardIcon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            cardColor: const Color(0xff157253),
                            title: 'dashboard.home.sell'.tr(),
                            titleColor: Colors.white,
                          ),
                          ActionCard(
                            actionClick: () =>
                                context.pushNamed('createInventory'),
                            cardIcon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            cardColor: const Color(0xffA70C4A),
                            title: 'dashboard.home.newLoad'.tr(),
                            titleColor: Colors.white,
                          ),
                          ActionCard(
                            titleColor: Colors.white,
                            actionClick: () =>
                                context.pushNamed('createExpense'),
                            cardIcon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            cardColor: const Color(0xffFDAB30),
                            title: 'dashboard.home.expenses'.tr(),
                          ),
                          ActionCard(
                            titleColor: Colors.white,
                            actionClick: () => showModalBottomSheet(
                                isDismissible: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        topLeft: Radius.circular(15))),
                                context: context,
                                builder: (context) => _modalForMore(context)),
                            cardIcon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            cardColor: const Color(0xff61B76B),
                            title: 'dashboard.home.more'.tr(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 10, bottom: 10),
                      alignment: AlignmentDirectional.centerStart,
                      child: const Text(
                        "dashboard.home.sales",
                        style: TextStyle( fontSize: 17.0, fontWeight: FontWeight.bold),
                      ).tr(),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.only(left: 15, right: 15),
                    //   height: 300,
                    //   width: MediaQuery.of(context).size.width,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(5.0)),

                    //   child: DeveloperCharts(data: chartData),
                    // ),

                    //   // child: DeveloperCharts(data: chartData),
                    // ),
                    const CustomPieChart(),

                    Container(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: LignChartObject(),
                    ),
                    // const LineChartIndicator(),

                    DoubleHeader(
                      rightSide: "dashboard.home.recentTransaction".tr(),
                      iconButton2: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                      iconButton: InkWell(
                          onTap: () => context.pushNamed('transactionsAll'),
                          child: const Text("dashboard.home.view_all").tr()),
                    ),
                    LimitedBox(
                      maxHeight: 800,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => ListTile(
                                subtitle: const Text("20 April 2022"),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "\$25.99",
                                    ),
                                    Text(
                                      index % 2 == 0
                                          ? "dashboard.home.approved".tr()
                                          : "dashboard.home.in_process".tr(),
                                      style: TextStyle(
                                        color: index % 2 == 0
                                            ? Colors.green
                                            : Colors.amber,
                                      ),
                                    )
                                  ],
                                ),
                                title: const Text(
                                  "Transaction name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: const Color(0xffC4C4C4),
                                  child: Text(
                                    "${++index}",
                                    style: TextStyle(
                                        color: index % 2 == 0
                                            ? Colors.amber
                                            : Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                          separatorBuilder: (_, idx) => const SizedBox(
                                height: 5,
                              ),
                          itemCount: 10),
                    )
                  ],
                ),
              ))
        ]));
  }

  _modalForMore(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          ListTile(
            title: const Text(
              "More menus",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
                onPressed: () => context.pop(), icon: const Icon(Icons.close)),
          ),
          ListTile(
            onTap: () => context.pushNamed('inventoryDeduction'),
            leading: const Icon(Icons.create_new_folder_outlined),
            title: const Text(
              "Inventory reduction",
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          ListTile(
            onTap: () => context.pushNamed('depositClient'),
            leading: const Icon(Icons.credit_card),
            title: const Text(
              "Client deposit",
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.credit_card),
            title: Text(
              "Vendor deposit",
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          ListTile(
            onTap: () => context.pushNamed('accountTransfer'),
            leading: const Icon(Icons.create_new_folder_outlined),
            title: const Text(
              "Account transfer",
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
    );
  }
}
