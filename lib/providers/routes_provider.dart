



// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:kudibooks_app/screens/splash_screen/green_splash_screen.dart';

// final routerProvider = Provider<GoRouter>((ref) {
//   final router = RouterNotifier(ref);
//   return GoRouter(
//       debugLogDiagnostics: true,
//       refreshListenable: router,
//       routes: router._routes,
//       errorBuilder: (context, state) =>  const Text('error'));
// });

// class RouterNotifier extends ChangeNotifier {
//   final Ref ref;
//   RouterNotifier(this.ref);

//   String? _redirectLogic(GoRouterState state) {
//     return null;
//   }

//   List<GoRoute> get _routes => [
    
//         GoRoute(
//             pageBuilder: (context, state) => const GreenSplashScreen(), path: '/')
//       ];
// }
