import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/providers/user_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/lock_icon.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/password_field.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/phone_input.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:provider/provider.dart';

import '../dashboard/classes/snack_bars.dart';
import '../dashboard/widget/bottom_navigation.dart';

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
  var _countryCode = '250';
  bool isHidden = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);
    List<User> _users = _userProvider.allUsers;
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
              validators: () =>
                  Validators.validatePhoneNumber(phoneController.text),
              countryCodes: (country) {
                _countryCode = country.dialCode;
                print(_countryCode);
              },
              fieldIcon: const Icon(
                Icons.phone,
                size: 17,
              ),
              phoneNumber: phoneController,
            ),
            PasswordField(
              hintText: "Password",
              isHidden: isHidden,
              passwordController: pinController,
              maxLength: 4,
              textInputType: TextInputType.number,
              validators: (value) => Validators.validatePin(value!),
              suffixIcon: IconButton(
                  onPressed: () => setState(() => isHidden = !isHidden),
                  icon: isHidden
                      ? const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        )
                      : const Icon(Icons.visibility_off)),
            ),
            const SizedBox(
              height: 10,
            ),
            LoginButton(
              text: 'Login',
              actionField: () {
                if (_formKey.currentState!.validate()) {
                  var checkUser = _users.where((element) =>
                      element.phoneOrEmail ==
                      _countryCode + phoneController.text);
                  if (checkUser.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBars.snackBars(
                            'This user not found', Colors.redAccent));
                  } else if (checkUser.first.phoneOrEmail ==
                          _countryCode + phoneController.text &&
                      checkUser.first.password == pinController.text) {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => NavigationBottom()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBars.snackBars('Incorrect pin', Colors.redAccent));
                    print(
                        "Printed successfully ${checkUser.first.phoneOrEmail} and password is: ${checkUser.first.password}");
                  }
                  print(
                      "Country code is: ${_countryCode + phoneController.text}");
                }
              },
            ),
            CustomDevider(
              middleText: 'Or sign in with',
              horizotalPadding: 40.0,
              verticalPadding: 15.0,
            ),
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
