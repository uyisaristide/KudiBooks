
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/client_model.dart';
import '../../providers/all_providers_list.dart';
import '../auth_screens/widgets/drop_down_widget.dart';
import '../auth_screens/widgets/login_button.dart';
import '../auth_screens/widgets/phone_input.dart';
import '../auth_screens/widgets/text_form_field.dart';
import 'widget/common_appBar.dart';

class NewClient extends ConsumerStatefulWidget {
  const NewClient({Key? key}) : super(key: key);

  @override
  ConsumerState<NewClient> createState() => _NewClientState();
}

class _NewClientState extends ConsumerState<NewClient> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final tinNumberController = TextEditingController();

  final contactPersonName = TextEditingController();
  final contactPersonLastName = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final addressController = TextEditingController();

  final noteController = TextEditingController();

  String countryCode = '250';

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
                text: 'Save Client',
                actionField: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(clientProvider.notifier).registerClient(
                        ClientModel(
                            clientName: nameController.text,
                            status:
                                clientStatusOption == "Active" ? true : false,
                            clientTin: tinNumberController.text,
                            contactPersonFirstName: contactPersonName.text,
                            contactPersonLastName: contactPersonLastName.text,
                            email: emailController.text,
                            phoneNumber:
                                countryCode.toString() + phoneController.text,
                            physicalAddress: addressController.text,
                            note: noteController.text));
                    debugPrint(countryCode.toString() + phoneController.text);
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
                  SelectInputType(
                    validation: (value) {
                      if (value == null) {
                        return "Select status";
                      }
                      return null;
                    },
                    dropDownHint: const Text(
                      'Client Status',
                      style: TextStyle(color: Colors.grey),
                    ),
                    selectedValue: (value) {
                      clientStatusOption = value;
                    },
                    itemsToSelect: clientStatus,
                  ),
                  CustomFormField(
                    validators: (value) {},
                    hintText: 'Tin Number',
                    fieldController: tinNumberController,
                    isShown: false,
                  ),
                  CustomFormField(
                      validators: (value) {},
                      hintText: 'Contact person’s First Name',
                      fieldController: contactPersonName,
                      isShown: false,
                      inputType: TextInputType.name),
                  CustomFormField(
                      validators: (value) {},
                      hintText: 'Contact person’s Last Name',
                      fieldController: contactPersonLastName,
                      isShown: false,
                      inputType: TextInputType.name),
                  CustomFormField(
                      validators: (value) {},
                      // validators: (value) {
                      //   final RegExp regex = RegExp(
                      //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      //   if (!regex.hasMatch(value)) {
                      //     return 'Invalid Phone number';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      hintText: 'Email',
                      fieldController: emailController,
                      isShown: false,
                      inputType: TextInputType.emailAddress),
                  PhoneField(
                      validators: (values) {
                        return null;
                      },
                      phoneNumber: phoneController,
                      fieldIcon: const Icon(Icons.phone),
                      countryCodes: (phoneCode) {
                        setState(() {
                          countryCode = phoneCode.dialCode;
                        });
                      }),
                  CustomFormField(
                      validators: (value) {},
                      hintText: 'Address',
                      fieldController: addressController,
                      isShown: false,
                      inputType: TextInputType.streetAddress),
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
