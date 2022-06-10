import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/lock_icon.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/phone_input.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/background.dart';

class PhoneLogin extends StatelessWidget {
  PhoneLogin({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(paddingSize: 150,
      screens: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LockIcon(),
            const PageTitle(title: 'Account Sign In'),
            // CustomFormField(
            //   hintText: 'Phone Number',
            //   validators: (value) =>
            //       Validators.validatePhoneNumber(value),
            //   fieldIcon: const Icon(Icons.phone),
            // ),
            PhoneField(
              fieldIcon: const Icon(
                Icons.phone,
                size: 17,
              ),
              phoneNumber: phoneController,
            ),
            CustomFormField(
              inputType: TextInputType.phone,
              hintText: 'Enter your pin',
              validators: (value) => Validators.validatePin(value),
              fieldIcon: const Icon(
                Icons.remove_red_eye,
                size: 17,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            LoginButton(
              text: 'Logins',
              validate: () => _formKey.currentState!.validate()
                  ? Navigator.pushNamed(context, '/')
                  : null,
              actionField: () {
                if (_formKey.currentState!.validate()) {
                  print("Here we go!");
                }
                print("Clicked successfully");
              },
            ),
            const CustomDevider(middleText: 'Or sign in with'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: const [
                  CircledLogo(
                    logo: 'assets/images/categories/emailIcon.png',
                    navigateTo: '/login',
                  ),
                  CircledLogo(
                    logo: 'assets/images/categories/googleIcon.png',
                    navigateTo: '/signup',
                  ),
                  CircledLogo(
                    logo: 'assets/images/categories/appleIcon.png',
                    navigateTo: '/phoneSignup',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
