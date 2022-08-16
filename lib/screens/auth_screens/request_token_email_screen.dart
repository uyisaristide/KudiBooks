import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/lock_icon.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:kudibooks_app/screens/dashboard/classes/snack_bars.dart';

import '../../providers/all_providers_list.dart';

class EmailReset extends ConsumerStatefulWidget {
  String? sentEmail;

  EmailReset({this.sentEmail, Key? key}) : super(key: key);

  @override
  ConsumerState<EmailReset> createState() => _PhoneResetState();
}

class _PhoneResetState extends ConsumerState<EmailReset> {
  String? email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  bool isHidden = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = widget.sentEmail;
    emailController = TextEditingController(text: email);
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
            const PageTitle(title: 'Reset password'),
            CustomFormField(
              fieldController: emailController,
              fieldIcon: const Icon(Icons.email),
              hintText: 'Email Address',
              validators: (value) => Validators.validateEmail(value),
              isShown: false,
            ),
            const SizedBox(
              height: 10,
            ),
            LoginButton(
              text: 'Send email',
              actionField: () async {
                debugPrint('Reset email');
                if (_formKey.currentState!.validate()) {
                  if (Platform.isAndroid) {
                    String result = await ref
                        .read(authProvider.notifier)
                        .forgotPassword(
                        email: emailController.text,
                        device: Platform.operatingSystem);
                    if (result == "success") {
                      // debugPrint(result);
                      context.goNamed('signin');
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBars.snackBars(
                            "Check Link on email", Colors.green.shade400));
                    } else {
                      // print("failed");
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBars.snackBars(
                            "Check Link on email", Colors.red.shade400));
                    }
                  } else if (Platform.isIOS) {
                    String result = await ref
                        .read(authProvider.notifier)
                        .forgotPassword(
                        email: emailController.text,
                        device: Platform.operatingSystem);
                    if (result == "success") {
                      debugPrint(result);
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBars.snackBars(
                            "Check Link on email", Colors.green.shade400));
                    } else {
                      print("failed");
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBars.snackBars(
                            "Check Link on email", Colors.red.shade400));
                    }
                  } else {
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(SnackBars.snackBars(
                          "Your platform not allowed here",
                          Colors.red.shade400));
                  }
                }
                // context.pushNamed('resetPassword', extra: emailController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
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
