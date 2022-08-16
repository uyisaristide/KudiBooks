import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/providers/all_providers_list.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'widgets/password_field.dart';

class SignUp extends ConsumerStatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  final secretController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController.addListener(() => setState(() {}));
    lastNameController.addListener(() => setState(() {}));
    emailController.addListener(() => setState(() {}));
    secretController.addListener(() => setState(() {}));
    confirmController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));
  }

  bool isHiddens = true;

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    List<User> _users = ref.watch(usersProvider);

    return BackgroundScreen(
      paddingSize: 150,
      screens: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PageTitle(title: 'Create new account'),
            CustomFormField(
              fieldController: firstNameController,
              fieldIcon: const Icon(Icons.person),
              hintText: 'First Name',
              validators: (value) => Validators.validateName(value),
              isShown: false,
            ),
            CustomFormField(
              fieldController: lastNameController,
              fieldIcon: const Icon(Icons.person_outline),
              hintText: 'Last Name',
              validators: (value) => Validators.validateName(value),
              isShown: false,
            ),
            CustomFormField(
              fieldController: emailController,
              fieldIcon: const Icon(Icons.email),
              hintText: 'Email Address',
              validators: (value) => Validators.validateEmail(value),
              isShown: false,
            ),
            PasswordField(
              hintText: "Password",
              maxLength: 30,
              isHidden: isHiddens,
              passwordController: passwordController,
              validators: (value) {
                if (value!.length < 8) {
                  return "Much 8 charactor string";
                }
                return null;
              },
              suffixIcon: IconButton(
                  onPressed: () => setState(() => isHiddens = !isHiddens),
                  icon: isHiddens
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
              passwordController: confirmController,
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
            // LoginButton(
            //   text: 'Register now',
            //   actionField: () {
            //
            //     context.goNamed('');
            //
            //     // if (_formKey.currentState!.validate()) {
            //     //   var checkUser = _users.firstWhereOrNull((element) =>
            //     //       element.phoneOrEmail == emailController.text);
            //     //   if (checkUser == null) {
            //     //     ref.read(usersProvider.notifier).addUser(User(
            //     //         firstName: firstNameController.text,
            //     //         lastName: lastNameController.text,
            //     //         phoneOrEmail: emailController.text,
            //     //         password: passwordController.text));
            //     //     context.goNamed('signin');
            //     //     ScaffoldMessenger.of(context).showSnackBar(
            //     //         SnackBars.snackBars(
            //     //             'User saved successfully', Colors.green.shade400));
            //     //   } else {
            //     //     ScaffoldMessenger.of(context).showSnackBar(
            //     //         SnackBars.snackBars(
            //     //             'User already exist', Colors.redAccent.shade400));
            //     //   }
            //     // }
            //   },
            // ),
            const SizedBox(height: 5),
            LoginButton(
              text: 'Register now',
              actionField: () async {
                var serverPassword = "${passwordController.text}+1234";
                if (_formKey.currentState!.validate()) {
                  var userSaving = await ref
                      .read(usersProvider.notifier)
                      .createUserEmail(User(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          passwordConfirm: passwordController.text));
                  if (userSaving == "success") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      duration: const Duration(seconds: 3),
                      content: const Text(
                        'User saved to network',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      backgroundColor: Colors.green,
                    ));
                    context.goNamed('signin');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      duration: const Duration(seconds: 3),
                      content: const Text(
                        'User saved to network',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      backgroundColor: Colors.red,
                    ));
                  }
                }
              },
            ),
            HyperLinkText(
              directingText: 'Login instead',
              actions: () => context.goNamed('signin'),
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
                    navigateTo: () => context.goNamed('signupPhone'),
                  ),
                  CircledLogo(
                    navigateTo: () {},
                    logo: 'assets/images/categories/googleIcon.png',
                  ),
                  CircledLogo(
                    navigateTo: () {},
                    logo: 'assets/images/categories/appleIcon.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
