import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/models/subjectmodel.dart';
import 'package:quiz_app/screens/quiz_screen/quiz_screen.dart';
import 'package:quiz_app/utils/images_and_icons/app_images_icons.dart';
import 'package:quiz_app/utils/size/app_size.dart';
import 'package:quiz_app/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/appcolors/app_colors.dart';

class StartQuizAppTutorial extends StatefulWidget {
  const StartQuizAppTutorial({
    super.key,
    required this.subjectModel,
  });

  final SubjectModel subjectModel;

  @override
  State<StartQuizAppTutorial> createState() => _StartQuizAppTutorialState();
}

class _StartQuizAppTutorialState extends State<StartQuizAppTutorial> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.c_273032,
      ),
      child: Scaffold(
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
                        left: 28.w,
                        top: 5.h,
                        bottom: 5.h,
                        right: 5.w,
                      ),
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
                    "Testni boshlash.",
                    style: AppTextStyle.poppinsBold.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 22.h),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                  color: AppColors.c_162023,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(32.w, 15.h, 32.w, 0),
                        children: [
                          Text(
                            "Put your understanding of this concept to test by answering a few MCQs.",
                            style: AppTextStyle.poppinsRegular.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                width: 1.r,
                                color: AppColors.c_F2954D,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 154.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.asset(
                                      AppIconsAndImages.img,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Fan nomi : ${widget.subjectModel.subjectName}",
                                        style: AppTextStyle.poppinsRegular
                                            .copyWith(
                                          fontSize: 14.w,
                                        ),
                                      ),
                                      Text(
                                        "Qiyinlik darajasi : ${widget.subjectModel.levelModel.name}",
                                        style: AppTextStyle.poppinsRegular
                                            .copyWith(
                                          fontSize: 14.w,
                                        ),
                                      ),
                                      Text(
                                        "Savollar soni : ${widget.subjectModel.questions.length}",
                                        style: AppTextStyle.poppinsRegular
                                            .copyWith(
                                          fontSize: 14.w,
                                        ),
                                      ),
                                      Text(
                                        "Ajratilgan vaqt : [20 : 00]",
                                        style: AppTextStyle.poppinsRegular
                                            .copyWith(
                                          fontSize: 14.w,
                                        ),
                                      ),
                                      SizedBox(height: 7.h),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text("Instructions:",
                              style: AppTextStyle.poppinsRegular
                                  .copyWith(fontSize: 14.sp)),
                          SizedBox(height: 4.h),
                          Text(
                            "The quizzes consists of questions carefully designed to help you self-assess your comprehension of the information presented on the topics covered in the module. After responding to a question, click on the Next Question button at the bottom to go to the next questino. After responding to the 8th question, click on Close on the top of the window to exit the quiz. If you select an incorrect response for a question, you can try again until you get the correct response. If you retake the quiz, the questions and their respective responses will be randomized.",
                            style: AppTextStyle.poppinsRegular.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 20.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color: const Color(0xFF273032),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 15.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.w,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                SvgPicture.asset(AppIconsAndImages.time),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  "12:00",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Spacer(),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: ZoomTapAnimation(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return QuizScreen(
                                      subjectModel: widget.subjectModel,
                                      time: 20,
                                      subjectName:
                                          widget.subjectModel.subjectName,
                                    );
                                  }),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.c_F2954D,
                                ),
                                child: Center(
                                  child: Text(
                                    "Testni boshlash",
                                    style: AppTextStyle.poppinsRegular.copyWith(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
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
