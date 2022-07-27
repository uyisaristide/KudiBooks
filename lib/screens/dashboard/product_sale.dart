import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/Users/ProductInLoad.dart';
import 'package:kudibooks_app/models/Users/products_sold_model.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/models/product_sale_model.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/providers/products_sale_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/add_products_popup.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';
import 'package:kudibooks_app/screens/dashboard/widget/inventory_card.dart';
import 'package:provider/provider.dart';

class ProductSale extends StatefulWidget {
  const ProductSale({Key? key}) : super(key: key);

  @override
  State<ProductSale> createState() => _ProductSaleState();
}

class _ProductSaleState extends State<ProductSale> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final transactionDateController = TextEditingController();

  final amountPaidController = TextEditingController();

  final debtAmountController = TextEditingController();

  List<String> unitProduct = [
    "Account 1",
    "Account 2",
    "Account 3",
    "Account 4"
  ];

  List<String> revenueAccounts = ["Account 1", "Account 2", "Account 3"];

  final productNameController = TextEditingController();

  final noteController = TextEditingController();

  final descriptionController = TextEditingController();

  final priceController = TextEditingController();

  List<String> unitOfProduct = ["Kg", "Little", "Hg"];

  List<String> bankAccounts = ["Bank 1", "Bank 2", "Bank 3"];

  String? bankAccountsValue;
  List<String> clientsList = ["client 1", "client 2", "client 3"];

  String? clientListValue;

  // GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ProductSalesProvider productSalesProvider =
        Provider.of<ProductSalesProvider>(context);

    List<ProductSalesModel> salesList = productSalesProvider.productSalesList;
    return Scaffold(
      appBar: AppBarCommon.preferredSizeWidget(context, "Products sale"),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: LoginButton(
                text: 'Save',
                actionField: () {
                  if (_formKey.currentState!.validate()) {
                    productSalesProvider.addNewSale(ProductSalesModel(
                        saleId: 11,
                        transactionDate: transactionDateController.text,
                        transactionName: productNameController.text,
                        productSold: 'product1',
                        amountPaid: double.parse(amountPaidController.text),
                        paymentMethod: bankAccountsValue!,
                        debtAmount: double.parse(debtAmountController.text),
                        client: 'mehuii'));

                    print(salesList.toList());
                    return Navigator.pop(context);
                  }
                }),
          )),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: _addProductForm(context),
          )),
    );
  }

  _addProductButton(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0))),
        elevation: 0.0,
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                    trailing: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                    title: const Text(
                      "Add products",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    )),
                const Divider(),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 20),
                  child: Form(
                    child: Column(
                      children: [
                        SelectInputType(
                            dropDownHint: const Text('Select Product'),
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
                          validators: (value) => Validators.validateName(value),
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
                                      itemsToSelect: unitOfProduct,
                                      dropDownHint: const Text("Select unit"),
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomFormField(
                                        validators: (value) {
                                          return Validators.notEmpty(value);
                                        },
                                        hintText: 'Sub units',
                                        fieldController: productNameController,
                                        isShown: false),
                                  )
                                ],
                              ),
                              CustomFormField(
                                  validators: (value) =>
                                      Validators.notEmpty(value),
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
                        LoginButton(text: 'Add', actionField: () {})
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  _addProductForm(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> _productModel = productProvider.allProducts;
    List<ProductToSell> _productsToSell = productProvider.allOnSaleList;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomFormField(
              fieldIcon: const Icon(Icons.calendar_today_outlined),
              validators: (value) {
                return Validators.notEmpty(value!);
              },
              hintText: 'Transaction date',
              fieldController: transactionDateController,
              isShown: false,
              inputType: TextInputType.datetime),
          CustomFormField(
              validators: (value) {
                return Validators.notEmpty(value);
              },
              hintText: 'Transaction name',
              fieldController: nameController,
              isShown: false,
              inputType: TextInputType.name),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                      _productsToSell[index].productId.toString();
                  print(changeToInt);
                  var _names = _productModel.firstWhere(
                      (element) => element.id == int.parse(changeToInt));

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
                          onPressed: () => setState(() => productProvider
                              .removeProductToSales(int.parse(changeToInt))),
                        ),
                        bottomSize: 10,
                      ),
                      TwoSideHeader(
                        textFontSize: 14.0,
                        textColor: Colors.grey,
                        leftSide: 'Buying price',
                        rightSide: Text(
                          "\$ ${_names.productPrice}",
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        bottomSize: 0.0,
                      ),
                      const Divider(),
                      TwoSideHeader(
                          fontWeight: FontWeight.bold,
                          bottomSize: 10,
                          textFontSize: 14.0,
                          leftSide: 'By sub-units',
                          rightSide: Text(
                            "\$ ${_names.subUnitPrice}",
                            style: const TextStyle(fontSize: 13.0),
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
                itemCount: _productsToSell.length),
          ),

          // InventoryProductCard(
          //   widgetPadding: Column(children: [
          //     TwoSideHeader(
          //       textFontSize: 16.0,
          //       leftSide: 'Product Name',
          //       fontWeight: FontWeight.bold,
          //       rightSide: IconButton(
          //         icon: const Icon(
          //           Icons.close,
          //           color: Color(0xffA34646),
          //         ),
          //         onPressed: () {},
          //       ),
          //       bottomSize: 10,
          //     ),
          //     TwoSideHeader(
          //       textFontSize: 14.0,
          //       textColor: Colors.grey,
          //       leftSide: 'Buying price',
          //       rightSide: const Text(
          //         "\$15.99",
          //         style: TextStyle(fontSize: 16.0),
          //       ),
          //       bottomSize: 0.0,
          //     ),
          //     const Divider(),
          //     TwoSideHeader(
          //         fontWeight: FontWeight.bold,
          //         bottomSize: 10,
          //         textFontSize: 14.0,
          //         leftSide: 'By sub-units',
          //         rightSide: const Text(
          //           "\$15.99",
          //           style: TextStyle(fontSize: 13.0),
          //         )),
          //     TwoSideHeader(
          //       textFontSize: 14.0,
          //       leftSide: 'Count',
          //       rightSide: const Text(
          //         "3",
          //         style: TextStyle(fontSize: 13.0),
          //       ),
          //       bottomSize: 0.0,
          //     ),
          //   ]),
          // ),
          // InventoryProductCard(
          //   widgetPadding: Column(children: [
          //     TwoSideHeader(
          //       textFontSize: 16.0,
          //       leftSide: 'Product Name',
          //       fontWeight: FontWeight.bold,
          //       rightSide: IconButton(
          //         icon: const Icon(
          //           Icons.close,
          //           color: Color(0xffA34646),
          //         ),
          //         onPressed: () {},
          //       ),
          //       bottomSize: 10,
          //     ),
          //     TwoSideHeader(
          //       textFontSize: 14.0,
          //       textColor: Colors.grey,
          //       leftSide: 'Buying price',
          //       rightSide: const Text(
          //         "\$15.99",
          //         style: TextStyle(fontSize: 16.0),
          //       ),
          //       bottomSize: 0.0,
          //     ),
          //     const Divider(),
          //     TwoSideHeader(
          //         fontWeight: FontWeight.bold,
          //         bottomSize: 10,
          //         textFontSize: 14.0,
          //         leftSide: 'By sub-units',
          //         rightSide: const Text(
          //           "\$15.99",
          //           style: TextStyle(fontSize: 13.0),
          //         )),
          //     TwoSideHeader(
          //       textFontSize: 14.0,
          //       leftSide: 'Count',
          //       rightSide: const Text(
          //         "3",
          //         style: TextStyle(fontSize: 13.0),
          //       ),
          //       bottomSize: 0.0,
          //     ),
          //   ]),
          // ),
          Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey,
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0)),
            child: Center(
                child: TextButton(
                    onPressed: () => showModalBottomSheet(
                        isDismissible: false,
                        elevation: 0.0,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                        context: context,
                        builder: (context) {
                          return const AddProductsPopup();
                        }),
                    child: const Text(
                      "Add Product",
                      style: TextStyle(color: Color(0xff6FCF97), fontSize: 12),
                    ))),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15.0, bottom: 1.0, top: 30),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Total Amount: ",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  "${_productsToSell.length}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                      return Validators.notEmpty(value);
                    },
                    hintText: 'Amount paid',
                    fieldController: amountPaidController,
                    isShown: false,
                    inputType: TextInputType.number),
                SelectInputType(
                  itemsToSelect: bankAccounts,
                  dropDownHint: const Text(
                    "Cash / Bank Account",
                    style: TextStyle(color: Colors.grey),
                  ),
                  selectedValue: (value) {
                    setState(() {
                      bankAccountsValue = value;
                    });
                  },
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
                      return Validators.notEmpty(value);
                    },
                    hintText: 'Debt amount',
                    fieldController: debtAmountController,
                    isShown: false,
                    inputType: TextInputType.number),
                SelectInputType(
                  itemsToSelect: clientsList,
                  selectedValue: (value) {
                    setState(() {
                      clientListValue = value;
                    });
                  },
                  dropDownHint: const Text("Select client"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
