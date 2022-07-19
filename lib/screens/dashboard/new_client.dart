import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';

class NewClient extends StatelessWidget {
  NewClient({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Random _randomId = Random();
  final nameController = TextEditingController();
  final idNumberController = TextEditingController();
  final contactPersonName = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final noteController = TextEditingController();
  List<String> clientStatus = ['Active', 'Inactive'];
  String? clientStatusOption;

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
      appBar: AppBarCommon.preferredSizeWidget(context, "New client"),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomFormField(
                      validators: (value) {
                        if(nameController.text.isEmpty){
                          return 'Enter client name';
                        }
                        return null;
                      },
                      hintText: 'Client name',
                      fieldController: nameController,
                      isShown: false),
                  CustomFormField(
                      validators: (value) {
                        if(idNumberController.text.isEmpty){
                          return 'Enter client name';
                        }else if(idNumberController.text.length <16){
                          return 'Match 16 digits';
                        }
                        return null;
                      },
                      hintText: 'Identification',
                      fieldController: idNumberController,
                      isShown: false,
                      inputType: TextInputType.number),
                  CustomFormField(
                      validators: (value) {
                        return 'Enter client name';
                      },
                      hintText: 'Contact person’s names',
                      fieldController: contactPersonName,
                      isShown: false,
                      inputType: TextInputType.name),
                  CustomFormField(
                      validators: (value) {
                        if(emailController.text.isEmpty){
                          return 'Enter email address';
                        }
                        return null;
                      },
                      hintText: 'Email',
                      fieldController: emailController,
                      isShown: false,
                      inputType: TextInputType.emailAddress),
                  CustomFormField(
                      validators: (value) {
                        if(phoneController.text.isEmpty){
                          return 'Enter email address';
                        }
                        return null;
                      },
                      hintText: 'Phone number',
                      fieldController: phoneController,
                      isShown: false,
                      inputType: TextInputType.multiline),
                  CustomFormField(
                      validators: (value) {
                        if(addressController.text.isEmpty){
                          return 'Enter email address';
                        }
                        return null;
                      },
                      hintText: 'Address',
                      fieldController: addressController,
                      isShown: false,
                      inputType: TextInputType.streetAddress),
                  SelectInputType(
                    dropDownHint: const Text(
                      'Client Status',
                      style: TextStyle(color: Colors.grey),
                    ),
                    selectedValue: (value) {
                      clientStatusOption = value;
                    },
                    validation: (value) {},
                    itemsToSelect: clientStatus,
                  ),
                  CustomFormField(
                      hintText: 'Note',
                      maxLining: 5,
                      fieldController: noteController,
                      isShown: false,
                      inputType: TextInputType.streetAddress),
                ],
              ),
            ),
          )),
    );
  }
}
