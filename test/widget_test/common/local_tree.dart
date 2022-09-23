import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


Widget myWidgetTree({required Widget widgetToTest, required Locale locale}) {
  return EasyLocalization(
    fallbackLocale: const Locale('en', 'US'),
    useFallbackTranslations: true,
    assetLoader: const RootBundleAssetLoader(),
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('fr', 'FR'),
      
    ],
    startLocale: locale,
    path: 'assets/translations',
    child: ProviderScope(
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp.router(
            localizationsDelegates: [
              ...context.localizationDelegates,
              
            ],
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            routerDelegate: getGoRouter(widgetToTest).routerDelegate,
            routeInformationParser: getGoRouter(widgetToTest).routeInformationParser,
            routeInformationProvider: getGoRouter(widgetToTest).routeInformationProvider,
          );
        },
      ),
    ),
  );
}

GoRouter getGoRouter(Widget w) {
  return GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return Material(child: w);
        })
  ]);
}