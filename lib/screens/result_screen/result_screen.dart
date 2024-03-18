import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/screens/quiz_screen/answer_report.dart';
import 'package:quiz_app/screens/quiz_screen/quiz_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/appcolors/app_colors.dart';
import '../../utils/images_and_icons/app_images_icons.dart';
import '../../utils/size/app_size.dart';
import '../../utils/styles/app_text_style.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.answerReport});

  final AnswerReport answerReport;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_273032,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(
            width: width,
            child: Row(
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 32.w, top: 5.h, bottom: 5.h, right: 5.w),
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.c_162023,
                    ),
                    child: SvgPicture.asset(AppIconsAndImages.arrow_back),
                  ),
                ),
                SizedBox(width: 16.w),
                Text(
                  "Result Quiz",
                  style: AppTextStyle.poppinsBold.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.c_162023,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5.h),
                    blurRadius: 12,
                    color: const Color(0xFF000000).withOpacity(0.25),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 44.h,
                    child: Expanded(
                      child: Text(
                        "Pair of Linear Equation in Two Variables ",
                        style: AppTextStyle.poppinsRegular.copyWith(
                          fontSize: 16.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "${widget.answerReport.subjectModel.subjectName} / ${widget.answerReport.subjectModel.questions.length}",
                    style: AppTextStyle.poppinsRegular.copyWith(
                      fontSize: 16.w,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.c_162023,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5.h),
                    blurRadius: 12,
                    color: const Color(0xFF000000).withOpacity(0.25),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 110.w,
                    height: 110.h,
                    child: Transform.rotate(
                      angle: pi,
                      child: CircularProgressIndicator(
                        value: widget.answerReport.truePersonPage,
                        color: AppColors.c_F2954D,
                        backgroundColor: AppColors.c_F2954D.withOpacity(0.3),
                        strokeCap: StrokeCap.round,
                        strokeWidth: 8.h,
                      ),
                    ),
                  ),
                  SizedBox(width: 23.w),
                  SizedBox(
                    width: 123.w,
                    height: 110.h,
                    child: Expanded(
                      child: Text(
                        "Congratulations!You have passed this test with ${(widget.answerReport.truePersonPage * 100).toStringAsFixed(0)}%.",
                        style: AppTextStyle.poppinsBold.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: const Color(0xFf27AE60),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.answerReport.trueAnswerCount}",
                          style: AppTextStyle.poppinsBold.copyWith(
                            fontSize: 16.w,
                          ),
                        ),
                        Text(
                          "Correct Answers",
                          style: AppTextStyle.poppinsBold.copyWith(
                            fontSize: 12.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: const Color(0xFfeb5757),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.answerReport.falseAnswerCount}",
                          style: AppTextStyle.poppinsBold.copyWith(
                            fontSize: 16.w,
                          ),
                        ),
                        Text(
                          "Wrong Answers",
                          style: AppTextStyle.poppinsBold.copyWith(
                            fontSize: 12.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.c_F2954D,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AppIconsAndImages.time,
                          width: 18.w,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          getMinutelyText(widget.answerReport.totalTime),
                          style: AppTextStyle.poppinsBold.copyWith(
                            fontSize: 16.w,
                          ),
                        ),
                        Text(
                          "Total time",
                          style: AppTextStyle.poppinsBold.copyWith(
                            fontSize: 12.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.blue,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AppIconsAndImages.time,
                          width: 18.w,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "00:${widget.answerReport.averageTimeForEach}",
                          style: AppTextStyle.poppinsBold.copyWith(
                            fontSize: 16.w,
                          ),
                        ),
                        Text(
                          "AwgTime/answer",
                          style: AppTextStyle.poppinsBold.copyWith(
                            fontSize: 12.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            ZoomTapAnimation(
              onTap: (){
                showDialog(context: context, builder: (BuildContext) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 32.w,vertical: 200.h),
                    decoration: BoxDecoration(
                      color: AppColors.c_273032,
                      borderRadius: BorderRadius.circular(16.w),
                    ),
                    child: Column(
                      children: [
                        Text("${widget.answerReport.wrongAnswer}"),
                      ],
                    ),
                  );
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.sp),
                  color: AppColors.c_F2954D.withOpacity(0.5),

                ),
                child: Center(
                  child: Text(
                    "Check Answers",style: AppTextStyle.poppinsSemiBold.copyWith(
                    fontSize: 16.w,
                  ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            ZoomTapAnimation(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.sp),
                  color: AppColors.c_F2954D,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.refresh,size: 22,color: Colors.white,),
                    SizedBox(width: 10.w),
                    Text(
                      "Try Quiz Again",style: AppTextStyle.poppinsSemiBold.copyWith(
                      fontSize: 16.w,
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}















