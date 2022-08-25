import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/utilities/network_info.dart';
import 'validators/validator.dart';
import 'widgets/lock_icon.dart';
import 'widgets/login_button.dart';
import 'widgets/page_title.dart';
import 'widgets/password_field.dart';
import 'widgets/phone_input.dart';
import '../background.dart';

import '../../providers/all_providers_list.dart';
import '../dashboard/classes/snack_bars.dart';

class ResetPin extends ConsumerStatefulWidget {
  String? phoneNumber;
  String? sentOTP;

  ResetPin({this.sentOTP, this.phoneNumber, Key? key}) : super(key: key);

  @override
  ConsumerState<ResetPin> createState() => _PhoneResetState();
}

class _PhoneResetState extends ConsumerState<ResetPin> {
  String? phoneNumbers;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;
  final pinController = TextEditingController();
  final otpController = TextEditingController();
  final confirmPinController = TextEditingController();

  var _countryCode = '250';
  bool isHidden = true;

  @override
  void initState() {
    super.initState();
    phoneNumbers = widget.phoneNumber;
    phoneController = TextEditingController(text: phoneNumbers);
  }

  @override
  Widget build(BuildContext context) {
    var resetUserWatcher = ref.watch(resetUserInfoProvider);
    return BackgroundScreen(
      paddingSize: 150,
      screens: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LockIcon(),
            const PageTitle(title: 'Reset your pin'),
            PasswordField(
              hintText: "OTP",
              passwordController: otpController,
              maxLength: 6,
              textInputType: TextInputType.number,
              validators: (value) {
                if (value!.length < 6) {
                  return "Too short";
                }
                return null;
              },
              isHidden: false,
            ),
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
            PasswordField(
              hintText: "Confirm pin",
              isHidden: isHidden,
              passwordController: confirmPinController,
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
                debugPrint(
                    "+$_countryCode${phoneController.text} Kigali controller");
                // context.pushNamed('otpVerification',
                //     extra: "$_countryCode${phoneController.text}");
                if (_formKey.currentState!.validate()) {
                  // print("+$_countryCode${phoneController.text}");
                  var phoneNumber = "+$_countryCode${phoneController.text}";
                  var otpResponse = await ref
                      .read(resetUserInfoProvider.notifier)
                      .resetPhonePin(
                          otpCode: otpController.text,
                          phoneNumber: phoneNumber,
                          pin: pinController.text,
                          confirm_pin: confirmPinController.text);
                  if (otpResponse.networkStatus == NetworkStatus.success) {
                    context.pushNamed('loginPhone');
                    ScaffoldMessenger.of(context).showSnackBar( SnackBars.snackBars('OTP Sent', Colors.green.shade400));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar( SnackBars.snackBars(resetUserWatcher.getErrorMessage, Colors.redAccent));
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
