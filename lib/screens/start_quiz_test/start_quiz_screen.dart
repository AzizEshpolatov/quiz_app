import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/models/subjectmodel.dart';
import 'package:quiz_app/screens/start_quiz_test/starts_quiz.dart';
import 'package:quiz_app/screens/widget/subject_item.dart';
import 'package:quiz_app/utils/appcolors/app_colors.dart';
import 'package:quiz_app/utils/size/app_size.dart';
import 'package:quiz_app/utils/styles/app_text_style.dart';
import '../../data/data_response.dart';

class StartQuizScreen extends StatefulWidget {
  const StartQuizScreen({super.key});

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  late List<SubjectModel> subjectModels;

  @override
  void initState() {
    subjectModels = DataRepository.allSubject;
    super.initState();
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
          centerTitle: true,
          title: Text(
            "Fanni tanlang.",
            style: AppTextStyle.poppinsBold.copyWith(
              fontSize: 18.w,
            ),
          ),
          backgroundColor: AppColors.c_273032,
          elevation: 1,
        ),
        body: ListView(
          children: [
            ...List.generate(
              subjectModels.length,
              (index) {
                SubjectModel subject = DataRepository.allSubject[index];
                return SubjectItem(
                  subjectModel: subjectModels[index],
                  time: "20:00",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return StartQuizAppTutorial(subjectModel: subject);
                      }),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
