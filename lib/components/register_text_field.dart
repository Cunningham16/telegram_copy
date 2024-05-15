import 'package:flutter/material.dart';

class RegisterTextField extends StatelessWidget {
  const RegisterTextField(
      {super.key, required this.controller, this.labelText, this.obscureText});

  final TextEditingController controller;
  final String? labelText;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        obscureText: obscureText ?? false,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 12, right: 12),
            border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
            labelText: labelText),
      ),
    );
  }
}
