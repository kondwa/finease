import 'package:flutter/material.dart';

class WideTextField extends StatelessWidget {
  const WideTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
  });
  final TextEditingController controller;
  final String labelText;
  final Function()? onTap;
  final Function(String)? onChanged;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelText),
    );
  }
}
