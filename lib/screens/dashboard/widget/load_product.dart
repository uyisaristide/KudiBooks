import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/models/Users/ProductInLoad.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/classes/selectItem.dart';
import 'package:kudibooks_app/screens/dashboard/widget/inventory_card.dart';

import 'double_header_two.dart';

class ProductInLoad extends ConsumerStatefulWidget {
  const ProductInLoad({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductInLoad> createState() => _ProductInLoadState();
}

class _ProductInLoadState extends ConsumerState<ProductInLoad> {
  late int productId;
  String? productNames;
  String? selectedMethod = "byProduct";
  final productNameController = TextEditingController();
  final unitProduct = TextEditingController();
  final unitPrice = TextEditingController();
  double? pricePerProduct;
  double? pricePerSubUnit;

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
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> productList = ref.watch(productProviders);
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
              trailing: IconButton(
                onPressed: () => context.pop(),
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
                    height: 350,
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
                        InventoryProductCard(
                          widgetPadding: Column(children: [
                            TwoSideHeader(
                              textFontSize: 16.0,
                              leftSide: "$productNames",
                              fontWeight: FontWeight.bold,
                              rightSide: Container(),
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
                            RadioListTile<String>(
                              secondary: const Text("\$15.99"),
                              value: "byProduct",
                              groupValue: selectedMethod,
                              onChanged: (value) {
                                currentSelectedMethod(value!);
                              },
                              title: const Text("By product"),
                            ),
                            RadioListTile<String>(
                              secondary: const Text("\$1.5.99"),
                              value: "bySub-unit",
                              groupValue: selectedMethod,
                              onChanged: (value) {
                                currentSelectedMethod(value!);
                              },
                              title: const Text("By product"),
                            ),
                          ]),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomFormField(
                                  validators: (value) {
                                    Validators.validateName(value);
                                  },
                                  hintText: 'Units',
                                  fieldController: unitProduct,
                                  isShown: false),
                            ),
                            Expanded(
                              child: CustomFormField(
                                  inputType: TextInputType.number,
                                  validators: (value) {
                                    Validators.validateName(value);
                                  },
                                  hintText: 'Unit price',
                                  fieldController: unitPrice,
                                  isShown: false),
                            )
                          ],
                        ),
                        CustomFormField(
                            isEnabled: false,
                            validators: (value) {},
                            hintText: 'Total',
                            fieldController: productNameController,
                            isShown: false),
                      ],
                    ),
                  ),
                  LoginButton(
                      text: 'Save',
                      actionField: () {
                        if (_formKey.currentState!.validate()) {
                          ref
                              .read(productInLoadProviders.notifier)
                              .addProductToInventory(ProductInLoadModel(
                                  productId: productId,
                                  sellingMethods: selectedMethod,
                                  unit: unitProduct.text.isEmpty
                                      ? "Kg"
                                      : unitProduct.text,
                                  price: unitPrice.text.isEmpty
                                      ? 1
                                      : int.parse(unitPrice.text),
                                  total: unitPrice.text.isEmpty
                                      ? 1
                                      : int.parse(unitPrice.text)));
                          context.pop();
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
