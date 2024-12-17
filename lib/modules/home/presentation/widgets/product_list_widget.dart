import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/config/style/text_styles.dart';
import 'package:pos_flutter/core/utils/shimmer/product_List_shimmer.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/product_cubit/product_state.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      return Container(
          padding: const EdgeInsets.all(8.0),
          height: 210,
          child: state is GetProductLoadingState
              ? const ProductListShimmer()
              // // ? SizedBox()
              : state is GetProductSuccessState
                  ? ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        double prodctQty = state.products[index]
                                .productVariations!.isNotEmpty
                            ? state.products[index].productVariations![0]
                                    .variations!.isNotEmpty
                                ? state
                                        .products[index]
                                        .productVariations![0]
                                        .variations![0]
                                        .variationLocationDetails!
                                        .isNotEmpty
                                    ? state
                                        .products[index]
                                        .productVariations![0]
                                        .variations![0]
                                        .variationLocationDetails![0]
                                        .qtyAvailable!
                                    : 0
                                : 0
                            : 0;
    
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
                                    state.products[index].name!,
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
                                    double.parse(state
                                            .products[index]
                                            .productVariations![0]
                                            .variations![0]
                                            .defaultSellPrice!)
                                        .toString(),
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
    });
  }
}