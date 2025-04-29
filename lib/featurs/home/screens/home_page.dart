import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/featurs/settings/screens/settings_screen.dart';

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
      appBar: AppBar(
        title: Text(
          'Today',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => SettingsScreen(),
                )),
            child: SizedBox(
              width: SizeConfig.width * 0.15,
              child: Center(
                child: SvgPicture.asset(
                  Constants.setttingsPath,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? AppColors.iconDefaultColor // White in dark mode
                        : AppColors.secondaryColor, // Black in light mode
                    BlendMode.srcIn,
                  ),
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
                style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.whiteColor
                        : AppColors.secondaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
