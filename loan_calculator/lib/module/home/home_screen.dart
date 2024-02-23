import 'package:flutter/material.dart';
import 'package:loan_calculator/constants/app_text.dart';
import 'package:loan_calculator/module/calculator/calculator_screen.dart';
import 'package:loan_calculator/module/dashboard/dashboard_screen.dart';
import 'package:loan_calculator/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: [
          const DashboardScreen(),
          const CalculatorScreen(),
        ][currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.whiteColor,
          selectedItemColor: AppColors.secondaryColor,
          unselectedItemColor: AppColors.greyColor,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: AppText.home,
            ),
            BottomNavigationBarItem(
              label: AppText.calculator,
              icon: Icon(Icons.calculate_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
