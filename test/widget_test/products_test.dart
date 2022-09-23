import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kudibooks_app/mocking_testing/class_to_mock.dart';
import 'package:kudibooks_app/mocking_testing/display_products.dart';
import 'package:mocktail/mocktail.dart';

import 'common/local_tree.dart';

class MockProductsList extends Mock implements DummyProducts {}

void main() {
  testWidgets("test description", (WidgetTester tester) async {
    await EasyLocalization.ensureInitialized();
    await tester.pumpWidget(myWidgetTree(
        widgetToTest: const ListAllProducts(),
        locale: const Locale('en', 'US')));
    await tester.pump();

    expect(find.byType(ListView), findsOneWidget);

    await tester.drag(find.byKey(const Key('list')), const Offset(0, -300));
    await tester.pump();
    expect(find.text('Product1'), findsOneWidget);
    // expect(find.byType(Scrollable), findsNWidgets(1));
  });
}
