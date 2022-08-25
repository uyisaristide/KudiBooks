import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/utilities/network_info.dart';
import 'validators/validator.dart';
import 'widgets/lock_icon.dart';
import 'widgets/login_button.dart';
import 'widgets/page_title.dart';
import 'widgets/text_form_field.dart';
import '../background.dart';
import '../dashboard/classes/snack_bars.dart';

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
    var forgetPasswordWatcher = ref.watch(forgetPasswordProvider);
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
                if (_formKey.currentState!.validate()) {
                  if (Platform.isAndroid) {
                    var result = await ref
                        .read(forgetPasswordProvider.notifier)
                        .forgotPassword(
                        email: emailController.text,
                        device: Platform.operatingSystem);
                    if (result.networkStatus == NetworkStatus.success) {
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
                            "${forgetPasswordWatcher.getErrorMessage}", Colors.red.shade400));
                    }
                  } else if (Platform.isIOS) {
                    var result = await ref
                        .read(forgetPasswordProvider.notifier)
                        .forgotPassword(
                        email: emailController.text,
                        device: Platform.operatingSystem);
                    if (result.networkStatus == NetworkStatus.success) {
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBars.snackBars(
                            "Check Link on email", Colors.green.shade400));
                    } else {
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBars.snackBars(
                            "Error: ${forgetPasswordWatcher.getErrorMessage}", Colors.red.shade400));
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
