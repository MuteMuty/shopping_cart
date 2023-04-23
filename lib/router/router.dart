import 'package:flutter/cupertino.dart';

import '../screens/root.dart';
import '../screens/splash.dart';
import '../screens/tabs/home.dart';
import '../screens/tabs/profile.dart';
import '../screens/tabs/search.dart';
import '../util/logger.dart';
import 'routes.dart';

/// Provides [onGenerateRoute] function and stores current topmost route.
abstract class AppRouter {
  /// Transforms [settings] into corresponding route.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Logger.instance.info(
      'AppRouter.onGenerateRoute',
      'pushing route ${settings.name}',
    );

    switch (settings.name) {
      case AppRoute.initial:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());
      /* case Route.signIn:
        return PageRouteBuilder(
          pageBuilder: (context, _, __) => SignInScreen(
            args: settings.arguments as SignInScreenArgs,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 850),
        ); */
      case AppRoute.root:
        return PageRouteBuilder(
          pageBuilder: (context, _, __) => const RootScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        );

      case AppRoute.home:
        return PageRouteBuilder(
          fullscreenDialog: true,
          reverseTransitionDuration: const Duration(milliseconds: 0),
          transitionDuration: const Duration(milliseconds: 0),
          pageBuilder: (context, _, __) => const HomeTab(),
        );
      case AppRoute.search:
        return PageRouteBuilder(
          fullscreenDialog: true,
          reverseTransitionDuration: const Duration(milliseconds: 0),
          transitionDuration: const Duration(milliseconds: 0),
          pageBuilder: (context, _, __) => const SearchTab(),
        );
      case AppRoute.profile:
        return PageRouteBuilder(
          fullscreenDialog: true,
          reverseTransitionDuration: const Duration(milliseconds: 0),
          transitionDuration: const Duration(milliseconds: 0),
          pageBuilder: (context, _, __) => const ProfileTab(),
        );
    }

    return null;
  }
}
