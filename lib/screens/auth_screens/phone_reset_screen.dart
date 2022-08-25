import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/utilities/network_info.dart';
import '../dashboard/classes/snack_bars.dart';
import 'widgets/lock_icon.dart';
import 'widgets/login_button.dart';
import 'widgets/page_title.dart';
import 'widgets/phone_input.dart';
import '../background.dart';

import '../../providers/all_providers_list.dart';

class PhoneReset extends ConsumerStatefulWidget {
  String? sentPhoneNumber;

  PhoneReset({this.sentPhoneNumber, Key? key}) : super(key: key);

  @override
  ConsumerState<PhoneReset> createState() => _PhoneResetState();
}

class _PhoneResetState extends ConsumerState<PhoneReset> {
  String? phoneNumbers;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;
  var _countryCode = '250';
  bool isHidden = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneNumbers = widget.sentPhoneNumber;
    phoneController = TextEditingController(text: phoneNumbers);
  }

  @override
  Widget build(BuildContext context) {
    var requestOtpWatcher = ref.watch(requestingOtpProvider);
    return BackgroundScreen(
      paddingSize: 150,
      screens: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LockIcon(),
            const PageTitle(title: 'Reset pin'),
            PhoneField(
              validators: (value) {
                return null;
              },
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
              text: 'Send OTP',
              actionField: () async {
                debugPrint(
                    "+$_countryCode${phoneController.text} Kigali controller");
                if (_formKey.currentState!.validate()) {
                  context.pushNamed('recoverScreen');
                  // print("+$_countryCode${phoneController.text}");
                  var phoneNumbers = "+$_countryCode${phoneController.text}";
                  var otpResponse = await ref
                      .read(requestingOtpProvider.notifier)
                      .requestOTP(phoneNumbers: phoneNumbers);
                  if (otpResponse.networkStatus == NetworkStatus.success) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBars.snackBars('Rewrite your OTP', Colors.green.shade400));
                    context.pushNamed('recoverScreen');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBars.snackBars(requestOtpWatcher.getErrorMessage, Colors.redAccent.shade400));
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
