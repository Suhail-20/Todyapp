import 'package:flutter/material.dart';

class Constants {
  static const logoPath = 'assets/images/Logo.svg';
  static const onBoard_3 = 'assets/images/Onboarding 3.png';
  static const googlePath = 'assets/images/google.png';
  static const onBoarding1 = 'assets/images/Onboarding1.png';
  static const onBoarding2 = 'assets/images/Onboarding2.png';
  static const avatarDefault =
      'https://external-preview.redd.it/5kh5OreeLd85QsqYO1Xz_4XSLYwZntfjqou-8fyBFoE.png?auto=webp&s=dbdabd04c399ce9c761ff899f5d38656d1de87c2';
  static const homePath = 'assets/images/home_icon.svg';
  static const inboxPath = 'assets/images/direct_inbox.svg';
  static const upcomingPath = 'assets/images/calendar.svg';
  static const filtterPath = 'assets/images/categories.svg';
  static const projectPath = 'assets/images/paper_plus.svg';
  static const setttingsPath = 'assets/images/settings.svg';
  static const searchPath = 'assets/images/search_normal.svg';
  static const arrowBackPath = 'assets/images/arrow_back.svg';
}

class AppColors {
  static const Color primaryColor = Color(0xff24A19C);
  static const Color iconDefaultColor = Color(0xffA0AAB8);
  static const Color secondaryColor = Color(0xff767E8C);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);
  static const Color dividerColor = Color(0xffE0E5ED);
  static const Color googleColor = Color(0xffF3F5F9);
}

class CardColors {
  static const Color blurColor = Color(0xffE7ECF5);
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double width;
  static late double height;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
  }
}
