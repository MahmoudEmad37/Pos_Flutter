import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/core/utils/shimmer/product_container_shimmer.dart';
import 'package:pos_flutter/core/utils/strings/app_strings.dart';
import 'package:pos_flutter/core/utils/variables/routerkeys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_flutter/core/widgets/default_search_box.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/contact_cubit/contact_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/contact_cubit/contact_state.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/widgets/brand_category_menus.dart';
import 'package:pos_flutter/modules/home/presentation/widgets/home_contact_dropdown_menu.dart';
import 'package:pos_flutter/modules/home/presentation/widgets/product_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchValue = "";

  String? selectedBrand;
  String? selectedCategory;
  String? selectedContact;
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

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
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            BrandCategoryMenus(
                brandOnChange: brandOnChangeMenu,
                categoryOnChange: categoryOnChangeMenu,
                brandOnClear: brandOnClearMenu,
                categoryOnClear: categoryOnClearMenu,
                searchFn: searchMenuFun),
            const ProductsListWidget(),
            const Divider(
              indent: 10,
              endIndent: 10,
              color: AppColors.grey3,
              thickness: 2,
            ),
            BlocBuilder<ContactCubit, ContactState>(
              builder: (context, state) {
                return state is GetContactLoadingState
                    ? const ProductContainerShimmer()
                    : state is GetContactSuccessState
                        ? HomeContactDropdownMenu(
                            title: AppStrings.contactName,
                            contacts: state.contacts,
                            onChanged: contactOnChangeMenu,
                            searchFn: searchMenuFun)
                        : Container(
                            width: 10,
                            height: 10,
                            color: Colors.red,
                          );
              },
            ),
          ]),
        ),
      ),
    );
  }

  searchMenuFun(String keyword, Items) {
    List<int> ret = [];
    if (Items != null && keyword.isNotEmpty) {
      keyword.split(" ").forEach((k) {
        int i = 0;
        Items.forEach((item) {
          if (k.isNotEmpty &&
              (item.value.name
                  .toString()
                  .toLowerCase()
                  .contains(k.toLowerCase()))) {
            ret.add(i);
          }
          i++;
        });
      });
    }
    if (keyword.isEmpty) {
      ret = Iterable<int>.generate(Items.length).toList();
    }
    return (ret);
  }

  contactOnChangeMenu(value) {
    selectedContact = value.id.toString();
    print("selectedContact");
    print(selectedContact);
  }

  brandOnChangeMenu(value) {
    selectedBrand = value.id.toString();
    refreshProducts();
  }

  categoryOnChangeMenu(value) {
    selectedCategory = value.id.toString();
    refreshProducts();
  }

  brandOnClearMenu() {
    selectedBrand = null;
    refreshProducts();
  }

  categoryOnClearMenu() {
    selectedCategory = null;
    refreshProducts();
  }

  refreshProducts() {
    ProductCubit.get(context).getAllProducts(
        page: -1, categoryId: selectedCategory, brandId: selectedBrand);
    print('maaaaxxx');
  }
}
