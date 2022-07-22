import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/providers/user_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/dashboard/widget/alert_box.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';
import 'package:provider/provider.dart';

import 'widget/bottom_navigation.dart';

class AlertScreen extends StatefulWidget {
  String loggedUser;

  AlertScreen({required this.loggedUser, Key? key}) : super(key: key);

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);
    User? signedUser = _userProvider.allUsers.firstWhere((user) => user.phoneOrEmail == widget.loggedUser);
    return WillPopScope(
      onWillPop: () async {
        print('cant pop');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => NavigationBottom(loggedUser: widget.loggedUser,)));
        // Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        drawerEnableOpenDragGesture: true,
        drawer: Drawers(userInfo: signedUser),
        appBar: AppBarCommon.preferredSizeWidget(context, "Alerts"),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                CustomDevider(
                  middleText: 'Today at 12:50',
                  horizotalPadding: 0.0,
                  verticalPadding: 0.0,
                ),
                AlertCard(
                  cardTitle: 'Inventory alert',
                  bodyCard:
                      'Hey, you are running out of inventory items in this product, stock in ASAP',
                  topLignColor: const Color(0xffC66666),
                  actionButton: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Action"),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13.0, horizontal: 20.0),
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                  ),
                  cancelButton: TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13.0, horizontal: 20.0),
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                    onPressed: () {},
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                CustomDevider(
                  middleText: 'Thursday 12 Apr 09:18',
                  horizotalPadding: 0.0,
                  verticalPadding: 0.0,
                ),
                AlertCard(
                  topLignColor: const Color(0xffFAC577),
                  bodyCard:
                      'Hey, you are running out of inventory items in this product, stock in ASAP',
                  cardTitle: 'Important alert',
                  actionButton: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Action"),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13.0, horizontal: 20.0),
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                  ),
                  cancelButton: TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13.0, horizontal: 20.0),
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                    onPressed: () {},
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                AlertCard(
                  topLignColor: const Color(0xffFAC577),
                  bodyCard:
                      'Hey, you are running out of inventory items in this product, stock in ASAP',
                  cardTitle: 'Important alert',
                  actionButton: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Action"),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13.0, horizontal: 20.0),
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                  ),
                  cancelButton: TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13.0, horizontal: 20.0),
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                    onPressed: () {},
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
