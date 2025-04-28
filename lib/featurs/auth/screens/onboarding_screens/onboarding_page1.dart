import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/theme/pallete.dart';

class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({super.key});

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Constants.logoPath),
            Text(
              "Todyapp",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: SizeConfig.width * 0.09,
              ),
            ),
            SizedBox(
              height: SizeConfig.height * 0.03,
            ),
            Text(
              "The best to do list application for you",
              style: TextStyle(
                  color: AppColors.whiteColor, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
