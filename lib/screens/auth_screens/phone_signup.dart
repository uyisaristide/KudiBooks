import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/Users/user_model.dart';
import '../../models/utilities/network_info.dart';
import '../../providers/all_providers_list.dart';
import 'validators/validator.dart';
import 'widgets/circled_logo.dart';
import 'widgets/custom_devider.dart';
import 'widgets/hyperlink_text.dart';
import 'widgets/login_button.dart';
import 'widgets/page_title.dart';
import 'widgets/phone_input.dart';
import 'widgets/text_form_field.dart';
import '../background.dart';

import '../dashboard/classes/snack_bars.dart';

class PhoneSignup extends ConsumerStatefulWidget {
  const PhoneSignup({Key? key}) : super(key: key);

  @override
  ConsumerState<PhoneSignup> createState() => _PhoneSignupState();
}

class _PhoneSignupState extends ConsumerState<PhoneSignup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final pinController = TextEditingController();
  final confirmPin = TextEditingController();

  String _countryCodes = '250';

  var isHidden = true;

  var isHidden2 = true;

  var pinController2 = TextEditingController();

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
    var createUserPhone = ref.watch(createUserPhoneProvider);
    return BackgroundScreen(
      screens: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PageTitle( title: 'createAccountPhone.title'.tr(), ),
            CustomFormField(
              labelText: 'createAccountPhone.form.firstName.label'.tr(),
              fieldIcon: const Icon(
                Icons.person_outline,
                size: 18,
              ),
              hintText: 'createAccountPhone.form.firstName.hint'.tr(),
              validators: (value) => Validators.validateName(value),
              fieldController: firstNameController,
              isShown: false,
            ),
            CustomFormField(
              labelText: 'createAccountPhone.form.lastName.label'.tr(),
              fieldIcon: const Icon(Icons.person, size: 18),
              hintText: 'createAccountPhone.form.lastName.hint'.tr(),
              validators: (value) => Validators.validateName(value),
              fieldController: lastNameController,
              isShown: false,
            ),
            PhoneField(
              textLabel: 'createAccountPhone.form.phoneNumber.label'.tr(),
              countryCodes: (country) {
                setState(() {
                  _countryCodes = country.dialCode;
                });
              },
              fieldIcon: const Icon(Icons.phone, size: 18),
              phoneNumber: phoneController,
              validators: (value) {
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: TextFormField(
                obscureText: isHidden,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: pinController,
                maxLength: 4,
                validator: (value) => Validators.validatePin(value!),
                decoration: InputDecoration(
                    labelText: "createAccountPhone.form.pin.label".tr(),
                    focusColor: const Color(0xff157253),
                    labelStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () => setState(() => isHidden = !isHidden),
                        icon: isHidden
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              )
                            : const Icon(Icons.visibility_off)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff157253), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Validators.validatePin(pinController.text) ==
                                    null
                                ? Colors.grey
                                : Colors.red,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        )),
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: "createAccountPhone.form.pin.hint".tr(),
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: TextFormField(
                obscureText: isHidden2,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: pinController2,
                maxLength: 4,
                validator: (value) {
                  if (value != pinController.text) {
                    return "createAccountPhone.validate.pinNotMatch".tr();
                  } else if (value == '') {
                    return 'createAccountPhone.validate.fillOutThisForm'.tr();
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "createAccountPhone.form.pin.label".tr(),
                    focusColor: const Color(0xff157253),
                    labelStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () => setState(() => isHidden2 = !isHidden2),
                        icon: isHidden2
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              )
                            : const Icon(Icons.visibility_off)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff157253), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Validators.validatePin(pinController.text) ==
                                    null
                                ? Colors.grey
                                : Colors.red,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        )),
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: "createAccountPhone.form.pin.hint".tr(),
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
            ),
            const SizedBox(height: 5),
            LoginButton(
              text: 'createAccountPhone.form.button.register'.tr(),
              actionField: () async{
                if (_formKey.currentState!.validate()) {
                  var _phoneNumber = "+$_countryCodes${phoneController.text}";
                  var phoneRegister = await ref
                      .read(createUserPhoneProvider.notifier)
                      .createUserPhone(User(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          phoneOrEmail: _phoneNumber,
                          password: pinController.text,
                          passwordConfirm: pinController.text));
                  if(phoneRegister.networkStatus == NetworkStatus.success){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBars.snackBars('Thanks for creating account', Colors.green.shade400));
                    context.goNamed('signin');
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBars.snackBars(phoneRegister.getErrorMessage, Colors.redAccent.shade400));
                  }
                }
              },
            ),
            HyperLinkText(
              directingText: 'createAccountPhone.button.loginInstead'.tr(),
              actions: () => context.goNamed('signin'),
            ),
            CustomDevider(
              middleText: 'createAccountPhone.signUpWith'.tr(),
              horizotalPadding: 40.0,
              verticalPadding: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircledLogo(
                    logo: 'assets/images/categories/emailIcon.png',
                    navigateTo: () => context.goNamed('signup'),
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
