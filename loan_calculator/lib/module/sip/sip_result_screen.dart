import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loan_calculator/constants/app_text.dart';
import 'package:loan_calculator/extentions/number_formater_extension.dart';
import 'package:loan_calculator/module/google_ads/Interstitial_ads.dart';
import 'package:loan_calculator/module/google_ads/banner_ads.dart';
import 'package:loan_calculator/module/google_ads/native_ads.dart';
import 'package:loan_calculator/module/home/home_screen.dart';
import 'package:loan_calculator/theme/app_colors.dart';
import 'package:loan_calculator/theme/app_text_style.dart';
import 'package:loan_calculator/widgets/primary_button.dart';
import 'package:pie_chart/pie_chart.dart';

class SipResultScreen extends StatefulWidget {
  final num investment;
  final num returnRate;
  final num time;
  const SipResultScreen(
      {super.key,
      required this.investment,
      required this.returnRate,
      required this.time});

  @override
  State<SipResultScreen> createState() => SipResultScreenState();
}

class SipResultScreenState extends State<SipResultScreen> {
  Map<String, double> dataMap = <String, double>{};

  final colorList = <Color>[
    AppColors.secondaryLightColor,
    AppColors.secondaryColor,
  ];
  late double totalInvestment;
  late double result;
  @override
  void initState() {
    super.initState();
    num investmentAmount = (widget.investment * 12) * widget.time;
    num i = (widget.returnRate) / (12 * 100);

    result = (widget.investment *
            (((pow((1 + i), (widget.time * 12))) - 1) / i) *
            (1 + i)) -
        investmentAmount;
    totalInvestment = result + investmentAmount;
    num percentage = (100 * investmentAmount) / totalInvestment;
    dataMap.addAll({
      "Invested Amount": percentage.toDouble(),
      "Est. returns": (100 - percentage).toDouble(),
    });
    // print((100 * investmentAmount) / totalInvestment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            InterstitialAds interstitialAds = InterstitialAds();
            interstitialAds.createInterad();
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.blackColor,
          ),
        ),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: Text(
          'Result',
          style: AppTextStyle.semiBold22,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.whiteLightColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.whiteLightColor,
                ),
              ),
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
                            'Est. Returns',
                            style: AppTextStyle.regular18,
                          ),
                          Text(
                            '${AppText.rupeeSymbol} ${result.doublePrice}',
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
                    '${(widget.investment * (widget.time * 12)).numPrice} ${AppText.rupeeSymbol}',
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
                    AppText.timePeriod,
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
                    '${result.doublePrice} ${AppText.rupeeSymbol}',
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
                    '${totalInvestment.doublePrice} ${AppText.rupeeSymbol}',
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
            const NativeAds(),
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
            const BannerAds(),
          ],
        ),
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
