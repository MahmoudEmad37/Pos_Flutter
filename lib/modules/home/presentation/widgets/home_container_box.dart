// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/config/style/text_styles.dart';
import 'package:pos_flutter/core/utils/strings/app_strings.dart';
import 'package:pos_flutter/modules/home/data/models/Category_model/Category_model.dart';
import 'package:pos_flutter/modules/home/data/models/brand_model/brand_model.dart';
import 'package:pos_flutter/modules/home/domain/entities/brand_entity/brand_entity.dart';
import 'package:search_choices/search_choices.dart';

class HomeDropdownContainer extends StatefulWidget {
  String title;
  List<BrandModel>? brands;
  List<CategoryModel>? categories;
  final Function onChanged;

  HomeDropdownContainer({
    super.key,
    required this.title,
    this.brands,
    this.categories,
    required this.onChanged,
  });

  @override
  State<HomeDropdownContainer> createState() => _HomeDropdownContainerState();
}

class _HomeDropdownContainerState extends State<HomeDropdownContainer> {
  BrandModel selectedBrand = BrandModel(id: 0, businessId: 0, name: "");
  CategoryModel selectedCategory =
      CategoryModel(id: 0, businessId: 0, name: "", categoryType: "");
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<dynamic>> dropdownMenuItems;
    if (widget.title == AppStrings.brand) {
      dropdownMenuItems = widget.brands!.map((brand) {
        double itemWidth = brand.name == selectedBrand.name
            ? MediaQuery.of(context).size.width / 7.5
            : MediaQuery.of(context).size.width / 2;
        return DropdownMenuItem<BrandModel>(
          value: brand,
          child: SizedBox(
            width: itemWidth,
            child: Text(brand.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.cairoSemiBold15black),
          ),
        );
      }).toList();
    } else {
      dropdownMenuItems = widget.categories!.map((category) {
        double itemWidth = category.name == selectedCategory.name
            ? MediaQuery.of(context).size.width / 7.5
            : MediaQuery.of(context).size.width / 2;
        return DropdownMenuItem<CategoryModel>(
          value: category,
          child: SizedBox(
            width: itemWidth,
            child: Text(category.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.cairoSemiBold15black),
          ),
        );
      }).toList();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.25,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.borderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(widget.title,
                  style: AppTextStyle.cairoSemiBold16Red,
                  overflow: TextOverflow.ellipsis),
            ),
            SearchChoices.single(
              clearIcon: const Icon(
                Icons.clear,
                size: 18,
                color: AppColors.black,
              ),
              underline: const SizedBox(),
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 16,
              ),
              hint: SizedBox(
                width: MediaQuery.of(context).size.width / 7.5,
                child: Text("الكل",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.cairoSemiBold15black),
              ),
              items: dropdownMenuItems,
              value: widget.title == AppStrings.brand
                  ? selectedBrand
                  : selectedCategory,
              autofocus: false,
              rightToLeft: true,
              searchHint: "Search for a Brand",
              onChanged: (value) {
                widget.onChanged(value);
                setState(() {
                  widget.title == AppStrings.brand
                      ? selectedBrand = value
                      : selectedCategory = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
