import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bpp_frontend/controller/screens/screen_controller.dart';
import 'package:bpp_frontend/utils/primary_config.dart';
import 'package:bpp_frontend/views/login_screen_view.dart';
import 'package:bpp_frontend/views/verification_page.dart';

class SignUpScreenView extends GetView<ScreenController> {
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        // Unfocus all input fields when tapping outside
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
              () => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.02), // Top padding
                buildLogo(screenWidth),
                SizedBox(height: screenHeight * 0.01),
                buildWelcomeText(screenWidth),
                SizedBox(height: screenHeight * 0.04),

                // Sign-up Form
                buildSignUpForm(screenWidth, screenHeight),

                SizedBox(height: screenHeight * 0.02),
                buildDividerWithText("or", screenWidth),
                SizedBox(height: screenHeight * 0.02),

                // Social Sign-in Buttons
                buildSocialButtons(screenWidth, screenHeight),

                SizedBox(height: screenHeight * 0.03),
                buildLoginRedirectText(screenWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Sign-Up Form Container
  Widget buildSignUpForm(double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.06),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildSignUpLabel(screenWidth),
          SizedBox(height: screenHeight * 0.02),
          buildEmailPhoneField(),
          SizedBox(height: screenHeight * 0.04),

          // Eligibility & Terms Checkboxes
          buildEligibilityCheckbox(screenWidth),
          buildTermsCheckbox(screenWidth),
          SizedBox(height: screenHeight * 0.02),

          // Next Button
          buildNextButton(screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget buildLogo(double screenWidth) {
    return Center(
      child: Image.asset(
        'assets/images/bpp_logo2.png',
        width: screenWidth * 0.3,
      ),
    );
  }

  Widget buildWelcomeText(double screenWidth) {
    return FittedBox(
      child: Text.rich(
        TextSpan(
          text: 'Welcome to\n',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.07,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: 'Bharatiya Popular Party',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.07,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildSignUpLabel(double screenWidth) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Sign up',
        style: TextStyle(
          fontSize: screenWidth * 0.07,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildEmailPhoneField() {
    return TextField(
      controller: controller.personalEmailController,
      decoration: InputDecoration(
        hintText: 'Email/Phone Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      ),
    );
  }

  Widget buildEligibilityCheckbox(double screenWidth) {
    return Row(
      children: [
        Checkbox(
          value: controller.isEligibleChecked.value,
          onChanged: (value) => controller.toggleEligibleCheckbox(),
        ),
        Expanded(
          child: Text(
            'Eligible for individuals 18 Years and above.',
            style: TextStyle(fontSize: screenWidth * 0.040),
          ),
        ),
      ],
    );
  }

  Widget buildTermsCheckbox(double screenWidth) {
    return Row(
      children: [
        Checkbox(
          value: controller.isAcceptTerms.value,
          onChanged: (value) => controller.toggleAcceptTerms(),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'By creating an account, I agree to BPP\'s ',
              style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.040),
              children: [
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy.',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNextButton(double screenWidth, double screenHeight) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (!controller.isEligibleChecked.value) {
            Get.snackbar(
              'Error',
              'Please confirm that you are eligible (18 years and above).',
              backgroundColor: Colors.redAccent,
              colorText: Colors.white,
            );
          } else if (!controller.isAcceptTerms.value) {
            Get.snackbar(
              'Error',
              'Please accept the Terms of Service and Privacy Policy.',
              backgroundColor: Colors.redAccent,
              colorText: Colors.white,
            );
          } else if (controller.personalEmailController.text.isEmpty) {
            Get.snackbar(
              'Error',
              'Please enter your email or phone number.',
              backgroundColor: Colors.redAccent,
              colorText: Colors.white,
            );
          } else {
            // Navigate to VerificationPage
            Get.snackbar(
              'Success',
              'Verification code sent successfully!',
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
            Get.to(() => VerificationPage(contactInfo: controller.personalEmailController.text),
                transition: Transition.rightToLeft);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildDividerWithText(String text, double screenWidth) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: TextStyle(fontSize: screenWidth * 0.05),
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget buildSocialButtons(double screenWidth, double screenHeight) {
    return Column(
      children: [
        buildOutlinedButton(
          label: 'Continue with Google',
          iconPath: 'assets/images/google_logo.png',
          onPressed: () {},
          iconWidth: screenWidth * 0.07,
        ),
        SizedBox(height: screenHeight * 0.02),
        buildOutlinedButton(
          label: 'Continue with Apple',
          iconPath: 'assets/images/apple_logo4.png',
          onPressed: () {},
          iconWidth: screenWidth * 0.08,
        ),
      ],
    );
  }

  Widget buildOutlinedButton({
    required String label,
    required String iconPath,
    required VoidCallback onPressed,
    required double iconWidth,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        icon: Image.asset(iconPath, width: iconWidth),
        label: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget buildLoginRedirectText(double screenWidth) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const LoginScreenView(), transition: Transition.rightToLeftWithFade);
      },
      child: Text(
        'Log in to Bharatiya Popular',
        style: TextStyle(
          color: PrimaryConfig.boxColor,
          fontSize: screenWidth * 0.045,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
