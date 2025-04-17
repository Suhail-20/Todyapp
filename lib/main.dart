import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/featurs/home/home_page.dart';

late double height;
late double width;
void main() {
  runApp(DevicePreview(
    enabled: true,
      builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
