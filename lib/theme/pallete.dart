import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryColor = Color(0xff24A19C);
  static const Color iconDefaultColor = Color(0xffA0AAB8);
  static const Color secondaryColor = Color(0xff767E8C);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);
  static const Color dividerColor = Color(0xffE0E5ED);
  static const Color googleColor = Color(0xffF3F5F9);
  static const Color dotColor = Color(0xffCBF1F0);
  static const Color transparentColor = Color.fromARGB(0, 0, 0, 0);
}

class CardColors {
  static const Color blurColor = Color(0xffE7ECF5);
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.whiteColor,
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: GoogleFonts.barlowTextTheme(
      const TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          color: Color(0xDD000000),
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          color: Color(0x89000000),
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.iconDefaultColor,
    ),
    dividerColor: AppColors.dividerColor,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff141A31),
    appBarTheme: const AppBarTheme(
      color: Color(0xff1E2746),
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white, // Ensure icons are white in AppBar
      ),
    ),
    textTheme: GoogleFonts.barlowTextTheme(
      const TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          color: Color(0xDDFFFFFF),
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          color: Color(0x89FFFFFF),
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.iconDefaultColor,
    ),
    dividerColor: AppColors.dividerColor,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      // primaryColor: const Color(0xff1E2746), // Match AppBar color for Cupertino widgets
      barBackgroundColor:
          const Color(0xff1E2746), // Set CupertinoNavBar background color
      // scaffoldBackgroundColor: const Color(0xff141A31), // Background color for scaffold
    ),
    useMaterial3: true,
  );
}
