import 'package:flutter/material.dart';
import 'package:loan_calculator/theme/app_colors.dart';
import 'package:loan_calculator/theme/app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final bool showShadow;
  final Function()? onTap;
  final Color? tColor, bColor;
  final TextStyle? textStyle;
  final double? height, width, borderRadius;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.tColor,
    this.bColor,
    this.height,
    this.width,
    this.textStyle,
    this.showShadow = false,
    this.borderRadius,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 40,
        width: width ?? MediaQuery.of(context).size.width * .5,
        decoration: BoxDecoration(
          color: onTap != null
              ? bColor ?? AppColors.primaryColor
              : AppColors.greyColor.withOpacity(0.32),
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          boxShadow: showShadow
              ? <BoxShadow>[
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.5),
                    blurRadius: 60,
                    offset: const Offset(20, 20),
                  ),
                ]
              : [],
        ),
        child: Text(
          text!,
          style: textStyle ??
              AppTextStyle.bold14.copyWith(
                color: onTap != null ? tColor : tColor?.withOpacity(0.32),
              ),
        ),
      ),
    );
  }
}
