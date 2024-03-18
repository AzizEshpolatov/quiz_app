import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/data/data_response.dart';
import 'package:quiz_app/utils/images_and_icons/app_images_icons.dart';

import '../start_quiz_test/start_quiz_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    DataRepository.instance.loadSubject();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return StartQuizScreen();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppIconsAndImages.lotties_animation1,
        ),
      ),
    );
  }
}
