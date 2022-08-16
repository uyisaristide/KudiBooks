import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/providers/all_providers_list.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/new_inventory.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';

import '../../models/account_type.dart';

class NewAccount extends ConsumerStatefulWidget {
  NewAccount({Key? key}) : super(key: key);

  @override
  ConsumerState<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends ConsumerState<NewAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> unitProduct = ["Kigali", "Rwanda"];

  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final noteController = TextEditingController();
  final accountTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // List unit = ref.read(chartAccountProvider.notifier).listOfCharts();
    // print("This is list: ${unit.length}");
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: LoginButton(
                text: 'Save account',
                actionField: () async {
                  // if (_formKey.currentState!.validate()) {
                  //   context.pop();
                  // }
                }),
          )),
      appBar: AppBarCommon.preferredSizeWidget(context, "New account"),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomFormField(
                    calendarPicker: () => showModalBottomSheet(
                        isDismissible: false,
                        isScrollControlled: true,
                        elevation: 0.0,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                        context: context,
                        builder: (context) {
                          return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.80,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: FutureBuilder<List<AccountChartModel>>(
                                  future: ref.read(chartAccountProvider.notifier).listOfCharts(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.none &&
                                        snapshot.hasData == null) {
                                      return Container();
                                    }
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Container(
                                          height: 20,
                                          width: 20,
                                          child: const CircularProgressIndicator());
                                    }
                                    if (snapshot.hasError) {
                                      debugPrint("${snapshot.error}");
                                      return Center(
                                        child: Text("${snapshot.error}"),
                                      );
                                    }
                                    return LimitedBox(
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    padding: const EdgeInsets.all(10.0),
                                                    color: Colors.grey.shade600,
                                                    child: Text(
                                                      snapshot.data![index].accountCategory,
                                                      style: const TextStyle(fontSize: 16.0),
                                                    )),
                                                Column(
                                                  children: snapshot.data![index].accountName
                                                      .map((e) => InkWell(
                                                    hoverColor: Colors.redAccent.shade400,
                                                    onTap: () {
                                                      debugPrint("${e} type");
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: Text(
                                                        e.name,
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(),
                                                      ),
                                                    ),
                                                  ))
                                                      .toList(),
                                                ),
                                              ],
                                            );
                                          },
                                          separatorBuilder: ((context, idx) => const SizedBox(
                                            height: 10.0,
                                          )),
                                          itemCount: snapshot.data!.length),
                                    );
                                  },
                                ),
                              ));
                        }),
                    // calendarPicker: () => DialogBox.dialogBox(
                    //     const AccountTypes(), context, 0.80),
                    validators: (value) {},
                    hintText: 'Account type',
                    isShown: false,
                    fieldController: accountTypeController,
                  ),
                  CustomFormField(
                    validators: (value) {},
                    hintText: 'Account name',
                    isShown: false,
                    fieldController: nameController,
                  ),
                  CustomFormField(
                      validators: (value) {},
                      hintText: 'Code',
                      fieldController: codeController,
                      isShown: false),
                  CustomFormField(
                    maxLining: 5,
                    hintText: 'Note',
                    fieldController: noteController,
                    isShown: false,
                    validators: (value) {},
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class AccountTypes extends ConsumerStatefulWidget {
  const AccountTypes({Key? key}) : super(key: key);

  @override
  ConsumerState<AccountTypes> createState() => _AccountTypesState();
}

class _AccountTypesState extends ConsumerState<AccountTypes> {
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<List<AccountChartModel>>(
        future: ref.read(chartAccountProvider.notifier).listOfCharts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            return Container();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                height: 20,
                width: 20,
                child: const CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            debugPrint("${snapshot.error}");
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return LimitedBox(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10.0),
                          color: Colors.grey.shade600,
                          child: Text(
                            snapshot.data![index].accountCategory,
                            style: const TextStyle(fontSize: 16.0),
                          )),
                      Column(
                        children: snapshot.data![index].accountName
                            .map((e) => InkWell(
                                  hoverColor: Colors.redAccent.shade400,
                                  onTap: () {
                                    debugPrint("${e} type");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      e.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  );
                },
                separatorBuilder: ((context, idx) => const SizedBox(
                      height: 10.0,
                    )),
                itemCount: snapshot.data!.length),
          );
        },
      ),
    );
  }
}
