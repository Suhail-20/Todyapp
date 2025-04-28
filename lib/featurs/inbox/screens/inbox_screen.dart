import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/theme/pallete.dart';

class InboxScreen extends ConsumerStatefulWidget {
  const InboxScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          'Inbox',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.all(SizeConfig.width * 0.03),
          child: SvgPicture.asset(
            Constants.arrowBackPath,
            colorFilter: ColorFilter.mode(
              AppColors.blackColor,
              BlendMode.srcIn,
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
    );
  }
}
