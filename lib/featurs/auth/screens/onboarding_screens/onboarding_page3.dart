import 'package:flutter/material.dart';
import 'package:todyapp/core/constants/constans.dart';

import '../../../../core/constants/constans.dart';
import '../../../../main.dart';

class OnboardingPage3 extends StatefulWidget {
  const OnboardingPage3({super.key});

  @override
  State<OnboardingPage3> createState() => _OnboardingPage3State();
}

class _OnboardingPage3State extends State<OnboardingPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      body: Column(
        children: [
          Stack(children: [
            Image.asset(Constants.onBoarding2),
            SizedBox(
              width: width,
              height: height * 0.47,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Find the practicality in \nmaking your todo list",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: width * 0.07),
                ),
              ),
            ),
          ]),
          Text(
            "Easy-to-understand user interface  that makes you \nmore comfortable when you want to create a task or \nto do list, Todyapp can also improve productivity",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
