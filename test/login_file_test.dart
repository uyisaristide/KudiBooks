import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kudibooks_app/screens/auth_screens/login.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/background.dart';

void main() {
  group("Login Widget testing", () {
    testWidgets("Login Screen", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Login())));
      expect(find.byType(CustomFormField), findsNWidgets(1));
      expect(find.byType(LoginButton), findsNWidgets(1));
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byType(BackgroundScreen), findsNWidgets(1));
    });
    testWidgets("test texts displayed on screen", (testText) async {
      await testText
          .pumpWidget(const MaterialApp(home: Scaffold(body: Login())));
      expect(find.text("Login"), findsOneWidget);
      expect(find.text("Enter your email"), findsOneWidget);
      expect(find.text("Enter your password"), findsOneWidget);
      expect(find.text("Or sign in with"), findsOneWidget);
    });
  });
}
