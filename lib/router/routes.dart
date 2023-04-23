/// Defines all possible routes for app.
abstract class AppRoute {
  static const String initial = '/';
  static const String signIn = '/signIn';
  static const String root = '/root';
  static const String home = '/home';
  static const String search = '/search';
  static const String profile = '/profile';
  static const List<String> tabNames = [home, search, profile];
}
