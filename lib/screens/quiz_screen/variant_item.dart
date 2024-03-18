import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/appcolors/app_colors.dart';

class VariantItem extends StatefulWidget {
  const VariantItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.caption,
    required this.variantText,
  });

  final VoidCallback onTap;
  final bool isSelected;
  final String caption;
  final String variantText;

  @override
  State<VariantItem> createState() => _VariantItemState();
}

class _VariantItemState extends State<VariantItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(
            16.r,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 20.w,
            ),
            decoration: BoxDecoration(
              color: widget.isSelected ? AppColors.c_F2954D : AppColors.c_273032,
              borderRadius: BorderRadius.circular(
                16.r,
              ),
            ),
            child: Row(
              children: [
                Text(
                  "${widget.caption}.",
                  style: TextStyle(
                    color: AppColors.c_F2F2F2,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  widget.variantText,
                  style: TextStyle(
                    color: AppColors.c_F2F2F2,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
