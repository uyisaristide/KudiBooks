import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/providers/all_providers_list.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/lock_icon.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/password_field.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/phone_input.dart';
import 'package:kudibooks_app/screens/background.dart';

import '../dashboard/classes/snack_bars.dart';

class PhoneLogin extends ConsumerStatefulWidget {
  PhoneLogin({Key? key}) : super(key: key);

  @override
  ConsumerState<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends ConsumerState<PhoneLogin> {
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
    print("In phone screen +$_countryCode${phoneController.text}");
    List<User> _users = ref.watch(usersProvider);
    return BackgroundScreen(
      buttonWidget: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              context.goNamed("signin");
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
              validators: (value) {},
              countryCodes: (country) {
                _countryCode = country.dialCode;
                debugPrint(_countryCode);
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
            HyperLinkText(
              directingText: 'Forgot Pin ?',
              actions: () {
                context.pushNamed('forget', extra: phoneController.text);
              },
            ),
            LoginButton(
              text: 'Login local',
              actionField: () {
                // debugPrint("${Hive.box('tokens').get('token')}");
                context.pushNamed('dashboard');
                // if (_formKey.currentState!.validate()) {
                //   var checkUser = _users.where((element) =>
                //       element.phoneOrEmail ==
                //       _countryCode + phoneController.text);
                //   if (checkUser.isEmpty) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBars.snackBars(
                //             'This user not found', Colors.redAccent));
                //   } else if (checkUser.first.phoneOrEmail ==
                //           _countryCode + phoneController.text &&
                //       checkUser.first.password == pinController.text) {
                //     context.goNamed('dashboard');
                //   } else {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBars.snackBars('Incorrect pin', Colors.redAccent));
                //     debugPrint(
                //         "Printed successfully ${checkUser.first.phoneOrEmail} and password is: ${checkUser.first.password}");
                //   }
                //   debugPrint(
                //       "Country code is: ${_countryCode + phoneController.text}");
                // }
              },
            ),
            LoginButton(
              text: 'Login',
              actionField: () async {
                if (_formKey.currentState!.validate()) {
                  var phoneNumber = "+$_countryCode${phoneController.text}";
                  var result = await ref
                      .read(usersProvider.notifier)
                      .loginPhone(
                          phoneNumber: phoneNumber, pin: pinController.text);
                  if (result == "success") {
                    var tokenHive = await Hive.box('tokens').get('token');
                    debugPrint("In Hive token: $tokenHive}");
                    context.goNamed('dashboard');
                  } else {
                    debugPrint("Incorrect pin: $result");
                  }
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
                    navigateTo: () => context.goNamed('signin'),
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
