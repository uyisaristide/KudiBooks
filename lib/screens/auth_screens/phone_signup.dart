import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/phone_input.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';

class PhoneSignup extends StatelessWidget {
  PhoneSignup({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                top: 150,
                left: 250,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(color: Colors.green),
                )),
            Positioned(
                top: 30,
                left: 60,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(color: Colors.amber),
                )),
            Positioned(
                top: 200,
                left: -80,
                child: Container(
                  height: 200,
                  width: 100,
                  decoration: const BoxDecoration(color: Colors.amber),
                )),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 90.0),
              child: Container(
                color: Colors.white.withOpacity(.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const PageTitle(
                      title: 'Create new account',
                    ),
                    CustomFormField(
                      fieldIcon: const Icon(
                        Icons.person_outline,
                        size: 18,
                      ),
                      hintText: 'First Name',
                      validators: (value) => Validators.validateName(value),
                    ),
                    CustomFormField(
                      fieldIcon: const Icon(Icons.person, size: 18),
                      hintText: 'Last Name',
                      validators: (value) => Validators.validateName(value),
                    ),
                    PhoneField(
                        fieldIcon: const Icon(Icons.phone, size: 18),
                        phoneNumber: phoneNumber),
                    CustomFormField(
                      fieldIcon: const Icon(Icons.remove_red_eye, size: 18),
                      inputType: TextInputType.number,
                      hintText: 'Pin',
                      validators: (value) => Validators.validatePassword(value),
                    ),
                    CustomFormField(
                      inputType: TextInputType.number,
                      fieldIcon: const Icon(Icons.remove_red_eye, size: 18),
                      hintText: 'Confirm Password',
                      validators: (value) => Validators.validatePassword(value),
                    ),
                    LoginButton(
                      text: 'Register now',
                      validate: () => _formKey.currentState!.validate()
                          ? Navigator.pushNamed(context, '/otp')
                          : null,
                      actionField: () {
                        if (_formKey.currentState!.validate()) {
                          print("Here we go!");
                        }
                      },
                    ),
                    const HyperLinkText(directingText: 'Login instead'),
                    const CustomDevider(middleText: 'Or sign up with'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
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
            ),
          ],
        ),
      ),
    );
  }
}
