import 'package:flutter/material.dart';

import 'package:pos_flutter/core/utils/shimmer/product_container_shimmer.dart';

class ProductListShimmer extends StatelessWidget {
  const ProductListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const ProductContainerShimmer(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 5,
      ),
    );
  }
}
