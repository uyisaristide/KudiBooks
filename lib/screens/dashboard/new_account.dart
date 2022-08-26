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
import "package:collection/collection.dart";

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
  int accountSelected = 0;
  int? selectedCategory;

  selectedValueFunction(AccountName accountName) {
    var accountNames =
        ref.read(accountNameProvider.notifier).state = accountName;
    accountTypeController.text = accountName.name;
    selectedType = accountNames.type == 5
        ? selectedType = 5
        : selectedType = accountNames.type;
    accountSelected = accountNames.code;
  }

  selectedExpenseCategory(ExpenseCategory expenseCategory) {
    ref.read(expenseCategoryProvider.notifier).state = expenseCategory;
    expenseCategoryController.text = expenseCategory.name;
    selectedCategory = expenseCategory.id;
  }

  void accountDetailsData() async {
    ref.read(accountDetailsProvider.notifier).accountDetailsData(int.parse(widget.accountId.toString()));
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(chartAccountProvider.notifier).listOfCharts();
      if (widget.accountId != 0) {
        accountDetailsData();
      }
    });
  }

  populateData() {
    ref.watch(expenseCategoryProvider);
    var details = ref.watch(accountDetailsProvider);
    var requiredData = ref.watch(chartAccountProvider);
    if (details.networkStatus == NetworkStatus.success) {
      var category = requiredData.data
          ?.singleWhere((element) => element.accountType == 5)
          .expenseCategories
          .singleWhereOrNull((element) =>
              element.id == details.data?.accountDetails.expenseCategory);
      // debugPrint("${category?.name}");

      accountTypeController.text = details.data?.accountSelected.name ?? '';
      codeController.text = details.data?.accountDetails.code ?? '';
      nameController.text = details.data?.accountDetails.name ?? '';
      noteController.text = details.data?.accountDetails.note ?? '';
      expenseCategoryController.text = category!.name;
      selectedType = details.data?.accountSelected.type == 5
          ? selectedType = 5
          : selectedType;
      accountSelected = details.data?.accountSelected.code ?? accountSelected;
      selectedCategory = category.id;
      // debugPrint("This is: $selectedType");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(accountNameProvider);
    debugPrint( "in build selected: $accountSelected and selected category is: $selectedCategory}");
    var detailsAccounts = ref.watch(accountDetailsProvider);
    var requiredData = ref.watch(chartAccountProvider);

    ref.listen<NetworkInfo<AccountDetailsModel?>>(accountDetailsProvider,
        (previous, next) {
      if (next.networkStatus == NetworkStatus.success) {
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
                              note: noteController.text,
                              expenseCategory: selectedCategory));
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
                    } else if (widget.accountId != 0) {
                      var editChart = await ref
                          .read(chartAccountProvider.notifier)
                          .updateChartAccount(
                              id: widget.accountId != 0
                                  ? int.parse(widget.accountId.toString())
                                  : 0,
                              chartAccountModel: ChartAccountModel(
                                  accountTypeSelected: accountSelected,
                                  accountName: nameController.text,
                                  accountCode: codeController.text,
                                  note: noteController.text,
                                  expenseCategory: selectedType == 5
                                      ? selectedCategory
                                      : null));
                      if (editChart == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBars.snackBars(
                                'Chart of account edited successfully',
                                Colors.green.shade400));
                        context.pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBars.snackBars('Can not update $editChart',
                                Colors.red.shade400));
                      }
                    }
                  }
                }),
          )),
      appBar: AppBarCommon.preferredSizeWidget(
          context, widget.accountId == 0 ? "Save account" : "Edit account"),
      body: widget.accountId == 0
          ? SingleChildScrollView(
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
              ))
          : detailsAccounts.networkStatus == NetworkStatus.success || requiredData.networkStatus == NetworkStatus.success
              ? SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(
                vertical: 15, horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomFormField(
                    fieldIcon: const Icon(Icons.arrow_drop_down),
                    inputType: TextInputType.none,
                    calendarPicker: () => DialogBox.dialogBox(
                        AccountTypes(selectedValueFunction),
                        context,
                        0.80),
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
                          ExpenseCategories(
                              selectedExpenseCategory),
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
          ))
              : detailsAccounts.networkStatus == NetworkStatus.loading && requiredData.networkStatus == NetworkStatus.loading
                  ? Center(
          child: CircularProgressIndicator(
            color: Colors.green.shade400,
          ))
                  : Center(
                      child: InkWell(
                          onTap: () {},
                          child: Text('${detailsAccounts.networkStatus}')),
                    ),
    );
  }
}
