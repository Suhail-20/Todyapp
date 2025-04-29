import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/featurs/auth/controller/auth_controller.dart';

import 'package:todyapp/theme/pallete.dart';
import 'package:todyapp/theme/theme_notifier.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  Future<void> logOut(WidgetRef ref) async {
    await ref.read(authControllerProvider.notifier).logOut();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.all(SizeConfig.width * 0.03),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              Constants.arrowBackPath,
              colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.dark
                    ? AppColors.iconDefaultColor // White in dark mode
                    : AppColors.blackColor, // Black in light mode
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.width * 0.05),
            child: SvgPicture.asset(
              Constants.searchPath,
              colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.dark
                    ? AppColors.iconDefaultColor // White in dark mode
                    : AppColors.blackColor, // Black in light mode
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.width * 0.03,
              ),
              SizedBox(
                width: SizeConfig.width,
                height: SizeConfig.height * 0.15,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CircleAvatar(
                      radius: SizeConfig.width * 0.14,
                    ),
                    Positioned(
                      top: SizeConfig.height * 0.1,
                      left: SizeConfig.width * 0.55,
                      child: Material(
                        elevation: 4, // Adjust elevation as needed
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          radius: SizeConfig.width * 0.04,
                          backgroundColor: AppColors.whiteColor,
                          child: Padding(
                            padding: EdgeInsets.all(SizeConfig.width * 0.02),
                            child: SvgPicture.asset(
                              Constants.editPath,
                              colorFilter: ColorFilter.mode(
                                AppColors.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text("User Name"),
              Text("Email"),
              SizedBox(
                height: SizeConfig.height * 0.05,
              ),
              ListTile(
                leading: SvgPicture.asset(
                  Constants.profilePath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  "Account",
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600),
                ),
                trailing: SvgPicture.asset(
                  Constants.arrowRightPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  Constants.magicPenPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  "Theme",
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600),
                ),
                trailing: SvgPicture.asset(
                  Constants.arrowRightPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  Constants.medalStarPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  "App Icon",
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600),
                ),
                trailing: SvgPicture.asset(
                  Constants.arrowRightPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  Constants.weightPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  "Productivity",
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600),
                ),
                trailing: SvgPicture.asset(
                  Constants.arrowRightPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  Constants.sunPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  "Change Mode",
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600),
                ),
                trailing: Switch(
                  value: themeMode == ThemeMode.dark,
                  onChanged: (bool value) {
                    // Toggle the theme when the switch is changed
                    ref.read(themeNotifierProvider.notifier).toggleTheme();
                  },
                  thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
                    return AppColors.whiteColor;
                  }),
                  activeTrackColor: AppColors.primaryColor,
                  inactiveTrackColor: Colors.grey.shade300,
                  thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
                    return const Icon(
                      Icons.circle,
                      color: Colors.white,
                    );
                  }),
                  trackOutlineColor:
                      WidgetStateProperty.resolveWith<Color>((states) {
                    return Colors.transparent;
                  }),
                ),
              ),
              Divider(
                color: AppColors.dividerColor,
              ),
              ListTile(
                leading: SvgPicture.asset(
                  Constants.keyPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600),
                ),
                trailing: SvgPicture.asset(
                  Constants.arrowRightPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  Constants.messageQuestionPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  "Help Center",
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600),
                ),
                trailing: SvgPicture.asset(
                  Constants.arrowRightPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              InkWell(
                onTap: () => logOut(ref),
                child: ListTile(
                  leading: SvgPicture.asset(
                    Constants.logoutPath,
                    colorFilter: ColorFilter.mode(
                      AppColors.secondaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: SvgPicture.asset(
                    Constants.arrowRightPath,
                    colorFilter: ColorFilter.mode(
                      AppColors.secondaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
