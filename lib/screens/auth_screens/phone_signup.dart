import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/phone_input.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/background.dart';

class PhoneSignup extends StatefulWidget {
  PhoneSignup({Key? key}) : super(key: key);

  @override
  State<PhoneSignup> createState() => _PhoneSignupState();
}

class _PhoneSignupState extends State<PhoneSignup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final pinController = TextEditingController();
  final confirmPin = TextEditingController();

  String _countryCodes = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController.addListener(() => setState(() {}));
    lastNameController.addListener(() => setState(() {}));
    phoneController.addListener(() => setState(() {}));
    pinController.addListener(() => setState(() {}));
    confirmPin.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      screens: Form(
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
              fieldController: firstNameController,
            ),
            CustomFormField(
              fieldIcon: const Icon(Icons.person, size: 18),
              hintText: 'Last Name',
              validators: (value) => Validators.validateName(value),
              fieldController: lastNameController,
            ),
            PhoneField(
                countryCodes: (country) {
                  _countryCodes = country.dialCode;
                  print("Country ${_countryCodes + phoneController.text}");
                },
                fieldIcon: const Icon(Icons.phone, size: 18),
                phoneNumber: phoneController),
            CustomFormField(
              fieldIcon: const Icon(Icons.remove_red_eye, size: 18),
              inputType: TextInputType.number,
              hintText: 'Pin',
              maximumLength: 4,
              validators: (value) => Validators.validatePin(value),
              fieldController: pinController,
            ),
            CustomFormField(
              maximumLength: 4,
              inputType: TextInputType.number,
              fieldIcon: const Icon(Icons.remove_red_eye, size: 18),
              hintText: 'Confirm Password',
              validators: (value) => Validators.validatePin(value),
              fieldController: confirmPin,
            ),
            LoginButton(
              text: 'Register now',
              validate: () => _formKey.currentState!.validate()
                  ? Navigator.pushNamed(context, '/otp')
                  : null,
              actionField: () {
                if (_formKey.currentState!.validate()) {
                  print(
                      "This is the value ${_countryCodes + pinController.text}");
                }
              },
            ),
            HyperLinkText(
              directingText: 'Login instead',
              actions: () => Navigator.pushReplacementNamed(context, '/login'),
            ),
            const CustomDevider(middleText: 'Or sign up with'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircledLogo(
                    logo: 'assets/images/categories/emailIcon.png',
                    navigateTo: () =>
                        Navigator.pushReplacementNamed(context, ("/signup")),
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
      paddingSize: 150,
    );
  }
}
