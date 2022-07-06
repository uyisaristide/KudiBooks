import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';
import 'package:kudibooks_app/screens/dashboard/widget/inventory_card.dart';

class InventoryDeduction extends StatelessWidget {
  InventoryDeduction({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final memoController = TextEditingController();
  final transactionController = TextEditingController();
  final transactionDateController = TextEditingController();
  List<String> unitProduct = [];

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
                    Navigator.pop(context);
                  }
                }),
          )),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              automaticallyImplyLeading: true,
              elevation: 0.0,
              backgroundColor: const Color(0xff157253),
              centerTitle: true,
              title: const Text("Inventory deduction",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SelectInputType(
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
                    child: const Center(
                        child: Text(
                      "Add Product",
                      style: TextStyle(color: Color(0xff6FCF97), fontSize: 12),
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
}
