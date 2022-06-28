import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';

class ClientDeposit extends StatelessWidget {
  ClientDeposit({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final memoController = TextEditingController();
  List<String> clientList = [];
  List<String> bankList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: LoginButton(
                text: 'Deposit',
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
              title: const Text("Client/Vendor deposit",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 3, color: Color(0xff157253)))),
                        child: const Text(
                          "DEPOSIT",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff157253),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(border: Border()),
                        child: const Text(
                          "WITHDRAW",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SelectInputType(
                    dropDownHint: const Text(
                      "Select client",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    itemsToSelect: clientList,
                  ),
                  SelectInputType(
                    dropDownHint: const Text(
                      "Cash/Bank",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    itemsToSelect: bankList,
                  ),
                  CustomFormField(
                      fieldIcon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey,
                      ),
                      inputType: TextInputType.datetime,
                      validators: (value) {
                        Validators.validateName(value);
                      },
                      hintText: 'Transaction date',
                      fieldController: nameController,
                      isShown: false),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 40, bottom: 40, right: 15, left: 15),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Client balance",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                          ),
                          Text(
                            " 0.0",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomFormField(
                      validators: (value) {
                        Validators.validateName(value);
                      },
                      hintText: 'Memo',
                      maxLining: 5,
                      fieldController: memoController,
                      isShown: false,
                      inputType: TextInputType.streetAddress),
                ],
              ),
            ),
          )),
    );
  }
}
