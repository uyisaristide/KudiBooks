import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:kudibooks_app/screens/dashboard/inventory_deduction.dart';
import 'package:kudibooks_app/screens/dashboard/new_expense.dart';
import 'package:kudibooks_app/screens/dashboard/new_inventory.dart';
import 'package:kudibooks_app/screens/dashboard/product_sale.dart';
import 'package:kudibooks_app/screens/dashboard/widget/action_card.dart';
import 'package:kudibooks_app/screens/dashboard/widget/card_dash_sm.dart';
import 'package:kudibooks_app/screens/dashboard/widget/card_dashboard.dart';
import 'package:kudibooks_app/screens/dashboard/widget/dash_header.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';
import 'package:kudibooks_app/screens/dashboard/widget/title_double.dart';

class Dashboard extends StatefulWidget {
  final VoidCallback? callBack;

  Dashboard({this.callBack, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawers(dashboardScreen: widget.callBack),
      body: Stack(
        children: [
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
                        "Actions",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          ActionCard(
                            cardIcon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            cardColor: const Color(0xff157253),
                            title: 'Sell',
                            actionClick: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => ProductSale())),
                          ),
                          ActionCard(
                            actionClick: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => NewInventory())),
                            cardIcon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            cardColor: const Color(0xffA70C4A),
                            title: 'New Load',
                          ),
                          ActionCard(
                            actionClick: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => NewExpense())),
                            cardIcon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            cardColor: const Color(0xffFDAB30),
                            title: 'Expenses',
                          ),
                          ActionCard(
                            actionClick: () => showModalBottomSheet(
                                isDismissible: false,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        topLeft: Radius.circular(15))),
                                context: context,
                                builder: (context) => SizedBox(
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
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                icon: const Icon(Icons.close)),
                                          ),
                                          ListTile(
                                            onTap: () => Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        InventoryDeduction())),
                                            leading: const Icon(Icons
                                                .create_new_folder_outlined),
                                            title: const Text(
                                              "Inventory reduction",
                                            ),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios,
                                            ),
                                          ),
                                          const ListTile(
                                            leading: Icon(Icons.credit_card),
                                            title: Text(
                                              "Client deposit",
                                            ),
                                            trailing: Icon(
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
                                          const ListTile(
                                            leading: Icon(Icons
                                                .create_new_folder_outlined),
                                            title: Text(
                                              "Account transfer",
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                            cardIcon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            cardColor: const Color(0xff61B76B),
                            title: 'More',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0, top: 5),
                      alignment: AlignmentDirectional.centerStart,
                      child: const Text(
                        "Sales",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Image.asset(
                        "assets/images/reportChart.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    DoubleHeader(
                      rightSide: "Recent Transactions",
                      iconButton2: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                      iconButton: const Text("View all"),
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
                                          ? "Approved"
                                          : "In process",
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
        ],
      ),
    );
    return BackgroundScreen(
      drawerWidget: Drawers(dashboardScreen: widget.callBack),
      appBars: AppBar(
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: ListTile(
                            onTap: () => Navigator.pop(context),
                            trailing: const Icon(
                              Icons.close,
                              size: 17,
                            ),
                            title: const Text(
                              "More menus",
                              style: TextStyle(fontSize: 12),
                            )),
                      ),
                      const PopupMenuItem(
                        child: ListTile(
                            leading: Icon(
                              Icons.create_new_folder_outlined,
                              size: 17,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                            ),
                            title: Text(
                              "Inventory reduction",
                              style: TextStyle(fontSize: 12),
                            )),
                      ),
                      const PopupMenuItem(
                        child: ListTile(
                            leading: Icon(
                              Icons.credit_card,
                              size: 17,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                            ),
                            title: Text(
                              "Client deposit",
                              style: TextStyle(fontSize: 12),
                            )),
                      ),
                      const PopupMenuItem(
                        child: ListTile(
                            leading: Icon(
                              Icons.credit_card,
                              size: 17,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                            ),
                            title: Text(
                              "Vendor deposit",
                              style: TextStyle(fontSize: 12),
                            )),
                      ),
                      const PopupMenuItem(
                        child: ListTile(
                            leading: Icon(
                              Icons.change_circle,
                              size: 17,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                            ),
                            title: Text(
                              "Account transfer",
                              style: TextStyle(fontSize: 12),
                            )),
                      ),
                    ])
          ],
          iconTheme: const IconThemeData(color: Color(0xff157253)),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Image.asset(
            "assets/images/splash/kudibooksLogo2.png",
            height: 150,
          )),
      paddingSize: 10,
      screens: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: DashboardHeader(),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 15, left: 15, bottom: 10),
            child: CardDashboard(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CardDashSmall(
                    lignColor: const Color(0xffFFDC99),
                    price: 166,
                    discount: 10,
                    containerIcon: const Icon(
                      Icons.bar_chart,
                      color: Color(0xffF2C94C),
                    ),
                    colorContainer: const Color(0xffEDF6EE),
                    stringTotal: 'Total Sales',
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: CardDashSmall(
                    lignColor: const Color(0xff219653),
                    price: 186,
                    discount: 30,
                    containerIcon: const Icon(
                      Icons.bar_chart,
                      color: Color(0xff43A047),
                    ),
                    colorContainer: const Color(0xffEDF6EE),
                    stringTotal: 'Total cost',
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15.0, bottom: 10.0, top: 5),
            alignment: AlignmentDirectional.centerStart,
            child: const Text(
              "Actions",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                ActionCard(
                  cardIcon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  cardColor: const Color(0xff157253),
                  title: 'Sell',
                ),
                const SizedBox(
                  width: 5,
                ),
                ActionCard(
                  cardIcon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  cardColor: const Color(0xffA70C4A),
                  title: 'New load',
                ),
                const SizedBox(
                  width: 5,
                ),
                ActionCard(
                  cardIcon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  cardColor: const Color(0xffFDAB30),
                  title: 'Expense',
                ),
                const SizedBox(
                  width: 5,
                ),
                ActionCard(
                  cardIcon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  cardColor: const Color(0xff61B76B),
                  title: 'More',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15.0, top: 5),
            alignment: AlignmentDirectional.centerStart,
            child: const Text(
              "Sales",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
            child: Image.asset(
              "assets/images/reportChart.png",
              fit: BoxFit.cover,
            ),
          ),
          DoubleHeader(
            rightSide: "Recent Transactions",
            iconButton2: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            ),
            iconButton: const Text("View all"),
          ),
          SizedBox(
              height: 400,
              child: ListView.separated(
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
                              index % 2 == 0 ? "Approved" : "In process",
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
                              fontWeight: FontWeight.bold, fontSize: 14),
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
                  itemCount: 15))
        ],
      ),
    );
  }
}
