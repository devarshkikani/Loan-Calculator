import 'package:flutter/material.dart';
import 'package:loan_calculator/constants/app_text.dart';
import 'package:loan_calculator/module/home/home_screen.dart';
import 'package:loan_calculator/theme/app_colors.dart';

class DotsLoanCalculatorApp extends StatefulWidget {
  const DotsLoanCalculatorApp({super.key});

  @override
  State<DotsLoanCalculatorApp> createState() => DdotLloaCalculatorAppState();
}

class DdotLloaCalculatorAppState extends State<DotsLoanCalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppText.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // highlightColor: AppColors.highlightColor,
        primaryColor: AppColors.primaryColor,
        // scaffoldBackgroundColor: AppColors.whiteColor,
      ),
      home: const HomeScreen(),
    );
  }
}
