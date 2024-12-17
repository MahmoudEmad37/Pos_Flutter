import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/config/style/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText, labelText;
  final TextEditingController? controller;
  final bool obscureText, readOnly;
  final bool isCustom;
  final TextInputType textInput;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final Widget? icon, fixIcon;

  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onSubmit, onChanged;
  final List<TextInputFormatter> inputFormatter;
  final int? maxLines;
  final int? maxLength;

  const AppTextFormField({
    super.key,
    this.inputFormatter = const [],
    this.textInput = TextInputType.text,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.onTap,
    this.icon,
    this.fixIcon,
    this.onChanged,
    this.textAlign,
    this.contentPadding,
    this.onSubmit,
    this.readOnly = false,
    this.maxLines,
    this.maxLength,
    this.isCustom = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      onTap: onTap,
      minLines: 1,
      maxLines: maxLines,
      maxLength: maxLength,
      readOnly: readOnly,
      inputFormatters: inputFormatter,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      keyboardType: textInput,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      obscuringCharacter: "*",
      style: AppTextStyle.cairoSemiBold20black,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        counterText: "",
        hintText: hintText,
        labelText: labelText,
        floatingLabelStyle: AppTextStyle.cairoRegular13black,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: icon,
        suffixIcon: fixIcon,
        filled: true,
        fillColor: isCustom ? AppColors.white : AppColors.grey3,
        errorStyle: AppTextStyle.cairoThin11Red,
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0.w, color: AppColors.borderColor),
            borderRadius: isCustom
                ? BorderRadius.circular(10.r)
                : BorderRadius.circular(10.r)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0.w, color: AppColors.borderColor),
            borderRadius: isCustom
                ? BorderRadius.circular(10.r)
                : BorderRadius.circular(10.r)),
        hintStyle: AppTextStyle.cairoMedium14Grey,
        labelStyle: AppTextStyle.cairoMedium14Black,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0.w, color: AppColors.borderColor),
            borderRadius: isCustom
                ? BorderRadius.circular(10.r)
                : BorderRadius.circular(10.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0.w, color: AppColors.borderColor),
            borderRadius: isCustom
                ? BorderRadius.circular(10.r)
                : BorderRadius.circular(10.r)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0.w, color: AppColors.borderColor),
            borderRadius: isCustom
                ? BorderRadius.circular(10.r)
                : BorderRadius.circular(10.r)),
        contentPadding: contentPadding ??
            EdgeInsets.only(top: 10.h, right: 20.w, bottom: 10.h, left: 10.w),

        // labelText: labelText,
      ),
    );
  }
}
