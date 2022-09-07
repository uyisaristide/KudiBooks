<<<<<<< HEAD
=======
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
>>>>>>> 39b1895d71f9f30293927ea113498717da5f5883
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kudibooks_app/models/Users/user_profile_model.dart';
import 'package:kudibooks_app/routers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'models/company_model.dart';

const String userProfileBoxName = "userProfile";
const String currentCompanyBoxName = "companyBox";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
<<<<<<< HEAD
  final document = await getApplicationDocumentsDirectory();

  Hive.init(document.path);

  Hive.registerAdapter(UserProfileAdapter());

  Hive.registerAdapter(CompanyModelAdapter());

  await Hive.openBox(userProfileBoxName);
  await Hive.openBox(currentCompanyBoxName);

  runApp(const ProviderScope(child: MyApp()));
=======
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox('tokens');
  await Hive.openBox('company');
  await EasyLocalization.ensureInitialized();
  debugPrint("Kigali Tokens: ${Hive.box('tokens').get('tokens')}");
  runApp(EasyLocalization(
      startLocale: const Locale('fr', 'FR'),
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translations',
      assetLoader: const RootBundleAssetLoader(),
      useFallbackTranslations: true,
      supportedLocales: const [Locale('fr', 'FR'),Locale('en', 'US')],
      child: const ProviderScope(child: MyApp())
      )
  );
>>>>>>> 39b1895d71f9f30293927ea113498717da5f5883
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    var modes = ref.watch(modeProvider);
>>>>>>> 39b1895d71f9f30293927ea113498717da5f5883
    return MaterialApp.router(
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData.dark(),
<<<<<<< HEAD
      themeMode: ThemeMode.system,
=======
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: modes ?? mode,
>>>>>>> 39b1895d71f9f30293927ea113498717da5f5883
      debugShowCheckedModeBanner: false,
      title: 'KudiBooks',
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
