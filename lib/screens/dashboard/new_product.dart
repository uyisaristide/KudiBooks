import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';

class NewProduct extends StatelessWidget {
  NewProduct({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> revenueAccounts = ["Account 1", "Account 2", "Account 3"];
  final productNameController = TextEditingController();
  final noteController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  List<String> unitOfProduct = ["Kg", "Little", "Hg"];

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
      appBar: AppBarCommon.preferredSizeWidget(context, "New product"),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Form(
          key: _formKey,
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
                  dropDownHint: const Text('Inventory expense account'),
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
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                              fieldController: productNameController,
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
                margin:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
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
            ],
          ),
        ),
      )),
    );
  }
}
