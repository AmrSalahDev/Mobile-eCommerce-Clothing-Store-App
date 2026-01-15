import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_clothing/core/assets_gen/assets.gen.dart';
import 'package:ecommerce_clothing/core/assets_gen/colors.gen.dart';
import 'package:ecommerce_clothing/core/constant/app_strings.dart';
import 'package:ecommerce_clothing/data/models/product_model.dart';
import 'package:ecommerce_clothing/presentation/widgets/quantity_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: CustomScrollView(
            clipBehavior: Clip.none,
            slivers: [
              SliverStickyHeader(
                header: Container(
                  color: ColorName.white,
                  padding: EdgeInsets.only(top: 16.h, bottom: 10.h),
                  child: CustomCheckoutAppBar(),
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.verticalSpace,
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final product = ProductModel.products[index];
                          return CheckoutProductCard(product: product);
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.grey.shade200,
                            thickness: 1,
                            height: 30.h,
                          );
                        },
                        itemCount: 3,
                      ),
                      35.verticalSpace,
                      Text(
                        AppStrings.shippingInformation,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorName.blackSoft,
                        ),
                      ),
                      20.verticalSpace,
                      Container(
                        width: double.infinity,
                        height: 80.h,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: ColorName.greyVeryLight,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            Assets.icons.visaLogo.svg(
                              width: 40.w,
                              height: 40.w,
                              colorFilter: const ColorFilter.mode(
                                Colors.indigo,
                                BlendMode.srcIn,
                              ),
                            ),
                            16.horizontalSpace,
                            Expanded(
                              child: Text(
                                AppStrings.cardNumber,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorName.blackSoft,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 30.w,
                              color: ColorName.charcoalDark,
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      _CustomRow(
                        title: AppStrings.totalItems,
                        amount: AppStrings.totalAmount,
                      ),
                      15.verticalSpace,
                      _CustomRow(
                        title: AppStrings.shippingFee,
                        amount: AppStrings.shippingFeeAmount,
                      ),
                      15.verticalSpace,
                      _CustomRow(
                        title: AppStrings.discount,
                        amount: AppStrings.discountAmount,
                      ),
                      Divider(
                        color: Colors.grey.shade200,
                        thickness: 1,
                        height: 30.h,
                      ),
                      15.verticalSpace,
                      _CustomRow(
                        title: AppStrings.subTotal,
                        amount: AppStrings.subTotalAmount,
                      ),
                      50.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: 10.h,
          top: 10.h,
        ),
        color: ColorName.white,
        child: SizedBox(
          width: double.infinity,
          height: 60.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorName.charcoalDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
            onPressed: () {},
            child: Text(
              AppStrings.pay,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: ColorName.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomRow extends StatelessWidget {
  final String title;
  final String amount;
  const _CustomRow({required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: ColorName.charcoalDark,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.blackSoft,
          ),
        ),
      ],
    );
  }
}

class CheckoutProductCard extends StatefulWidget {
  final ProductModel product;
  const CheckoutProductCard({super.key, required this.product});

  @override
  State<CheckoutProductCard> createState() => _CheckoutProductCardState();
}

class _CheckoutProductCardState extends State<CheckoutProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      color: ColorName.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: CachedNetworkImage(
              imageUrl: widget.product.image,
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.title,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorName.blackSoft,
                          ),
                        ),
                        3.verticalSpace,
                        Text(
                          widget.product.category,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorName.charcoalDark,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_horiz,
                        size: 27.w,
                        color: ColorName.blackSoft,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorName.blackSoft,
                      ),
                    ),
                    QuantityButtons(size: 30),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCheckoutAppBar extends StatelessWidget {
  const CustomCheckoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.all(12.w)),
            side: WidgetStatePropertyAll(
              BorderSide(color: Colors.grey.shade300),
            ),
          ),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ColorName.blackSoft,
            size: 24.w,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        Text(
          AppStrings.checkoutTitle,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: ColorName.blackSoft,
          ),
        ),
        IconButton(
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.all(12.w)),
            side: WidgetStatePropertyAll(
              BorderSide(color: Colors.grey.shade300),
            ),
          ),
          icon: Icon(LucideIcons.menu, color: ColorName.blackSoft, size: 24.w),
          onPressed: () {},
        ),
      ],
    );
  }
}
