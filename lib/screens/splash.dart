import 'package:flutter/cupertino.dart';

import '../router/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
        context,
        AppRoute.root,
      );
    });
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
