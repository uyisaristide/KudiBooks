import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/lock_icon.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _cPwd = TextEditingController();

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
            const PageTitle(title: 'Create new account'),
            CustomFormField(
              hintText: 'First Name',
              validators: (value) => Validators.validateName(value),
            ),
            CustomFormField(
              hintText: 'Last Name',
              validators: (value) => Validators.validateName(value),
            ),
            CustomFormField(
              hintText: 'Email Address',
              validators: (value) => Validators.validateEmail(value),
            ),
            CustomFormField(
              controller: _pwd,
              hintText: 'Password',
              validators: (value) => Validators.validatePassword(value),
            ),
            CustomFormField(
              controller: _cPwd,
              hintText: 'Confirm Password',
              validators: (value) {
                if (_cPwd.text != _pwd.text) {
                  return 'enter same password';
                } else {
                  return Validators.validatePassword(value);
                }
              },
            ),
            LoginButton(
                text: 'Register now',
                validate: () => _formKey.currentState!.validate()
                    ? Navigator.pushNamed(context, '/')
                    : null),
            const HyperLinkText(directingText: 'Login instead'),
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
    ));
  }
}
