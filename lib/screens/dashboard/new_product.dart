import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/providers/all_providers_list.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';
import 'package:provider/provider.dart';

class NewProduct extends ConsumerStatefulWidget {
  NewProduct({Key? key}) : super(key: key);

  @override
  ConsumerState<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends ConsumerState<NewProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _idRandom = Random();

  List<String> revenueAccounts = ["Account 1", "Account 2", "Account 3"];
  List<String> expenseAccount = [
    "Expense Account 1",
    "Expense Account 2",
    "Expense Account 3"
  ];

  final productNameController = TextEditingController();
  final noteController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final numberOfSubUnits = TextEditingController();
  final subUnitPrice = TextEditingController();
  final subUnitName = TextEditingController();
  String? expenseAccountValue;
  String? revenueAccountValue;
  String? unitType;
  String? defaultSellingMethodValue;

  List<String> unitOfProduct = ["Kg", "Little", "Hg"];
  List<String> defaultSellingMethod = ["Kg", "Little", "Hg"];

  bool isItInInventory = false;
  bool soldInSubUnits = false;

  @override
  Widget build(BuildContext context) {
    
    List<ProductModel> _listProducts = ref.watch(productProvider);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: LoginButton(
                text: 'Add product',
                actionField: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(productProvider.notifier).addProduct(ProductModel(
                        id: _idRandom.nextInt(300),
                        revenueAccount: revenueAccountValue,
                        inventoryExpenseAccount: expenseAccountValue,
                        productName: productNameController.text,
                        subUnit: unitType,
                        numberOfSubUnits: numberOfSubUnits.text,
                        subUnitPrice: subUnitPrice.text,
                        subUnitName: subUnitName.text,
                        productPrice: priceController.text,
                        defaultSellingMethod: defaultSellingMethodValue,
                        productDescription: descriptionController.text,
                        productNote: noteController.text));
                    Navigator.pop(context);
                  }
                }),
          )),
      appBar: AppBarCommon.preferredSizeWidget(context, "New product"),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SelectInputType(
                  selectedValue: (value) {
                    setState(() {
                      revenueAccountValue = value;
                      print("This is the revenue account $revenueAccountValue");
                    });
                  },
                  dropDownHint: const Text('Revenue account'),
                  itemsToSelect: revenueAccounts),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TwoSideHeader(
                    textFontSize: 16,
                    fontWeight: FontWeight.bold,
                    bottomSize: 10,
                    leftSide: 'It is in inventory?',
                    rightSide: Switch(
                      onChanged: (value) => setState(() {
                        isItInInventory = value;
                      }),
                      value: isItInInventory,
                    )),
              ),
              isItInInventory
                  ? SelectInputType(
                      selectedValue: (value) {
                        setState(() {
                          expenseAccountValue = value;
                          print(expenseAccountValue);
                        });
                      },
                      dropDownHint: const Text('Inventory expense account'),
                      itemsToSelect: expenseAccount)
                  : Container(),
              CustomFormField(
                validators: (value) => Validators.validateName(value),
                hintText: 'Product name',
                fieldController: productNameController,
                isShown: false,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TwoSideHeader(
                    textFontSize: 16,
                    fontWeight: FontWeight.bold,
                    bottomSize: 0.0,
                    leftSide: 'Sold in sub-units?',
                    rightSide: Switch(
                      onChanged: (soldInSub) => setState(() {
                        soldInSubUnits = soldInSub;
                      }),
                      value: soldInSubUnits,
                    )),
              ),
              soldInSubUnits
                  ? Container(
                      height: 200,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
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
                          Row(
                            children: [
                              Expanded(
                                child: SelectInputType(
                                  selectedValue: (value) {
                                    setState(() {
                                      unitType = value;
                                      print("Sub unit is: $value");
                                    });
                                  },
                                  itemsToSelect: unitOfProduct,
                                  dropDownHint: const Text("Select unit"),
                                ),
                              ),
                              Expanded(
                                child: CustomFormField(
                                    validators: (value) {
                                      Validators.validateName(value);
                                    },
                                    hintText: 'Sub units',
                                    fieldController: numberOfSubUnits,
                                    isShown: false),
                              )
                            ],
                          ),
                          CustomFormField(
                              inputType: TextInputType.number,
                              validators: (value) {},
                              hintText: 'Sub-unit price',
                              fieldController: subUnitPrice,
                              isShown: false),
                          CustomFormField(
                              validators: (value) {},
                              hintText: 'Sub-unit name',
                              fieldController: subUnitName,
                              isShown: false),
                        ],
                      ),
                    )
                  : Container(),
              SelectInputType(
                selectedValue: (value) {
                  setState(() {
                    defaultSellingMethodValue = value;
                  });
                },
                itemsToSelect: defaultSellingMethod,
                dropDownHint: const Text("Default selling method"),
              ),
              CustomFormField(
                  validators: (value) {},
                  hintText: 'Product price',
                  inputType: TextInputType.number,
                  fieldController: priceController,
                  isShown: false),
              CustomFormField(
                validators: (value) {},
                hintText: 'Description',
                maxLining: 5,
                fieldController: descriptionController,
                isShown: false,
                inputType: TextInputType.multiline,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
                child: TwoSideHeader(
                    textFontSize: 12,
                    bottomSize: 10.0,
                    leftSide: 'Displayed on invoice',
                    rightSide: Container()),
              ),
              CustomFormField(
                  validators: (value) {},
                  inputType: TextInputType.multiline,
                  hintText: 'Note',
                  maxLining: 5,
                  fieldController: noteController,
                  isShown: false),
            ],
          ),
        ),
      )),
    );
  }
}
