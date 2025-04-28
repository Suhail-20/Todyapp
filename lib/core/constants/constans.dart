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
  static const arrowRightPath = 'assets/images/arrow_right.svg';
  static const editPath = 'assets/images/edit_2.svg';
  static const keyPath = 'assets/images/key.svg';
  static const logoutPath = 'assets/images/logout.svg';
  static const magicPenPath = 'assets/images/magicpen.svg';
  static const medalStarPath = 'assets/images/medal_star.svg';
  static const messageQuestionPath = 'assets/images/message_question.svg';
  static const profilePath = 'assets/images/profile.svg';
  static const sunPath = 'assets/images/sun.svg';
  static const weightPath = 'assets/images/weight.svg';
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double width;
  static late double height;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    // Avoid issues if init is called before MediaQuery data is available
    if (_mediaQueryData.size.width == 0 || _mediaQueryData.size.height == 0) {
      throw Exception("MediaQuery data is not yet available!");
    }

    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
  }
}
