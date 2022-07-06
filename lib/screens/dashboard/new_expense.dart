import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';

import '../auth_screens/widgets/text_form_field.dart';

class NewExpense extends StatelessWidget {
  NewExpense({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final productNameController = TextEditingController();
  final nameController = TextEditingController();
  final transactionDateController = TextEditingController();
  final memoController = TextEditingController();

  List<String> expenseAccount = [
    'Account 1',
    'Account 2',
    'Account 3',
    'Account 4'
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
              automaticallyImplyLeading: true,
              elevation: 0.0,
              backgroundColor: const Color(0xff157253),
              centerTitle: true,
              title: const Text("New expense",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SelectInputType(
                  dropDownHint: const Text('Expense account'),
                  itemsToSelect: expenseAccount),
              Container(
                height: 150,
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
                          child: CustomFormField(
                              validators: (value) {
                                Validators.validateName(value);
                              },
                              hintText: 'Amount paid',
                              fieldController: productNameController,
                              isShown: false),
                        ),
                        Expanded(
                          child: CustomFormField(
                              validators: (value) {
                                Validators.validateName(value);
                              },
                              hintText: 'Add tags',
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
                  ],
                ),
              ),
              Container(
                height: 150,
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
                    CustomFormField(
                        validators: (value) {},
                        hintText: 'Sub-unit price',
                        fieldController: productNameController,
                        isShown: false),
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormField(
                              validators: (value) {
                                Validators.validateName(value);
                              },
                              hintText: 'Amount paid',
                              fieldController: productNameController,
                              isShown: false),
                        ),
                        Expanded(
                          child: CustomFormField(
                              validators: (value) {
                                Validators.validateName(value);
                              },
                              hintText: 'Add tags',
                              fieldController: productNameController,
                              isShown: false),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TwoSideHeader(
                    textFontSize: 16,
                    fontWeight: FontWeight.bold,
                    bottomSize: 20,
                    leftSide: '',
                    rightSide: const Text(
                      "New expense",
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    )),
              ),
              Container(
                margin:
                    const EdgeInsets.only(right: 15.0, bottom: 1.0, top: 30),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
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
                    CustomFormField(
                      validators: (value) {
                        Validators.validateName(value);
                      },
                      hintText: 'Amount',
                      fieldController: productNameController,
                      isShown: false,
                    ),
                    SelectInputType(
                        dropDownHint: const Text('Cash/Bank account'),
                        itemsToSelect: expenseAccount),
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
              CustomFormField(
                  validators: (value) {
                    Validators.validateName(value);
                  },
                  hintText: 'Transaction name',
                  fieldController: nameController,
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
