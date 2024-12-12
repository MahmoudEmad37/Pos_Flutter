import 'package:flutter/material.dart';
import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/core/utils/shimmer/custom_app_shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeContainerMenuShimmer extends StatelessWidget {
  const HomeContainerMenuShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.only(right: 16.0),
      width: MediaQuery.of(context).size.width / 2.3,
      child: CustomAppShimmer(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              color: AppColors.white),
        ),
      ),
    );
  }
}
