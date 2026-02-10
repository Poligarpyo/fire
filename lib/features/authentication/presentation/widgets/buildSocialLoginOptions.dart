import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'buildSocialButton.dart';

Widget buildSocialLoginOptions(bool isDark) {
  return Row(
    children: [
      Expanded(
        child: buildSocialButton(
          icon: Icons.g_mobiledata_rounded,
          label: 'Google',
          isDark: isDark,
          onPressed: () {
            // Handle Google login
          },
        ),
      ),
      const Gap(12),
      Expanded(
        child: buildSocialButton(
          icon: Icons.apple_rounded,
          label: 'Apple',
          isDark: isDark,
          onPressed: () {
            // Handle Apple login
          },
        ),
      ),
    ],
  );
}
