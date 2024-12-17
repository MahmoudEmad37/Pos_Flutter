// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pos_flutter/core/utils/shimmer/home_container_menu_shimmer.dart';
import 'package:pos_flutter/core/utils/strings/app_strings.dart';

import 'package:pos_flutter/modules/home/presentation/cubits/brand_cubit/brand_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/brand_cubit/brand_state.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/category_cubit.dart/category_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/category_cubit.dart/category_state.dart';
import 'package:pos_flutter/modules/home/presentation/widgets/home_dropdown_container.dart';

class BrandCategoryMenus extends StatelessWidget {
  Function brandOnChange;
  Function categoryOnChange;
  Function brandOnClear;
  Function categoryOnClear;
  Function searchFn;
  BrandCategoryMenus({
    super.key,
    required this.brandOnChange,
    required this.categoryOnChange,
    required this.brandOnClear,
    required this.categoryOnClear,
    required this.searchFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<BrandCubit, BrandState>(
          builder: (context, state) {
            return state is GetBrandLoadingState
                ? const HomeContainerMenuShimmer()
                : state is GetBrandSuccessState
                    ? HomeDropdownContainer(
                        title: AppStrings.brand,
                        brands: state.brands,
                        onChanged: brandOnChange,
                        onClear:brandOnClear,
                        searchFn:searchFn)
                    : Container(
                        width: 10,
                        height: 10,
                        color: Colors.red,
                      );
          },
        ),
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return state is GetCategoryLoadingState
                ? const HomeContainerMenuShimmer()
                : state is GetCategorySuccessState
                    ? HomeDropdownContainer(
                        title: AppStrings.category,
                        categories: state.categories,
                        onChanged: categoryOnChange,
                        onClear: categoryOnClear,
                        searchFn:searchFn)
                    : Container(
                        width: 10,
                        height: 10,
                        color: Colors.red,
                      );
          },
        ),
      ],
    );
  }
}
