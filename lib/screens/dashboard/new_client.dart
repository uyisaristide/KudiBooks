import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';

class NewClient extends StatelessWidget {
  NewClient({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final idNumberController = TextEditingController();
  final contactPersonName = TextEditingController();
  final emailController = TextEditingController();
  List<String> clientStatus = ['Active', 'Inactive'];

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
                        Validators.validateName(value);
                      },
                      hintText: 'Client name',
                      fieldController: nameController,
                      isShown: false),
                  CustomFormField(
                      validators: (value) {
                        Validators.validateName(value);
                      },
                      hintText: 'Identification',
                      fieldController: idNumberController,
                      isShown: false,
                      inputType: TextInputType.number),
                  CustomFormField(
                      fieldIcon: const Icon(Icons.calendar_today_outlined),
                      validators: (value) {
                        Validators.validateName(value);
                      },
                      hintText: 'Contact person’s names',
                      fieldController: contactPersonName,
                      isShown: false,
                      inputType: TextInputType.name),
                  CustomFormField(
                      validators: (value) {
                        Validators.validateEmail(value);
                      },
                      hintText: 'Email',
                      fieldController: emailController,
                      isShown: false,
                      inputType: TextInputType.emailAddress),
                  CustomFormField(
                      validators: (value) {
                        Validators.validatePhoneNumber(value);
                      },
                      hintText: 'Phone number',
                      fieldController: emailController,
                      isShown: false,
                      inputType: TextInputType.multiline),
                  CustomFormField(
                      validators: (value) {
                        Validators.validateName(value);
                      },
                      hintText: 'Address',
                      fieldController: emailController,
                      isShown: false,
                      inputType: TextInputType.streetAddress),
                  SelectInputType(
                    itemsToSelect: clientStatus,
                  ),
                  CustomFormField(
                      validators: (value) {
                        Validators.validateName(value);
                      },
                      hintText: 'Address',
                      maxLining: 5,
                      fieldController: emailController,
                      isShown: false,
                      inputType: TextInputType.streetAddress),
                ],
              ),
            ),
          )),
    );
  }
}
