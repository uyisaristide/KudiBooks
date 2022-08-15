import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';
import 'package:kudibooks_app/screens/dashboard/widget/inventory_card.dart';

class InventoryDeduction extends StatefulWidget {
  InventoryDeduction({Key? key}) : super(key: key);

  @override
  State<InventoryDeduction> createState() => _InventoryDeductionState();
}

class _InventoryDeductionState extends State<InventoryDeduction> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final memoController = TextEditingController();

  final transactionController = TextEditingController();

  final transactionDateController = TextEditingController();

  final descriptionController = TextEditingController();

  final noteController = TextEditingController();

  List<String> unitProduct = ["Used", "Stolen", "Damaged", "Other"];

  String? unitProductValue;

  @override
  Widget build(BuildContext context) {
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
                    context.pop();
                  }
                }),
          )),
      appBar: AppBarCommon.preferredSizeWidget(context, "Inventory deduction"),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SelectInputType(
                    selectedValue: (value) {
                      setState(() {
                        unitProductValue = value;
                      });
                    },
                    itemsToSelect: unitProduct,
                    dropDownHint: const Text(
                      'Used',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
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
                    height: 150,
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                        left: 15, right: 15, top: 5, bottom: 40),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                        child: InkWell(
                      onTap: () => _addProductModel(context),
                      child: const Text(
                        "Add Product",
                        style:
                            TextStyle(color: Color(0xff6FCF97), fontSize: 12),
                      ),
                    )),
                  ),
                  CustomFormField(
                    validators: (value) {
                      Validators.validateName(value);
                    },
                    hintText: 'Transaction date',
                    isShown: false,
                    fieldController: transactionDateController,
                    fieldIcon: const Icon(Icons.calendar_today_outlined),
                  ),
                  CustomFormField(
                      validators: (value) {},
                      hintText: 'Transaction name',
                      fieldController: transactionController,
                      isShown: false),
                  CustomFormField(
                    maxLining: 5,
                    hintText: 'Memo',
                    fieldController: memoController,
                    isShown: false,
                    validators: (value) {},
                  )
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
                        onPressed: () => context.pop(),
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
                              itemsToSelect: unitProduct),
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
                              itemsToSelect: unitProduct),
                          CustomFormField(
                            validators: (value) {
                              Validators.validateName(value);
                            },
                            hintText: 'Product name',
                            fieldController: nameController,
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
                                        itemsToSelect: unitProduct,
                                        dropDownHint: const Text("Select unit"),
                                      ),
                                    ),
                                    Expanded(
                                      child: CustomFormField(
                                          validators: (value) {
                                            Validators.validateName(value);
                                          },
                                          hintText: 'Sub units',
                                          fieldController: nameController,
                                          isShown: false),
                                    )
                                  ],
                                ),
                                CustomFormField(
                                    validators: (value) {},
                                    hintText: 'Sub-unit price',
                                    fieldController: nameController,
                                    isShown: false),
                                CustomFormField(
                                    validators: (value) {},
                                    hintText: 'Sub-unit name',
                                    fieldController: nameController,
                                    isShown: false),
                              ],
                            ),
                          ),
                          SelectInputType(
                            itemsToSelect: unitProduct,
                            dropDownHint: const Text("Default selling method"),
                          ),
                          CustomFormField(
                              validators: (value) {},
                              hintText: 'Product price',
                              inputType: TextInputType.number,
                              fieldController: nameController,
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
                              text: 'Add', actionField: () => context.pop())
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
