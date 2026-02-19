import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:go_router/go_router.dart';

import '../../../../router/app_router.dart';
import '../../domain/login_response.dart';
import '../login/controller/login_controller.dart';

void handleLogin(
  BuildContext context,
  WidgetRef ref,
  TextEditingController phoneController,
  TextEditingController passwordController,
) {
  FocusScope.of(context).unfocus();

  final cleanedPhone = phoneController.text.replaceAll(
    RegExp(r'[^0-9]'),
    '',
  );

  // Validate empty
  if (cleanedPhone.isEmpty || passwordController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill in all fields'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  // Validate PH mobile format (9123456789)
  if (cleanedPhone.length != 10 || !cleanedPhone.startsWith('9')) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Enter a valid 10-digit PH mobile number (e.g., 9123456789)',
        ),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  ref
      .read(loginControllerProvider.notifier)
      .login(
        phone: cleanedPhone, // or phone:
        password: passwordController.text.trim(),
      )
      .then((loginResponse) {
    if (loginResponse.token.isNotEmpty && context.mounted) {
      context.go(SGRoute.home.route);
    }
  }).catchError((error) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString().replaceFirst('Exception: ', ''),
          ),
          backgroundColor: const Color(0xFFEF4444),
        ),
      );
    }
  });
}
