import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loan_calculator/constants/app_text.dart';
import 'package:loan_calculator/extentions/number_formater_extension.dart';
import 'package:loan_calculator/module/home/home_screen.dart';
import 'package:loan_calculator/theme/app_colors.dart';
import 'package:loan_calculator/theme/app_text_style.dart';
import 'package:loan_calculator/widgets/primary_button.dart';

class LumpsumResultScreen extends StatefulWidget {
  final int investment;
  final double returnRate;
  final int time;
  const LumpsumResultScreen(
      {super.key,
      required this.investment,
      required this.returnRate,
      required this.time});

  @override
  State<LumpsumResultScreen> createState() => LumpsumResultScreenState();
}

class LumpsumResultScreenState extends State<LumpsumResultScreen> {
  late num totalInvestment;
  late num result;
  @override
  void initState() {
    super.initState();
    num i = (widget.returnRate) / 100;

    totalInvestment = widget.investment * pow(1 + i, widget.time);
    result = totalInvestment - widget.investment;
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
                  'Investment Amount',
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
                  'Interest rate',
                  style: AppTextStyle.regular16,
                ),
              ),
              paddingAll12(
                child: Text(
                  '${widget.returnRate} ${AppText.percentageSymbol}',
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
                  'Time Period',
                  style: AppTextStyle.regular16,
                ),
              ),
              paddingAll12(
                child: Text(
                  '${widget.time} Year',
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
                  'Est. returns',
                  style: AppTextStyle.regular16,
                ),
              ),
              paddingAll12(
                child: Text(
                  '${result.numPrice} ${AppText.rupeeSymbol}',
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
                  'Total value',
                  style: AppTextStyle.regular16,
                ),
              ),
              paddingAll12(
                child: Text(
                  '${totalInvestment.numPrice} ${AppText.rupeeSymbol}',
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
