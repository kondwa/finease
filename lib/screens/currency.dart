import 'package:currency_picker/currency_picker.dart';
import 'package:finease/components/flex_textfield.dart';
import 'package:finease/components/wide_button.dart';
import 'package:finease/screens/currency_results.dart';
import 'package:finease/util/functions.dart';
import 'package:flutter/material.dart';
import 'package:forex_conversion/forex_conversion.dart';
import 'package:get/get.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  TextEditingController fromController = TextEditingController();

  TextEditingController toController = TextEditingController();

  TextEditingController amountController = TextEditingController();
  Future<void> convertCurrency() async {
    try {
      var fx = Forex(
          defaultSourceCurrency: "USD", defaultDestinationCurrency: "MWK");
      String source = fromController.text;
      String destination = toController.text;
      double amount = currency2double(amountController.text);
      double result = await fx.getCurrencyConverted(
          sourceCurrency: source,
          destinationCurrency: destination,
          sourceAmount: amount);
      String msg = "${cash(amount, source)} is ${cash(result, destination)}";
      //alert("Conversion Results", msg);
      Get.to(() => CurrencyResultsScreen(
            message: msg,
          ));
    } catch (e) {
      error(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Exchange"),
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  FlexTextField(
                    controller: fromController,
                    labelText: "From",
                    onTap: () {
                      showCurrencyPicker(
                          context: context,
                          onSelect: (currency) {
                            fromController.text = currency.code;
                          });
                    },
                    readOnly: true,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FlexTextField(
                    controller: toController,
                    labelText: "To",
                    onTap: () {
                      showCurrencyPicker(
                          context: context,
                          onSelect: (currency) {
                            toController.text = currency.code;
                          });
                    },
                    readOnly: true,
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  FlexTextField(
                      controller: amountController, labelText: "Amount")
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              WideButton(
                  onPressed: () {
                    convertCurrency();
                  },
                  labelText: "Convert"),
            ],
          ),
        ),
      ),
    );
  }
}
