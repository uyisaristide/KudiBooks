import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/providers/user_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/phone_input.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:collection/collection.dart';

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
    List<User> users = ref.watch(userProvider).allUsers;
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
              isShown: false,
            ),
            CustomFormField(
              fieldIcon: const Icon(Icons.person, size: 18),
              hintText: 'Last Name',
              validators: (value) => Validators.validateName(value),
              fieldController: lastNameController,
              isShown: false,
            ),
            PhoneField(
              countryCodes: (country) {
                setState(() {
                  _countryCodes = country.dialCode;
                });
                debugPrint("Phone Number with country code");
              },
              fieldIcon: const Icon(Icons.phone, size: 18),
              phoneNumber: phoneController,
              validators: () {},
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
                    hintText: "Pin",
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
                    return "Pin not match";
                  } else if (value == '') {
                    return 'Fill out this form';
                  }
                  return null;
                },
                decoration: InputDecoration(
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
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        )),
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: "Pin",
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
            ),
            LoginButton(
              text: 'Register now',
              actionField: () {
                if (_formKey.currentState!.validate()) {
                  var checkUser = users.firstWhereOrNull((element) =>
                      element.phoneOrEmail == phoneController.text);
                  if (checkUser == null) {
                    ref.watch(userProvider).addUser(User(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        phoneOrEmail: _countryCodes + phoneController.text,
                        password: pinController.text));
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBars.snackBars(
                            'User saved successfully', Colors.green.shade400));
                    Navigator.pushReplacementNamed(context, '/login');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBars.snackBars(
                            'User already exists', Colors.redAccent.shade400));
                  }
                }
              },
            ),
            const SizedBox(height: 5),
            LoginButton(
              text: 'Register now Net',
              actionField: () {
                if (_formKey.currentState!.validate()) {
                  var _phoneNumber = "+$_countryCodes${phoneController.text}";
                  ref.watch(userProvider).createUser(User(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      phoneOrEmail: _phoneNumber,
                      password: pinController.text,
                      passwordConfirm: pinController.text));
                  Navigator.pushReplacementNamed(context, '/login');
                }
              },
            ),
            HyperLinkText(
              directingText: 'Login instead',
              actions: () => Navigator.pushReplacementNamed(context, '/login'),
            ),
            CustomDevider(
              middleText: 'Or sign up with',
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
