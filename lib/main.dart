import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:parent_internet_lock/bindings/general_binding.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';
import 'package:parent_internet_lock/utils/theme/theme.dart';

import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  /// Widgets Binding
  final WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage
  await GetStorage.init();

  /// -- Await Splash until other item Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  /// -- Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: PAppTheme.lightTheme,
      initialBinding: GeneralBindings(),
      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: PColors.white, body: Center(child: CircularProgressIndicator(color: PColors.black10))),
      builder: (context, widget) {
        return FlutterSmartDialog(child: widget!);
      },
    );
  }
}