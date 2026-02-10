import 'package:flutter/material.dart';

Widget buildModernTextField({
  required TextEditingController controller,
  required FocusNode focusNode,
  required String hintText,
  required IconData icon,
  required bool isDark,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
  bool isPassword = false,
  bool obscureText = false,
  Widget? suffixIcon,
  Function(String)? onFieldSubmitted,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: isDark
              ? Colors.black.withOpacity(0.2)
              : Colors.black.withOpacity(0.04),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: isDark ? Colors.white : const Color(0xFF0A0A0A),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 16),
          child: Icon(
            icon,
            color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
            size: 22,
          ),
        ),
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 12),
                child: suffixIcon,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: isDark
                ? Colors.grey.shade800.withOpacity(0.3)
                : Colors.grey.shade200,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFF6366F1),
            width: 2,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),
    ),
  );
}
