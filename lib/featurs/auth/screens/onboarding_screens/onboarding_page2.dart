import 'package:flutter/material.dart';
import 'package:todyapp/core/constans/constans.dart';

import '../../../../main.dart';

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
        children: [
          Image.asset(Constants.onBoarding1),
          Text("Your convenience in \n making a todo list",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: width*0.075,
          ),)
        ],
      ),
    );
  }
}
