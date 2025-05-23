import 'package:flutter/material.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/core/enums/enum.dart';
import 'package:todyapp/theme/pallete.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextFieldValidationType validationType;
  final String? confirmPassword;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.validationType = TextFieldValidationType.none,
    this.confirmPassword,
  });
  String? _defaultValidator(String? value) {
    final lowercaseEmailRegex = RegExp(
      r"^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$",
    );

    if (value == null || value.isEmpty) return "Enter $hint";

    if (validationType == TextFieldValidationType.email) {
      if (!lowercaseEmailRegex.hasMatch(value)) {
        return "Enter a valid lowercase email";
      }
    }

    if (validationType == TextFieldValidationType.confirmPassword) {
      if (value != confirmPassword) return "Passwords do not match";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 6), // space between label and text field
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
            color: AppColors.blackColor,
          ),
          decoration: InputDecoration(
            filled: true,
            hintText: "$hint@example.com",
            contentPadding: EdgeInsets.symmetric(
              vertical: SizeConfig.width * 0.06,
              horizontal: SizeConfig.width * 0.03,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SizeConfig.width * 0.02),
              borderSide: BorderSide.none,
            ),
          ),
          validator: validator ?? _defaultValidator,
        ),
      ],
    );
  }
}

class CustomPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isHidden;
  final VoidCallback onToggle;
  final TextFieldValidationType validationType;
  final String? confirmPassword;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.hint,
    required this.isHidden,
    required this.onToggle,
    this.validationType = TextFieldValidationType.none,
    this.confirmPassword,
  });

  String? _defaultValidator(String? value) {
    final passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );

    if (value == null || value.isEmpty) return "Enter $hint";

    if (validationType == TextFieldValidationType.password) {
      if (!passwordRegex.hasMatch(value)) {
        return 'Password must contain uppercase, lowercase, number, special char, and 8+ chars';
      }
    }

    if (validationType == TextFieldValidationType.confirmPassword) {
      if (value != confirmPassword) return "Passwords do not match";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: isHidden,
          style: const TextStyle(color: AppColors.blackColor),
          decoration: InputDecoration(
            filled: true,
            hintText: "Enter your $hint",
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeConfig.width * 0.06,
                horizontal: SizeConfig.width * 0.04),
            suffixIcon: IconButton(
              icon: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
              onPressed: onToggle,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SizeConfig.width * 0.02),
              borderSide: BorderSide.none,
            ),
          ),
          validator: _defaultValidator,
        ),
      ],
    );
  }
}
