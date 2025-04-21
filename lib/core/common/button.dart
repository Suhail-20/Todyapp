import 'package:flutter/material.dart';
import 'package:todyapp/core/constans/constans.dart';
import 'package:todyapp/main.dart';

class FillButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  const FillButton(
      {super.key, required this.text, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height * 0.07,
        width: width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(width * 0.05),
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: AppColors.whiteColor,
                ),
                SizedBox(width: width * 0.02),
              ],
              Text(
                text,
                style: TextStyle(
                  fontSize: width * 0.05,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final dynamic? image;
  const GoogleButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.icon,
      this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height * 0.07,
        width: width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.googleColor),
          borderRadius: BorderRadius.circular(width * 0.05),
          color: AppColors.googleColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image ??
                  Icon(
                    icon,
                  ),
              SizedBox(
                width: width * 0.01,
              ),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.05,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
