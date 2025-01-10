import 'package:bpp_frontend/views/component/registration/registration_page.dart';
import 'package:bpp_frontend/views/drawer/account_details.dart';
import 'package:bpp_frontend/views/drawer/donor.dart';
import 'package:bpp_frontend/views/drawer/membership_pass.dart';
import 'package:bpp_frontend/views/drawer/personal_details.dart';
import 'package:bpp_frontend/views/drawer/referral%20code.dart';
import 'package:bpp_frontend/views/drawer/wallet.dart';
import 'package:bpp_frontend/views/goals.dart'; // Import GoalsScreen
import 'package:bpp_frontend/views/watson.dart';
import 'package:bpp_frontend/views/widgets/dashbaord/community_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bpp_frontend/controller/screens/screen_controller.dart';
import 'package:bpp_frontend/utils/primary_config.dart';
import 'package:bpp_frontend/views/welcome_screen.dart';
import 'controller/screens/screen_dashbaord.dart';

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
      initialRoute: '/',
      getPages: [
        // GetPage(name: '/', page: () => SignupPage1()),

        GetPage(name: '/', page: () => WelcomeScreen()),
        GetPage(
            name: '/dashboard',
            page: () => ScreenDashbaord(firstName: '', lastName: '', referralCode: '',)), // Add Dashboard route
        GetPage(
            name: '/donor-dashboard',
            page: () => GoalsScreen()), // Add Donor Dashboard route
        GetPage(
            name: '/goals', page: () => DonorDashboard()), // GoalsScreen route
        GetPage(name: '/wallet', page: () => WalletPage()), // Wallet route
      ],
    );
  }
}
