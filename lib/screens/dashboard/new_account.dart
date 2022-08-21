import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/account_details_model.dart';
import '../../models/chart_of_account_model.dart';
import '../../providers/all_providers_list.dart';
import '../auth_screens/widgets/login_button.dart';
import '../auth_screens/widgets/text_form_field.dart';
import 'new_inventory.dart';
import 'widget/accountTypebottomSheet.dart';
import 'widget/common_appBar.dart';
import '../../models/account_type.dart';
import 'classes/snack_bars.dart';

class NewAccount extends ConsumerStatefulWidget {
  int? accountId;

  NewAccount({Key? key, this.accountId}) : super(key: key);

  @override
  ConsumerState<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends ConsumerState<NewAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> unitProduct = ["Kigali", "Rwanda"];

  var nameController = TextEditingController();
  var codeController = TextEditingController();
  var noteController = TextEditingController();
  var accountTypeController = TextEditingController();
  var expenseCategoryController = TextEditingController();

  int accountCode = 0;
  String selectedName = '';
  int selectedType = 0;
  int expenseCategoryId = 0;
  String expenseCategoryName = '';
  bool _loading = false;

  selectedValueFunction(AccountName accountName) {
    setState(() {
      accountCode = accountName.code;
      accountTypeController = TextEditingController(text: accountName.name);
      selectedType = accountName.type;
    });
  }

  AccountDetailsModel? accountDetailsModel;

  selectedExpenseCategory(ExpenseCategory expenseCategory) {
    setState(() {
      expenseCategoryId = expenseCategory.id;
      expenseCategoryName = expenseCategory.name;
      expenseCategoryController =
          TextEditingController(text: expenseCategory.name);
    });
  }

  AccountDetailsModel? dataStatus;

  void accountDetailsData() async {
    setState(() {
      _loading = true;
    });

    if (widget.accountId != 0) {
      var model = await ref
          .read(accountDetailsProvider.notifier)
          .accountDetailsData(int.parse(widget.accountId.toString()));
    }
    setState(() {
      _loading = false;
    });
  }

  List<ExpenseCategory> expenseCategories = [];

  @override
  void initState() {
    super.initState();
    accountDetailsData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var detailsAccounts = ref.watch(accountDetailsProvider);
    if (detailsAccounts != null && widget.accountId != 0) {
      debugPrint('${detailsAccounts.accountDetails.expenseCategory}');
      accountTypeController.text = detailsAccounts.accountSelected.name;
      codeController.text = detailsAccounts.accountDetails.code;
      nameController.text = detailsAccounts.accountDetails.name;
      noteController.text = detailsAccounts.accountDetails.note;
        selectedType = detailsAccounts.accountSelected.type == 5 ?detailsAccounts.accountSelected.type:0;
        debugPrint("Expenses: ${expenseCategoryController.text}");
    }
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
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
