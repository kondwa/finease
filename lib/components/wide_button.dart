import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WideButton extends StatelessWidget {
  const WideButton(
      {super.key, required this.onPressed, required this.labelText});
  final Function()? onPressed;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 40),
          backgroundColor: Theme.of(Get.context!).colorScheme.primary),
      child: Text(
        labelText,
        style: TextStyle(color: Theme.of(Get.context!).colorScheme.onPrimary),
      ),
    );
  }
}
