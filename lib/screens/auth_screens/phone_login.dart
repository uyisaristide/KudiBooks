import 'dart:ffi';
import 'dart:math';
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

class PhoneLogin extends StatefulWidget {
  PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final pinController = TextEditingController();
  var _countryCode = '';

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      buttonWidget: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/signup');
            },
            child: const Text(
              "Sign up",
              style: TextStyle(
                color: Color(0Xff157253),
              ),
            ),
          ),
        ],
      ),
      paddingSize: 150,
      screens: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LockIcon(),
            const PageTitle(title: 'Account Sign In'),
            PhoneField(
              countryCodes: (country) {
                setState(() {
                  _countryCode = country.code;
                });
              },
              fieldIcon: const Icon(
                Icons.phone,
                size: 17,
              ),
              phoneNumber: phoneController,
            ),
            CustomFormField(
              labelText: "Pin",
              maximumLength: 4,
              inputType: TextInputType.phone,
              hintText: 'Enter your pin',
              validators: (value) => Validators.validatePin(value),
              fieldIcon: const Icon(
                Icons.remove_red_eye,
                size: 17,
              ),
              fieldController: pinController,
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
                  print(
                      "Country code is: ${_countryCode + phoneController.text}");
                }
                print("Clicked successfully");
              },
            ),
            const CustomDevider(middleText: 'Or sign in with'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircledLogo(
                    logo: 'assets/images/categories/emailIcon.png',
                    navigateTo: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
                  ),
                  CircledLogo(
                    navigateTo: () {},
                    logo: 'assets/images/categories/googleIcon.png',
                  ),
                  CircledLogo(
                    navigateTo: () {},
                    logo: 'assets/images/categories/appleIcon.png',
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
