import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../models/Users/ProductInLoad.dart';
import '../../models/inventory_model.dart';
import '../../providers/all_providers_list.dart';
import '../auth_screens/validators/validator.dart';
import '../auth_screens/widgets/drop_down_widget.dart';
import '../auth_screens/widgets/login_button.dart';
import '../auth_screens/widgets/text_form_field.dart';
import 'widget/common_appBar.dart';
import 'widget/double_header_two.dart';
import 'widget/inventory_card.dart';
import 'widget/load_product.dart';

class NewInventory extends ConsumerStatefulWidget {
  const NewInventory({Key? key}) : super(key: key);

  @override
  ConsumerState<NewInventory> createState() => _NewInventoryState();
}

class _NewInventoryState extends ConsumerState<NewInventory> {
  final _randNumber = Random();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var transactionDateController = TextEditingController();
  var transactionNameController = TextEditingController();
  var amountPaid = TextEditingController();
  List<String> bankAccounts = ["Bank 1", "Bank 2", "Bank 3"];
  String? bankAccountsValue;
  String? vendorListValue;
  var debtAmount = TextEditingController();
  List<String> vendorList = ["Vendor 1", "Vendor 2", "Vendor 3"];
  final memoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var productModel = ref.watch(productProvider);
    List<ProductInLoadModel> productsToLoad = ref.watch(productToLoadProvider);

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: LoginButton(
                text: 'Save',
                actionField: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(inventoryProvider.notifier).addInventory(
                        InventoryModel(
                            id: _randNumber.nextInt(500),
                            bulkName: nameController.text,
                            productList: productsToLoad,
                            amountPaid: double.parse(amountPaid.text),
                            bankAccount: bankAccountsValue,
                            deptAmount: double.parse(debtAmount.text),
                            vendor: vendorListValue,
                            transactionName: transactionNameController.text,
                            transactionDate: transactionDateController.text,
                            memoInventory: memoController.text));
                    productsToLoad.clear();
                    debugPrint("Saved");
                    context.pop();
                  }
                }),
          )),
      appBar: AppBarCommon.preferredSizeWidget(context, "New inventory load"),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormField(
                  validators: (value) {
                    if (nameController.text.isEmpty) {
                      return 'Enter user name';
                    }
                    return null;
                  },
                  hintText: 'Bulk name',
                  fieldController: nameController,
                  isShown: false),
              Container(
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: const Text(
                  "Products section",
                  style: TextStyle(fontSize: 16, color: Color(0xff808080)),
                ),
              ),
              LimitedBox(
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      String changeToInt =
                          productsToLoad[index].productId.toString();
                      debugPrint(changeToInt);
                      var names = productModel.firstWhere(
                          (element) => element.id == int.parse(changeToInt));

                      return InventoryProductCard(
                        widgetPadding: Column(children: [
                          TwoSideHeader(
                            textFontSize: 16.0,
                            leftSide: names.productName,
                            fontWeight: FontWeight.bold,
                            rightSide: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Color(0xffA34646),
                              ),
                              onPressed: () => setState(() => ref
                                  .read(productToLoadProvider.notifier)
                                  .removeLoadInModel(int.parse(changeToInt))),
                            ),
                            bottomSize: 10,
                          ),
                          TwoSideHeader(
                            textFontSize: 14.0,
                            textColor: Colors.grey,
                            leftSide: 'Buying price',
                            rightSide: const Text(
                              "\$15.99",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            bottomSize: 0.0,
                          ),
                          const Divider(),
                          TwoSideHeader(
                              fontWeight: FontWeight.bold,
                              bottomSize: 10,
                              textFontSize: 14.0,
                              leftSide: 'By sub-units',
                              rightSide: const Text(
                                "\$15.99",
                                style: TextStyle(fontSize: 13.0),
                              )),
                          TwoSideHeader(
                            textFontSize: 14.0,
                            leftSide: 'Count',
                            rightSide: const Text(
                              "3",
                              style: TextStyle(fontSize: 13.0),
                            ),
                            bottomSize: 0.0,
                          ),
                        ]),
                      );
                    },
                    separatorBuilder: (_, idx) => const SizedBox(
                          height: 2,
                        ),
                    itemCount: productsToLoad.length),
              ),
              Container(
                height: 100,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                    child: TextButton(
                        onPressed: () => DialogBox.dialogBox(
                            const ProductInLoad(), context, null),
                        child: const Text(
                          "Add Product",
                          style:
                              TextStyle(color: Color(0xff6FCF97), fontSize: 12),
                        ))),
              ),
              Container(
                height: 150,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFormField(
                        validators: (value) {
                          if (value == '') {
                            return "This is required";
                          }
                        },
                        hintText: 'Amount paid',
                        fieldController: amountPaid,
                        isShown: false,
                        inputType: TextInputType.number),
                    SelectInputType(
                      selectedValue: (value) {
                        setState(() {
                          bankAccountsValue = value;
                        });
                      },
                      itemsToSelect: bankAccounts,
                      dropDownHint: const Text(
                        "Cash / Bank Account",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFormField(
                        validators: (value) {
                          if (value == '') {
                            return "This is required";
                          }
                        },
                        hintText: 'Debt amount',
                        fieldController: debtAmount,
                        isShown: false,
                        inputType: TextInputType.number),
                    SelectInputType(
                      selectedValue: (value) {
                        setState(() {
                          vendorListValue = value;
                        });
                      },
                      itemsToSelect: vendorList,
                      dropDownHint: const Text("Select vendor"),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: const Text(
                  "Transaction details section",
                  style: TextStyle(fontSize: 16, color: Color(0xff808080)),
                ),
              ),
              CustomFormField(
                  validators: (value) {
                    if (transactionNameController.text.isEmpty) {
                      return 'Enter user name';
                    }
                  },
                  hintText: 'Transaction name',
                  fieldController: transactionNameController,
                  isShown: false,
                  inputType: TextInputType.name),
              CustomFormField(
                  calendarPicker: () async {
                    // FocusScope.of(context).requestFocus(FocusNode());
                    await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2017),
                            lastDate: DateTime(2040))
                        .then((selectedDate) {
                      if (selectedDate != null) {
                        transactionDateController.text =
                            DateFormat('yyyy-MM-dd').format(selectedDate);
                      }
                    });
                  },
                  fieldIcon: const Icon(Icons.calendar_today_outlined),
                  validators: (value) {
                    Validators.validateName(value);
                  },
                  hintText: 'Transaction dates',
                  fieldController: transactionDateController,
                  isShown: false,
                  inputType: TextInputType.datetime),
              CustomFormField(
                  validators: (value) {
                    Validators.validateName(value);
                  },
                  hintText: 'Memo',
                  maxLining: 5,
                  fieldController: memoController,
                  isShown: false,
                  inputType: TextInputType.multiline),
            ],
          ),
        ),
      )),
    );
  }
}

class DialogBox {
  static dialogBox(Widget dialogContent, context, double? height) =>
      showModalBottomSheet(
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
                height: MediaQuery.of(context).size.height * (height ?? 0.60),
                child: dialogContent);
          });
}
