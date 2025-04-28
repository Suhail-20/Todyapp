import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/theme/pallete.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
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
                AppColors.blackColor,
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
                AppColors.blackColor,
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
                      top: SizeConfig.height * 0.045,
                      left: SizeConfig.width * 0.55,
                      child: Container(
                        width: SizeConfig.width * 0.10,
                        height: SizeConfig.height * 0.14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: CardColors.blurColor,
                              blurRadius: SizeConfig.width * 0.015,
                              offset: Offset(2, 3),
                            ),
                          ],
                        ),
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
                trailing: SvgPicture.asset(
                  Constants.arrowRightPath,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Divider(
                color: AppColors.dividerColor,
              ),
              SizedBox(
                height: SizeConfig.height * 0.03,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Constants.keyPath,
                    colorFilter: ColorFilter.mode(
                      AppColors.secondaryColor,
                      BlendMode.srcIn,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.height * 0.03,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Constants.messageQuestionPath,
                    colorFilter: ColorFilter.mode(
                      AppColors.secondaryColor,
                      BlendMode.srcIn,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.height * 0.03,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Constants.logoutPath,
                    colorFilter: ColorFilter.mode(
                      AppColors.secondaryColor,
                      BlendMode.srcIn,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
