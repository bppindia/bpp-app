import 'package:bpp_frontend/controller/screens/dashbaord_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bpp_frontend/controller/screens/screen_controller.dart';
import 'package:bpp_frontend/utils/primary_config.dart';
import 'package:bpp_frontend/views/splash_screen_view.dart';
//import 'package:bpp_frontend/controller/screens/dashbaord.dart'; // Import the DashboardScreen

void main() {
  Get.put(ScreenController());
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: PrimaryConfig.regular,
      ),
      // Set the initial route to SplashScreenView
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()), // Splash Screen
        GetPage(
            name: '/dashboard',
            page: () => DashboardScreen()), // Dashboard screen
      ],
      // Optional: You can set the initial screen directly like:
      // home: const SplashScreenView(),
    );
  }
}
