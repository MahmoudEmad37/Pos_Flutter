import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/config/style/text_styles.dart';
import 'package:pos_flutter/core/utils/strings/app_strings.dart';

class DefaultSearchBox extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isSearch;
  final Widget? child;
  final bool isCategory;
  final bool isConversation;

  final TextEditingController? searchController;
  final dynamic onChanged;

  const DefaultSearchBox(
      {super.key,
      this.title = '',
      this.isSearch = false,
      this.searchController,
      this.onChanged,
      this.child,
      this.isCategory = false,
      this.isConversation = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.greyTransparent,
            ),
            child: TextFormField(
              onChanged: onChanged,
              style: AppTextStyle.cairoSemiBold17Black,
              cursorColor: AppColors.grey4,
              decoration: InputDecoration(
                hintText: AppStrings.search,
                hintStyle: AppTextStyle.cairoThin13Grey,
                border: InputBorder.none,
                suffixIcon: const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Icon(Icons.search, color: AppColors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, isSearch ? 100.h : 60.h);
}
// Row(
// children: [
// Text(
// AppStrings.search,
// style: AppTextStyle.cairoMedium14Black,
// ),
// const Spacer(),
// const Icon(Icons.search),
// ],
// ),
