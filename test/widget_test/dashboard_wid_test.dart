// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hive/hive.dart';
// import 'package:kudibooks_app/main.dart';
// import 'package:kudibooks_app/screens/dashboard/dashboard.dart';
// import 'package:kudibooks_app/screens/dashboard/widget/line_chart.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

// import 'common/local_tree.dart';

// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   final document = await path_provider.getApplicationDocumentsDirectory();

  

//   Hive.init(document.path);
//   await Hive.openBox(userProfileBoxName);
//   await Hive.openBox(currentCompanyBoxName);
//   testWidgets("dashboard page tests", (WidgetTester tester) async {
//     await EasyLocalization.ensureInitialized();

//     await tester.pumpWidget(myWidgetTree(
//         widgetToTest: const Dashboard(), locale: const Locale('en', 'US')));
//     // await tester.drag(find.byType(LignChartObject), const Offset(0, -500));
//     await tester.pumpAndSettle(Duration(seconds: 1));

//     expect(find.byType(LignChartObject), findsOneWidget);
//   });
// }
