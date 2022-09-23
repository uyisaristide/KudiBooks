import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'widget/common_appBar.dart';
import 'widget/list_tile.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var selectedValue =
        context.locale.toString() == 'en_US' ? 'English' : 'French';
    print("Selected value: ${context.locale.toString()}");
    return Scaffold(
      appBar: AppBarCommon.preferredSizeWidget(
          context, "setting_screen.settings".tr()),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Text(
                  "setting_screen.display".tr(),
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              ListTile(
                title: const Text("setting_screen.theme").tr(),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (contextDialog) {
                        return AlertDialog(
                          actions: [
                            Column(children: [
                              RadioListTile(
                                  secondary: const CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/images/US.png"),
                                    radius: 15.0,
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  title: Text("setting_screen.english".tr()),
                                  value: "English",
                                  groupValue: selectedValue,
                                  onChanged: (value) async {
                                    selectedValue = "English";
                                    setState(() {
                                      context
                                          .setLocale(const Locale('en', 'US'));
                                    });

                                    Navigator.pop(contextDialog);
                                  }),
                              RadioListTile(
                                  secondary: const CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/images/RW.png"),
                                      radius: 15.0),
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  title: const Text("Kinyarwanda"),
                                  value: "Kinyarwanda",
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = "Kinyarwanda";
                                    });
                                  }),
                              RadioListTile(
                                  secondary: const CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/images/FR.png"),
                                      radius: 15.0),
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  title: Text("setting_screen.french".tr()),
                                  value: "French",
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = "French";
                                    });
                                    print(contextDialog.locale.toString());
                                    contextDialog
                                        .setLocale(const Locale('fr', 'FR'));
                                    Navigator.pop(contextDialog);
                                  }),
                            ]),
                          ],
                        );
                      });
                },
                title: Text("setting_screen.language".tr()),
                leading: const Icon(Icons.language),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Text(
                  "setting_screen.display".tr(),
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: DoubleRowWidgets(
                      leftSideWidget:
                          Switch(value: true, onChanged: (value) {}),
                      rightSideText: 'setting_screen.inventory'.tr(),
                      borderSidebottom: true,
                    ),
                  ),
                ],
              ),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'setting_screen.billing'.tr(),
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'setting_screen.product'.tr(),
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'setting_screen.updates'.tr(),
                borderSidebottom: false,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: const Text(
                  "setting_screen.permisions",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ).tr(),
              ),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'setting_screen.sms'.tr(),
                borderSidebottom: true,
              ),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'setting_screen.camera'.tr(),
                borderSidebottom: false,
              ),
              const SizedBox(height: 50),
              DoubleRowWidgets(
                leftSideWidget: Switch(value: true, onChanged: (value) {}),
                rightSideText: 'setting_screen.default'.tr(),
                borderSidebottom: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
