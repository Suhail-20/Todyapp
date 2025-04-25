import 'package:flutter/material.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/featurs/auth/screens/onboarding_screens/onboarding_page2.dart';
import 'package:todyapp/featurs/auth/screens/onboarding_screens/onboarding_page3.dart';
import 'package:todyapp/featurs/auth/screens/register_screen.dart';
import 'package:todyapp/main.dart';

import 'onboarding_page1.dart';

class OnbordingScreens extends StatefulWidget {
  const OnbordingScreens({super.key});

  @override
  State<OnbordingScreens> createState() => _OnbordingScreensState();
}

class _OnbordingScreensState extends State<OnbordingScreens> {
  final PageController pageController = PageController();
  final ValueNotifier<int> currentPage = ValueNotifier<int>(0);

  final List<dynamic> onboardingPages = [
    OnboardingPage1(),
    OnboardingPage2(),
    OnboardingPage3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          PageView.builder(
            controller: pageController,
            itemCount: onboardingPages.length,
            onPageChanged: (index) {
              currentPage.value = index;
            },
            itemBuilder: (BuildContext context, int index) {
              return onboardingPages[index];
            },
        ),
          SizedBox(
            height: height*0.4,
            width: width,
            child: Align(
              alignment: Alignment.topRight,
              child: ValueListenableBuilder(
                valueListenable: currentPage,
                builder: ( context,value,  child) {
                  return (value > 0 && value < onboardingPages.length -0 ) ?  GestureDetector(
                    onTap: () {
                     Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => RegisterScreen(),), (route) => false,);
                    },
                    child: Text("Skip",style: TextStyle(
                    color: AppColors.primaryColor,
                      fontSize: width*0.06
                    ),
                    ),
                  ): SizedBox();
                },
              ),
            ),
          )
        ]
      ),
    );
  }
}
