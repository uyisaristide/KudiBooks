import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
<<<<<<< HEAD
import '../../models/Users/user_profile_model.dart';
=======
>>>>>>> 39b1895d71f9f30293927ea113498717da5f5883
import '../../models/utilities/network_info.dart';
import '../../providers/all_providers_list.dart';
import '../../providers/user_provider.dart';
import 'validators/validator.dart';
import 'widgets/circled_logo.dart';
import 'widgets/custom_devider.dart';
import 'widgets/hyperlink_text.dart';
import 'widgets/lock_icon.dart';
import 'widgets/login_button.dart';
import 'widgets/page_title.dart';
import 'widgets/text_form_field.dart';
import '../background.dart';
import '../dashboard/classes/snack_bars.dart';

// late Box box;
// void createBox() async {
//    box = await Hive.openBox('sad');
// }

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isHidden = true;

  // late Box<UserProfile> loggedUserBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(loginEmailProvider);
    emailController.addListener(() => setState(() {}));

    // loggedUserBox = Hive.box(userProfileBoxName);
  }

  @override
  Widget build(BuildContext context) {
    var loginEmailWatcher = ref.watch(loginEmailProvider);
    debugPrint("Logged user is: $myToken");
    return BackgroundScreen(
      buttonWidget: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => context.goNamed('signup'),
            child: const Text(
              "signUpScreen.button.signUp",
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
            PageTitle(title: 'signUpScreen.title'.tr()),
            CustomFormField(
              labelText: "signUpScreen.form.email.label".tr(),
              inputType: TextInputType.emailAddress,
              onChangeAction: (value) {
                // Validators.validateEmail(value) == null ? :;
              },
              hintText: 'signUpScreen.form.email.hint'.tr(),
              fieldIcon: const Icon(
                Icons.email,
                color: Colors.grey,
              ),
              validators: (value) => Validators.validateEmail(value!),
              fieldController: emailController,
              isShown: false,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: TextFormField(
                obscureText: isHidden,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: passwordController,
                maxLength: 30,
                validator: (value) => Validators.validatePassword(value!),
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
                            color: Validators.validatePassword(
                                        passwordController.text) ==
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
                    hintText: "signUpScreen.form.password.hint".tr(),
                    labelText: 'signUpScreen.form.password.label'.tr(),
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
            ),
            HyperLinkText(
              directingText: 'signUpScreen.forgotPassword'.tr(),
              actions: () {
                context.pushNamed('requestTokenEmail',
                    extra: emailController.text);
              },
            ),
            // LoginButton(
            //   text: 'Login',
            //   actionField: () {
            //     if (_formKey.currentState!.validate()) {
            //       context.goNamed('dashboard');
            //       var checkUser = _user.where((element) =>
            //           element.phoneOrEmail == emailController.text);
            //       if (checkUser.isEmpty) {
            //         ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBars.snackBars(
            //                 'This user not found', Colors.redAccent));
            //       } else if (checkUser.first.phoneOrEmail ==
            //               emailController.text &&
            //           checkUser.first.password == passwordController.text) {
            //         context.goNamed('dashboard',
            //             extra: checkUser.first.phoneOrEmail!);
            //         // Navigator.pushReplacement(
            //         //     context,
            //         //     CupertinoPageRoute(
            //         //         builder: (context) => NavigationBottom(
            //         //               loggedUser: checkUser.first.phoneOrEmail!,
            //         //             )));
            //       } else {
            //         ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBars.snackBars(
            //                 'Incorrect password', Colors.redAccent));
            //         print(
            //             "Printed successfully ${checkUser.first.phoneOrEmail} and password is: ${checkUser.first.password}");
            //       }
            //     }
            //   },
            // ),

            LoginButton(
<<<<<<< HEAD
              text: 'Login net',
=======
              text: 'signUpScreen.button.login'.tr(),
>>>>>>> 39b1895d71f9f30293927ea113498717da5f5883
              actionField: () async {
                if (_formKey.currentState!.validate()) {
                  var check = await ref
                      .read(loginEmailProvider.notifier)
                      .loginEmail(
                          emailController.text, passwordController.text);
                  if (check.networkStatus == NetworkStatus.success) {
                    var user = await ref
                        .read(userProfileProvider.notifier)
                        .getUserProfile();
                    var toHive = await ref
                        .read(userProfileProvider.notifier)
                        .addLoggedUserToHive();
                    var getUserProfile = ref
                        .read(userProfileProvider.notifier)
                        .getUserFromHive();
                    // var companiesAssociated =
                    ref.read(companyProvider.notifier).getCompaniesList();
                    // print('get user returned: ${companiesAssociated}');
                    context.goNamed('companiesScreen');
                  } else {
                    debugPrint("${loginEmailWatcher.networkStatus}");
<<<<<<< HEAD
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBars.snackBars('${loginEmailWatcher.errorMessage}',
                            Colors.redAccent.shade400));
=======
                    ScaffoldMessenger.of(context).showSnackBar(SnackBars.snackBars(check.getErrorMessage, Colors.redAccent.shade400));
>>>>>>> 39b1895d71f9f30293927ea113498717da5f5883
                  }
                }
              },
            ),
            CustomDevider(
              middleText: 'signUpScreen.signUpWith'.tr(),
              horizotalPadding: 40.0,
              verticalPadding: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircledLogo(
                    logo: 'assets/images/categories/logoutIcon.png',
                    navigateTo: () {
                      context.goNamed("loginPhone");
                    },
                  ),
                  const CircledLogo(
                    logo: 'assets/images/categories/googleIcon.png',
                  ),
                  const CircledLogo(
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
