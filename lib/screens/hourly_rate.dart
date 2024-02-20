import 'package:finease/components/flex_button.dart';
import 'package:finease/components/flex_textfield.dart';
import 'package:finease/components/wide_textfield.dart';
import 'package:finease/controllers/rate.dart';
import 'package:finease/util/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HourlyRateScreen extends StatefulWidget {
  const HourlyRateScreen({super.key});

  @override
  State<HourlyRateScreen> createState() => _HourlyRateScreenState();
}

class _HourlyRateScreenState extends State<HourlyRateScreen> {
  RateController rateController = Get.find();
  int currentStep = 0;
  void getIncome() {
    double rent = currency2double(rateController.rent.text);
    double groceries = currency2double(rateController.groceries.text);
    double utilities = currency2double(rateController.utilities.text);
    double health = currency2double(rateController.health.text);
    double other = currency2double(rateController.other.text);
    double income = rent + groceries + utilities + health + other;
    rateController.income.text = cash(income, "MWK");
  }

  void getHours() {
    int holidays = int.parse(rateController.holidays.text);
    int leaveDays = int.parse(rateController.leaveDays.text);
    int daysOff = holidays + leaveDays;
    int workingDays = 5 * 52 - daysOff;
    int workingHours = workingDays * 8;
    rateController.hours.text = "${workingHours} hours";
  }

  bool active(step) {
    return currentStep >= step;
  }

  state(step) {
    return currentStep >= step ? StepState.complete : StepState.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hourly Rate Calculation"),
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: currentStep,
              steps: getSteps(),
              onStepCancel: () {
                if (currentStep > 0) {
                  setState(() {
                    currentStep--;
                  });
                }
              },
              onStepContinue: () {
                if (currentStep < getSteps().length - 1) {
                  setState(() {
                    currentStep++;
                  });
                }
              },
              onStepTapped: (step) {
                setState(() {
                  currentStep = step;
                });
              },
              controlsBuilder: (context, details) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      FlexButton(
                        onPressed: details.onStepCancel,
                        labelText: "Back",
                      ),
                      SizedBox(width: 16.0),
                      FlexButton(
                        onPressed: details.onStepContinue,
                        labelText: 'Next',
                      ),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
          title: const Text("Monthly Expenses"),
          isActive: active(0),
          state: state(0),
          content: Column(
            children: [
              Row(
                children: [
                  FlexTextField(
                    controller: rateController.rent,
                    labelText: "Rent",
                    onChanged: (value) {
                      getIncome();
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FlexTextField(
                      controller: rateController.groceries,
                      labelText: "Groceries",
                      onChanged: (value) {
                        getIncome();
                      }),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  FlexTextField(
                      controller: rateController.utilities,
                      labelText: "Utilities",
                      onChanged: (value) {
                        getIncome();
                      }),
                  const SizedBox(
                    width: 8,
                  ),
                  FlexTextField(
                      controller: rateController.health,
                      labelText: "Health",
                      onChanged: (value) {
                        getIncome();
                      }),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              WideTextField(
                  controller: rateController.other,
                  labelText: "Other",
                  onChanged: (value) {
                    getIncome();
                  }),
              SizedBox(
                height: 8,
              ),
              WideTextField(
                controller: rateController.income,
                labelText: "Minimum Required Income",
                readOnly: true,
              )
            ],
          )),
      Step(
          title: const Text("Billable Hours"),
          isActive: active(1),
          state: state(1),
          content: Column(
            children: [
              Row(
                children: [
                  FlexTextField(
                    controller: rateController.holidays,
                    labelText: "Holidays",
                    onChanged: (value) {
                      getHours();
                    },
                  ),
                  FlexTextField(
                      controller: rateController.leaveDays,
                      labelText: "Leave Days",
                      onChanged: (value) {
                        getHours();
                      })
                ],
              ),
              WideTextField(
                controller: rateController.hours,
                labelText: "Total Working Hours",
                readOnly: true,
              )
            ],
          )),
      Step(
          title: Text("Confirm Details"),
          isActive: active(2),
          state: state(2),
          content: Text("Is it ok?"))
    ];
  }
}
