import 'package:flutter/material.dart';
import 'package:todyapp/core/common/button.dart';
import 'package:todyapp/core/common/textfeild.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/core/enums/validation_type.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPasswordHidden = true;
  bool isConfirmHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          'Create account',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.03,
              vertical: SizeConfig.width * 0.12,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Create your account and feel the benefits",
                      style: TextStyle(color: AppColors.secondaryColor),
                    ),
                  ),
                  SizedBox(height: SizeConfig.height * 0.04),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Full Name',
                        style: TextStyle(
                          fontSize: SizeConfig.width * 0.04,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CustomTextField(
                        controller: nameController,
                        hint: "Full Name",
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.height * 0.03),
                  // Email text field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: SizeConfig.width * 0.04,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CustomTextField(
                        controller: emailController,
                        hint: "Email",
                        keyboardType: TextInputType.emailAddress,
                        validationType: TextFieldValidationType.email,
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.height * 0.03),
                  // Password text field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: SizeConfig.width * 0.04,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CustomPasswordField(
                        controller: passwordController,
                        hint: "Password",
                        isHidden: isPasswordHidden,
                        onToggle: () => setState(
                          () => isPasswordHidden = !isPasswordHidden,
                        ),
                        validationType: TextFieldValidationType.password,
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.height * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: SizeConfig.width * 0.04,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CustomPasswordField(
                        controller: confirmController,
                        hint: "Confirm Password",
                        isHidden: isConfirmHidden,
                        onToggle: () =>
                            setState(() => isConfirmHidden = !isConfirmHidden),
                        validationType: TextFieldValidationType.confirmPassword,
                        confirmPassword: passwordController
                            .text, // make sure this is set too
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.height * 0.06),
                  FillButton(
                    text: "Sign Up",
                    onPressed: () {},
                  ),

                  SizedBox(height: SizeConfig.height * 0.04),
                  // Signup link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
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
                          'Login',
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
          ),
        ),
      ),
    );
  }
}
