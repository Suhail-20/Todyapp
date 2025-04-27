import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todyapp/core/common/button.dart';
import 'package:todyapp/core/common/loader.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/featurs/auth/controller/auth_controller.dart';

import 'package:todyapp/featurs/auth/screens/login_screen.dart';
import 'package:todyapp/featurs/auth/screens/sign_up_screen.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome To',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.blackColor),
            ),
            Text(
              ' Toddyapp',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
      body: isLoading
          ? const Loader()
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: SizeConfig.width,
                    height: SizeConfig.height * 0.5,
                    child: Image.asset(Constants.onBoard_3),
                  ),
                  Center(
                    child: FillButton(
                        icon: Icons.mail,
                        text: 'Continue with email',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: SizeConfig.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.width * 0.08,
                              right: SizeConfig.width * 0.04),
                          child: Divider(
                            color: AppColors.dividerColor,
                          ),
                        ),
                      ),
                      Text(
                        "or continue with",
                        style: TextStyle(color: AppColors.secondaryColor),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.width * 0.04,
                              right: SizeConfig.width * 0.08),
                          child: Divider(
                            color: AppColors.dividerColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.height * 0.02,
                  ),
                  SignInButton(),
                  SizedBox(height: SizeConfig.height * 0.04),
                  // Signup link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(color: AppColors.secondaryColor),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
