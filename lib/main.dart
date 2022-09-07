import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'providers/all_providers_list.dart';
import 'routers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.
  var mode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    var modes = ref.watch(modeProvider);
    return MaterialApp.router(
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData.dark(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: modes ?? mode,
      debugShowCheckedModeBanner: false,
      title: 'KudiBooks',
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
