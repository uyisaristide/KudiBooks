import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/Users/user_model.dart';
import '../../models/utilities/network_info.dart';
import '../../providers/all_providers_list.dart';
import '../dashboard/classes/snack_bars.dart';
import 'validators/validator.dart';
import 'widgets/circled_logo.dart';
import 'widgets/custom_devider.dart';
import 'widgets/hyperlink_text.dart';
import 'widgets/login_button.dart';
import 'widgets/page_title.dart';
import 'widgets/text_form_field.dart';
import '../background.dart';
import 'widgets/password_field.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

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
    var allUsers = ref.watch(usersProvider);
    var userEmailCreate = ref.watch(createUserEmailProvider);
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


                // if (_formKey.currentState!.validate()) {
                //   var checkUser = _users.firstWhereOrNull((element) =>
                //       element.phoneOrEmail == emailController.text);
                //   if (checkUser == null) {
                //     ref.read(usersProvider.notifier).addUser(User(
                //         firstName: firstNameController.text,
                //         lastName: lastNameController.text,
                //         phoneOrEmail: emailController.text,
                //         password: passwordController.text));
                //     context.goNamed('signin');
                //     ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBars.snackBars(
                //             'User saved successfully', Colors.green.shade400));
                //   } else {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBars.snackBars(
                //             'User already exist', Colors.redAccent.shade400));
                //   }
                // }
             

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

            LoginButton(
              text: 'Register now',
              actionField: () async {
                var serverPassword = "${passwordController.text}+1234";
                if (_formKey.currentState!.validate()) {
                  var userSaving = await ref
                      .read(createUserEmailProvider.notifier)
                      .createUserEmail(User(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          passwordConfirm: passwordController.text));
                  if(userSaving.networkStatus == NetworkStatus.success){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBars.snackBars('Thanks for creating account', Colors.green.shade400));
                    context.goNamed('signin');
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBars.snackBars(userEmailCreate.getErrorMessage, Colors.redAccent.shade400));
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
