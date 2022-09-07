import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/utilities/network_info.dart';
import '../../providers/all_providers_list.dart';
import '../dashboard/classes/snack_bars.dart';
import 'validators/validator.dart';
import 'widgets/circled_logo.dart';
import 'widgets/custom_devider.dart';
import 'widgets/hyperlink_text.dart';
import 'widgets/lock_icon.dart';
import 'widgets/login_button.dart';
import 'widgets/page_title.dart';
import 'widgets/password_field.dart';
import 'widgets/phone_input.dart';
import '../background.dart';

class PhoneLogin extends ConsumerStatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

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
    var loginPhoneWatcher = ref.watch(loginPhoneProvider);
    return BackgroundScreen(
      buttonWidget: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              context.goNamed("signin");
            },
            child: const Text(
              "signUpPhoneScreen.button.signUp",
              style: TextStyle(
                color: Color(0Xff157253),
              ),
            ).tr(),
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
            PageTitle(title: 'signUpPhoneScreen.title'.tr()),
            PhoneField(
              textLabel: 'signUpPhoneScreen.form.phoneNumber.hint'.tr(),
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
              labelText: 'signUpPhoneScreen.form.pin.label'.tr(),
              hintText: "signUpPhoneScreen.form.pin.hint".tr(),
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
              directingText: 'signUpPhoneScreen.forgotPassword'.tr(),
              actions: () {
                context.pushNamed('forget', extra: phoneController.text);
              },
            ),
            LoginButton(
              text: 'signUpPhoneScreen.button.login'.tr(),
              actionField: () async {
                if (_formKey.currentState!.validate()) {
                  var phoneNumber = "+$_countryCode${phoneController.text}";
                  var result = await ref
                      .read(loginPhoneProvider.notifier)
                      .loginPhone(
                          phoneNumber: phoneNumber, pin: pinController.text);
                  if (result.networkStatus == NetworkStatus.success) {
                    context.goNamed('signin', extra: "${phoneController.text}");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBars.snackBars(
                            result.getErrorMessage, Colors.redAccent.shade400));
                  }
                }
              },
            ),
            CustomDevider(
              middleText: 'signUpPhoneScreen.signUpWith'.tr(),
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
