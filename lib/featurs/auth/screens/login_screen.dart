import 'package:flutter/material.dart';
import 'package:todyapp/core/common/button.dart';
import 'package:todyapp/core/common/textfeild.dart';
import 'package:todyapp/core/constans/constans.dart';
import 'package:todyapp/core/enums/validation_type.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Center(
                    child: Text(
                      " Your work faster and structured with Todyapp",
                      style: TextStyle(color: AppColors.secondaryColor),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  // Email text field
                  Padding(
                    padding: EdgeInsets.all(width * 0.03),
                    child: CustomTextField(
                      controller: emailController,
                      hint: "Email",
                      keyboardType: TextInputType.emailAddress,
                      validationType: TextFieldValidationType.email,
                    ),
                  ),

                  // Password text field
                  Padding(
                    padding: EdgeInsets.all(width * 0.03),
                    child: CustomPasswordField(
                      controller: passwordController,
                      hint: "Password",
                      isHidden: isPasswordHidden,
                      onToggle: () => setState(
                        () => isPasswordHidden = !isPasswordHidden,
                      ),
                      validationType: TextFieldValidationType.password,
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  // Login Button
                ],
              ),
              FillButton(
                text: "Login",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
