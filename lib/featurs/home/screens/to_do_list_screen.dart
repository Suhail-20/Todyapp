import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todyapp/core/common/button.dart';
import 'package:todyapp/core/common/coloredcard.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/main.dart';

class ToDoListScreen extends ConsumerWidget {
  const ToDoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = [
      Colors.teal,
      Colors.black,
      Colors.red,
      Colors.blue,
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          'Create to do list',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                "Choose your to do list color theme:",
                style: TextStyle(color: AppColors.secondaryColor),
              ),
            ),
            SizedBox(height: height * 0.04),
            Expanded(
              child: ListView.separated(
                itemCount: colors.length,
                separatorBuilder: (_, __) => SizedBox(height: height * 0.02),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      debugPrint("Selected color: ${colors[index]}");
                    },
                    child: ColoredCard(topColor: colors[index]),
                  );
                },
              ),
            ),
            FillButton(
              text: "Open Todyapp",
              onPressed: () {},
            ),
            SizedBox(height: height * 0.04),
          ],
        ),
      ),
    );
  }
}
