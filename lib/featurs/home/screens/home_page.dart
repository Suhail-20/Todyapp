import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/featurs/settings/screens/settings_screen.dart';
import 'package:todyapp/featurs/upcoming/screens/upcoming_screen.dart';
import 'package:todyapp/theme/pallete.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          'Today',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.width * 0.03),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SettingsScreen(),
                  )),
              child: SvgPicture.asset(
                Constants.setttingsPath,
                colorFilter: ColorFilter.mode(
                  AppColors.secondaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.05),
          child: Column(
            children: [
              Text(
                "Best platform for creating to-do lists",
                style: TextStyle(color: AppColors.secondaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
