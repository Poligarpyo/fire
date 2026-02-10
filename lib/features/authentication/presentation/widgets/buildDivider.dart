import 'package:flutter/material.dart';

Widget buildDivider(bool isDark) {
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
          thickness: 1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'or continue with',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.grey.shade500 : Colors.grey.shade600,
          ),
        ),
      ),
      Expanded(
        child: Divider(
          color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
          thickness: 1,
        ),
      ),
    ],
  );
}
