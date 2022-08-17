import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/models/chart_of_account_model.dart';
import 'package:kudibooks_app/providers/all_providers_list.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/new_inventory.dart';
import 'package:kudibooks_app/screens/dashboard/widget/accountTypebottomSheet.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';

import '../../models/account_type.dart';
import 'classes/snack_bars.dart';

class NewAccount extends ConsumerStatefulWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  ConsumerState<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends ConsumerState<NewAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> unitProduct = ["Kigali", "Rwanda"];

  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final noteController = TextEditingController();
  var accountTypeController = TextEditingController();
  var expenseCategoryController = TextEditingController();

  int accountCode = 0;
  String selectedName = '';
  int selectedType = 0;
  int expenseCategoryId = 0;
  String expenseCategoryName = '';

  selectedValueFunction(AccountName accountName) {
    setState(() {
      accountCode = accountName.code;
      accountTypeController = TextEditingController(text: accountName.name);
      selectedType = accountName.type;
    });
  }

  selectedExpenseCategory(ExpenseCategory expenseCategory) {
    setState(() {
      expenseCategoryId = expenseCategory.id;
      expenseCategoryName = expenseCategory.name;
      expenseCategoryController =
          TextEditingController(text: expenseCategory.name);
    });
  }

  List<ExpenseCategory> expenseCategories = [];

  @override
  Widget build(BuildContext context) {
    debugPrint("$expenseCategoryId");
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: LoginButton(
                text: 'Save account',
                actionField: () async {
                  if (_formKey.currentState!.validate()) {
                    print('$selectedType');
                    var resp = await ref
                        .read(chartAccountProvider.notifier)
                        .registerChart(ChartAccountModel(
                            accountTypeSelected: accountCode,
                            accountName: nameController.text,
                            accountCode: codeController.text,
                            accountNote: noteController.text,
                            expenseCategory: expenseCategoryId != 0
                                ? expenseCategoryId
                                : null));
                    if (resp == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBars.snackBars(
                              'Chart of account saved successfully',
                              Colors.green.shade400));
                      context.pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBars.snackBars(
                              'Chart of account saved successfully',
                              Colors.red.shade400));
                    }
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
                  CustomFormField(
                    fieldIcon: const Icon(Icons.arrow_drop_down),
                    inputType: TextInputType.none,
                    calendarPicker: () => DialogBox.dialogBox(
                        AccountTypes(selectedValueFunction), context, 0.80),
                    validators: (value) {
                      if (value.toString().isEmpty) {
                        return "Enter account Name";
                      }
                      return null;
                    },
                    hintText: 'Select type',
                    isShown: false,
                    fieldController: accountTypeController,
                  ),
                  if (selectedType == 5)
                    CustomFormField(
                      fieldIcon: const Icon(Icons.arrow_drop_down),
                      inputType: TextInputType.none,
                      calendarPicker: () => DialogBox.dialogBox(
                          ExpenseCategories(selectedExpenseCategory),
                          context,
                          0.25),
                      validators: (value) {
                        if (value.toString().isEmpty) {
                          return "Enter account Name";
                        }
                        return null;
                      },
                      hintText: 'Select type',
                      isShown: false,
                      fieldController: expenseCategoryController,
                    )
                  else
                    Container(),
                  CustomFormField(
                    validators: (value) {
                      if (value.toString().isEmpty) {
                        return "Enter account Name";
                      }
                      return null;
                    },
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
