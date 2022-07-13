import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';

class NewAccount extends StatelessWidget {
  NewAccount({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> unitProduct = [];
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: LoginButton(
                text: 'Save account',
                actionField: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
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
                  SelectInputType(
                      dropDownHint: const Text(
                        'Account type',
                        style: TextStyle(color: Colors.grey),
                      ),
                      itemsToSelect: unitProduct),
                  CustomFormField(
                    validators: (value) {},
                    hintText: 'Account name',
                    isShown: false,
                    fieldController: nameController,
                  ),
                  CustomFormField(
                      validators: (value) {},
                      hintText: 'Code',
                      fieldController: nameController,
                      isShown: false),
                  CustomFormField(
                    maxLining: 5,
                    hintText: 'Note',
                    fieldController: nameController,
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
