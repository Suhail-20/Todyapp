import 'package:flutter/material.dart';
import 'package:todyapp/core/constants/constans.dart';

class OnboardingPage2 extends StatefulWidget {
  const OnboardingPage2({super.key});

  @override
  State<OnboardingPage2> createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(Constants.onBoarding1),
              SizedBox(
                width: SizeConfig.width,
                height: SizeConfig.height * 0.46,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Your convenience in \n making a todo list",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.width * 0.075,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Here's a mobile platform that helps you create task\nor to list so that it can help you in every job\neasier and faster.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
