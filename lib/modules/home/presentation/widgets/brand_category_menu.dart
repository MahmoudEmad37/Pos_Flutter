import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/core/utils/shimmer/home_container_menu_shimmer.dart';
import 'package:pos_flutter/core/utils/strings/app_strings.dart';
import 'package:pos_flutter/modules/home/data/models/Category_model/Category_model.dart';
import 'package:pos_flutter/modules/home/data/models/brand_model/brand_model.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/brand_cubit/brand_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/brand_cubit/brand_state.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/category_cubit.dart/category_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/category_cubit.dart/category_state.dart';
import 'package:pos_flutter/modules/home/presentation/widgets/home_container_box.dart';

class BrandCategoryMenus extends StatefulWidget {
  const BrandCategoryMenus({super.key});

  @override
  State<BrandCategoryMenus> createState() => _BrandCategoryMenusState();
}

class _BrandCategoryMenusState extends State<BrandCategoryMenus> {
  BrandModel? selectedBrand;
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final allBrands = BrandCubit.get(context).brands;
    final allCategories = CategoryCubit.get(context).categories;
    return Row(
      children: [
        BlocBuilder<BrandCubit, BrandState>(
          builder: (context, state) {
            return state is GetBrandLoadingState || allBrands.isEmpty
                ? const HomeContainerMenuShimmer()
                : state is GetBrandSuccessState
                    ? HomeDropdownContainer(
                        title: AppStrings.brand,
                        brands: allBrands,
                        onChanged: (value) {
                          selectedBrand = value;
                          print('maaaaxxx');
                          print(selectedBrand!.id);
                        },
                      )
                    : Container(
                        width: 10,
                        height: 10,
                        color: Colors.red,
                      );
          },
        ),
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return state is GetCategoryLoadingState || allCategories.isEmpty
                ? const HomeContainerMenuShimmer()
                : state is GetCategorySuccessState
                    ? HomeDropdownContainer(
                        title: AppStrings.category,
                        categories: allCategories,
                        onChanged: (value) {
                          selectedCategory = value;
                          print('maaaaxxx');
                          print(selectedCategory!.id);
                        },
                      )
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
