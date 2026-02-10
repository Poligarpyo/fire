import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/app_snackbar.dart';
import '../../../../common/navigation_keys.dart';
import '../../../../core/storage/auth_local_datasource_provider.dart';
import '../../../../data/repository/network_repository.dart';
import '../../data/hive/user_repository.dart';
part 'auth_controller.g.dart';

enum AuthStatus { authenticated, unauthenticated }

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthStatus build() {
    final token = ref.read(authLocalDataSourceProvider).getToken();
    return token != null && token.isNotEmpty
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
  }

  Future<void> logout({String? message}) async {
    await ref.read(userRepositoryProvider).logout();
    await ref.read(authLocalDataSourceProvider).clearToken();
    await ref.read(authLocalDataSourceProvider).clearLogin();
    ref.read(networkRepositoryProvider.notifier).clearToken();

    state = AuthStatus.unauthenticated;

    // Show snackbar if message is provided
    if (message != null) {
      final context = rootNavigatorKey.currentContext;
      if (context != null) {
        AppSnackbar.showMessage(
          context,
          message,
          duration: const Duration(seconds: 2),
        );
      }
    }
  }

  void loginSuccess() {
    state = AuthStatus.authenticated;
  }
}
