import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/inventory_card.dart';

class NewInventory extends StatelessWidget {
  NewInventory({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var transactionDateController = TextEditingController();
  var memoController = TextEditingController();
  List<String> unitProduct = ["Kg", "Liter"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
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
              title: const Text("Inventory",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: const Text(
                "Products section",
                style: TextStyle(fontSize: 16, color: Color(0xff808080)),
              ),
            ),
            const InventoryProductCard(),
            const InventoryProductCard(),
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
              child: const Center(
                  child: Text(
                "Add Product",
                style: TextStyle(color: Color(0xff6FCF97), fontSize: 12),
              )),
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
                        Validators.validateName(value);
                      },
                      hintText: 'Amount paid',
                      fieldController: nameController,
                      isShown: false,
                      inputType: TextInputType.number),
                  SelectInputType(
                    itemsToSelect: unitProduct,
                    dropDownHint: const Text("Cash / Bank Account"),
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
                      fieldController: nameController,
                      isShown: false,
                      inputType: TextInputType.number),
                  SelectInputType(
                    itemsToSelect: unitProduct,
                    dropDownHint: const Text("Select vendor"),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                fieldController: nameController,
                isShown: false,
                inputType: TextInputType.number),
            CustomFormField(
                fieldIcon: const Icon(Icons.calendar_today_outlined),
                validators: (value) {
                  Validators.validateName(value);
                },
                hintText: 'Transaction date',
                fieldController: transactionDateController,
                isShown: false,
                inputType: TextInputType.name),
            CustomFormField(
                validators: (value) {
                  Validators.validateName(value);
                },
                hintText: 'Memo',
                fieldController: memoController,
                isShown: false,
                inputType: TextInputType.multiline),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: LoginButton(
                    text: 'Save',
                    actionField: () {
                      if (_formKey.currentState!.validate()) {
                        print("Should be saved");
                      }
                    }))
          ],
        ),
      )),
    );
  }
}
