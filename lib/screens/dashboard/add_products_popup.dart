import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/Users/products_sold_model.dart';
import '../../models/product/product_model.dart';
import '../../providers/all_providers_list.dart';
import '../auth_screens/validators/validator.dart';
import '../auth_screens/widgets/login_button.dart';
import '../auth_screens/widgets/text_form_field.dart';
import 'classes/selectItem.dart';
import 'widget/double_header_two.dart';
import 'widget/inventory_card.dart';

class AddProductsPopup extends ConsumerStatefulWidget {
  const AddProductsPopup({Key? key}) : super(key: key);

  @override
  ConsumerState<AddProductsPopup> createState() => _AddProductsPopupState();
}

class _AddProductsPopupState extends ConsumerState<AddProductsPopup> {
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
      productNames = productModel.productName;
      pricePerProduct = productModel.productPrice;
      pricePerSubUnit = productModel.subUnitPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    List<ProductModel> productList = ref.watch(productProvider);
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
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
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
                      ],
                    ),
                  ),
                  LoginButton(
                      text: 'Save',
                      actionField: () {
                        if (_formKey.currentState!.validate()) {
                          ref.read(productToSalesProvide.notifier).addProductToSales(ProductToSell(
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
