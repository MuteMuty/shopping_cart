/// Holds route definitions.
abstract class VecServerRoute {
  static const String api = 'api';
  static const String apiAuth = 'auth';
  static const String apiAuthLogin = 'login';
  static const String apiAuthRegister = 'register';
  static const String apiAuthRefresh = 'refresh';

  static const String apiUser = 'user';
  static const String apiUserPassword = 'password';

  static const String queryParamFilter = 'filter';
  static const String queryParamPage = 'page';
  static const String queryParamLimit = 'limit';
}
