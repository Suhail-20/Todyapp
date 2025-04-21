import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todyapp/core/constans/constans.dart';
import 'package:todyapp/featurs/auth/screens/login_screen.dart';
import 'package:todyapp/featurs/auth/screens/register_screen.dart';
import 'package:todyapp/featurs/auth/screens/sign_up_screen.dart';
import 'package:todyapp/featurs/home/home_page.dart';

import 'featurs/auth/screens/onboarding_screens/onboarding_page1.dart';
import 'featurs/auth/screens/onboarding_screens/onboarding_page2.dart';

var height;
var width;
void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.barlowTextTheme(),
          primaryColor: AppColors.primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: OnboardingPage2(),
      ),
    );
  }
}
