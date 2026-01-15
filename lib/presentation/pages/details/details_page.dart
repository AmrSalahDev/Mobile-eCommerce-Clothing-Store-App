import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_clothing/core/assets_gen/colors.gen.dart';
import 'package:ecommerce_clothing/core/constant/app_strings.dart';
import 'package:ecommerce_clothing/data/models/product_model.dart';
import 'package:ecommerce_clothing/presentation/widgets/favorite_button.dart';
import 'package:ecommerce_clothing/presentation/widgets/quantity_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class DetailsPage extends StatefulWidget {
  final ProductModel product;
  const DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                _ProductImage(widget: widget),
                20.verticalSpace,
                Row(
                  children: [
                    _ProductInfoPart(widget: widget),
                    const Spacer(),
                    QuantityButtons(),
                  ],
                ),
                15.verticalSpace,
                _DescriptionPart(widget: widget),
                20.verticalSpace,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _SizesPart(productModel: widget.product),
                      20.horizontalSpace,
                      _ColorsPart(productModel: widget.product),
                    ],
                  ),
                ),
                25.verticalSpace,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _AddToCartButton(widget: widget),
    );
  }
}

class _ProductInfoPart extends StatelessWidget {
  const _ProductInfoPart({
    required this.widget,
  });

  final DetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 0.5.sw,
          child: Text(
            widget.product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        10.verticalSpace,
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 24.sp),
            4.horizontalSpace,
            Text(
              "${widget.product.rating}",
              style: TextStyle(
                fontSize: 16.sp,
                color: ColorName.charcoalDark,
                fontWeight: FontWeight.w400,
              ),
            ),
            10.horizontalSpace,
            Text(
              AppStrings.reviewsCount,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SizesPart extends StatefulWidget {
  final ProductModel productModel;
  const _SizesPart({required this.productModel});

  @override
  State<_SizesPart> createState() => _SizesPartState();
}

class _SizesPartState extends State<_SizesPart> {
  int selectedCategory = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.chooseSize,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        SizedBox(
          height: 50.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.productModel.sizes.length,
            clipBehavior: Clip.none,
            itemBuilder: (_, index) {
              final currentIndex = index;
              final isSelected = selectedCategory == currentIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = currentIndex;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 35.w,
                  height: 35.w,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorName.greyLight),
                    color: isSelected
                        ? ColorName.charcoalDark
                        : ColorName.greyVeryLight,
                  ),
                  child: Text(
                    widget.productModel.sizes[index],
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: isSelected ? Colors.white : ColorName.charcoalDark,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ColorsPart extends StatefulWidget {
  final ProductModel productModel;
  const _ColorsPart({required this.productModel});

  @override
  State<_ColorsPart> createState() => _ColorsPartState();
}

class _ColorsPartState extends State<_ColorsPart> {
  int selectedCategory = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.chooseColor,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        SizedBox(
          height: 50.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.productModel.colors.length,
            clipBehavior: Clip.none,
            itemBuilder: (_, index) {
              final currentIndex = index;
              final isSelected = selectedCategory == currentIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = currentIndex;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 35.w,
                  height: 35.w,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorName.greyLight),
                    color: widget.productModel.colors[index],
                  ),
                  child: Icon(
                    Icons.check,
                    size: 24.sp,
                    color: isSelected
                        ? widget.productModel.colors[index] == Colors.white
                              ? Colors.black
                              : Colors.white
                        : Colors.transparent,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _DescriptionPart extends StatelessWidget {
  const _DescriptionPart({required this.widget});

  final DetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      '${widget.product.description} ',
      trimMode: TrimMode.Line,
      trimLines: 2,
      trimCollapsedText: AppStrings.readMore,
      trimExpandedText: AppStrings.showLess,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
        color: ColorName.charcoalDark,
      ),
      moreStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
        color: ColorName.blackSoft,
      ),
      lessStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
        color: ColorName.blackSoft,
      ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({required this.widget});

  final DetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      height: 90.h,

      decoration: BoxDecoration(color: ColorName.greyVeryLight),
      child: ElevatedButton(
        onPressed: () {
          // Handle add to cart action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorName.charcoalDark,
          padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 30.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 24.sp,
              color: Colors.white,
            ),
            10.horizontalSpace,
            Text(
              "${AppStrings.addToCart} | \$${widget.product.price}",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            5.horizontalSpace,
            Text(
              AppStrings.strikeoutPrice,
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.white,
                height: 3.8,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.widget});

  final DetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: CachedNetworkImage(
            imageUrl: widget.product.image,
            width: double.infinity,
            height: 0.5.sh,
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.w),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 24.sp,
                color: ColorName.charcoalDark,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.w),
            child: FavoriteButton(
              heartColor: ColorName.charcoalDark,
              size: 24.sp,
              padding: 12.w,
              isFavorited: widget.product.isFavorite,
              onToggle: (isFavorited) {},
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
