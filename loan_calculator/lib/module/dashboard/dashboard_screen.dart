import 'package:flutter/material.dart';
import 'package:loan_calculator/constants/app_text.dart';
import 'package:loan_calculator/module/emi/emi_screen.dart';
import 'package:loan_calculator/module/fd/fd_screen.dart';
import 'package:loan_calculator/module/lumpsum/lumpsum_screen.dart';
import 'package:loan_calculator/module/mutual_funds/mutual_funds_screen.dart';
import 'package:loan_calculator/module/sip/sip_screen.dart';
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
      'icon':
          'https://assets-netstorage.groww.in/web-assets/nbg_mobile/prod/_next/static/media/sip.81144080.png',
    },
    {
      'title': 'Lumpsum',
      'subtitle':
          'Calculate returns for lumpsum investments to achieve your financial goals',
      'icon':
          'https://assets-netstorage.groww.in/web-assets/nbg_mobile/prod/_next/static/media/lumpsum.1794f9ea.png',
    },
    {
      'title': 'EMI',
      'subtitle':
          'Calculate EMI on your loans – home loan, car loan or personal loan',
      'icon':
          'https://assets-netstorage.groww.in/web-assets/nbg_mobile/prod/_next/static/media/emi.bf7e22de.png',
    },
    {
      'title': 'FD',
      'subtitle':
          'Check returns on your fixed deposits (FDs) without any hassle',
      'icon':
          'https://assets-netstorage.groww.in/web-assets/nbg_mobile/prod/_next/static/media/fd.5c66d7e6.png',
    },
    {
      'title': 'MF',
      'subtitle': 'Calculate the returns on your mutual fund investments',
      'icon':
          'https://assets-netstorage.groww.in/web-assets/nbg_mobile/prod/_next/static/media/mutualFund.30d93762.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: Text(
          AppText.calculators,
          style: AppTextStyle.semiBold22,
        ),
      ),
      body: GridView.builder(
        primary: false,
        itemCount: listOfFeature.length,
        padding: const EdgeInsets.all(12),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.78,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                navigate(const SipScreen());
              } else if (index == 1) {
                navigate(const LumpsumScreen());
              } else if (index == 2) {
                navigate(const EmiScreen());
              } else if (index == 3) {
                navigate(const FdScreen());
              } else if (index == 4) {
                navigate(const MutualFundsScreen());
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.whiteLightColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.whiteLightColor,
                ),
              ),
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
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.network(
                      listOfFeature[index]['icon'],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void navigate(Widget child) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => child));
  }
}
