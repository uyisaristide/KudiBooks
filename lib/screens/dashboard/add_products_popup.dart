import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/Users/ProductInLoad.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/classes/selectItem.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';
import 'package:kudibooks_app/screens/dashboard/widget/inventory_card.dart';
import 'package:provider/provider.dart';

class AddProductsPopup extends StatefulWidget {
  const AddProductsPopup({Key? key}) : super(key: key);

  @override
  State<AddProductsPopup> createState() => _AddProductsPopupState();
}

class _AddProductsPopupState extends State<AddProductsPopup> {
  late int productId;
  String? productNames;
  String? selectedMethod = "byProduct";
  final productNameController = TextEditingController();
  final unitProduct = TextEditingController();
  final unitController = TextEditingController();
  String? pricePerProduct;
  String? pricePerSubUnit;

  final priceController = TextEditingController();
  final discountController = TextEditingController();
  final totalController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  currentSelectedMethod(String currentValue) {
    setState(() {
      selectedMethod = currentValue;
    });
  }

  selectedProduct(ProductModel productModel) {
    setState(() {
      // print(productModel!.id);
      productId = productModel.id;
      productNames = productModel.productName;
      pricePerProduct = productModel.productPrice;
      pricePerSubUnit = productModel.subUnitPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<String> productLists = productList.map((item) => item.productName).toList();
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> productList = productProvider.allProducts;
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
              trailing: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
              title: const Text(
                "Add product",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              )),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SelectItemDynamic(
                    selectValue: (value) {
                      selectedProduct(value!);
                    },
                    productList: productList,
                  ),
                  Container(
                    // height: 350,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //   width: 1.0,
                        //   color: Colors.grey,
                        // ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InventoryProductCard(
                          widgetPadding: Column(children: [
                            TwoSideHeader(
                              textFontSize: 16.0,
                              leftSide:
                                  productNames == null ? "" : "$productNames",
                              fontWeight: FontWeight.bold,
                              rightSide: Container(),
                              bottomSize: 10,
                            ),
                            TwoSideHeader(
                              textFontSize: 14.0,
                              textColor: Colors.grey,
                              leftSide: 'Buying price',
                              rightSide: Text(
                                pricePerProduct == null
                                    ? '0'
                                    : "$pricePerProduct",
                                style: const TextStyle(fontSize: 16.0),
                              ),
                              bottomSize: 0.0,
                            ),
                            const Divider(),
                            RadioListTile<String>(
                              activeColor: Colors.red,
                              secondary: Text("\$ $pricePerProduct"),
                              value: "byProduct?",
                              groupValue: selectedMethod,
                              onChanged: (value) {
                                currentSelectedMethod(value!);
                              },
                              title: const Text("By product"),
                            ),
                            RadioListTile<String>(
                              activeColor: Colors.red,
                              secondary: Text("\$ $pricePerSubUnit"),
                              value: "bySub-unit",
                              groupValue: selectedMethod,
                              onChanged: (value) {
                                currentSelectedMethod(value!);
                              },
                              title: const Text("By sub-units"),
                            ),
                          ]),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomFormField(
                                  validators: (value) {
                                    return Validators.notEmpty(value);
                                  },
                                  hintText: 'Units',
                                  fieldController: unitProduct,
                                  isShown: false),
                            ),
                            Expanded(
                              child: CustomFormField(
                                  inputType: TextInputType.number,
                                  validators: (value) {
                                    return Validators.notEmpty(value);
                                  },
                                  hintText: 'Price',
                                  fieldController: priceController,
                                  isShown: false),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomFormField(
                                  validators: (value) {
                                    return Validators.notEmpty(value);
                                  },
                                  hintText: 'discount',
                                  fieldController: discountController,
                                  isShown: false),
                            ),
                            Expanded(
                              child: CustomFormField(
                                  inputType: TextInputType.number,
                                  validators: (value) {
                                    return Validators.notEmpty(value);
                                  },
                                  hintText: 'Total',
                                  fieldController: totalController,
                                  isShown: false),
                            )
                          ],
                        ),
                        const Text('Tags')
                        // CustomFormField(
                        //     isEnabled: false,
                        //     validators: (value) {},
                        //     hintText: 'Total',
                        //     fieldController: productNameController,
                        //     isShown: false),
                      ],
                    ),
                  ),
                  LoginButton(
                      text: 'Save',
                      actionField: () {
                        if (_formKey.currentState!.validate()) {
                          productProvider.addProductToInventory(
                              ProductInLoadModel(
                                  productId: productId,
                                  sellingMethods: selectedMethod,
                                  unit: unitProduct.text.isEmpty
                                      ? "Kg"
                                      : unitProduct.text,
                                  price: unitController.text.isEmpty
                                      ? 1
                                      : int.parse(priceController.text),
                                  total: totalController.text.isEmpty
                                      ? 1
                                      : int.parse(totalController.text)));
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
