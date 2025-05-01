import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todyapp/core/constants/constans.dart';
import 'package:todyapp/featurs/auth/screens/register_screen.dart';
import 'package:todyapp/featurs/home/bottom/naviagtion_bar_page.dart';
import 'package:todyapp/featurs/home/screens/to_do_list_screen.dart';
import 'package:todyapp/firebase_options.dart';
import 'package:todyapp/theme/pallete.dart';
import 'package:todyapp/theme/theme_helper.dart';
import 'package:todyapp/theme/theme_notifier.dart';

import 'featurs/auth/screens/onboarding_screens/onbording_screens.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: false, // set to false in production
      builder: (context) => const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Consumer(
      builder: (context, ref, child) {
        // Access theme state from the ThemeNotifier provider
        final themeMode = ref.watch(themeNotifierProvider);

        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Your App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode, // Using theme mode from provider
<<<<<<< HEAD
            home: RegisterScreen(),
=======
            home: OnbordingScreens(),
>>>>>>> 4107be0fd9959cd5ed29177e7a77df446dadbb77
          ),
        );
      },
    );
  }
}
