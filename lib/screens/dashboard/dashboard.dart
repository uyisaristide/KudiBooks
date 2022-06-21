import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:kudibooks_app/screens/dashboard/widget/action_card.dart';
import 'package:kudibooks_app/screens/dashboard/widget/card_dash_sm.dart';
import 'package:kudibooks_app/screens/dashboard/widget/card_dashboard.dart';
import 'package:kudibooks_app/screens/dashboard/widget/dash_header.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      drawerWidget: Drawers(),
      appBars: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            )
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
      screens: SizedBox(
        height: 800,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: DashboardHeader(),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: CardDashboard(),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
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
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
              alignment: AlignmentDirectional.centerStart,
              child: const Text(
                "Actions",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
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
            )
          ],
        ),
      ),
    );
  }
}
