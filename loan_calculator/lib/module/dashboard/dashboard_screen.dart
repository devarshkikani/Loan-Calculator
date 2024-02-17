import 'package:flutter/material.dart';
import 'package:loan_calculator/constants/app_text.dart';
import 'package:loan_calculator/theme/app_colors.dart';
import 'package:loan_calculator/theme/app_text_style.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> listOfFeature = <Map<String, dynamic>>[
    {
      'title': 'SIP',
      'subtitle':
          'Calculate how much you need to save or how much you will accumulate with your SIP',
    },
    {
      'title': 'Lumpsum',
      'subtitle':
          'Calculate returns for lumpsum investments to achieve your financial goals',
    },
    {
      'title': 'EMI',
      'subtitle':
          'Calculate EMI on your loans – home loan, car loan or personal loan',
    },
    {
      'title': 'FD',
      'subtitle':
          'Check returns on your fixed deposits (FDs) without any hassle',
    },
    {
      'title': 'GST',
      'subtitle': 'Calculate your payable GST amount with a few clicks',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppText.calculators,
          style: AppTextStyle.black22,
        ),
      ),
      body: GridView.builder(
        primary: false,
        itemCount: listOfFeature.length,
        padding: const EdgeInsets.all(12),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return Card(
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listOfFeature[index]['title'],
                    style: AppTextStyle.bold18,
                  ),
                  Text(
                    listOfFeature[index]['subtitle'],
                    style: AppTextStyle.regular14,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
