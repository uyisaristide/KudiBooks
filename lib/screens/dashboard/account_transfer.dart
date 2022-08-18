import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../auth_screens/validators/validator.dart';
import '../auth_screens/widgets/drop_down_widget.dart';
import '../auth_screens/widgets/login_button.dart';
import '../auth_screens/widgets/text_form_field.dart';
import 'widget/common_appBar.dart';

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
                    context.pop();
                  }
                }),
          )),
      appBar: AppBarCommon.preferredSizeWidget(context, "Account transfer"),
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
                  itemsToSelect: const [],
                ),
                SelectInputType(
                  dropDownHint: const Text(
                    'Withdraw to',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  itemsToSelect: const [],
                ),
                CustomFormField(
                    validators: (value) {
                      Validators.validateName(value);
                    },
                    hintText: 'Amount',
                    fieldController: nameController,
                    isShown: false,
                    inputType: TextInputType.streetAddress),
                CustomFormField(
                    fieldIcon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                    validators: (value) {
                      Validators.validateName(value);
                    },
                    hintText: 'Transaction date',
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
