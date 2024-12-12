import 'package:flutter/material.dart';
import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/core/utils/shimmer/custom_app_shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductContainerShimmer extends StatelessWidget {
  const ProductContainerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width / 1.2,
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
