import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'router/router.dart';
import 'router/routes.dart';
import 'services/auth_service.dart';
import 'services/backend_service.dart';
import 'services/http_service.dart';
import 'style/theme.dart';
import 'util/logger.dart';

void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final Logger logger = Logger();

  final HttpService httpService = HttpService();
  AuthService(httpService: httpService);
  BackendService(httpService: httpService);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(AppApp(navigatorKey: navigatorKey));
}

class AppApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const AppApp({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return CupertinoApp(
      title: 'App',
      theme: appTheme,
      initialRoute: AppRoute.initial,
      onGenerateRoute: AppRouter.onGenerateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
