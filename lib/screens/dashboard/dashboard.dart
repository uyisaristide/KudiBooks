import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:kudibooks_app/screens/dashboard/widget/card_dashboard.dart';
import 'package:kudibooks_app/screens/dashboard/widget/dash_header.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';
import 'package:kudibooks_app/screens/dashboard/widget/horizontal_line_container.dart';

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
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 10,
                                blurRadius: 15,
                                offset: const Offset(0, 3),
                              )
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            shape: BoxShape.rectangle,
                            color: Colors.white),
                        height: 136,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            HorizontalLine(lineColor: const Color(0xffFFDC99))
                          ],
                        )),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
