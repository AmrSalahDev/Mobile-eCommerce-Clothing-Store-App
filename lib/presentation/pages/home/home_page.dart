import 'package:ecommerce_clothing/core/assets_gen/colors.gen.dart';
import 'package:ecommerce_clothing/data/models/product_model.dart';
import 'package:ecommerce_clothing/presentation/widgets/categories_bar.dart';
import 'package:ecommerce_clothing/presentation/widgets/custom_bottom_bar.dart';
import 'package:ecommerce_clothing/presentation/widgets/custom_home_app_bar.dart';
import 'package:ecommerce_clothing/presentation/widgets/custom_search_bar.dart';
import 'package:ecommerce_clothing/presentation/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            clipBehavior: Clip.none,
            slivers: [
              SliverStickyHeader(
                header: Container(
                  color: ColorName.white,
                  child: Column(
                    children: [
                      16.verticalSpace,
                      const CustomHomeAppBar(),
                      20.verticalSpace,
                      const CustomSearchBar(),
                      30.verticalSpace,
                      const CategoriesBar(),
                      30.verticalSpace,
                    ],
                  ),
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      ProductsGridView(products: ProductModel.products),
                      30.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
