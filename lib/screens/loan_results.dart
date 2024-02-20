import 'package:finease/components/wide_text_view.dart';
import 'package:finease/models/payment.dart';
import 'package:finease/util/functions.dart';
import 'package:flutter/material.dart';

class LoanResultsScreen extends StatelessWidget {
  const LoanResultsScreen({super.key, required this.schedule});
  final List<Payment> schedule;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loan Schedule"),
      ),
      body: ListView.builder(
          itemCount: schedule.length,
          itemBuilder: (context, index) {
            Payment payment = schedule[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Text(payment.period.toString()),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WideTextView(
                            labelText: "Principal Due",
                            displayText: cash(payment.principalDue, "MWK")),
                        WideTextView(
                            labelText: "Interest Due",
                            displayText: cash(payment.interestDue, "MWK")),
                        WideTextView(
                            labelText: "Principal Balance",
                            displayText: cash(payment.principalBalance, "MWK")),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
