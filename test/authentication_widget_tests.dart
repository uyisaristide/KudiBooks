import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kudibooks_app/screens/auth_screens/login.dart';
import 'package:kudibooks_app/screens/auth_screens/phone_login.dart';
import 'package:kudibooks_app/screens/auth_screens/phone_signup.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/custom_devider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/phone_input.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:provider/provider.dart';

void main() {
  group("Login with email Widget testing", () {
    testWidgets("Login with email Screen", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Login())));
      expect(find.byType(CustomFormField), findsNWidgets(1));
      expect(find.byType(LoginButton), findsNWidgets(1));
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byType(BackgroundScreen), findsNWidgets(1));
    });
  });
  group("Login with phone Widget testing", () {
    testWidgets("Login with phone Screen", (WidgetTester testLoginPhone) async {
      await testLoginPhone
          .pumpWidget(const MaterialApp(home: Scaffold(body: PhoneLogin())));
      expect(find.byType(CustomDevider), findsNWidgets(1));
      expect(find.byType(CircledLogo), findsNWidgets(3));
      expect(find.byType(PhoneField), findsOneWidget);

      //Tests phone number screen texts

      expect(find.text("Phone Number"), findsOneWidget);
      expect(find.text("Password"), findsOneWidget);
      expect(find.text("Login"), findsOneWidget);
      expect(find.text("Sign up"), findsOneWidget);
      expect(find.text("Or sign in with"), findsOneWidget);
    });
  });
  // group("sign up with email widgets tests", () {
  //   testWidgets("Screen widgets tests", (testersWidget) async {
  //     await testersWidget.pumpWidget(MaterialApp(
  //       home: Scaffold(
  //         body: MultiProvider(providers: [
  //           ChangeNotifierProvider(create: (_) => UserProvider()),
  //         ], child: SignUp()),
  //       ),
  //     ));
  //     expect(find.byType(CustomFormField), findsNWidgets(3));
  //     expect(find.byType(LoginButton), findsNWidgets(1));
  //     expect(find.byType(HyperLinkText), findsNWidgets(1));
  //     expect(find.byType(PageTitle), findsNWidgets(1));
  //     expect(find.byType(CircledLogo), findsNWidgets(3));
  //     expect(find.byType(PasswordField), findsNWidgets(2));
  //     //Test texts on sign up screen
  //     expect(find.text("Create new account"), findsOneWidget);
  //     expect(find.text("First Name"), findsOneWidget);
  //     expect(find.text("Last Name"), findsOneWidget);
  //     expect(find.text("Email Address"), findsOneWidget);
  //     expect(find.text("Password"), findsOneWidget);
  //     expect(find.text("Confirm Password"), findsOneWidget);
  //     expect(find.text("Register now"), findsOneWidget);
  //     expect(find.text("Login instead"), findsOneWidget);
  //     expect(find.text("Or sign in with"), findsOneWidget);
  //   });
  // });
  group("Sign up with phone widgets tests", () {
    testWidgets("widgets on sign up with phone screen",
        (testPhoneSignUp) async {
      await testPhoneSignUp.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MultiProvider(providers: [
            // ChangeNotifierProvider(create: (_) => UserProvider()),
          ], child: PhoneSignup()),
        ),
      ));
      expect(find.byType(BackgroundScreen), findsOneWidget);
      expect(find.byType(PageTitle), findsOneWidget);
      expect(find.byType(CustomFormField), findsNWidgets(2));
      expect(find.byType(LoginButton), findsOneWidget);
      expect(find.byType(HyperLinkText), findsOneWidget);
      expect(find.byType(PhoneField), findsOneWidget);
      expect(find.byType(CustomDevider), findsOneWidget);
      expect(find.byType(CircledLogo), findsNWidgets(3));
    });
  });
}
