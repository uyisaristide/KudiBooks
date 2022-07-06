import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';

class AccountTransfer extends StatelessWidget {
  AccountTransfer({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final transactionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: LoginButton(
                text: 'Transfer',
                actionField: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                }),
          )),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
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
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SelectInputType(
                  dropDownHint: const Text(
                    'Withdraw from',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  itemsToSelect: [],
                ),
                SelectInputType(
                  dropDownHint: const Text(
                    'Withdraw from',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  itemsToSelect: [],
                ),
                CustomFormField(
                    validators: (value) {
                      Validators.validateName(value);
                    },
                    hintText: 'Amount',
                    fieldController: nameController,
                    isShown: false,
                    inputType: TextInputType.streetAddress),
                SelectInputType(
                  dropDownHint: const Text(
                    'Withdraw from',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  itemsToSelect: [],
                ),
                CustomFormField(
                    fieldIcon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                    validators: (value) {
                      Validators.validateName(value);
                    },
                    hintText: 'Transaction date',
                    maxLining: 5,
                    fieldController: transactionController,
                    isShown: false,
                    inputType: TextInputType.datetime),
                CustomFormField(
                    validators: (value) {
                      Validators.validateName(value);
                    },
                    hintText: 'Transaction name',
                    fieldController: nameController,
                    isShown: false,
                    inputType: TextInputType.name),
                CustomFormField(
                    maxLining: 5,
                    validators: (value) {
                      Validators.validateName(value);
                    },
                    hintText: 'Memo',
                    fieldController: nameController,
                    isShown: false,
                    inputType: TextInputType.name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
