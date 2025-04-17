import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/featurs/home/home_page.dart';

late double height;
late double width;
void main(){
  runApp( TestApp());
}
class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}