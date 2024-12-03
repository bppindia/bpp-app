// import 'dart:async';
// //https://github.com/duocodethailand/flutter-ui-clone.login.binance/blob/main/assets/fonts/Mukta-Regular.ttf
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:bpp_frontend/utils/primary_config.dart';
// import 'package:bpp_frontend/views/login_screen_view.dart';
//
// class SplashScreenView extends StatelessWidget {
//   const SplashScreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Timer(const Duration(seconds: 5), () {
//       Get.to(() => const LoginScreenView());
//     });
//     return Scaffold(
//       backgroundColor: PrimaryConfig.primaryBackgroundColor,
//       body: Center(
//         child: Image.asset(
//           'assets/images/bpp_logo1.png',
//           width: 180,
//         ),
//       ),
//     );
//   }
// }