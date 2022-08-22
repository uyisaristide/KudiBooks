import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/account_details_model.dart';
import '../../models/chart_of_account_model.dart';
import '../../models/utilities/network_info.dart';
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

  var accountNameProvider = StateProvider<AccountName?>((ref) => null);
  var expenseCategoryProvider = StateProvider<ExpenseCategory?>((ref) => null);

  var nameController = TextEditingController();
  var codeController = TextEditingController();
  var noteController = TextEditingController();
  var accountTypeController = TextEditingController();
  var expenseCategoryController = TextEditingController();
  var selectedType = 0;
  selectedValueFunction(AccountName accountName) {
    ref.read(accountNameProvider.notifier).state = accountName;
    accountTypeController.text = accountName.name;
    selectedType = accountName.type;
  }

  selectedExpenseCategory(ExpenseCategory expenseCategory) {
    ref.read(expenseCategoryProvider.notifier).state = expenseCategory;
    expenseCategoryController.text = expenseCategory.name;
  }

  void accountDetailsData() async {
    ref.read(accountDetailsProvider.notifier).accountDetailsData(int.parse(widget.accountId.toString()));
  }

  List<ExpenseCategory> expenseCategories = [];

  @override
  void initState() {
    super.initState();
    if (widget.accountId != 0) {
      accountDetailsData();
    }
  }

  populateData() {
    var details = ref.read(accountDetailsProvider);
    // accountTypeController.text = details!.accountSelected.name;
    // codeController.text = details.accountDetails.code;
    // nameController.text = details.accountDetails.name;
    // noteController.text = details.accountDetails.note;
    // selectedType = details.accountSelected.type == 5 ? 5 : details.accountSelected.type;
    // expenseCategoryController.text =
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    print("selected type: $selectedType");
    var accountName = ref.watch(accountNameProvider);
    var detailsAccounts = ref.watch(accountDetailsProvider);
    ref.listen<NetworkInfo<AccountDetailsModel?>>(accountDetailsProvider, (previous, next) {
      if (widget.accountId != 0) {
        populateData();
      }
    });

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: LoginButton(
                text: widget.accountId == 0 ? "Save account" : "Edit account",
                actionField: () async {
                  if (_formKey.currentState!.validate()) {
                    if (widget.accountId == 0) {
                      var resp = await ref
                          .read(chartAccountProvider.notifier)
                          .registerChart(ChartAccountModel(
                              accountTypeSelected:
                                  ref.watch(accountNameProvider)!.code,
                              accountName: nameController.text,
                              accountCode: codeController.text,
                              accountNote: noteController.text,
                              expenseCategory:
                                  ref.watch(expenseCategoryProvider)!.id != 0
                                      ? ref.watch(expenseCategoryProvider)!.id
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

                    } else if (widget.accountId != 0) {
                      var editChart = await ref
                          .read(chartAccountProvider.notifier)
                          .updateChartAccount(
                              chartAccountModel: ChartAccountModel(
                                  accountTypeSelected: ref.watch(accountNameProvider)!.type,
                                  accountName: nameController.text,
                                  accountCode: codeController.text,
                                  accountNote: noteController.text,
                                  expenseCategory:
                                  ref.watch(expenseCategoryProvider)!.id != 0
                                  ? ref.watch(expenseCategoryProvider)!.id
                                  : null));
                      if (editChart == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBars.snackBars(
                                'Chart of account edited successfully',
                                Colors.green.shade400));
                        context.pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBars.snackBars(
                                'Not',
                                Colors.red.shade400));
                      }
                    }
                }),
          )),
      appBar: AppBarCommon.preferredSizeWidget(
          context, widget.accountId == 0 ? "Save account" : "Edit account"),
      body: detailsAccounts == null && widget.accountId !=0
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.green.shade400,
            ))
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
