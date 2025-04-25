import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/featurs/auth/controller/auth_controller.dart';
import 'package:todyapp/featurs/home/screens/home_page.dart';
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

class ImageIconButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final dynamic image;
  const ImageIconButton(
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

class SignInButton extends ConsumerWidget {
  final bool isFromLogin;
  const SignInButton({super.key, this.isFromLogin = true});

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref
        .read(authControllerProvider.notifier)
        .signInWithGoogle(context, isFromLogin);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(context, ref),
        icon: Image.asset(
          Constants.googlePath,
          width: width * 0.08,
        ),
        label: Text(
          "Google",
          style: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: width * 0.05,
          ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.googleColor,
            minimumSize: Size(width * 0.9, height * 0.07),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.05),
            )),
      ),
    );
  }
}
