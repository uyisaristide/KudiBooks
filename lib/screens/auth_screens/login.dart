import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import '../../models/Users/user_model.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    List<User> _user = ref.watch(usersProvider);
    debugPrint("Logged user is: $myToken");
    return BackgroundScreen(
      buttonWidget: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => context.goNamed('signup'),
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
            CustomFormField(
              labelText: "Enter your email",
              inputType: TextInputType.emailAddress,
              onChangeAction: (value) {
                // Validators.validateEmail(value) == null ? :;
              },
              hintText: 'Email',
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
                    hintText: "Password",
                    labelText: 'Enter your password',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
            ),
            HyperLinkText(
              directingText: 'Forgot Password ?',
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
              text: 'Login',
              actionField: () async {
                if (_formKey.currentState!.validate()) {
                  String? check = await ref
                      .read(usersProvider.notifier)
                      .loginEmail(
                          emailController.text, passwordController.text);
                  if (check == "success") {
                    var tokenHive = await Hive.box('tokens').get('token');
                    debugPrint("In Hive token: $tokenHive}");
                    context.goNamed('dashboard');
                  } else if (check == "fail") {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBars.snackBars(
                            "${ref.read(usersProvider.notifier).wrongCred}",
                            Colors.redAccent));
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
