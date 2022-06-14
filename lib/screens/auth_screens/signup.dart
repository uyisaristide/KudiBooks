import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/providers/user_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  final secretController = TextEditingController();

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
  }

  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);
    List<User> _userList = _userProvider.allUsers;
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
            ),
            CustomFormField(
              fieldController: lastNameController,
              fieldIcon: const Icon(Icons.person_outline),
              hintText: 'Last Name',
              validators: (value) => Validators.validateName(value),
            ),
            CustomFormField(
              fieldController: emailController,
              fieldIcon: const Icon(Icons.email),
              hintText: 'Email Address',
              validators: (value) => Validators.validateEmail(value),
            ),
            CustomFormField(
              fieldController: secretController,
              fieldIcon: const Icon(Icons.remove_red_eye),
              hintText: 'Password',
              validators: (value) => Validators.validatePassword(value),
            ),
            CustomFormField(
              fieldController: confirmController,
              fieldIcon: const Icon(Icons.remove_red_eye),
              hintText: 'Confirm Password',
              validators: (value) => Validators.validatePassword(value),
            ),
            LoginButton(
              text: 'Register now',
              actionField: () {
                if (_formKey.currentState!.validate()) {
                  _userProvider.addUser(User(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      password: secretController.text));
                  // print(
                  //     "First name is: ${firstNameController.text} '\n and last name is : ${lastNameController.text} '\ email is: ${emailController.text}");
                  Navigator.pushReplacementNamed(context, '/signup');
                }
              },
            ),
            HyperLinkText(
              directingText: 'Login instead',
              actions: () =>
                  Navigator.pushReplacementNamed(context, ('/login')),
            ),
            const CustomDevider(middleText: 'Or sign in with'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircledLogo(
                    logo: 'assets/images/categories/logoutIcon.png',
                    navigateTo: () {
                      Navigator.pushReplacementNamed(context, ('/phoneSignup'));
                    },
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
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    List<User> _revList = _userList.reversed.toList();
                    return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(
                            "${_revList[index].firstName} ${_revList[index].lastName}"));
                  },
                  separatorBuilder: (_, idx) => const SizedBox(
                        height: 1.0,
                      ),
                  itemCount: _userList.length),
            )
          ],
        ),
      ),
    );
  }
}
