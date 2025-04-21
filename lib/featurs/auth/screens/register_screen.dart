import 'package:flutter/material.dart';
import 'package:todyapp/core/constans/constans.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome To',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              ' Toddyapp',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
