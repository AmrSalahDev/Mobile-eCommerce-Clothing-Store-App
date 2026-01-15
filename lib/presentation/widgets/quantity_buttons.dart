import 'package:ecommerce_clothing/core/assets_gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityButtons extends StatefulWidget {
  final double? size;
  const QuantityButtons({super.key, this.size});

  @override
  State<QuantityButtons> createState() => _QuantityButtonsState();
}

class _QuantityButtonsState extends State<QuantityButtons> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minWidth: widget.size ?? 40.w,
            minHeight: widget.size ?? 40.w,
          ),
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            side: WidgetStateProperty.all(
              BorderSide(color: ColorName.greyLight),
            ),
          ),
          onPressed: () {
            setState(() {
              if (quantity > 1) {
                quantity--;
              }
            });
          },
          icon: Icon(Icons.remove, size: 20.sp, color: ColorName.charcoalDark),
        ),
        SizedBox(
          width: 0.1.sw,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              quantity.toString(),
              maxLines: 1,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorName.blackSoft,
              ),
            ),
          ),
        ),

        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minWidth: widget.size ?? 40.w,
            minHeight: widget.size ?? 40.w,
          ),
          style: ButtonStyle(
            side: WidgetStateProperty.all(
              BorderSide(color: ColorName.greyLight),
            ),
          ),
          onPressed: () {
            setState(() {
              quantity++;
            });
          },
          icon: Icon(Icons.add, size: 20.sp, color: ColorName.charcoalDark),
        ),
      ],
    );
  }
}
