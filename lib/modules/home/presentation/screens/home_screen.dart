import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/config/style/text_styles.dart';
import 'package:pos_flutter/core/utils/shimmer/home_container_menu_shimmer.dart';
import 'package:pos_flutter/core/utils/shimmer/product_List_shimmer.dart';
import 'package:pos_flutter/core/utils/strings/app_strings.dart';
import 'package:pos_flutter/core/utils/variables/routerkeys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_flutter/core/widgets/default_search_box.dart';
import 'package:pos_flutter/modules/home/data/models/Category_model/Category_model.dart';
import 'package:pos_flutter/modules/home/data/models/brand_model/brand_model.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/brand_cubit/brand_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/brand_cubit/brand_state.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/category_cubit.dart/category_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/category_cubit.dart/category_state.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/product_cubit/product_state.dart';
import 'package:pos_flutter/modules/home/presentation/widgets/brand_category_menu.dart';
import 'package:pos_flutter/modules/home/presentation/widgets/home_container_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchValue = "";

  int? selectedItemId = 0;
  //bool isLoading = true;

  // @override
  // void initState() {
  //   // Future.delayed(const Duration(seconds: 2)).then((_) {
  //   //   if (mounted) {
  //   //     setState(() {
  //   //       isLoading = false;
  //   //     });
  //   //   }
  //   // });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    final allProducts = ProductCubit.get(context).products;

    return Scaffold(
      appBar: AppBar(
        actions: const [SizedBox()],
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        backgroundColor: AppColors.white,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(
            right: 15.0,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 28,
              color: AppColors.red,
            ),
            onPressed: () {
              RouterKeys.mainNavigatorKey.currentState!.openDrawer();
            },
          ),
        ),
        title: DefaultSearchBox(
          isSearch: true,
          searchController: searchController,
          onChanged: (v) {
            setState(() {
              searchValue = v;
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const BrandCategoryMenus(),
          BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
            return Container(
                padding: const EdgeInsets.all(8.0),
                height: 210,
                child: state is GetProductLoadingState || allProducts.isEmpty
                    ? const ProductListShimmer()
                    : state is GetProductSuccessState
                        ? ListView.builder(
                            itemCount: allProducts.length,
                            itemBuilder: (context, index) {
                              double prodctQty = 1;
                              // allProducts[index]
                              //         .productVariations!
                              //         .isNotEmpty
                              //     ? allProducts[index]
                              //             .productVariations![0]
                              //             .variations!
                              //             .isNotEmpty
                              //         ? allProducts[index]
                              //                 .productVariations![0]
                              //                 .variations![0]
                              //                 .variationLocationDetails!
                              //                 .isNotEmpty
                              //             ? allProducts[index]
                              //                 .productVariations![0]
                              //                 .variations![0]
                              //                 .variationLocationDetails![0]
                              //                 .qtyAvailable!
                              //             : 0
                              //         : 0
                              //     : 0;

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: prodctQty > 0
                                            ? AppColors.borderColor
                                            : AppColors.red,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: Text(
                                          allProducts[index].name!,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: AppTextStyle
                                              .cairoSemiBold16DarkBlue,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: Text(
                                          "200.0",
                                          // allProducts[index]
                                          //     .productVariations![0]
                                          //     .variations![0]
                                          //     .defaultPurchasePrice!
                                          //     .toString(),
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle.cairoBold16red,
                                        ),
                                      ),
                                      prodctQty > 0
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      AppColors.addButtonColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: AppColors.white,
                                                ),
                                                iconSize: 20,
                                              ))
                                          : const SizedBox(
                                              height: 48,
                                            ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : const SizedBox());
          })
        ]),
      ),
    );
  }

  // Row brandCategoryMenus() {

  //   return
  // }
}
