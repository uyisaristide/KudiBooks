import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/lock_icon.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';

class PhoneSignup extends StatelessWidget {
  PhoneSignup({Key? key}) : super(key: key);
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
              const PageTitle(
                title: 'Create new account',
              ),
              CustomFormField(
                  hintText: 'First Name',
                  validators: (value) => Validators.validateName(value)),
              CustomFormField(
                  hintText: 'Last Name',
                  validators: (value) => Validators.validateName(value)),
              CustomFormField(
                  prefix: CountryCodePicker(
                    onChanged: (code) => print(code),
                    initialSelection: 'Rwanda',
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: false,
                    favorite: const ['+250', 'Rwanda'],
                    enabled: true,
                    hideMainText: false,
                    showFlagMain: true,
                    showFlag: true,
                    hideSearch: false,
                    showFlagDialog: false,
                  ),
                  hintText: 'Phone Number',
                  validators: (value) => Validators.validatePhoneNumber(value)),
              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(border: Border.all()),
              //   child: CountryCodePicker(
              //     initialSelection: 'Rwanda',
              //     showCountryOnly: true,
              //     showOnlyCountryWhenClosed: false,
              //     favorite: const ['+250', 'Rwanda'],
              //     enabled: true,
              //     hideMainText: false,
              //     showFlagMain: true,
              //     showFlag: true,
              //     hideSearch: false,
              //     showFlagDialog: false,
              //     onChanged: (code) => print(code),
              //   ),
              // ),
              LoginButton(
                  text: 'Register now',
                  validate: () => _formKey.currentState!.validate()
                      ? Navigator.pushNamed(context, '/otp')
                      : null),
              const HyperLinkText(directingText: 'Login instead'),
              const CustomDevider(middleText: 'Or sign up with'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
