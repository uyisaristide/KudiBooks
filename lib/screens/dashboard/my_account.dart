import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/account_transfer.dart';
import 'package:kudibooks_app/screens/dashboard/chart_of_account.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';
import 'package:kudibooks_app/screens/dashboard/widget/list_tile.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawers(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              // leading: IconButton(
              //     icon: const Icon(Icons.arrow_back_ios),
              //     onPressed: () => Navigator.pop(context)),
              automaticallyImplyLeading: true,
              elevation: 0.0,
              backgroundColor: const Color(0xff157253),
              centerTitle: true,
              title: const Text("Account transfer",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
                    const Text("Customer name",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              DoubleRowWidgets(
                leftSideWidget: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => AccountTransfer())),
                ),
                rightSideText: 'Billing details',
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
                rightSideText: 'Company profile',
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const ChartAccount())),
                ),
                rightSideText: 'Chart of account',
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
                rightSideText: 'Refer & Earn',
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
                rightSideText: 'Edit profile',
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
                rightSideText: 'Change password',
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
                rightSideText: 'Settings',
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
                rightSideText: 'Help',
                borderSidebottom: true,
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffD16262)),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
