import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/product/required_data_product.dart';
import '../../../providers/product/providers.dart';
import '../../auth_screens/validators/validator.dart';
import '../../auth_screens/widgets/drop_down_widget.dart';
import '../../auth_screens/widgets/login_button.dart';
import '../../auth_screens/widgets/text_form_field.dart';
import '../new_inventory.dart';
import '../widget/common_appBar.dart';
import '../widget/double_header_two.dart';
import 'load_product_required_data.dart';
import 'new_measure.dart';

class NewProduct extends ConsumerStatefulWidget {
  const NewProduct({Key? key}) : super(key: key);

  @override
  ConsumerState<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends ConsumerState<NewProduct> {

  final revenueAccountsProvider = StateProvider<RevenueAccounts?>((ref) => null);
  final inventoryExpenseAccountProvider = StateProvider<InventoryExpenseAccounts?>((ref) => null);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final revenueAccountController = TextEditingController();
  final inventoryExpenseAccountController = TextEditingController();
  final productNameController = TextEditingController();
  final unitProductController = TextEditingController();
  final noteController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final numberOfSubUnits = TextEditingController();
  final subUnitPrice = TextEditingController();
  final subUnitName = TextEditingController();

  String? unitType;
  String? defaultSellingMethodValue;

  //Unit of product

  List<String> defaultSellingMethod = ["Kg", "Little", "Hg"];

  bool isItInInventory = false;
  bool soldInSubUnits = false;

  selectedRevenueAccount(RevenueAccounts revenueAccounts){
    var inventoryExpenseAccounts = ref.read(revenueAccountsProvider.notifier).state=revenueAccounts;
    revenueAccountController.text=inventoryExpenseAccounts.name.toString();
    print("Selected is: ");
  }
  selectedInventoryExpense(InventoryExpenseAccounts invExpenseAccount){
    var inventoryExpenseAccounts = ref.read(inventoryExpenseAccountProvider.notifier).state=invExpenseAccount;
    inventoryExpenseAccountController.text=inventoryExpenseAccounts.name.toString();
    print("Selected is: ");
  }

  void runRequiredData() {
    ref.read(productToSellRequiredDataProvider.notifier).productRequiredData();
  }

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

                    // ref.read(productProvider.notifier).addProduct(ProductModel(
                    //     id: _idRandom.nextInt(300),
                    //     revenueAccount: revenueAccountValue,
                    //     inventoryExpenseAccount: expenseAccountValue,
                    //     productName: productNameController.text,
                    //     subUnit: unitType,
                    //     numberOfSubUnits: numberOfSubUnits.text,
                    //     subUnitPrice: subUnitPrice.text,
                    //     subUnitName: subUnitName.text,
                    //     productPrice: priceController.text,
                    //     defaultSellingMethod: defaultSellingMethodValue,
                    //     productDescription: descriptionController.text,
                    //     productNote: noteController.text));
                    context.pop();
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
              CustomFormField(
                fieldIcon: const Icon(Icons.arrow_drop_down),
                inputType: TextInputType.none,
                calendarPicker: () => DialogBox.dialogBox(
                  LoadProductRequiredData(revenueExpenseFunction: selectedRevenueAccount),
                  context,
                  0.60,
                ),
                validators: (value) {
                  if (value.toString().isEmpty) {
                    return "Enter account Name";
                  }
                  return null;
                },
                hintText: 'Revenue Account',
                isShown: false,
                fieldController: revenueAccountController,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TwoSideHeader(
                    textFontSize: 16,
                    fontWeight: FontWeight.bold,
                    bottomSize: 10,
                    leftSide: 'It is in inventory?',
                    rightSide: Switch(activeColor: Colors.green.shade400,focusColor: Colors.green.shade400,
                      onChanged: (value) => setState(() {
                        isItInInventory = value;
                      }),
                      value: isItInInventory,
                    )),
              ),
              isItInInventory
                  ? CustomFormField(
                      fieldIcon: const Icon(Icons.arrow_drop_down),
                      inputType: TextInputType.none,
                      calendarPicker: () => DialogBox.dialogBox(
                        LoadProductRequiredData( inInventory: true, inventoryAccount: selectedInventoryExpense, ),
                        context,
                        0.60,
                      ),
                      validators: (value) {
                        if (value.toString().isEmpty) {
                          return "Enter account Name";
                        }
                        return null;
                      },
                      hintText: 'Inventory Expense Account',
                      isShown: false,
                      fieldController: inventoryExpenseAccountController,
                    )
                  : Container(),
              CustomFormField(
                inputType: TextInputType.name,
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
                    rightSide: Switch(activeColor: Colors.green.shade400,
                      onChanged: (soldInSub) => setState(() {
                        soldInSubUnits = soldInSub;
                      }),
                      value: soldInSubUnits,
                    )),
              ),
              soldInSubUnits
                  ? Container(
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
                                child:
                                CustomFormField(
                                  fieldIcon: const Icon(Icons.arrow_drop_down),
                                  inputType: TextInputType.none,
                                  calendarPicker: () => DialogBox.dialogBox(
                                    NewMeasure()
                                    ,context,
                                    0.60,
                                  ),
                                  validators: (value) {
                                    if (value.toString().isEmpty) {
                                      return "Select unit";
                                    }
                                    return null;
                                  },
                                  hintText: 'Choose unit',
                                  isShown: false,
                                  fieldController: unitProductController,
                                )
                              ),
                              Expanded(
                                child: CustomFormField(
                                    validators: (value) {
                                      if (soldInSubUnits == true &&
                                          value == '') {
                                        return "Fill this field";
                                      }
                                      return null;
                                    },
                                    hintText: 'Sub units',
                                    fieldController: numberOfSubUnits,
                                    isShown: false),
                              )
                            ],
                          ),
                          CustomFormField(
                              inputType: TextInputType.number,
                              validators: (value) {
                                if (soldInSubUnits == true && value == '') {
                                  return "Fill this field";
                                }
                                return null;
                              },
                              hintText: 'Sub-unit price',
                              fieldController: subUnitPrice,
                              isShown: false),
                          CustomFormField(
                              validators: (value) {
                                if (soldInSubUnits == true && value == '') {
                                  return "Fill this field";
                                }
                                return null;
                              },
                              hintText: 'Sub-unit name',
                              fieldController: subUnitName,
                              isShown: false),
                        ],
                      ),
                    )
                  : Container(),
              SelectInputType(
                validation: (values) {
                  if (values == null) {
                    return "This field is required";
                  }
                  return null;
                },
                selectedValue: (value) {
                  setState(() {
                    defaultSellingMethodValue = value;
                  });
                },
                itemsToSelect: defaultSellingMethod,
                dropDownHint: const Text("Default selling method"),
              ),
              CustomFormField(
                  validators: (val) {
                    if (val == null) {
                      return "This field is required";
                    }
                    return null;
                  },
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
