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

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));
  }

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
            CustomFormField(
              labelText: "Email",
              inputType: TextInputType.emailAddress,
              onChangeAction: (value) {
                // Validators.validateEmail(value) == null ? :;
              },
              hintText: 'Email',
              fieldIcon: const Icon(Icons.email),
              validators: (value) => Validators.validateEmail(value!),
              fieldController: emailController,
            ),
            CustomFormField(labelText: "Password",
              fieldIcon: const Icon(Icons.remove_red_eye),
              hintText: 'Password',
              validators: (value) => Validators.validatePassword(value!),
              fieldController: passwordController,
            ),
            HyperLinkText(
              directingText: 'Forgot Password ?',
              actions: () {
                print("Need to recover");
              },
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircledLogo(
                    logo: 'assets/images/categories/logoutIcon.png',
                    navigateTo: () {
                      Navigator.pushReplacementNamed(context, "/phoneLogin");
                    },
                  ),
                  const CircledLogo(
                    logo: 'assets/images/categories/googleIcon.png',
                  ),
                  const CircledLogo(
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
