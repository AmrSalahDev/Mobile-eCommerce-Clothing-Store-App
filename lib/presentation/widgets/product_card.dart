import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_clothing/core/assets_gen/colors.gen.dart';
import 'package:ecommerce_clothing/core/routes/app_paths.dart';
import 'package:ecommerce_clothing/data/models/product_model.dart';
import 'package:ecommerce_clothing/presentation/widgets/favorite_button.dart';
import 'package:ecommerce_clothing/presentation/widgets/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppPaths.details, extra: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      ShimmerBox(height: 200.h, width: double.infinity),
                  errorWidget: (context, url, error) =>
                      ShimmerBox(height: 200.h, width: double.infinity),
                ),
              ),
              // Heart Button
              Positioned(
                top: 10,
                right: 10,
                child: FavoriteButton(
                  size: 24.sp,
                  padding: 7.w,
                  heartColor: Colors.white,
                  isFavorited: product.isFavorite,
                  backgroundColor: ColorName.charcoalDark,
                  onToggle: (isFav) {
                    // Handle favorite toggle
                  },
                ),
              ),
            ],
          ),
      
          // Details Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.verticalSpace,
              Text(
                product.title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorName.blackSoft,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              4.verticalSpace,
              Text(
                product.category,
                style: TextStyle(fontSize: 12.sp, color: ColorName.grey),
              ),
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorName.blackSoft,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 14.sp),
                      4.horizontalSpace,
                      Text(
                        "${product.rating}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: ColorName.blackSoft,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  8.horizontalSpace,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
