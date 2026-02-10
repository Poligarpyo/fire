import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget buildSocialButton({
  required IconData icon,
  required String label,
  required bool isDark,
  required VoidCallback onPressed,
}) {
  return Container(
    height: 52,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
        width: 1.5,
      ),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isDark ? Colors.white : const Color(0xFF0A0A0A),
              size: 24,
            ),
            const Gap(8),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : const Color(0xFF0A0A0A),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
