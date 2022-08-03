import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/providers/user_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/dashboard/widget/alert_box.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';

class AlertScreen extends ConsumerStatefulWidget {
  String loggedUser;

  AlertScreen({required this.loggedUser, Key? key}) : super(key: key);

  @override
  ConsumerState<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends ConsumerState<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    User? signedUser = ref
        .watch(userProvider)
        .firstWhere((user) => user.phoneOrEmail == widget.loggedUser);
    return Scaffold(
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
    );
  }
}
