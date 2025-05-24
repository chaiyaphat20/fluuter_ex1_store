import 'package:flutter/material.dart';

Widget customTextFormField({
  required TextEditingController controller,
  required String hintText,
  required IconData? prefixIcon,
  TextInputType keyboardType = TextInputType.text,
  required bool obscureText,
  required String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    enableSuggestions: !obscureText,
    autocorrect: !obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon)
          : null,
      hintStyle: TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
      ),
      fillColor: Colors.grey[200],
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
    ),
    validator: validator,
  );
}
