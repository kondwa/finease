import 'package:finease/components/wide_button.dart';
import 'package:flutter/material.dart';

class FlexButton extends StatelessWidget {
  const FlexButton(
      {super.key, required this.onPressed, required this.labelText});
  final Function()? onPressed;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1, child: WideButton(onPressed: onPressed, labelText: labelText));
  }
}
