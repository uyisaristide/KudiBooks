import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/lock_icon.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';

class PhoneLogin extends StatelessWidget {
  PhoneLogin({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LockIcon(),
              const PageTitle(title: 'Account SignIn'),
              const CustomFormField(hintText: 'Phone Number'),
              LoginButton(
                text: 'Login',
                validate: () => _formKey.currentState!.validate()
                    ? Navigator.pushNamed(context, '/')
                    : null,
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
      ),
    );
  }
}
