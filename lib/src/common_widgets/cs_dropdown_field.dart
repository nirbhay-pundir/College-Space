import 'package:flutter/material.dart';

class CsDropdownField extends StatelessWidget {
  const CsDropdownField({
    super.key,
    required this.options,
    required this.colorScheme,
    required this.text,
    required this.icon,
  });

  final List<String> options;
  final ColorScheme colorScheme;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: options.map((value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(),
      onChanged: (value) {},
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        prefixIconColor: colorScheme.primary,
        labelText: text,
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
      dropdownColor: colorScheme.surface,
    );
  }
}
