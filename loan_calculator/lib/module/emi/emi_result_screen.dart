import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loan_calculator/constants/app_text.dart';
import 'package:loan_calculator/extentions/number_formater_extension.dart';
import 'package:loan_calculator/module/home/home_screen.dart';
import 'package:loan_calculator/theme/app_colors.dart';
import 'package:loan_calculator/theme/app_text_style.dart';
import 'package:loan_calculator/widgets/primary_button.dart';
import 'package:pie_chart/pie_chart.dart';

class EmiResultScreen extends StatefulWidget {
  final num investment;
  final num returnRate;
  final num time;
  const EmiResultScreen(
      {super.key,
      required this.investment,
      required this.returnRate,
      required this.time});

  @override
  State<EmiResultScreen> createState() => EmiResultScreenState();
}

class EmiResultScreenState extends State<EmiResultScreen> {
  Map<String, double> dataMap = <String, double>{};

  final colorList = <Color>[
    AppColors.secondaryLightColor,
    AppColors.secondaryColor,
  ];
  late double totalAmount;
  late double monthlyEMI;
  late double interestRate;
  @override
  void initState() {
    super.initState();
    double r = widget.returnRate / 12 / 100;
    num n = widget.time * 12;
    monthlyEMI = (widget.investment * r * pow(1 + r, n)) / (pow(1 + r, n) - 1);
    interestRate = (monthlyEMI * n) - widget.investment;
    totalAmount = widget.investment + interestRate;
    num percentage = (100 * interestRate) / totalAmount;
    dataMap.addAll({
      "Invested Amount": percentage.toDouble(),
      "Est. returns": (100 - percentage).toDouble(),
    });
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
          paddingAll12(
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  paddingAll12(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: PieChart(
                        dataMap: dataMap,
                        ringStrokeWidth: 14,
                        chartType: ChartType.ring,
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValueBackground: false,
                          showChartValues: false,
                        ),
                        legendOptions: const LegendOptions(
                          showLegends: false,
                        ),
                        baseChartColor: Colors.transparent,
                        colorList: colorList,
                      ),
                    ),
                  ),
                  Expanded(
                    child: paddingAll12(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Monthly EMI',
                            style: AppTextStyle.regular18,
                          ),
                          Text(
                            '${AppText.rupeeSymbol} ${monthlyEMI.doublePrice}',
                            style: AppTextStyle.semiBold20.copyWith(
                              color: AppColors.blackColor,
                            ),
                          ),
                          const Divider(),
                          showChartText(
                            color: AppColors.secondaryLightColor,
                            title: dataMap.keys.first,
                            trailing:
                                '${dataMap.values.first.toStringAsFixed(2)}%',
                          ),
                          showChartText(
                            color: AppColors.secondaryColor,
                            title: dataMap.keys.last,
                            trailing:
                                '${dataMap.values.last.toStringAsFixed(2)}%',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
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
                  '${widget.investment.numPrice} ${AppText.rupeeSymbol}',
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

  Widget showChartText({
    required Color color,
    required String title,
    required String trailing,
  }) {
    return Row(
      children: [
        Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: AppTextStyle.regular16,
        ),
        const Spacer(),
        Text(
          trailing,
          style: AppTextStyle.semiBold16.copyWith(
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }

  Widget paddingAll12({required Widget child}) {
    return Padding(padding: const EdgeInsets.all(12.0), child: child);
  }
}
