import 'package:finease/components/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyResultsScreen extends StatelessWidget {
  const CurrencyResultsScreen({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversion Results"),
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                message,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              WideButton(
                  onPressed: () {
                    Get.back();
                  },
                  labelText: "Back")
            ],
          ),
        ),
      ),
    );
  }
}
