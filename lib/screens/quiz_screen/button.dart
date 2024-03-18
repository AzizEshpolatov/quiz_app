import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/appcolors/app_colors.dart';

class StartQuizBottom extends StatefulWidget {
  const StartQuizBottom({
    super.key,
    required this.previousOnTap,
    required this.nextOnTap,
    required this.previousButtonVisibility,
    required this.nextButtonVisibility,
  });

  final VoidCallback previousOnTap;
  final VoidCallback nextOnTap;
  final bool previousButtonVisibility;
  final bool nextButtonVisibility;

  @override
  State<StartQuizBottom> createState() => _StartQuizBottomState();
}

class _StartQuizBottomState extends State<StartQuizBottom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20.h,
        right: 20.w,
        left: 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: widget.previousButtonVisibility,
            child: ZoomTapAnimation(
              onTap: widget.previousOnTap,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 12.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.c_273032,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 12.r,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Oldingisi",
                    style: TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.nextButtonVisibility,
            child: ZoomTapAnimation(
              onTap: widget.nextOnTap,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 12.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.c_F2954D,
                  border: Border.all(color: AppColors.c_F2954D, width: 1.r),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.25),
                      blurRadius: 12.r,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Keyingisi",
                    style: TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
