import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';

import '../login/auth_ui_model.dart';
import 'handleLogin.dart';

Widget buildLoginButton(
    BuildContext context,
    AuthUiModel authUiModel,
    bool isDark,
    WidgetRef ref,
    TextEditingController userNameController,
    TextEditingController passwordController) {
  return Container(
    height: 56,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF6366F1).withOpacity(0.4),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: ElevatedButton(
      onPressed: authUiModel.isLoading
          ? null
          : () => handleLogin(
              context, ref, userNameController, passwordController),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: authUiModel.isLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Text(
              'Sign in',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 0.2,
              ),
            ),
    ),
  );
}
