import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/features/personalization/screens/splash/splash_screen.dart';
import 'package:parent_internet_lock/utils/theme/theme.dart';

void main() {

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: PAppTheme.lightTheme,
      home: const SplashScreen(),
      builder: (context, widget) {
        return FlutterSmartDialog(child: widget!);
      },
    );
  }
}