import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WideTextView extends StatelessWidget {
  const WideTextView(
      {super.key, required this.labelText, required this.displayText});
  final String labelText;
  final String displayText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.width - 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            displayText,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
