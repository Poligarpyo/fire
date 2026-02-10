import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget buildWelcomeSection(bool isDark) {
  return Column(
    children: [
      Text(
        'Welcome back',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: isDark ? Colors.white : const Color(0xFF0A0A0A),
          letterSpacing: -0.5,
        ),
      ),
      const Gap(8),
      Text(
        'Sign in to continue your journey',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
          letterSpacing: 0.1,
        ),
      ),
    ],
  );
}
