import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/endpoints.dart';
import '../../../core/storage/auth_local_datasource_provider.dart';
import '../../../data/repository/network_repository.dart';
import '../domain/login_request.dart';
import '../domain/login_response.dart';
import '../domain/register_response.dart';

part 'authentication_repository.g.dart';

/// An abstract class that defines the authentication methods.
abstract class AuthenticationRepository {
  /// Authenticates a user with the given [username] and [password].
  /// Returns a [LoginResponse] containing the authentication details.
  Future<LoginResponse> login(String phone, String password);

  /// Registers a new user with the given [username] and [password].
  /// Returns a [RegisterResponse] containing the registration details.
  Future<RegisterResponse> register(String username, String password);
}

/// A class that implements the [AuthenticationRepository] using HTTP requests.
class HttpAuthRepository implements AuthenticationRepository {
  /// Creates an instance of [HttpAuthRepository].
  HttpAuthRepository(this.ref);
  final Ref ref;

  /// The Dio instance used for making HTTP requests.
  Dio get dio => ref.read(networkRepositoryProvider);
  @override
  Future<LoginResponse> login(String phone, String password) async {
    try {
      // 1️⃣ Call API
      final Response<dynamic> response = await dio.post(
        Endpoints.exampleLogin,
        data: LoginCredentials(phone: phone, password: password),
      );

      // 2️⃣ Parse response
      final LoginResponse loginResponse =
          LoginResponse.fromJson(response.data as Map<String, dynamic>);

      await Future.wait([
        ref.read(authLocalDataSourceProvider).saveToken(loginResponse.token),
        ref.read(authLocalDataSourceProvider).saveLogin(phone),
      ]);

      // 4️⃣ Set token in NetworkRepository (for API headers)
      ref
          .read(networkRepositoryProvider.notifier)
          .setToken(loginResponse.token);

      return loginResponse;
    } on DioException catch (e) {
      // Handle specific HTTP errors
      if (e.response?.statusCode == 401) {
        throw Exception('Invalid credentials');
      } else if (e.response?.statusCode == 400) {
        throw Exception('User not found');
      } else if (e.response?.statusCode != null) {
        throw Exception('Login failed: ${e.response?.statusMessage}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('Unexpected error during login: $e');
    }
  }

  @override
  Future<RegisterResponse> register(String username, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}

@riverpod
AuthenticationRepository authenticationRepository(Ref ref) {
  return HttpAuthRepository(ref);
}
