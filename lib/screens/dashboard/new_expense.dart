import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/expense_model.dart';
import 'package:kudibooks_app/providers/expenses_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';
import 'package:provider/provider.dart';
import '../auth_screens/widgets/text_form_field.dart';
import 'classes/snack_bars.dart';

class NewExpense extends StatefulWidget {
  NewExpense({Key? key}) : super(key: key);

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  DateTime time =
  DateTime(DateTime
      .now()
      .day, DateTime
      .now()
      .month, DateTime
      .now()
      .year);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final productNameController = TextEditingController();

  final amountPaidController = TextEditingController();

  final amountPaidExpensesController = TextEditingController();

  final nameController = TextEditingController();
  final Random _idRandom = Random();
  final transactionDateController = TextEditingController(text: ''
    // text:
    //     '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
  );

  final memoController = TextEditingController();

  List<String> expenseAccountList = [
    'Expenses 1',
    'Expenses 2',
    'Expenses 3',
    'Expenses 4'
  ];

  String? expenseAccount;

  List<String> cashBankAccountList = [
    'Account 1',
    'Account 2',
    'Account 3',
    'Account 4'
  ];

  String? cashBankAccount;

  addExpenseWidget(Widget widgets) {}

  @override
  Widget build(BuildContext context) {
    ExpensesProvider _expensesProvider = Provider.of<ExpensesProvider>(context);

    List<Widget> listOfNewCard = [
      Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
            SelectInputType(
                dropDownHint: const Text('Expense account'),
                selectedValue: (values) {
                  expenseAccount = values;
                },
                validation: (expenseName) {
                  if (expenseName == null) {
                    return 'Select expense';
                  }
                  return null;
                },
                itemsToSelect: expenseAccountList),
            Row(
              children: [
                Expanded(
                  child: CustomFormField(
                      inputType: TextInputType.number,
                      validators: (value) {
                        if (amountPaidExpensesController.text.isEmpty) {
                          return 'Enter amount';
                        }
                        return null;
                      },
                      hintText: 'Amount paid',
                      fieldController: amountPaidExpensesController,
                      isShown: false),
                ),
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(width: 1.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: InkWell(
                        onTap: () =>
                            showModalBottomSheet(
                                elevation: 0.0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0))),
                                context: (context),
                                builder: (index) => LoadTags()),
                        child: const Text(
                          "Add Tag",
                          style: TextStyle(color: Color(0xffA70C4A)),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
            SelectInputType(
                dropDownHint: const Text('Expense account'),
                selectedValue: (values) {
                  expenseAccount = values;
                },
                validation: (expenseName) {
                  if (expenseName == null) {
                    return 'Select expense';
                  }
                  return null;
                },
                itemsToSelect: expenseAccountList),
            Row(
              children: [
                Expanded(
                  child: CustomFormField(
                      inputType: TextInputType.number,
                      validators: (value) {
                        if (amountPaidExpensesController.text.isEmpty) {
                          return 'Enter amount';
                        }
                        return null;
                      },
                      hintText: 'Amount paid',
                      fieldController: amountPaidExpensesController,
                      isShown: false),
                ),
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(width: 1.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: InkWell(
                        onTap: () =>
                            showModalBottomSheet(
                                elevation: 0.0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0))),
                                context: (context),
                                builder: (index) => LoadTags()),
                        child: const Text(
                          "Add Tag",
                          style: TextStyle(color: Color(0xffA70C4A)),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    ];

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
                    _expensesProvider.addExpense(Expense(
                        _idRandom.nextInt(100),
                        expenseAccount.toString(),
                        double.parse(amountPaidExpensesController.text),
                        double.parse(amountPaidExpensesController.text),
                        cashBankAccount.toString(),
                        nameController.text,
                        transactionDateController.text,
                        memoController.text));
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(SnackBars.snackBars(
                          'Expense saved successfully', Colors.green.shade400));
                    Navigator.pop(context);
                  }
                }),
          )),
      appBar: AppBarCommon.preferredSizeWidget(context, "New expense"),
      body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  LimitedBox(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context,
                        indexCard) => listOfNewCard[indexCard],
                        separatorBuilder: (_, idx) =>const SizedBox(height: 5,),
                        itemCount: listOfNewCard.length),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TwoSideHeader(
                        textFontSize: 16,
                        fontWeight: FontWeight.bold,
                        bottomSize: 20,
                        leftSide: '',
                        rightSide: TextButton(
                          onPressed: () {
                            print(listOfNewCard.length);
                            return setState(() {
                              listOfNewCard.add(
                                Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                                      SelectInputType(
                                          dropDownHint: const Text('Expense account'),
                                          selectedValue: (values) {
                                            expenseAccount = values;
                                          },
                                          validation: (expenseName) {
                                            if (expenseName == null) {
                                              return 'Select expense';
                                            }
                                            return null;
                                          },
                                          itemsToSelect: expenseAccountList),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomFormField(
                                                inputType: TextInputType.number,
                                                validators: (value) {
                                                  if (amountPaidExpensesController.text.isEmpty) {
                                                    return 'Enter amount';
                                                  }
                                                  return null;
                                                },
                                                hintText: 'Amount paid',
                                                fieldController: amountPaidExpensesController,
                                                isShown: false),
                                          ),
                                          Expanded(
                                              child: Container(
                                                margin: const EdgeInsets.only(right: 15),
                                                padding: const EdgeInsets.all(15),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(width: 1.0, color: Colors.grey),
                                                    borderRadius: BorderRadius.circular(10.0)),
                                                child: InkWell(
                                                  onTap: () =>
                                                      showModalBottomSheet(
                                                          elevation: 0.0,
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(10.0),
                                                                  topRight: Radius.circular(10.0))),
                                                          context: (context),
                                                          builder: (index) => LoadTags()),
                                                  child: const Text(
                                                    "Add Tag",
                                                    style: TextStyle(color: Color(0xffA70C4A)),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                          },
                          child: const Text(
                            "New expense",
                            style: TextStyle(color: Colors.green, fontSize: 12),
                          ),
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
                            if (amountPaidController.text.isEmpty) {
                              return 'Enter amount';
                            }
                            return null;
                          },
                          hintText: 'Amount',
                          fieldController: amountPaidController,
                          isShown: false,
                        ),
                        SelectInputType(
                            validation: (account) {
                              if (cashBankAccount == null) {
                                return "Enter cash or bank";
                              }
                              return null;
                            },
                            selectedValue: (value) {
                              setState(() {
                                cashBankAccount = value;
                              });
                            },
                            dropDownHint: const Text('Cash/Bank account'),
                            itemsToSelect: cashBankAccountList),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 15.0, bottom: 15.0),
                      alignment: Alignment.topRight,
                      child: TextButton(
                        child: const Text(
                          "Add payment method",
                          style: TextStyle(
                              fontSize: 12, color: Color(0xffA70C4A)),
                        ),
                        onPressed: () {},
                      )),
                  CustomFormField(
                      validators: (value) {
                        if (nameController.text.isEmpty) {
                          return 'Fill this field';
                        }
                        return null;
                      },
                      hintText: 'Transaction name',
                      fieldController: nameController,
                      isShown: false,
                      inputType: TextInputType.name),
                  CustomFormField(
                      fieldIcon: const Icon(Icons.calendar_today_outlined),
                      fieldIconbutton: IconButton(
                          onPressed: () async {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2025));
                          },
                          icon: const Icon(Icons.calendar_today_outlined)),
                      validators: (value) {
                        Validators.validateName(value);
                      },
                      // initialText: '${time.day}/${time.month}',
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

class LoadTags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text(
                "Add tags",
                style: TextStyle(),
              ),
              trailing: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close)),
            ),
            const Divider(
              thickness: 0.7,
              color: Colors.grey,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Row(
                    children: const [
                      Text(
                        "CLIENTS",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                LimitedBox(
                  maxHeight: 300,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Client Name 1"),
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Client Name 1"),
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Client Name 1"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Row(
                    children: const [
                      Text(
                        "VENDOR",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                LimitedBox(
                  maxHeight: 300,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Client Name 1"),
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Client Name 1"),
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Client Name 1"),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
