import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan_calculator/theme/app_colors.dart';
import 'package:loan_calculator/theme/app_text_style.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.validator,
    this.prefixIcon,
    this.controller,
    this.obscureText,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.onTap,
    this.cursorHeight,
    this.enabled,
    this.readOnly,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.textInputAction,
    this.keyboardType,
    this.filledColor,
    this.hintStyle,
    this.style,
    this.focusBorder,
    this.border,
    this.enabledBorder,
    this.cursorColor,
    this.contentPadding,
    this.autofocus,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.textCapitalization = TextCapitalization.words,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final bool? readOnly;
  final bool? obscureText;
  final double? cursorHeight;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final bool? enabled;
  final bool? autofocus;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final Color? filledColor;
  final Color? cursorColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final BorderSide? focusBorder;
  final BorderSide? border;
  final BorderSide? enabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final TextCapitalization textCapitalization;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      fieldKey: fieldKey,
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      hintText: hintText,
      style: style,
      obscureText: obscureText,
      readOnly: readOnly,
      textCapitalization: textCapitalization,
      labelText: labelText,
      inputFormatters: inputFormatters,
      hintStyle: hintStyle,
      controller: controller,
      cursorColor: cursorColor,
      keyboardType: keyboardType,
      validator: validator,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      textAlign: textAlign,
      cursorHeight: cursorHeight,
      onTap: onTap,
      enabled: enabled,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      contentPadding: contentPadding,
      filledColor: filledColor,
      border: border,
      prefixIconConstraints: prefixIconConstraints,
      suffixIconConstraints: suffixIconConstraints,
      focusBorder: focusBorder,
      enabledBorder: enabledBorder,
    );
  }

  TextFormField textFormField({
    final Key? fieldKey,
    final String? hintText,
    final String? labelText,
    final String? helperText,
    final String? initialValue,
    final int? errorMaxLines,
    final int? maxLines,
    final int? maxLength,
    final bool? enabled,
    final bool? readOnly,
    final bool autofocus = false,
    final bool? obscureText,
    final Color? filledColor,
    final Color? cursorColor,
    final Widget? prefixIcon,
    final Widget? suffixIcon,
    final FocusNode? focusNode,
    final TextStyle? style,
    final TextStyle? hintStyle,
    final TextAlign textAlign = TextAlign.left,
    final TextEditingController? controller,
    final List<TextInputFormatter>? inputFormatters,
    final TextInputAction? textInputAction,
    final TextInputType? keyboardType,
    final TextCapitalization textCapitalization = TextCapitalization.none,
    final GestureTapCallback? onTap,
    final FormFieldSetter<String?>? onSaved,
    final FormFieldValidator<String?>? validator,
    final ValueChanged<String?>? onChanged,
    final ValueChanged<String?>? onFieldSubmitted,
    final BorderSide? focusBorder,
    final BorderSide? enabledBorder,
    final BorderSide? border,
    final double? cursorHeight,
    final BoxConstraints? prefixIconConstraints,
    final BoxConstraints? suffixIconConstraints,
    final EdgeInsetsGeometry? contentPadding,
    final Function()? onEditingComplete,
  }) {
    return TextFormField(
      key: fieldKey,
      controller: controller,
      focusNode: focusNode,
      maxLines: maxLines ?? 1,
      initialValue: initialValue,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      obscureText: obscureText ?? false,
      enabled: enabled,
      enableInteractiveSelection: enabled,
      validator: validator,
      maxLength: maxLength,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      onTap: onTap,
      onSaved: onSaved,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      autocorrect: true,
      autofocus: autofocus,
      textAlign: textAlign,
      cursorColor: cursorColor ?? AppColors.primaryColor,
      cursorHeight: cursorHeight ?? 24,
      style: style ??
          AppTextStyle.regular18.copyWith(color: AppColors.primaryColor),
      readOnly: readOnly ?? false,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorMaxLines: 5,
        fillColor: filledColor ?? AppColors.highlightColor,
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle ??
            AppTextStyle.regular18.copyWith(
              color: AppColors.whiteColor,
            ),
        counterText: '',
        suffixIcon: suffixIcon,
        labelText: labelText,
        floatingLabelStyle: AppTextStyle.regular18.copyWith(
          color: AppColors.whiteColor.withOpacity(.8),
        ),
        labelStyle: AppTextStyle.regular18.copyWith(
          color: AppColors.whiteColor,
        ),
        helperText: helperText,
      ),
    );
  }
}
