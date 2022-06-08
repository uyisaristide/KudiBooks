import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/lock_icon.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LockIcon(),
          const PageTitle(title: 'Create new account'),
          const CustomFormField(hintText: 'First Name'),
          const CustomFormField(hintText: 'Last Name'),
          const CustomFormField(hintText: 'Email Address'),
          const CustomFormField(hintText: 'Password'),
          const CustomFormField(hintText: 'Confirm Password'),
           LoginButton(text: 'Register now'),
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
    ));
  }
}
