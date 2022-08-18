import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/chart_of_account_model.dart';
import '../auth_screens/widgets/text_form_field.dart';
import 'widget/accountTypebottomSheet.dart';
import 'widget/common_appBar.dart';
import '../../models/account_type.dart';
import '../../providers/all_providers_list.dart';
import '../auth_screens/widgets/login_button.dart';
import 'classes/snack_bars.dart';
import 'new_inventory.dart';

class EditCharts extends ConsumerStatefulWidget {
  // AccountName accountNameExtra;
  const EditCharts({Key? key}) : super(key: key);

  @override
  ConsumerState<EditCharts> createState() => _EditChartsState();
}

class _EditChartsState extends ConsumerState<EditCharts> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // accountTypeController = TextEditingController(text: widget.accountNameExtra.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: LoginButton(
                text: 'Edit Chart',
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
      appBar:
          AppBarCommon.preferredSizeWidget(context, "Edit Charts of accounts"),
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
