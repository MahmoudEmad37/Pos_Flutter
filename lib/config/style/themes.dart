import 'package:flutter/material.dart';
import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/config/style/text_styles.dart';

class Themes {
  static ThemeData get defaultTheme => ThemeData(
      useMaterial3: false,
      fontFamily: Fonts.cairo,
      primaryColor: AppColors.blue,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.blue),
        color: AppColors.white,
        titleTextStyle: TextStyle(color: AppColors.white),
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
      ),
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.blue));
}
