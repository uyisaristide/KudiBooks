import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/Users/ProductInLoad.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';
import 'package:kudibooks_app/screens/dashboard/widget/inventory_card.dart';
import 'package:kudibooks_app/screens/dashboard/widget/load_product.dart';
import 'package:provider/provider.dart';

class NewInventory extends StatefulWidget {
  NewInventory({Key? key}) : super(key: key);

  @override
  State<NewInventory> createState() => _NewInventoryState();
}

class _NewInventoryState extends State<NewInventory> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  List<String>? itemId = [];
  var transactionDateController = TextEditingController();
  var transactionNameController = TextEditingController();
  var amountPaid = TextEditingController();
  List<String> bankAccounts = ["Bank 1", "Bank 2", "Bank 3"];
  var debtAmount = TextEditingController();
  List<String> vendorList = ["Vendor 1", "Vendor 2", "Vendor 3"];
  final memoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    List<ProductInLoadModel> _productsToLoad = productProvider.allToLoadModel;
    List<ProductModel> _productModel = productProvider.allProducts;
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
                  LimitedBox(
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          String changeToInt =
                          _productsToLoad[index].productId.toString();
                          print(changeToInt);
                          var _names = _productModel.firstWhere(
                                  (element) =>
                              element.id == int.parse(changeToInt));

                          return InventoryProductCard(
                            widgetPadding: Column(children: [
                              TwoSideHeader(
                                textFontSize: 16.0,
                                leftSide: _names.productName,
                                fontWeight: FontWeight.bold,
                                rightSide: IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Color(0xffA34646),
                                  ),
                                  onPressed: () =>
                                      setState(() {
                                        productProvider
                                            .removeLoadInModel(
                                            int.parse(changeToInt));
                                      }),
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
                        separatorBuilder: (_, idx) =>
                        const SizedBox(
                          height: 2,
                        ),
                        itemCount: _productsToLoad.length),
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
                            onPressed: () =>
                                showModalBottomSheet(
                                    isDismissible: false,
                                    elevation: 0.0,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0))),
                                    context: context,
                                    builder: (context) {
                                      return const ProductInLoad();
                                    }),
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
                            fieldController: amountPaid,
                            isShown: false,
                            inputType: TextInputType.number),
                        SelectInputType(
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
                              Validators.validateName(value);
                            },
                            hintText: 'Debt amount',
                            fieldController: debtAmount,
                            isShown: false,
                            inputType: TextInputType.number),
                        SelectInputType(
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
                        Validators.validateName(value);
                      },
                      hintText: 'Transaction name',
                      fieldController: transactionNameController,
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
}
