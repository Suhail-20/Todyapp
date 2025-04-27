import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/featurs/Filters/screens/filters_screen.dart';
import 'package:todyapp/featurs/home/screens/home_page.dart';
import 'package:todyapp/featurs/inbox/screens/inbox_screen.dart';
import 'package:todyapp/featurs/project/screens/project_screen.dart';
import 'package:todyapp/featurs/upcoming/screens/upcoming_screen.dart';

class NaviagtionBarPage extends ConsumerStatefulWidget {
  const NaviagtionBarPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NaviagtionBarPageState();
}

class _NaviagtionBarPageState extends ConsumerState<NaviagtionBarPage> {
  int selectIndex = 0;
  List pages = [
    HomePage(),
    InboxScreen(),
    UpcomingScreen(),
    FiltersScreen(),
    ProjectScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectIndex],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: selectIndex,
        onTap: (index) {
          setState(() {
            selectIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: SizeConfig.height * 0.0035,
                  width: SizeConfig.width * 0.05,
                  decoration: BoxDecoration(
                    color: selectIndex == 0
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      SizeConfig.width * 0.05,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.height * 0.007),
                SvgPicture.asset(
                  Constants.homePath,
                  colorFilter: ColorFilter.mode(
                    selectIndex == 0
                        ? AppColors.primaryColor
                        : AppColors.iconDefaultColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: SizeConfig.height * 0.0035,
                  width: SizeConfig.width * 0.05,
                  decoration: BoxDecoration(
                    color: selectIndex == 1
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.width * 0.05),
                  ),
                ),
                SizedBox(height: SizeConfig.height * 0.007),
                SvgPicture.asset(
                  Constants.inboxPath,
                  colorFilter: ColorFilter.mode(
                    selectIndex == 1
                        ? AppColors.primaryColor
                        : AppColors.iconDefaultColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: SizeConfig.height * 0.0035,
                  width: SizeConfig.width * 0.05,
                  decoration: BoxDecoration(
                    color: selectIndex == 2
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.width * 0.05),
                  ),
                ),
                SizedBox(height: SizeConfig.height * 0.007),
                SvgPicture.asset(
                  Constants.upcomingPath,
                  colorFilter: ColorFilter.mode(
                    selectIndex == 2
                        ? AppColors.primaryColor
                        : AppColors.iconDefaultColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: SizeConfig.height * 0.0035,
                  width: SizeConfig.width * 0.05,
                  decoration: BoxDecoration(
                    color: selectIndex == 3
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.width * 0.05),
                  ),
                ),
                SizedBox(height: SizeConfig.height * 0.007),
                SvgPicture.asset(
                  Constants.filtterPath,
                  colorFilter: ColorFilter.mode(
                    selectIndex == 3
                        ? AppColors.primaryColor
                        : AppColors.iconDefaultColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: SizeConfig.height * 0.0035,
                  width: SizeConfig.width * 0.05,
                  decoration: BoxDecoration(
                    color: selectIndex == 4
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.width * 0.05),
                  ),
                ),
                SizedBox(height: SizeConfig.width * 0.007),
                SvgPicture.asset(
                  Constants.projectPath,
                  colorFilter: ColorFilter.mode(
                    selectIndex == 4
                        ? AppColors.primaryColor
                        : AppColors.iconDefaultColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
