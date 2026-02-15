import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/authentication_repository.dart';
import '../../../data/hive/user_repository.dart';
import '../../../domain/auth/auth_controller.dart';
import '../../../domain/login_request.dart';
import '../../../domain/login_response.dart'; 
import 'auth_ui_model.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  AuthUiModel build() {
    final Future<LoginCredentials?> userLoginFuture =
        ref.read(userRepositoryProvider).getCachedUser();
    userLoginFuture.then((LoginCredentials? cachedUser) {
      if (cachedUser != null) {
        state = state.copyWith(
          user: cachedUser,
          rememberMe: true,
        );
      }
    }).catchError((dynamic error) {
      // Handle error if needed
    });
    return const AuthUiModel();
  }

  void updateRememberMe(bool rememberMe) {
    if (rememberMe) {
      ref.keepAlive();
    }
    state = state.copyWith(rememberMe: rememberMe);
  }

  void updateShowPassword(bool showPassword) {
    state = state.copyWith(showPassword: showPassword);
  }

  void updateLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

// Login Controller - Fixed version
  Future<LoginResponse> login({
    required String phone,
    required String password,
  }) async {
  
    final LoginCredentials user = LoginCredentials(
      phone: phone,
      password: password,
    );

    updateLoading(true);

    try {
      // Call repository to perform login
      final LoginResponse loginResponse = await ref
          .read(authenticationRepositoryProvider)
          .login(user.phone, user.password);

      // Check if login was successful
      if (loginResponse.token.isNotEmpty) {
        ref.read(authControllerProvider.notifier).loginSuccess();

        // Cache user credentials if "Remember Me" is enabled
        if (state.rememberMe) {
          state = state.copyWith(
            user: state.user?.copyWith(
              phone: user.phone,
              password: user.password,
            ),
          );

          try {
            await ref.read(userRepositoryProvider).cacheUser(user);
          } catch (error) {
            Logger().e('Failed to cache user: $error');
            // Don't throw - caching failure shouldn't prevent login
          }
        }
      }

      updateLoading(false);
      return loginResponse;
    } catch (error) {
      updateLoading(false);
      rethrow; // Let the UI handle the error
    }
  }
}
