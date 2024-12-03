import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bpp_frontend/controller/screens/screen_controller.dart';
import 'package:bpp_frontend/views/sign_up_screen_view.dart';

import '../utils/primary_config.dart';

class LoginScreenView extends GetView<ScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine device type (phone, tablet, desktop)
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1200;
    bool isDesktop = screenWidth >= 1200;

    return GestureDetector(
      onTap: () {
        controller.personalPhoneFocusNode.unfocus();
        controller.personalEmailFocusNode.unfocus();
        controller.passwordFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? screenWidth * 0.05
                  : isTablet
                  ? screenWidth * 0.1
                  : screenWidth * 0.2,
            ).copyWith(top: screenHeight * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30), // Spacing between top of screen and container

                // Box containing the logo, welcome text, and form
                Container(
                  padding: EdgeInsets.all(
                    isMobile
                        ? screenWidth * 0.05
                        : isTablet
                        ? screenWidth * 0.07
                        : screenWidth * 0.1,
                  ), // Responsive padding inside the box
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      Center(
                        child: Image.asset(
                          'assets/images/bpp_logo2.png',
                          width: isMobile
                              ? screenWidth * 0.3
                              : isTablet
                              ? screenWidth * 0.2
                              : screenWidth * 0.15,
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Welcome Text
                      FittedBox(
                        child: Text.rich(
                          TextSpan(
                            text: 'Bharatiya Popular Party', // "Welcome to" part in black
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile
                                  ? screenWidth * 0.05
                                  : isTablet
                                  ? screenWidth * 0.07
                                  : screenWidth * 0.08,
                              color: Colors.blue,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Log in label and Email/Phone Input Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: isMobile
                                  ? screenWidth * 0.05
                                  : isTablet
                                  ? screenWidth * 0.06
                                  : screenWidth * 0.07,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: controller.personalEmailController,
                            decoration: InputDecoration(
                              hintText: 'Email/Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Next Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Next button action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isMobile
                                  ? screenWidth * 0.05
                                  : isTablet
                                  ? screenWidth * 0.06
                                  : screenWidth * 0.07,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Divider with "or"
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'or',
                              style: TextStyle(
                                fontSize: isMobile
                                    ? screenWidth * 0.04
                                    : isTablet
                                    ? screenWidth * 0.045
                                    : screenWidth * 0.05,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Google Sign-in Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          icon: Image.asset(
                            'assets/images/google_logo.png',
                            width: isMobile
                                ? screenWidth * 0.08
                                : isTablet
                                ? screenWidth * 0.07
                                : screenWidth * 0.06,
                          ),
                          label: Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile
                                  ? screenWidth * 0.045
                                  : isTablet
                                  ? screenWidth * 0.05
                                  : screenWidth * 0.06,
                            ),
                          ),
                          onPressed: () {
                            // Google sign-in action
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02),
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Apple Sign-in Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          icon: Image.asset(
                            'assets/images/apple_logo4.png',
                            width: isMobile
                                ? screenWidth * 0.12
                                : isTablet
                                ? screenWidth * 0.1
                                : screenWidth * 0.08,
                          ),
                          label: Text(
                            'Continue with Apple',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile
                                  ? screenWidth * 0.045
                                  : isTablet
                                  ? screenWidth * 0.05
                                  : screenWidth * 0.06,
                            ),
                          ),
                          onPressed: () {
                            // Apple sign-in action
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02),
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Create Account link
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignUpScreenView(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        child: Text(
                          'Create a Bharatiya Popular Party Account',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: isMobile
                                ? screenWidth * 0.035
                                : isTablet
                                ? screenWidth * 0.032
                                : screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
