import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kudibooks_app/screens/dashboard/settings_screen.dart';
import 'package:kudibooks_app/screens/dashboard/widget/list_tile.dart';

import 'common/local_tree.dart';

void main() {
  testWidgets(
    "settings screen test",
    (WidgetTester tester) async {
      await EasyLocalization.ensureInitialized();

      await tester.pumpWidget(myWidgetTree(
          widgetToTest: const Settings(), locale: const Locale('en', 'US')));
      await tester.pump();

      // expect texts in screen
      expect(find.text("Billing updates"), findsOneWidget);
      // expect lists and deviders
      expect(find.byType(DoubleRowWidgets), findsNWidgets(7));
      

      expect(find.byType(RadioListTile), findsOneWidget);

      //language on tap
      await tester.tap(
        find.widgetWithText(ListTile, 'Language'),
      );
      await tester.pump();

      //expect to see AlertDialog
      expect(find.byType(AlertDialog), findsOneWidget);

      final seeLocales = find.descendant(
          of: find.byType(AlertDialog), matching: find.byType(RadioListTile));

      // expect(seeLocales, findsNWidgets(3));
    },
  );
}





