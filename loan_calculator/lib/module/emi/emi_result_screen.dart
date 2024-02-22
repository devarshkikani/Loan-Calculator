import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loan_calculator/constants/app_text.dart';
import 'package:loan_calculator/extentions/number_formater_extension.dart';
import 'package:loan_calculator/module/home/home_screen.dart';
import 'package:loan_calculator/theme/app_colors.dart';
import 'package:loan_calculator/theme/app_text_style.dart';
import 'package:loan_calculator/widgets/primary_button.dart';

class EmiResultScreen extends StatefulWidget {
  final int investment;
  final double returnRate;
  final int time;
  const EmiResultScreen(
      {super.key,
      required this.investment,
      required this.returnRate,
      required this.time});

  @override
  State<EmiResultScreen> createState() => EmiResultScreenState();
}

class EmiResultScreenState extends State<EmiResultScreen> {
  late double totalAmount;
  late double monthlyEMI;
  late double interestRate;
  @override
  void initState() {
    super.initState();
    double r = widget.returnRate / 12 / 100;
    int n = widget.time * 12;
    monthlyEMI = (widget.investment * r * pow(1 + r, n)) / (pow(1 + r, n) - 1);
    interestRate = (monthlyEMI * n) - widget.investment;
    totalAmount = widget.investment + interestRate;
    double rate = ((totalAmount * interestRate) / 100);
    print(rate.round());
    print(100 - rate.round());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: AppTextStyle.semiBold22,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              paddingAll12(
                child: Text(
                  'Monthly EMI',
                  style: AppTextStyle.regular16,
                ),
              ),
              paddingAll12(
                child: Text(
                  '${monthlyEMI.doublePrice} ${AppText.rupeeSymbol}',
                  style: AppTextStyle.semiBold16.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              paddingAll12(
                child: Text(
                  'Principal amount',
                  style: AppTextStyle.regular16,
                ),
              ),
              paddingAll12(
                child: Text(
                  '${widget.investment.intPrice} ${AppText.rupeeSymbol}',
                  style: AppTextStyle.semiBold16.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              paddingAll12(
                child: Text(
                  'Total interest',
                  style: AppTextStyle.regular16,
                ),
              ),
              paddingAll12(
                child: Text(
                  '${(interestRate).doublePrice} ${AppText.rupeeSymbol}',
                  style: AppTextStyle.semiBold16.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              paddingAll12(
                child: Text(
                  'Total amount',
                  style: AppTextStyle.regular16,
                ),
              ),
              paddingAll12(
                child: Text(
                  '${totalAmount.doublePrice} ${AppText.rupeeSymbol}',
                  style: AppTextStyle.semiBold16.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 30,
          ),
          PrimaryButton(
            text: 'Go to home',
            height: 50,
            tColor: AppColors.whiteColor,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }

  Widget paddingAll12({required Widget child}) {
    return Padding(padding: const EdgeInsets.all(12.0), child: child);
  }
}
