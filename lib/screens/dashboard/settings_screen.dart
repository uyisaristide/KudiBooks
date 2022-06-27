import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/widget/list_tile.dart';
import 'package:kudibooks_app/screens/dashboard/widget/title_double.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context)),
              automaticallyImplyLeading: true,
              elevation: 0.0,
              backgroundColor: const Color(0xff157253),
              centerTitle: true,
              title: const Text("Settings",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: const Text(
                  "Display",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              DoubleRowWidgets(
                leftSideWidget: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
                borderSidebottom: false,
                rightSideText: 'Theme',
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: const Text(
                  "Display",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'Inventory refill alert',
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'Billing updates',
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'Product expiration',
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'Other updates',
                borderSidebottom: false,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: const Text(
                  "Device permissions",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'SMS permission',
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'Camera permisson',
                borderSidebottom: false,
              ),
              const SizedBox(height: 50),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'Default data',
                borderSidebottom: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
