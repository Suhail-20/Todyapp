import 'package:flutter/material.dart';
import 'package:todyapp/core/common/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FillButton(
              icon: Icons.mail, text: 'Continue with email', onPressed: () {})),
    );
  }
}
