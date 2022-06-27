import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';
import 'package:kudibooks_app/screens/dashboard/widget/inventory_card.dart';

class ProductSale extends StatelessWidget {
  ProductSale({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final transactionDateController = TextEditingController();
  final memoController = TextEditingController();

  List<String> unitProduct = [
    "Account 1",
    "Account 2",
    "Account 3",
    "Account 4"
  ];

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
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context)),
              automaticallyImplyLeading: true,
              elevation: 0.0,
              backgroundColor: const Color(0xff157253),
              centerTitle: true,
              title: const Text("Product sale",
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
                      hintText: 'Transaction name',
                      fieldController: nameController,
                      isShown: false,
                      inputType: TextInputType.name),
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
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
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
                  Container(
                    margin: const EdgeInsets.only(
                        right: 15.0, bottom: 1.0, top: 30),
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Total Amount: ",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "0.0",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
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
                    margin: const EdgeInsets.only(right: 15.0, bottom: 15.0),
                    alignment: Alignment.topRight,
                    child: const Text(
                      "Add payment method",
                      style: TextStyle(fontSize: 12, color: Color(0xffA70C4A)),
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
                          dropDownHint: const Text("Select client"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}