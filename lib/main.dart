import 'package:device_preview/device_preview.dart';
import 'package:european_single_marriage/core/utils/theme/app_theme.dart';
import 'package:european_single_marriage/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.splashScreen,
      theme: MAppTheme.myTheme,
    );
  }
}
