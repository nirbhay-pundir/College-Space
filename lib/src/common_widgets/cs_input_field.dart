import 'package:flutter/material.dart';

class CsInputField extends StatelessWidget {
  const CsInputField({
    super.key,
    required this.colorScheme,
    required this.text,
    required this.hintText,
    this.icon,
    this.type,
    this.obscureText,
    this.controller,
  });

  final ColorScheme colorScheme;
  final String text;
  final String hintText;
  final IconData? icon;
  final TextInputType? type;
  final bool? obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText != null ? true : false,
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        prefixIconColor: colorScheme.primary,
        labelText: text,
        hintText: hintText,
        hintStyle: TextStyle(
          color: colorScheme.secondary,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
