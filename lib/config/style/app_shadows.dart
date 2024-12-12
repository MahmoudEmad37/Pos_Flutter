import 'package:flutter/material.dart';
import 'package:pos_flutter/config/style/app_colors.dart';

class AppShadows {
  static const List<BoxShadow> shadow1 = [
    BoxShadow(color: AppColors.blue6, offset: Offset(0, 0), blurRadius: 4),
  ];
  static const List<BoxShadow> shadow3 = [
    BoxShadow(
        color: AppColors.shadow3Color, blurRadius: 26.9, offset: Offset(1, 6))
  ];
}
