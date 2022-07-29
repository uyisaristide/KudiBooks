import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/client_model.dart';
import 'package:kudibooks_app/providers/all_providers_list.dart';
import 'package:kudibooks_app/providers/client_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/phone_input.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';

class NewClient extends ConsumerStatefulWidget {
  NewClient({Key? key}) : super(key: key);

  @override
  ConsumerState<NewClient> createState() => _NewClientState();
}

class _NewClientState extends ConsumerState<NewClient> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Random _randomId = Random();

  final nameController = TextEditingController();

  final idNumberController = TextEditingController();

  final contactPersonName = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final addressController = TextEditingController();

  final noteController = TextEditingController();

  String? countryCode;

  List<String> clientStatus = ['Active', 'Inactive'];

  String? clientStatusOption;

  @override
  Widget build(BuildContext context) {
    // print(ClientProvider.clientInstance.allClients.length);
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
                    ref.read(clientProvider.notifier).addClient(ClientModel(
                        _randomId.nextInt(500),
                        nameController.text,
                        int.parse(idNumberController.text),
                        contactPersonName.text,
                        emailController.text,
                        countryCode.toString() + phoneController.text,
                        addressController.text,
                        clientStatusOption.toString(),
                        noteController.text));
                    print(countryCode.toString() + phoneController.text);
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        content: const Text(
                          "Client saved successfully",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                        duration: const Duration(seconds: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: const EdgeInsets.only(
                          bottom: 30.0,
                          top: 10.0,
                        ),
                        elevation: 0.0,
                        backgroundColor: Colors.green,
                      ));
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
                        if (nameController.text.isEmpty) {
                          return 'Enter client name';
                        }
                        return null;
                      },
                      hintText: 'Client name',
                      fieldController: nameController,
                      isShown: false),
                  CustomFormField(
                      validators: (value) {
                        if (idNumberController.text.isEmpty) {
                          return 'Enter Id Number';
                        } else if (idNumberController.text.length < 16) {
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
                        if (value == '') {
                          return "Enter person name";
                        }
                        return null;
                      },
                      hintText: 'Contact person’s names',
                      fieldController: contactPersonName,
                      isShown: false,
                      inputType: TextInputType.name),
                  CustomFormField(
                      validators: (value) {
                        final RegExp regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (emailController.text.isEmpty) {
                          return 'Enter email address';
                        } else if (!regex.hasMatch(value)) {
                          return 'Invalid Phone number';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'Email',
                      fieldController: emailController,
                      isShown: false,
                      inputType: TextInputType.emailAddress),
                  PhoneField(
                      validators: (values) {},
                      phoneNumber: phoneController,
                      fieldIcon: const Icon(Icons.phone),
                      countryCodes: (phoneCode) {
                        setState(() {
                          countryCode = phoneCode.dialCode;
                        });
                      }),
                  CustomFormField(
                      validators: (value) {
                        if (addressController.text.isEmpty) {
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
                      validators: (value) {},
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
