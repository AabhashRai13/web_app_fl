import 'package:find_scan_return_web/presentation/home/screens/home.dart';
import 'package:find_scan_return_web/presentation/initialPage/landing_page.dart';
import 'package:find_scan_return_web/presentation/resources/router/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/not_found_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.initialScreenRoute,
    routes: [
      GoRoute(
        path: Routes.home,
        name: Routes.home,
        builder: (BuildContext context, state) => const Home(),
      ),
      GoRoute(
        path: Routes.initialScreenRoute,
        name: Routes.initialScreenRoute,
        builder: (BuildContext context, state) => const InitialPage(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
    redirect: (context, state) {
      return redirect(context, state);
    },
  );

  static Future<String?> redirect(BuildContext context, state) async {
    // no need to redirect at all
    return null;
  }

  static GoRouter get router => _router;
}
