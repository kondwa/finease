import 'package:finease/components/action_tile.dart';
import 'package:finease/screens/currency.dart';
import 'package:finease/screens/hourly_rate.dart';
import 'package:finease/screens/loan.dart';
import 'package:finease/screens/tax.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("FinEase"),
        elevation: 1,
      ),
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(24))),
          ),
          Card(
              margin: const EdgeInsets.only(
                  top: 140, left: 32, right: 32, bottom: 32),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  children: [
                    ActionTile(
                        icon: Icons.currency_exchange,
                        labelText: "Currency Exchange",
                        onTap: () {
                          Get.to(() => const CurrencyScreen());
                        }),
                    ActionTile(
                        icon: Icons.money,
                        labelText: "Loan Calculation",
                        onTap: () {
                          Get.to(() => const LoanScreen());
                        }),
                    ActionTile(
                        icon: Icons.calculate,
                        labelText: "Malawi Tax Calculation",
                        onTap: () {
                          Get.to(() => const TaxScreen());
                        }),
                    ActionTile(
                        icon: Icons.wallet,
                        labelText: "Hourly Rate Calculation",
                        onTap: () {
                          Get.to(() => const HourlyRateScreen());
                        })
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
