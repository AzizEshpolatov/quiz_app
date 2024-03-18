import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/models/quiz_model.dart';
import 'package:quiz_app/models/subjectmodel.dart';
import 'package:quiz_app/screens/quiz_screen/answer_report.dart';
import 'package:quiz_app/screens/quiz_screen/variant_item.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/appcolors/app_colors.dart';
import '../../utils/images_and_icons/app_images_icons.dart';
import '../../utils/size/app_size.dart';
import '../../utils/styles/app_text_style.dart';
import '../result_screen/result_screen.dart';
import 'button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.subjectModel,
    required this.time,
    required this.subjectName,
  });

  final SubjectModel subjectModel;
  final int time;
  final String subjectName;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int count = 0;
  List<QuizModel> questions = [];
  int activeIndex = 0;
  int selectedIndex = 0;
  int questionIndex = 0;
  Map<int, int> selectedAnswers = {};

  @override
  void initState() {
    questions = widget.subjectModel.questions;
    for (int i = 0; i < questions.length; i++) {
      selectedAnswers[i] = 0;
    }
    _timerLogic();
    super.initState();
  }

  Future _timerLogic() async {
    for (int i = questions.length * 10; i > 0; i--) {
      setState(() {
      count = i;
    });
      await Future.delayed(const Duration(seconds: 1));

    }
    _navigateToResultScreen();
  }

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
                          left: 28.w, top: 5.h, bottom: 5.h, right: 5.w),
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
                    "Test",
                    style: AppTextStyle.poppinsBold.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  const Spacer(),
                  ZoomTapAnimation(
                    onTap: () {
                      _navigateToResultScreen();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 28.w,
                        vertical: 5.h,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.r,
                            color: AppColors.c_F2954D,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: AppTextStyle.poppinsBold.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.subjectName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIconsAndImages.time,
                        height: 22.h,
                        width: 22.w,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        getMinutelyText(count),
                        style: TextStyle(
                          color: AppColors.c_F2F2F2,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: LinearProgressIndicator(
                color: AppColors.c_F2954D,
                backgroundColor: AppColors.c_162023,
                value: count / (questions.length * 10),
                minHeight: 10.h,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 14.h),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.c_162023,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.r),
                    topLeft: Radius.circular(40.r),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.h,
                          horizontal: 20.w,
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${activeIndex + 1}-savol",
                                style: AppTextStyle.poppinsLight
                                    .copyWith(fontSize: 15.sp),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.pink,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    text: "${activeIndex + 1}",
                                    style: TextStyle(
                                      color: AppColors.c_F2F2F2,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "/${questions.length}",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            questions[activeIndex].questionText,
                            style: TextStyle(
                              color: AppColors.c_F2F2F2,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          VariantItem(
                            onTap: () {
                              setState(
                                () {
                                  selectedIndex = 1;
                                },
                              );
                            },
                            isSelected: selectedIndex == 1,
                            caption: "A",
                            variantText: questions[activeIndex].variant1,
                          ),
                          VariantItem(
                            onTap: () {
                              setState(
                                () {
                                  selectedIndex = 2;
                                },
                              );
                            },
                            isSelected: selectedIndex == 2,
                            caption: "B",
                            variantText: questions[activeIndex].variant2,
                          ),
                          VariantItem(
                            onTap: () {
                              setState(
                                () {
                                  selectedIndex = 3;
                                },
                              );
                            },
                            isSelected: selectedIndex == 3,
                            caption: "C",
                            variantText: questions[activeIndex].variant3,
                          ),
                          VariantItem(
                            onTap: () {
                              setState(
                                () {
                                  selectedIndex = 4;
                                },
                              );
                            },
                            isSelected: selectedIndex == 4,
                            caption: "D",
                            variantText: questions[activeIndex].variant4,
                          ),
                        ],
                      ),
                    ),
                    StartQuizBottom(
                      previousOnTap: () {
                        if (activeIndex >= 1) {
                          activeIndex--;
                          questionIndex--;
                          selectedIndex = selectedAnswers[activeIndex]!;
                        }
                        setState(() {});
                      },
                      nextOnTap: () {
                        selectedAnswers[activeIndex] = selectedIndex;
                        if (activeIndex < questions.length - 1) {
                          selectedIndex = 0;
                          activeIndex++;
                          questionIndex++;
                        }
                        setState(
                          () {},
                        );
                      },
                      previousButtonVisibility: activeIndex != 0,
                      nextButtonVisibility: activeIndex != questions.length - 1,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _navigateToResultScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ResultScreen(
            answerReport: AnswerReport(
              subjectModel: widget.subjectModel,
              selectedAnswer: selectedAnswers,
              spentTime: questions.length * 10 - count,
            ),
          );
        },
      ),
    );
  }
}

String getMinutelyText(int timeInSecund) {
  int min = timeInSecund ~/ 60;
  int sec = timeInSecund % 60;

  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String secunde = sec.toString().length <= 1 ? "0$sec" : "$sec";

  return "$minute : $secunde";
}
