import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth_screens/widgets/custom_devider.dart';
import 'widget/alert_box.dart';
import 'widget/common_appBar.dart';
import 'widget/drawer.dart';

class AlertScreen extends ConsumerStatefulWidget {
  String? loggedUser;

  AlertScreen({this.loggedUser, Key? key}) : super(key: key);

  @override
  ConsumerState<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends ConsumerState<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    // User? signedUser = ref
    //     .watch(usersProvider)
    //     .firstWhere((user) => user.phoneOrEmail == widget.loggedUser);
<<<<<<< HEAD

    var signedUser = ref.watch(userProfileProvider.notifier).myUserProfile;
=======
>>>>>>> 4fa982bd7a709896c57fdbb1d145786bac93220f
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawers(),
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
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 20.0),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  child: const Text("Action"),
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
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 20.0),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  child: const Text("Action"),
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
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 20.0),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  child: const Text("Action"),
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
