import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/jwt_pair.dart';
import '../server/routes.dart';
import '../util/either.dart';
import '../util/failures/backend_failure.dart';
import '../util/functions/auth_header_value.dart';
import 'http_service.dart';

class AuthService {
  static AuthService? _instance;
  static AuthService get instance => _instance!;

  const AuthService._({required HttpService httpService}) : _http = httpService;

  factory AuthService({required HttpService httpService}) {
    if (_instance != null) {
      throw StateError('AuthService already created!');
    }

    _instance = AuthService._(httpService: httpService);
    return _instance!;
  }

  final HttpService _http;

  /* Future<Either<BackendFailure, VecturaUser>> login(
      String email, String password) async {
    final http.Response? response = await _http.post(
      [
        VecServerRoute.api,
        VecServerRoute.apiAuth,
        VecServerRoute.apiAuthLogin,
      ],
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: ContentType.json.value,
      },
      body: jsonEncode(
        <String, String>{
          VecturaUserJsonKey.email: email,
          VecturaUserJsonKey.password: password,
        },
      ),
    );

    if (response == null) return error(const UnknownBackendFailure());

    switch (response.statusCode) {
      case HttpStatus.ok:
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        print(
            'Login ID: ${jsonResponse['id']}, oseba: ${jsonResponse['name']}.');
        return value(VecturaUser.fromJson(jsonResponse));
      case HttpStatus.badRequest:
        print('No email/password, fail code: ${response.statusCode}.');
        return error(const BadRequestBackendFailure());
      // return {'error': "badRequest"};
      case HttpStatus.notFound:
        print('Wrong email/password, fail code: ${response.statusCode}.');
        return error(const NotFoundBackendFailure());
      // return {'error': "notFound"};
      default:
        return error(const UnknownBackendFailure());
    }
  } */

  Future<Either<BackendFailure, JwtPair>> refreshToken(
      String refreshToken) async {
    final http.Response? response = await _http.post(
      [
        VecServerRoute.api,
        VecServerRoute.apiAuth,
        VecServerRoute.apiAuthRefresh,
      ],
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: ContentType.json.value,
      },
      body: jsonEncode(
        <String, String>{'refresh_token': refreshToken},
      ),
    );

    if (response == null) return error(const UnknownBackendFailure());

    switch (response.statusCode) {
      case HttpStatus.ok:
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return value(JwtPair.fromJson(jsonResponse));
      case HttpStatus.badRequest:
        return error(const BadRequestBackendFailure());
      default:
        return error(const UnknownBackendFailure());
    }
  }
}
