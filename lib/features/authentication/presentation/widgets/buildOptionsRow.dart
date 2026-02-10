import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:gap/gap.dart';

import '../login/auth_ui_model.dart';
import '../login/login_controller.dart';

Widget buildOptionsRow(AuthUiModel authUiModel, bool isDark, WidgetRef ref) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              value: authUiModel.rememberMe,
              onChanged: (bool? value) {
                ref
                    .read(loginControllerProvider.notifier)
                    .updateRememberMe(value ?? false);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: const Color(0xFF6366F1),
            ),
          ),
          const Gap(8),
          Text(
            'Remember me',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
            ),
          ),
        ],
      ),
      TextButton(
        onPressed: () {
          // Handle forgot password
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: const Text(
          'Forgot password?',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6366F1),
          ),
        ),
      ),
    ],
  );
}
