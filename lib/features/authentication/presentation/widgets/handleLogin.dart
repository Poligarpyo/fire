import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:go_router/go_router.dart';

import '../../../../router/app_router.dart';
import '../../domain/login_response.dart';
import '../login/login_controller.dart';

void handleLogin(
  BuildContext context,
  WidgetRef ref,
  TextEditingController userNameController,
  TextEditingController passwordController,
) {
  FocusScope.of(context).unfocus();
  ref
      .read(loginControllerProvider.notifier)
      .login(
        username: userNameController.text,
        password: passwordController.text,
      )
      .catchError((dynamic error, StackTrace stackTrace) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
          backgroundColor: const Color(0xFFEF4444),
        ),
      );
    }
    return const LoginResponse(token: '', result: false);
  }).then(
    (LoginResponse loginResponse) {
      if (loginResponse.token.isNotEmpty && context.mounted) {
        context.push(SGRoute.home.route);
      }
    },
  );
}
