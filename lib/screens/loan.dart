import 'package:finease/components/flex_textfield.dart';
import 'package:finease/components/wide_button.dart';
import 'package:finease/models/payment.dart';
import 'package:finease/screens/loan_results.dart';
import 'package:finease/util/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key});

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  TextEditingController paymentsController = TextEditingController();
  void loanSchedule() {
    try {
      double amount = currency2double(amountController.text);
      double interest = double.parse(interestController.text);
      int periodInYrs = int.parse(periodController.text);
      int paymentsPerYr = int.parse(paymentsController.text);
      List<Payment> schedule =
          loanAmortization(amount, interest, periodInYrs, paymentsPerYr);
      Get.to(() => LoanResultsScreen(schedule: schedule));
    } catch (e) {
      error(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loan Calculation"),
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              FlexTextField(
                  controller: amountController, labelText: "Loan Amount(MWK)"),
              SizedBox(
                height: 8,
              ),
              FlexTextField(
                  controller: interestController,
                  labelText: "Annual Interest(%)"),
              SizedBox(
                height: 8,
              ),
              FlexTextField(
                  controller: periodController,
                  labelText: "Loan Period(Years)"),
              SizedBox(
                height: 8,
              ),
              FlexTextField(
                  controller: paymentsController,
                  labelText: "Number of Payments Per Year"),
              SizedBox(
                height: 8,
              ),
              WideButton(
                  onPressed: () {
                    loanSchedule();
                  },
                  labelText: "Loan Schedule")
            ],
          ),
        ),
      ),
    );
  }
}
