import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/lock_icon.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/background.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      paddingSize: 150,
      screens: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LockIcon(),
            const PageTitle(title: 'Account Sign In'),
            CustomFormField(
              hintText: 'Email',
              fieldIcon: const Icon(Icons.email),
              validators: (value) => Validators.validateEmail(value!),
            ),
            CustomFormField(
              fieldIcon: const Icon(Icons.remove_red_eye),
              hintText: 'Password',
              validators: (value) => Validators.validatePassword(value!),
            ),
            const HyperLinkText(
              directingText: 'Forgot Password ?',
            ),
            LoginButton(
              text: 'Login',
              validate: () => _formKey.currentState!.validate()
                  ? Navigator.pushNamed(context, '/')
                  : null,
              actionField: () {
                if (_formKey.currentState!.validate()) {
                  print("Here we go!");
                }
                print("Printed successfully");
              },
            ),
            const CustomDevider(middleText: 'Or sign in with'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                children: const [
                  CircledLogo(
                    logo: 'assets/images/categories/logoutIcon.png',
                    navigateTo: '/phoneLogin',
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
