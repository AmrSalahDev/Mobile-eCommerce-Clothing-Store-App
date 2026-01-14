import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:ecommerce_clothing/core/assets_gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: AnimatedTextField(
              animationType: Animationtype.typer,
              hintTextStyle: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey.shade400,
              ),
              hintTexts: [
                'Search for "Dress"',
                'Search for "T-Shirt"',
                'Search for "Jeans"',
                'Search for "Jumpsuit"',
                'Search for "Skirt"',
                'Search for "Shorts"',
              ],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 16.w,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),

                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),

                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),

                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                prefixIcon: Icon(
                  LucideIcons.search,
                  size: 24.sp,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
          16.horizontalSpace,
          Container(
            height: double.infinity,
            width: 70.h,
            decoration: BoxDecoration(
              color: ColorName.charcoalDark,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(LucideIcons.settings2, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
