import 'package:flutter/material.dart';
import 'package:loan_calculator/constants/app_text.dart';
import 'package:loan_calculator/theme/app_colors.dart';
import 'package:loan_calculator/theme/app_text_style.dart';
import 'package:loan_calculator/widgets/app_text_form_field.dart';
import 'package:loan_calculator/widgets/primary_button.dart';
import 'package:loan_calculator/widgets/rounded_border_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SIP ${AppText.calculator}',
          style: AppTextStyle.black22,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Card(
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    investView(),
                    const SizedBox(
                      height: 12,
                    ),
                    expectedRate(),
                    const SizedBox(
                      height: 12,
                    ),
                    timePeriod(),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RoundedBorderButton(
                            text: AppText.reset,
                            tColor: AppColors.primaryColor,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: PrimaryButton(
                            text: AppText.calculate,
                            tColor: AppColors.whiteColor,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget investView() {
    return Row(
      children: [
        Text(
          AppText.monthlyInvestment,
          style: AppTextStyle.regular16,
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: TextFormFieldWidget(
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            prefixIconConstraints: const BoxConstraints(maxWidth: 20),
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.rupeeSymbol,
                  style: AppTextStyle.regular18.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget expectedRate() {
    return Row(
      children: [
        Text(
          AppText.expectedReturnRate,
          style: AppTextStyle.regular16,
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: TextFormFieldWidget(
            maxLength: 2,
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            suffixIconConstraints: const BoxConstraints(maxWidth: 20),
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.percentageSymbol,
                  style: AppTextStyle.regular18.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget timePeriod() {
    return Row(
      children: [
        Text(
          AppText.timePeriod,
          style: AppTextStyle.regular16,
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: TextFormFieldWidget(
            maxLength: 2,
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            suffixIconConstraints: const BoxConstraints(maxWidth: 20),
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.yearSymbol,
                  style: AppTextStyle.regular18.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
