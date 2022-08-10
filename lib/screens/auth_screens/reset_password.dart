import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/providers/all_providers_list.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/lock_icon.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/password_field.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/background.dart';

import '../dashboard/classes/snack_bars.dart';

class ResetEmailPassword extends ConsumerStatefulWidget {
  String? token;
  String? recoverEmail;

  ResetEmailPassword({this.recoverEmail, this.token, Key? key})
      : super(key: key);

  @override
  ConsumerState<ResetEmailPassword> createState() => _PhoneResetState();
}

class _PhoneResetState extends ConsumerState<ResetEmailPassword> {
  String? myEmail;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isHidden = true;

  @override
  void initState() {
    super.initState();
    myEmail = widget.recoverEmail;
    emailController = TextEditingController(text: myEmail);
  }

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
            const PageTitle(title: 'Reset your password'),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("$myEmail"),
            ),
            CustomFormField(
              fieldController: emailController,
              fieldIcon: const Icon(Icons.email),
              hintText: 'Email Address',
              validators: (value) => Validators.validateEmail(value),
              isShown: false,
            ),
            PasswordField(
              hintText: "New Password",
              maxLength: 30,
              isHidden: isHidden,
              passwordController: passwordController,
              validators: (value) {
                if (value!.length < 8) {
                  return "Much 8 charactor string";
                }
                return null;
              },
              suffixIcon: IconButton(
                  onPressed: () => setState(() => isHidden = !isHidden),
                  icon: isHidden
                      ? const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        )
                      : const Icon(Icons.visibility_off)),
            ),
            PasswordField(
              hintText: "Confirm Password",
              maxLength: 30,
              isHidden: isHidden,
              passwordController: confirmPasswordController,
              validators: (value) {
                if (value != passwordController.text) {
                  return "Password not match";
                } else if (value == '') {
                  return 'Fill out this form';
                }
                return null;
              },
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
            // LoginButton(
            //   text: 'Login',
            //   actionField: () {
            //     if (_formKey.currentState!.validate()) {
            //       var checkUser = _users.where((element) =>
            //           element.phoneOrEmail ==
            //           _countryCode + phoneController.text);
            //       if (checkUser.isEmpty) {
            //         ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBars.snackBars(
            //                 'This user not found', Colors.redAccent));
            //       } else if (checkUser.first.phoneOrEmail ==
            //               _countryCode + phoneController.text &&
            //           checkUser.first.password == pinController.text) {
            //         context.goNamed('dashboard');
            //       } else {
            //         ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBars.snackBars('Incorrect pin', Colors.redAccent));
            //         debugPrint(
            //             "Printed successfully ${checkUser.first.phoneOrEmail} and password is: ${checkUser.first.password}");
            //       }
            //       debugPrint(
            //           "Country code is: ${_countryCode + phoneController.text}");
            //     }
            //   },
            // ),
            LoginButton(
              text: 'Reset',
              actionField: () async {
                if (_formKey.currentState!.validate()) {
                  debugPrint("able to reset");
                  String response = ref
                      .read(authProvider.notifier)
                      .resetEmailPassword(
                          token: widget.token.toString(),
                          email: emailController.text,
                          password: passwordController.text,
                          password_confirmation:
                              confirmPasswordController.text);
                  if (response == "success") {
                    context.goNamed('signin');
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBars.snackBars(
                            'Reseted successfully', Colors.green.shade400));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBars.snackBars(
                            'Reseted successfully', Colors.red.shade400));
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
