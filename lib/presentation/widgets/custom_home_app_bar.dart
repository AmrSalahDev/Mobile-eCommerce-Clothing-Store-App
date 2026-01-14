import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_clothing/core/assets_gen/colors.gen.dart';
import 'package:ecommerce_clothing/presentation/widgets/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Hello, Welcome",
                  style: TextStyle(fontSize: 16.sp, color: ColorName.grey),
                ),
                AnimatedEmoji(
                  AnimatedEmojis.wave,
                  size: 20.sp,
                  repeat: true,
                  errorWidget: const SizedBox.shrink(),
                ),
              ],
            ),
            Text(
              "Amr Salah",
              style: TextStyle(
                fontSize: 24.sp,
                color: ColorName.blackSoft,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        ClipOval(
          child: CachedNetworkImage(
            width: 50.w,
            height: 50.w,
            fit: BoxFit.cover,
            imageUrl: "https://i.pravatar.cc/100?img=12",
            errorWidget: (context, url, error) =>
                ShimmerBox(width: 50.w, height: 50.w),
            placeholder: (context, url) =>
                ShimmerBox(width: 50.w, height: 50.w),
          ),
        ),
      ],
    );
  }
}
