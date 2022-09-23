import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kudibooks_app/screens/auth_screens/login.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/circled_logo.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';


import 'common/local_tree.dart';

void main() {
  
  testWidgets(
    "signin page tests",
    (WidgetTester tester) async {
      await EasyLocalization.ensureInitialized();
      await tester.pumpWidget(myWidgetTree(
          widgetToTest: const Login(), locale: const Locale('en', 'US')));
      await tester.pump();

      //Once loaded first
      expect(find.text("Sign in"), findsOneWidget);
      expect(find.text("Account Sign in"), findsOneWidget);
      expect(find.text("Forgot Password"), findsOneWidget);
      expect(find.text("Or Sign up with"), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byType(LoginButton), findsOneWidget);

      //tapping on login and set state
      await tester.tap(find.byType(LoginButton));
      await tester.pump();

      //Once pressed Login Button but not validated
      expect(find.text("Enter your email"), findsNWidgets(2));
      expect(find.text("Enter password"), findsOneWidget);

      //invalid email test
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Enter your email'), 'ar');
      await tester.pump();
      expect(find.text("Entered email is invalid"), findsOneWidget);

      //invalid email test
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Enter your password'), 'sdfwe');
      await tester.pump();
      expect(find.text("6 is minimum character for password"), findsOneWidget);

      //invalid email test
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Enter your password'), 'sdfwe');
      await tester.pump();
      expect(find.text("6 is minimum character for password"), findsOneWidget);

      //test if images are displayed
      expect(find.byType(CircledLogo), findsNWidgets(3));
      
    },
  );


  
  
}



