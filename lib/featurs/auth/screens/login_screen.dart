import 'package:flutter/material.dart';
import 'package:todyapp/core/common/button.dart';
import 'package:todyapp/core/common/textfeild.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/core/enums/validation_type.dart';
import 'package:todyapp/featurs/auth/screens/sign_up_screen.dart';
import 'package:todyapp/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          'Welcome Back!',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: width * 0.12,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Your work faster and structured with Todyapp",
                      style: TextStyle(color: AppColors.secondaryColor),
                    ),
                  ),
                  SizedBox(height: height * 0.06),

                  // Email text field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: width * 0.04,
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
                  SizedBox(height: height * 0.03),
                  // Password text field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: width * 0.04,
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
                  SizedBox(height: height * 0.1),
                  FillButton(
                    text: "Login",
                    onPressed: () {},
                  ),

                  SizedBox(height: height * 0.04),
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
          ),
        ),
      ),
    );
  }
}
