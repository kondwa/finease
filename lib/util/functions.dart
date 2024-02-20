import 'dart:math';

import 'package:finease/components/wide_button.dart';
import 'package:finease/models/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String cash(double amount, String code) {
  return NumberFormat.simpleCurrency(name: code).format(amount);
}

void alert(String title, String msg) {
  Get.defaultDialog(
      title: title,
      content: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: Text(
          msg,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      confirm: WideButton(
          onPressed: () {
            Get.back();
          },
          labelText: "Dismiss"));
}

void error(String msg) {
  Get.defaultDialog(title: "Failure", content: Text(msg));
}

double currency2double(String s) {
  if (s.isEmpty) {
    return 0.0;
  }
  String c = s.replaceAll(RegExp(r'[^\d.]'), "");
  return double.parse(c);
}

List<Payment> loanAmortization(
  double loanAmount,
  double annualInterestRate,
  int loanPeriodInYears,
  int paymentsPerYear,
) {
  int totalPayments = loanPeriodInYears * paymentsPerYear;
  double monthlyInterestRate = annualInterestRate / (100 * paymentsPerYear);
  double discountFactor = (pow(1 + monthlyInterestRate, totalPayments) - 1) /
      (monthlyInterestRate * pow(1 + monthlyInterestRate, totalPayments));
  double monthlyPayment = loanAmount / discountFactor;
  double remainingBalance = loanAmount;
  List<Payment> schedule = [];
  for (int period = 1; period <= totalPayments; period++) {
    double interestPaymentDue = remainingBalance * monthlyInterestRate;
    double principalPaymentDue = monthlyPayment - interestPaymentDue;
    remainingBalance -= principalPaymentDue;
    schedule.add(Payment(period, monthlyPayment, principalPaymentDue,
        interestPaymentDue, remainingBalance));
  }
  return schedule;
}
