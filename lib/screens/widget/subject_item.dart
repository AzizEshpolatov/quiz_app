import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/models/subjectmodel.dart';
import 'package:quiz_app/utils/appcolors/app_colors.dart';
import 'package:quiz_app/utils/size/app_size.dart';
import 'package:quiz_app/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({
    super.key,
    required this.subjectModel,
    required this.time,
    required this.onTap,
  });

  final SubjectModel subjectModel;
  final String time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.orangeAccent,
          boxShadow: [
            BoxShadow(
              blurRadius: 12.h,
              offset: Offset(0,5.h),
              color: AppColors.black,
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 15.getW(),vertical: 5),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.getW(),
            vertical: 10.getH(),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    subjectModel.subjectName,
                    style: AppTextStyle.poppinsBold.copyWith(
                      fontSize: 16.w,
                      color: AppColors.c_000E56,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    time,
                    style: AppTextStyle.poppinsRegular.copyWith(
                      fontSize: 14.w,
                      color: AppColors.c_000E56,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    subjectModel.levelModel.name,
                    style: AppTextStyle.poppinsBold.copyWith(
                      fontSize: 16.w,
                      color: AppColors.c_000E56,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    subjectModel.questions.length.toString(),
                    style: AppTextStyle.poppinsRegular.copyWith(
                      fontSize: 14.w,
                      color: AppColors.c_000E56,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
