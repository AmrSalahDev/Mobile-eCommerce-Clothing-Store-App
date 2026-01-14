import 'package:ecommerce_clothing/core/assets_gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double width;
  final double? borderRadius;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final EdgeInsetsGeometry? margin;

  const ShimmerBox({
    super.key,
    required this.height,
    required this.width,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.borderRadius,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor ?? ColorName.baseShimmerColor,
      highlightColor: shimmerHighlightColor ?? ColorName.highlightShimmerColor,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: shimmerBaseColor ?? ColorName.baseShimmerColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
        ),
      ),
    );
  }
}
