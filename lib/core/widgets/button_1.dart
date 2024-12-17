import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_flutter/config/style/text_styles.dart';


class AppSingleButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final VoidCallback onPressed;
  final String text;
  final bool isCustom;
  TextStyle? textStyle;

  AppSingleButton(
      {super.key,
      required this.height,
      required this.width,
      required this.onPressed,
      required this.text,
      required this.color,
      this.isCustom = false,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: isCustom
                ? BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        bottomLeft: Radius.circular(20.r))
                : BorderRadius.circular(7.r),
            color: color,
          ),
          height: height.h,
          width: width.w,
          child: Center(
            child: DefaultTextStyle(
              style: textStyle ?? AppTextStyle.cairoSemiBold16White,
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}
