import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';
import 'package:kudibooks_app/screens/dashboard/widget/inventory_card.dart';

class NewInventory extends StatelessWidget {
  NewInventory({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var transactionDateController = TextEditingController();
  var memoController = TextEditingController();
  List<String> unitProduct = ["Kg", "Liter"];
  List<String> revenueAccounts = [];
  List<String> unitOfProduct = [];

  final productNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    Navigator.pop(context);
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
                    Validators.validateName(value);
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
              InventoryProductCard(
                widgetPadding: Column(children: [
                  TwoSideHeader(
                    textFontSize: 16.0,
                    leftSide: 'Product Name',
                    fontWeight: FontWeight.bold,
                    rightSide: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xffA34646),
                      ),
                      onPressed: () {},
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
              ),
              InventoryProductCard(
                widgetPadding: Column(children: [
                  TwoSideHeader(
                    textFontSize: 16.0,
                    leftSide: 'Product Name',
                    fontWeight: FontWeight.bold,
                    rightSide: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xffA34646),
                      ),
                      onPressed: () {},
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
                        onPressed: () => _addProductModel(context),
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
                          Validators.validateName(value);
                        },
                        hintText: 'Amount paid',
                        fieldController: nameController,
                        isShown: false,
                        inputType: TextInputType.number),
                    SelectInputType(
                      itemsToSelect: unitProduct,
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
                          Validators.validateName(value);
                        },
                        hintText: 'Debt amount',
                        fieldController: nameController,
                        isShown: false,
                        inputType: TextInputType.number),
                    SelectInputType(
                      itemsToSelect: unitProduct,
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
                    Validators.validateName(value);
                  },
                  hintText: 'Transaction name',
                  fieldController: nameController,
                  isShown: false,
                  inputType: TextInputType.name),
              CustomFormField(
                  fieldIcon: const Icon(Icons.calendar_today_outlined),
                  validators: (value) {
                    Validators.validateName(value);
                  },
                  hintText: 'Transaction date',
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

  _addProductModel(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        elevation: 0.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                      trailing: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                      title: const Text(
                        "Add product",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      )),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      child: Column(
                        children: [
                          SelectInputType(
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
                                  onChanged: (bool value) {},
                                  value: true,
                                )),
                          ),
                          SelectInputType(
                              dropDownHint:
                                  const Text('Inventory expense account'),
                              itemsToSelect: revenueAccounts),
                          CustomFormField(
                            validators: (value) {
                              Validators.validateName(value);
                            },
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
                                  onChanged: (bool value) {},
                                  value: true,
                                )),
                          ),
                          Container(
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
                                          fieldController:
                                              productNameController,
                                          isShown: false),
                                    )
                                  ],
                                ),
                                CustomFormField(
                                    validators: (value) {},
                                    hintText: 'Sub-unit price',
                                    fieldController: productNameController,
                                    isShown: false),
                                CustomFormField(
                                    validators: (value) {},
                                    hintText: 'Sub-unit name',
                                    fieldController: productNameController,
                                    isShown: false),
                              ],
                            ),
                          ),
                          SelectInputType(
                            itemsToSelect: unitOfProduct,
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
                            fieldController: descriptionController,
                            isShown: false,
                            inputType: TextInputType.multiline,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 20),
                            child: TwoSideHeader(
                                textFontSize: 12,
                                bottomSize: 10.0,
                                leftSide: 'Displayed on invoice',
                                rightSide: const Text("")),
                          ),
                          CustomFormField(
                              validators: (value) {},
                              inputType: TextInputType.multiline,
                              hintText: 'Note',
                              maxLining: 5,
                              fieldController: noteController,
                              isShown: false),
                          LoginButton(
                              text: 'Add',
                              actionField: () => Navigator.pop(context))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
