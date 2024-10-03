import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String? errorText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String) onChanged;

  const InputField({
    super.key,
    required this.label,
    this.errorText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
