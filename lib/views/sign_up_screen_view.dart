// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:bpp_frontend/controller/screens/screen_controller.dart';
// import 'package:bpp_frontend/utils/primary_config.dart';
// import 'package:bpp_frontend/views/login_screen_view.dart';
// import 'package:bpp_frontend/views/verification_page.dart';
// import 'package:http/http.dart' as http;
//
// class SignUpScreenView extends GetView<ScreenController> {
//   const SignUpScreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     // Determine device type
//     bool isTablet = screenWidth > 600;
//     bool isDesktop = screenWidth > 1200;
//
//     double horizontalPadding = screenWidth *
//         (isDesktop
//             ? 0.2
//             : isTablet
//                 ? 0.1
//                 : 0.05);
//
//     return GestureDetector(
//       onTap: () {
//         // Unfocus all input fields when tapping outside
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Obx(
//           () => SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: screenHeight * 0.08), // Top padding
//                 buildLogo(screenWidth, isDesktop, isTablet),
//                 SizedBox(height: screenHeight * 0.01),
//                 buildWelcomeText(screenWidth, isDesktop, isTablet),
//                 SizedBox(height: screenHeight * 0.04),
//
//                 // Sign-up Form
//                 buildSignUpForm(screenWidth, screenHeight, isDesktop, isTablet),
//
//                 SizedBox(height: screenHeight * 0.01),
//                 buildDividerWithText("or", screenWidth, isDesktop, isTablet),
//                 SizedBox(height: screenHeight * 0.02),
//
//                 // Social Sign-in Buttons
//                 buildSocialButtons(screenWidth, screenHeight),
//
//                 SizedBox(height: screenHeight * 0.02),
//                 buildLoginRedirectText(screenWidth),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper Methods:
//   Widget buildLogo(double screenWidth, bool isDesktop, bool isTablet) {
//     return Center(
//       child: Image.asset(
//         'assets/images/bpp_logo2.png',
//         width: screenWidth *
//             (isDesktop
//                 ? 0.15
//                 : isTablet
//                     ? 0.2
//                     : 0.25),
//       ),
//     );
//   }
//
//   Widget buildWelcomeText(double screenWidth, bool isDesktop, bool isTablet) {
//     return FittedBox(
//       child: Text.rich(
//         TextSpan(
//           text: 'Bharatiya Popular Party',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: screenWidth *
//                 (isDesktop
//                     ? 0.03
//                     : isTablet
//                         ? 0.05
//                         : 0.06),
//             color: Colors.blue,
//           ),
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
//
//   Widget buildSignUpForm(
//       double screenWidth, double screenHeight, bool isDesktop, bool isTablet) {
//     return Container(
//       padding: EdgeInsets.all(screenWidth * 0.04),
//       width: isDesktop ? 800 : double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 5,
//             blurRadius: 10,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           buildSignUpLabel(screenWidth),
//           SizedBox(height: screenHeight * 0.01),
//           buildEmailPhoneField(),
//           SizedBox(height: screenHeight * 0.01),
//           buildEligibilityCheckbox(screenWidth),
//           buildTermsCheckbox(screenWidth),
//           SizedBox(height: screenHeight * 0.02),
//           buildNextButton(screenWidth, screenHeight),
//         ],
//       ),
//     );
//   }
//
//   Widget buildSignUpLabel(double screenWidth) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         'Sign up',
//         style: TextStyle(
//           fontSize: screenWidth * 0.07,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
//
//   Widget buildEmailPhoneField() {
//     return TextField(
//       controller: controller.personalEmailController,
//       decoration: InputDecoration(
//         hintText: 'Email/Phone Number',
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//       ),
//     );
//   }
//
//   Widget buildEligibilityCheckbox(double screenWidth) {
//     return Row(
//       children: [
//         Checkbox(
//           value: controller.isEligibleChecked.value,
//           onChanged: (value) => controller.toggleEligibleCheckbox(),
//         ),
//         Expanded(
//           child: Text(
//             'Eligible for individuals 18 Years and above.',
//             style: TextStyle(fontSize: screenWidth * 0.040),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildTermsCheckbox(double screenWidth) {
//     return Row(
//       children: [
//         Checkbox(
//           value: controller.isAcceptTerms.value,
//           onChanged: (value) => controller.toggleAcceptTerms(),
//         ),
//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               text: 'By creating an account, I agree to BPP\'s ',
//               style:
//                   TextStyle(color: Colors.black, fontSize: screenWidth * 0.040),
//               children: [
//                 TextSpan(
//                   text: 'Terms of Service',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 TextSpan(text: ' and '),
//                 TextSpan(
//                   text: 'Privacy Policy.',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Widget buildNextButton(double screenWidth, double screenHeight) {
//   //   return SizedBox(
//   //     width: double.infinity,
//   //     child: ElevatedButton(
//   //       onPressed: () async {
//   //         String email = controller.personalEmailController.text.trim();
//   //         if (email.isEmpty) {
//   //           Get.snackbar(
//   //             'Error',
//   //             'Please enter your email address.',
//   //             backgroundColor: Colors.redAccent,
//   //             colorText: Colors.white,
//   //           );
//   //           return;
//   //         }
//   //
//   //         if (!controller.isEligibleChecked.value) {
//   //           Get.snackbar(
//   //             'Error',
//   //             'Please confirm that you are eligible (18 years and above).',
//   //             backgroundColor: Colors.redAccent,
//   //             colorText: Colors.white,
//   //           );
//   //           return;
//   //         }
//   //
//   //         if (!controller.isAcceptTerms.value) {
//   //           Get.snackbar(
//   //             'Error',
//   //             'Please accept the Terms of Service and Privacy Policy.',
//   //             backgroundColor: Colors.redAccent,
//   //             colorText: Colors.white,
//   //           );
//   //           return;
//   //         }
//   //
//   //         // API Endpoint and Payload
//   //         String endpoint =
//   //             'http://ec2-13-232-238-37.ap-south-1.compute.amazonaws.com:8080/api/v1/send-otp';
//   //         Map<String, String> payload = {'email': email}; // Only email for OTP
//   //
//   //         try {
//   //           // Send API request
//   //           var response = await http.post(
//   //             Uri.parse(endpoint),
//   //             headers: {'Content-Type': 'application/json'},
//   //             body: jsonEncode(payload),
//   //           );
//   //
//   //           if (response.statusCode == 200) {
//   //             // Parse Response
//   //             var responseData = jsonDecode(response.body);
//   //             if (responseData['success'] == true) {
//   //               Get.snackbar(
//   //                 'Success',
//   //                 'OTP sent successfully!',
//   //                 backgroundColor: Colors.green,
//   //                 colorText: Colors.white,
//   //               );
//   //               Get.to(
//   //                 () => VerificationPage(contactInfo: email),
//   //                 transition: Transition.rightToLeft,
//   //               );
//   //             } else {
//   //               Get.snackbar(
//   //                 'Error',
//   //                 responseData['message'] ?? 'Failed to send OTP.',
//   //                 backgroundColor: Colors.redAccent,
//   //                 colorText: Colors.white,
//   //               );
//   //             }
//   //           } else {
//   //             Get.snackbar(
//   //               'Error',
//   //               'Failed to send OTP. Please try again.',
//   //               backgroundColor: Colors.redAccent,
//   //               colorText: Colors.white,
//   //             );
//   //           }
//   //         } catch (e) {
//   //           Get.snackbar(
//   //             'Error',
//   //             'An unexpected error occurred. Please try again.',
//   //             backgroundColor: Colors.redAccent,
//   //             colorText: Colors.white,
//   //           );
//   //         }
//   //       },
//   //       style: ElevatedButton.styleFrom(
//   //         backgroundColor: Colors.blue,
//   //         padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//   //         shape: RoundedRectangleBorder(
//   //           borderRadius: BorderRadius.circular(6),
//   //         ),
//   //       ),
//   //       child: Text(
//   //         'Next',
//   //         style: TextStyle(
//   //           color: Colors.white,
//   //           fontSize: screenWidth * 0.05,
//   //           fontWeight: FontWeight.bold,
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   Widget buildNextButton(double screenWidth, double screenHeight) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () async {
//           String email = controller.personalEmailController.text.trim();
//
//           // Check if the email is empty
//           if (email.isEmpty) {
//             Get.snackbar(
//               'Error',
//               'Please enter your email address.',
//               backgroundColor: Colors.redAccent,
//               colorText: Colors.white,
//             );
//             return;
//           }
//
//           // Check eligibility
//           if (!controller.isEligibleChecked.value) {
//             Get.snackbar(
//               'Error',
//               'Please confirm that you are eligible (18 years and above).',
//               backgroundColor: Colors.redAccent,
//               colorText: Colors.white,
//             );
//             return;
//           }
//
//           // Check if terms are accepted
//           if (!controller.isAcceptTerms.value) {
//             Get.snackbar(
//               'Error',
//               'Please accept the Terms of Service and Privacy Policy.',
//               backgroundColor: Colors.redAccent,
//               colorText: Colors.white,
//             );
//             return;
//           }
//
//           // Navigate to VerificationPage
//           Get.to(
//             () => VerificationPage(contactInfo: email),
//             transition: Transition.rightToLeft,
//           );
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue,
//           padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6),
//           ),
//         ),
//         child: Text(
//           'Next',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: screenWidth * 0.05,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildDividerWithText(
//       String text, double screenWidth, bool isDesktop, bool isTablet) {
//     return Row(
//       children: [
//         Expanded(child: Divider()),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: screenWidth *
//                   (isDesktop
//                       ? 0.015
//                       : isTablet
//                           ? 0.04
//                           : 0.05),
//             ),
//           ),
//         ),
//         Expanded(child: Divider()),
//       ],
//     );
//   }
//
//   Widget buildSocialButtons(double screenWidth, double screenHeight) {
//     return Column(
//       children: [
//         buildOutlinedButton(
//           label: 'Continue with Google',
//           iconPath: 'assets/images/google_logo.png',
//           onPressed: () {},
//           iconWidth: screenWidth * 0.07,
//         ),
//         SizedBox(height: screenHeight * 0.02),
//         buildOutlinedButton(
//           label: 'Continue with Apple',
//           iconPath: 'assets/images/apple_logo4.png',
//           onPressed: () {},
//           iconWidth: screenWidth * 0.08,
//         ),
//       ],
//     );
//   }
//
//   Widget buildOutlinedButton({
//     required String label,
//     required String iconPath,
//     required VoidCallback onPressed,
//     required double iconWidth,
//   }) {
//     return SizedBox(
//       width: double.infinity,
//       child: OutlinedButton.icon(
//         icon: Image.asset(iconPath, width: iconWidth),
//         label: Text(
//           label,
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//         onPressed: onPressed,
//         style: OutlinedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           side: BorderSide(color: Colors.grey),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//       ),
//     );
//   }
//
//   Widget buildLoginRedirectText(double screenWidth) {
//     return GestureDetector(
//       onTap: () {
//         Get.to(() => const LoginScreenView(),
//             transition: Transition.rightToLeftWithFade);
//       },
//       child: Text(
//         'Log in to Bharatiya Popular',
//         style: TextStyle(
//           color: PrimaryConfig.boxColor,
//           fontSize: screenWidth * 0.045,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

//correct code with api

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:bpp_frontend/controller/screens/screen_controller.dart';
// import 'package:bpp_frontend/utils/primary_config.dart';
// import 'package:bpp_frontend/views/login_screen_view.dart';
// import 'package:bpp_frontend/views/verification_page.dart';
// import 'package:http/http.dart' as http;
//
// class SignUpScreenView extends GetView<ScreenController> {
//   const SignUpScreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     // Determine device type
//     bool isTablet = screenWidth > 600;
//     bool isDesktop = screenWidth > 1200;
//
//     double horizontalPadding = screenWidth *
//         (isDesktop
//             ? 0.2
//             : isTablet
//                 ? 0.1
//                 : 0.05);
//
//     return GestureDetector(
//       onTap: () {
//         // Unfocus all input fields when tapping outside
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Obx(
//           () => SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: screenHeight * 0.11), // Top padding
//
//                 // Single Card containing all the elements (Logo, Welcome text, Email/Phone input, Checkbox and Button)
//                 Card(
//                   color: Colors.white,
//                   margin: EdgeInsets.zero,
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(screenWidth * 0.04),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         // Logo
//                         Center(
//                           child: Image.asset(
//                             'assets/images/bpp_logo2.png',
//                             width: screenWidth *
//                                 (isDesktop
//                                     ? 0.15
//                                     : isTablet
//                                         ? 0.2
//                                         : 0.25),
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.01),
//
//                         // Welcome Text
//                         FittedBox(
//                           child: Text.rich(
//                             TextSpan(
//                               text: 'Welcome to' '\n' 'Bharatiya Popular Party',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: screenWidth *
//                                     (isDesktop
//                                         ? 0.03
//                                         : isTablet
//                                             ? 0.05
//                                             : 0.06),
//                                 color: Colors.blue,
//                               ),
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.04),
//
//                         // Email/Phone Number Field
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             'Email/Phone Number',
//                             style: TextStyle(
//                               fontSize: screenWidth * 0.04,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.01),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade200, // Background color
//                             borderRadius:
//                                 BorderRadius.circular(8), // Border radius
//                             border: Border.all(
//                                 color: Colors.grey.shade200), // Border color
//                           ),
//                           child: TextField(
//                             controller: controller.personalEmailController,
//                             decoration: InputDecoration(
//                               hintText: 'Email/Phone Number',
//                               filled: true,
//                               fillColor: Colors
//                                   .transparent, // Make the fill color transparent for container styling
//                               border:
//                                   InputBorder.none, // Remove the default border
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 15, horizontal: 15),
//                             ),
//                           ),
//                         ),
//
//                         SizedBox(
//                             height: screenHeight *
//                                 0.04), // Increased space after input field
//
//                         // Eligibility Checkbox
//                         buildEligibilityCheckbox(screenWidth),
//                         SizedBox(height: 10),
//
//                         // Terms Checkbox
//                         buildTermsCheckbox(screenWidth),
//                         SizedBox(height: screenHeight * 0.02),
//
//                         // Next Button
//                         buildNextButton(screenWidth, screenHeight),
//
//                         SizedBox(
//                             height:
//                                 screenHeight * 0.01), // Space after Next button
//
//                         // Now the "or" divider
//                         Row(
//                           children: [
//                             Expanded(child: Divider()),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Text(
//                                 "or",
//                                 style: TextStyle(
//                                   fontSize: screenWidth *
//                                       (isDesktop
//                                           ? 0.015
//                                           : isTablet
//                                               ? 0.04
//                                               : 0.05),
//                                 ),
//                               ),
//                             ),
//                             Expanded(child: Divider()),
//                           ],
//                         ),
//                         SizedBox(
//                             height: screenHeight *
//                                 0.02), // Space after "or" divider
//
//                         // Login Redirect Text
//                         buildLoginRedirectText(screenWidth),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper Methods
//   Widget buildEligibilityCheckbox(double screenWidth) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Checkbox(
//           value: controller.isEligibleChecked.value,
//           onChanged: (value) => controller.toggleEligibleCheckbox(),
//         ),
//         SizedBox(width: 4), // Space between checkbox and text
//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               text: 'I accept the Bharatiya Popular Party\'s Membership, ',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: screenWidth * 0.0350,
//               ),
//               children: [
//                 TextSpan(
//                   text: 'Terms & Conditions',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                     fontSize: screenWidth * 0.0350,
//                   ),
//                 ),
//                 TextSpan(
//                   text:
//                       ' & Constitution and also confirm that I am 18+ and not a member of any other political party.',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: screenWidth * 0.0350,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildTermsCheckbox(double screenWidth) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Checkbox(
//               value: controller.isAcceptTerms.value,
//               onChanged: (value) => controller.toggleAcceptTerms(),
//             ),
//             SizedBox(width: 4), // Space between checkbox and text
//             Expanded(
//               child: RichText(
//                 text: TextSpan(
//                   text:
//                       'I wish to enroll as a Primary Member of the Bharatiya Popular Party and accept ',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: screenWidth * 0.0350,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: 'Party\'s Objectives.',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                         fontSize: screenWidth * 0.0350,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 15), // Space between the terms checkbox and new text
//         Text(
//           '* Keep your Aadhaar & Voter Id handy, before Proceeding',
//           style: TextStyle(
//             color: Colors.red, // Red color
//             fontWeight: FontWeight.bold,
//             fontSize: screenWidth * 0.0300,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildNextButton(double screenWidth, double screenHeight) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () async {
//           if (!controller.isEligibleChecked.value) {
//             Get.snackbar(
//               'Error',
//               'Please confirm that you are eligible (18 years and above).',
//               backgroundColor: Colors.redAccent,
//               colorText: Colors.white,
//             );
//           } else if (!controller.isAcceptTerms.value) {
//             Get.snackbar(
//               'Error',
//               'Please accept the Terms of Service and Privacy Policy.',
//               backgroundColor: Colors.redAccent,
//               colorText: Colors.white,
//             );
//           } else if (controller.personalEmailController.text.isEmpty) {
//             Get.snackbar(
//               'Error',
//               'Please enter your email or phone number.',
//               backgroundColor: Colors.redAccent,
//               colorText: Colors.white,
//             );
//           } else {
//             try {
//               final response =
//                   await sendOtp(controller.personalEmailController.text);
//               if (response['status'] == 'DELIVERED') {
//                 Get.snackbar(
//                   'Success',
//                   response['message'],
//                   backgroundColor: Colors.green,
//                   colorText: Colors.white,
//                 );
//                 Get.to(
//                     () => VerificationPage(
//                         contactInfo: controller.personalEmailController.text),
//                     transition: Transition.rightToLeft);
//               } else {
//                 Get.snackbar(
//                   'Error',
//                   'Failed to send OTP.',
//                   backgroundColor: Colors.redAccent,
//                   colorText: Colors.white,
//                 );
//               }
//             } catch (e) {
//               Get.snackbar(
//                 'Error',
//                 'Something went wrong: $e',
//                 backgroundColor: Colors.redAccent,
//                 colorText: Colors.white,
//               );
//             }
//           }
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue,
//           padding: EdgeInsets.symmetric(vertical: screenHeight * 0.00),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6),
//           ),
//         ),
//         child: Text(
//           'Next',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: screenWidth * 0.05,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildLoginRedirectText(double screenWidth) {
//     return InkWell(
//       onTap: () => Get.to(LoginScreenView()),
//       child: Text(
//         'Already have an account? Log In',
//         style: TextStyle(
//           color: Colors.blue,
//           fontSize: screenWidth * 0.04,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   Future<Map<String, dynamic>> sendOtp(String contactInfo) async {
//     final url = Uri.parse(
//         'https://api.bppindia.com:8443/api/v1//send-otp');
//     final body = contactInfo.contains('@')
//         ? {'email': contactInfo}
//         : {'phoneNumber': contactInfo};
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(body),
//       );
//
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to send OTP');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }

//mobile number
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:bpp_frontend/controller/screens/screen_controller.dart';
// import 'package:bpp_frontend/utils/primary_config.dart';
// import 'package:bpp_frontend/views/login_screen_view.dart';
// import 'package:bpp_frontend/views/verification_page.dart';
// import 'package:http/http.dart' as http;
//
// class SignUpScreenView extends GetView<ScreenController> {
//   const SignUpScreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     // Determine device type
//     bool isTablet = screenWidth > 600;
//     bool isDesktop = screenWidth > 1200;
//
//     double horizontalPadding = screenWidth *
//         (isDesktop
//             ? 0.2
//             : isTablet
//                 ? 0.1
//                 : 0.05);
//
//     return GestureDetector(
//       onTap: () {
//         // Unfocus all input fields when tapping outside
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Obx(
//           () => SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: screenHeight * 0.11), // Top padding
//
//                 // Single Card containing all the elements (Logo, Welcome text, Email/Phone input, Checkbox and Button)
//                 Card(
//                   color: Colors.white,
//                   margin: EdgeInsets.zero,
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(screenWidth * 0.04),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         // Logo
//                         Center(
//                           child: Image.asset(
//                             'assets/images/bpp_logo2.png',
//                             width: screenWidth *
//                                 (isDesktop
//                                     ? 0.15
//                                     : isTablet
//                                         ? 0.2
//                                         : 0.25),
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.01),
//
//                         // Welcome Text
//                         FittedBox(
//                           child: Text.rich(
//                             TextSpan(
//                               text: 'Welcome to' '\n' 'Bharatiya Popular Party',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: screenWidth *
//                                     (isDesktop
//                                         ? 0.03
//                                         : isTablet
//                                             ? 0.05
//                                             : 0.06),
//                                 color: Colors.blue,
//                               ),
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.04),
//
//                         // Email/Phone Number Field
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             'Email/Phone Number',
//                             style: TextStyle(
//                               fontSize: screenWidth * 0.04,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.01),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade200, // Background color
//                             borderRadius:
//                                 BorderRadius.circular(8), // Border radius
//                             border: Border.all(
//                                 color: Colors.grey.shade200), // Border color
//                           ),
//                           child: TextField(
//                             controller: controller.personalEmailController,
//                             keyboardType:
//                                 TextInputType.phone, // Number pad for phone
//                             decoration: InputDecoration(
//                               hintText: 'Email/Phone Number',
//                               filled: true,
//                               fillColor: Colors.transparent,
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 15, horizontal: 15),
//                             ),
//                             onChanged: (text) {
//                               // Automatically add +91 prefix for phone number
//                               if (!text.startsWith('+91') && text.length > 0) {
//                                 if (text.contains(RegExp(r'^[0-9]+$'))) {
//                                   // Only add prefix for numeric input
//                                   controller.personalEmailController.text =
//                                       '+91' + text;
//                                   controller.personalEmailController.selection =
//                                       TextSelection.fromPosition(TextPosition(
//                                           offset: controller
//                                               .personalEmailController
//                                               .text
//                                               .length));
//                                 }
//                               }
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                             height: screenHeight *
//                                 0.04), // Increased space after input field
//
//                         // Eligibility Checkbox
//                         buildEligibilityCheckbox(screenWidth),
//                         SizedBox(height: 10),
//
//                         // Terms Checkbox
//                         buildTermsCheckbox(screenWidth),
//                         SizedBox(height: screenHeight * 0.02),
//
//                         // Next Button
//                         buildNextButton(screenWidth, screenHeight),
//
//                         SizedBox(
//                             height:
//                                 screenHeight * 0.01), // Space after Next button
//
//                         // Now the "or" divider
//                         Row(
//                           children: [
//                             Expanded(child: Divider()),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Text(
//                                 "or",
//                                 style: TextStyle(
//                                   fontSize: screenWidth *
//                                       (isDesktop
//                                           ? 0.015
//                                           : isTablet
//                                               ? 0.04
//                                               : 0.05),
//                                 ),
//                               ),
//                             ),
//                             Expanded(child: Divider()),
//                           ],
//                         ),
//                         SizedBox(
//                             height: screenHeight *
//                                 0.02), // Space after "or" divider
//
//                         // Login Redirect Text
//                         buildLoginRedirectText(screenWidth),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper Methods
//   Widget buildEligibilityCheckbox(double screenWidth) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Checkbox(
//           value: controller.isEligibleChecked.value,
//           onChanged: (value) => controller.toggleEligibleCheckbox(),
//         ),
//         SizedBox(width: 4), // Space between checkbox and text
//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               text: 'I accept the Bharatiya Popular Party\'s Membership, ',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: screenWidth * 0.0350,
//               ),
//               children: [
//                 TextSpan(
//                   text: 'Terms & Conditions',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                     fontSize: screenWidth * 0.0350,
//                   ),
//                 ),
//                 TextSpan(
//                   text:
//                       ' & Constitution and also confirm that I am 18+ and not a member of any other political party.',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: screenWidth * 0.0350,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildTermsCheckbox(double screenWidth) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Checkbox(
//               value: controller.isAcceptTerms.value,
//               onChanged: (value) => controller.toggleAcceptTerms(),
//             ),
//             SizedBox(width: 4), // Space between checkbox and text
//             Expanded(
//               child: RichText(
//                 text: TextSpan(
//                   text:
//                       'I wish to enroll as a Primary Member of the Bharatiya Popular Party and accept ',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: screenWidth * 0.0350,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: 'Party\'s Objectives.',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                         fontSize: screenWidth * 0.0350,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 15), // Space between the terms checkbox and new text
//         Text(
//           '* Keep your Aadhaar & Voter Id handy, before Proceeding',
//           style: TextStyle(
//             color: Colors.red, // Red color
//             fontWeight: FontWeight.bold,
//             fontSize: screenWidth * 0.0300,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildNextButton(double screenWidth, double screenHeight) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () async {
//           if (!controller.isEligibleChecked.value) {
//             Get.snackbar(
//               'Error',
//               'Please confirm that you are eligible (18 years and above).',
//               backgroundColor: Colors.redAccent,
//               colorText: Colors.white,
//             );
//           } else if (!controller.isAcceptTerms.value) {
//             Get.snackbar(
//               'Error',
//               'Please accept the Terms of Service and Privacy Policy.',
//               backgroundColor: Colors.redAccent,
//               colorText: Colors.white,
//             );
//           } else if (controller.personalEmailController.text.isEmpty) {
//             Get.snackbar(
//               'Error',
//               'Please enter your email or phone number.',
//               backgroundColor: Colors.redAccent,
//               colorText: Colors.white,
//             );
//           } else {
//             try {
//               final response =
//                   await sendOtp(controller.personalEmailController.text);
//               if (response['status'] == 'DELIVERED') {
//                 Get.snackbar(
//                   'Success',
//                   response['message'],
//                   backgroundColor: Colors.green,
//                   colorText: Colors.white,
//                 );
//                 Get.to(
//                     () => VerificationPage(
//                         contactInfo: controller.personalEmailController.text),
//                     transition: Transition.rightToLeft);
//               } else {
//                 Get.snackbar(
//                   'Error',
//                   'Failed to send OTP.',
//                   backgroundColor: Colors.redAccent,
//                   colorText: Colors.white,
//                 );
//               }
//             } catch (e) {
//               Get.snackbar(
//                 'Error',
//                 'Something went wrong: $e',
//                 backgroundColor: Colors.redAccent,
//                 colorText: Colors.white,
//               );
//             }
//           }
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue,
//           padding: EdgeInsets.symmetric(vertical: screenHeight * 0.00),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6),
//           ),
//         ),
//         child: Text(
//           'Next',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: screenWidth * 0.05,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildLoginRedirectText(double screenWidth) {
//     return InkWell(
//       onTap: () => Get.to(LoginScreenView()),
//       child: Text(
//         'Already have an account? Log In',
//         style: TextStyle(
//           color: Colors.blue,
//           fontSize: screenWidth * 0.04,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   Future<Map<String, dynamic>> sendOtp(String contactInfo) async {
//     final url = Uri.parse(
//         'https://ec2-13-232-238-37.ap-south-1.compute.amazonaws.com:8443/api/v1/send-otp');
//     final body = contactInfo.contains('@')
//         ? {'email': contactInfo}
//         : {'phoneNumber': contactInfo};
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(body),
//       );
//
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to send OTP');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }

// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:bpp_frontend/controller/screens/screen_controller.dart';
// import 'package:bpp_frontend/utils/primary_config.dart';
// import 'package:bpp_frontend/views/login_screen_view.dart';
// import 'package:bpp_frontend/views/verification_page.dart';
// import 'package:http/http.dart' as http;
//
// class SignUpScreenView extends GetView<ScreenController> {
//   const SignUpScreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     // Determine device type
//     bool isTablet = screenWidth > 600;
//     bool isDesktop = screenWidth > 1200;
//
//     double horizontalPadding = screenWidth *
//         (isDesktop
//             ? 0.2
//             : isTablet
//                 ? 0.1
//                 : 0.05);
//
//     return GestureDetector(
//       onTap: () {
//         // Unfocus all input fields when tapping outside
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Obx(
//           () => SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: screenHeight * 0.08), // Top padding
//                 buildLogo(screenWidth, isDesktop, isTablet),
//                 SizedBox(height: screenHeight * 0.01),
//                 buildWelcomeText(screenWidth, isDesktop, isTablet),
//                 SizedBox(height: screenHeight * 0.04),
//
//                 // Sign-up Form
//                 buildSignUpForm(screenWidth, screenHeight, isDesktop, isTablet),
//
//                 SizedBox(height: screenHeight * 0.01),
//                 buildDividerWithText("or", screenWidth, isDesktop, isTablet),
//                 SizedBox(height: screenHeight * 0.02),
//
//                 // Social Sign-in Buttons
//                 // buildSocialButtons(screenWidth, screenHeight),
//
//                 SizedBox(height: screenHeight * 0.02),
//                 buildLoginRedirectText(screenWidth),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper Methods:
//   Widget buildLogo(double screenWidth, bool isDesktop, bool isTablet) {
//     return Center(
//       child: Image.asset(
//         'assets/images/bpp_logo2.png',
//         width: screenWidth *
//             (isDesktop
//                 ? 0.15
//                 : isTablet
//                     ? 0.2
//                     : 0.25),
//       ),
//     );
//   }
//
//   Widget buildWelcomeText(double screenWidth, bool isDesktop, bool isTablet) {
//     return FittedBox(
//       child: Text.rich(
//         TextSpan(
//           text: 'Welcome to ' '\n' 'Bharatiya Popular Party',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: screenWidth *
//                 (isDesktop
//                     ? 0.03
//                     : isTablet
//                         ? 0.05
//                         : 0.06),
//             color: Colors.blue,
//           ),
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
//
//   Widget buildSignUpForm(
//       double screenWidth, double screenHeight, bool isDesktop, bool isTablet) {
//     return Container(
//       padding: EdgeInsets.all(screenWidth * 0.04),
//       width: isDesktop ? 800 : double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 5,
//             blurRadius: 10,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           buildSignUpLabel(screenWidth),
//           SizedBox(height: screenHeight * 0.01),
//           buildEmailPhoneField(),
//           SizedBox(height: screenHeight * 0.01),
//           buildEligibilityCheckbox(screenWidth),
//           SizedBox(height: 10),
//           buildTermsCheckbox(screenWidth),
//           SizedBox(height: screenHeight * 0.02),
//           buildNextButton(screenWidth, screenHeight),
//         ],
//       ),
//     );
//   }
//
//   Widget buildSignUpLabel(double screenWidth) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         'Email/Phone Number',
//         style: TextStyle(
//           fontSize: screenWidth * 0.04,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
//
//   Widget buildEmailPhoneField() {
//     return TextField(
//       controller: controller.personalEmailController,
//       decoration: InputDecoration(
//         hintText: 'Email/Phone Number',
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//       ),
//     );
//   }
//
//   Widget buildEligibilityCheckbox(double screenWidth) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Checkbox(
//           value: controller.isEligibleChecked.value,
//           onChanged: (value) => controller.toggleEligibleCheckbox(),
//         ),
//         SizedBox(width: 4), // Space between checkbox and text
//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               text: 'I accept the Bharatiya Popular Party\'s Membership, ',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: screenWidth * 0.0350,
//               ),
//               children: [
//                 TextSpan(
//                   text: 'Terms & Conditions',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                     fontSize: screenWidth * 0.0350,
//                   ),
//                 ),
//                 TextSpan(
//                   text:
//                       ' & Constitution and also confirm that I am 18+ and not a member of any other political party.',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: screenWidth * 0.0350,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildTermsCheckbox(double screenWidth) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Checkbox(
//           value: controller.isAcceptTerms.value,
//           onChanged: (value) => controller.toggleAcceptTerms(),
//         ),
//         SizedBox(width: 4), // Space between checkbox and text
//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               text:
//                   'I wish to enroll as a Primary Member of the Bharatiya Popular Party and accept ',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: screenWidth * 0.0350,
//               ),
//               children: [
//                 TextSpan(
//                   text: 'Party\'s Objectives.',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                     fontSize: screenWidth * 0.0350,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildNextButton(double screenWidth, double screenHeight) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () async {
//           if (!controller.isEligibleChecked.value) {
//             Get.snackbar(
//               'Error',
//               'Please confirm that you are eligible (18 years and above).',
//               backgroundColor: Colors.redAccent,
//               colorText: Colors.white,
//             );
//           } else if (!controller.isAcceptTerms.value) {
//             Get.snackbar(
//               'Error',
//               'Please accept the Terms of Service and Privacy Policy.',
//               backgroundColor: Colors.redAccent,
//               colorText: Colors.white,
//             );
//           } else if (controller.personalEmailController.text.isEmpty) {
//             Get.snackbar(
//               'Error',
//               'Please enter your email or phone number.',
//               backgroundColor: Colors.redAccent,
//               colorText: Colors.white,
//             );
//           } else {
//             try {
//               final response =
//                   await sendOtp(controller.personalEmailController.text);
//               if (response['status'] == 'DELIVERED') {
//                 Get.snackbar(
//                   'Success',
//                   response['message'],
//                   backgroundColor: Colors.green,
//                   colorText: Colors.white,
//                 );
//                 Get.to(
//                     () => VerificationPage(
//                         contactInfo: controller.personalEmailController.text),
//                     transition: Transition.rightToLeft);
//               } else {
//                 Get.snackbar(
//                   'Error',
//                   'Failed to send OTP.',
//                   backgroundColor: Colors.redAccent,
//                   colorText: Colors.white,
//                 );
//               }
//             } catch (e) {
//               Get.snackbar(
//                 'Error',
//                 'Something went wrong: $e',
//                 backgroundColor: Colors.redAccent,
//                 colorText: Colors.white,
//               );
//             }
//           }
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue,
//           padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6),
//           ),
//         ),
//         child: Text(
//           'Next',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: screenWidth * 0.05,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildDividerWithText(
//       String text, double screenWidth, bool isDesktop, bool isTablet) {
//     return Row(
//       children: [
//         Expanded(child: Divider()),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: screenWidth *
//                   (isDesktop
//                       ? 0.015
//                       : isTablet
//                           ? 0.04
//                           : 0.05),
//             ),
//           ),
//         ),
//         Expanded(child: Divider()),
//       ],
//     );
//   }
//
//   // Widget buildSocialButtons(double screenWidth, double screenHeight) {
//   //   return Column(
//   //     children: [
//   //       buildOutlinedButton(
//   //         label: 'Continue with Google',
//   //         iconPath: 'assets/images/google_logo.png',
//   //         onPressed: () {},
//   //         iconWidth: screenWidth * 0.07,
//   //       ),
//   //       SizedBox(height: screenHeight * 0.02),
//   //       buildOutlinedButton(
//   //         label: 'Continue with Apple',
//   //         iconPath: 'assets/images/apple_logo4.png',
//   //         onPressed: () {},
//   //         iconWidth: screenWidth * 0.08,
//   //       ),
//   //     ],
//   //   );
//   // }
//
//   Widget buildOutlinedButton({
//     required String label,
//     required String iconPath,
//     required VoidCallback onPressed,
//     required double iconWidth,
//   }) {
//     return SizedBox(
//       width: double.infinity,
//       child: OutlinedButton.icon(
//         icon: Image.asset(iconPath, width: iconWidth),
//         label: Text(
//           label,
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//         onPressed: onPressed,
//         style: OutlinedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           side: BorderSide(color: Colors.grey),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//       ),
//     );
//   }
//
//   Widget buildLoginRedirectText(double screenWidth) {
//     return GestureDetector(
//       onTap: () {
//         Get.to(() => const LoginScreenView(),
//             transition: Transition.rightToLeftWithFade);
//       },
//       child: Text(
//         'sign up as a business or log in',
//         style: TextStyle(
//           color: PrimaryConfig.boxColor,
//           fontSize: screenWidth * 0.045,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   Future<Map<String, dynamic>> sendOtp(String contactInfo) async {
//     final url = Uri.parse(
//         'http://ec2-13-232-238-37.ap-south-1.compute.amazonaws.com:8080/api/v1/send-otp');
//     final body = contactInfo.contains('@')
//         ? {'email': contactInfo}
//         : {'phoneNumber': contactInfo};
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(body),
//       );
//
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to send OTP');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bpp_frontend/controller/screens/screen_controller.dart';
import 'package:bpp_frontend/utils/primary_config.dart';
import 'package:bpp_frontend/views/login_screen_view.dart';
import 'package:bpp_frontend/views/verification_page.dart';
import 'package:http/http.dart' as http;

class SignUpScreenView extends GetView<ScreenController> {
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine device type
    bool isTablet = screenWidth > 600;
    bool isDesktop = screenWidth > 1200;

    double horizontalPadding = screenWidth *
        (isDesktop
            ? 0.2
            : isTablet
                ? 0.1
                : 0.05);

    return GestureDetector(
      onTap: () {
        // Unfocus all input fields when tapping outside
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(240, 240, 240, 240),
        body: Obx(
          () => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.11),

                // Single Card containing all the elements (Logo, Welcome text, Email/Phone input, Checkbox and Button)
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.zero,
                  //elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Logo
                        Center(
                          child: Image.asset(
                            'assets/images/bpp_logo2.png',
                            width: screenWidth *
                                (isDesktop
                                    ? 0.15
                                    : isTablet
                                        ? 0.2
                                        : 0.25),
                          ),
                        ),
                        // SizedBox(height: screenHeight * 0.00),

                        // Welcome Text
                        FittedBox(
                          child: Text.rich(
                            TextSpan(
                              text: 'Welcome to' '\n' 'Bharatiya Popular Party',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth *
                                    (isDesktop
                                        ? 0.03
                                        : isTablet
                                            ? 0.05
                                            : 0.06),
                                color: Colors.blue,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        // Email/Phone Number Field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ' Email/Phone Number',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200, // Background color
                            borderRadius:
                                BorderRadius.circular(8), // Border radius
                            border: Border.all(
                                color: Colors.grey.shade200), // Border color
                          ),
                          child: TextField(
                            controller: controller.personalEmailController,
                            keyboardType: TextInputType
                                .text, // Allows both text and numeric input
                            textInputAction: TextInputAction
                                .done, // Allows users to submit or move to the next field
                            onChanged: (text) {
                              // Check if input is purely numeric and doesn't already have +91
                              if (text.isNotEmpty &&
                                  text.contains(RegExp(r'^\d+$')) &&
                                  !text.startsWith('+91')) {
                                // Automatically prepend +91 for numeric input
                                controller.personalEmailController.text =
                                    '+91' + text;
                                controller.personalEmailController.selection =
                                    TextSelection.fromPosition(
                                  TextPosition(
                                    offset: controller
                                        .personalEmailController.text.length,
                                  ),
                                );
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter email and mobile number',
                              filled: true,
                              fillColor: Colors.transparent,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),

                        // Eligibility Checkbox
                        buildEligibilityCheckbox(screenWidth),
                        SizedBox(height: 10),

                        // Terms Checkbox
                        buildTermsCheckbox(screenWidth),
                        SizedBox(height: screenHeight * 0.02),

                        // Next Button
                        buildNextButton(screenWidth, screenHeight),

                        SizedBox(height: screenHeight * 0.01),

                        // "or" Divider
                        Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "or",
                                style: TextStyle(
                                  fontSize: screenWidth *
                                      (isDesktop
                                          ? 0.015
                                          : isTablet
                                              ? 0.04
                                              : 0.05),
                                ),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        // Login Redirect Text
                        buildLoginRedirectText(screenWidth),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper Methods
  Widget buildEligibilityCheckbox(double screenWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: controller.isEligibleChecked.value,
          onChanged: (value) => controller.toggleEligibleCheckbox(),
        ),
        SizedBox(width: 4),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'I accept the Bharatiya Popular Party\'s Membership, ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.0350,
              ),
              children: [
                TextSpan(
                  text: 'Terms & Conditions',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.0350,
                  ),
                ),
                TextSpan(
                  text:
                      ' & Constitution and confirm I am 18+ and not a member of another political party.',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.0350,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTermsCheckbox(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: controller.isAcceptTerms.value,
              onChanged: (value) => controller.toggleAcceptTerms(),
            ),
            SizedBox(width: 4),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text:
                      'I wish to enroll as a Primary Member of the Bharatiya Popular Party and accept ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.0350,
                  ),
                  children: [
                    TextSpan(
                      text: 'Party\'s Objectives.',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.0350,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Text(
          '* Keep your Aadhaar & Voter Id handy, before Proceeding',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.0300,
          ),
        ),
      ],
    );
  }

  Widget buildNextButton(double screenWidth, double screenHeight) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
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
            try {
              final response =
                  await sendOtp(controller.personalEmailController.text);
              if (response['status'] == 'DELIVERED') {
                Get.snackbar(
                  'Success',
                  response['message'],
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
                Get.to(
                    () => VerificationPage(
                        contactInfo: controller.personalEmailController.text),
                    transition: Transition.rightToLeft);
              } else {
                Get.snackbar(
                  'Error',
                  'Failed to send OTP.',
                  backgroundColor: Colors.redAccent,
                  colorText: Colors.white,
                );
              }
            } catch (e) {
              Get.snackbar(
                'Error',
                'Something went wrong: $e',
                backgroundColor: Colors.redAccent,
                colorText: Colors.white,
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
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

  Widget buildLoginRedirectText(double screenWidth) {
    return InkWell(
      onTap: () => Get.to(LoginScreenView()),
      child: Text(
        'Already have an account? Log In',
        style: TextStyle(
          color: Colors.blue,
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> sendOtp(String contactInfo) async {
    final url = Uri.parse('https://api.bppindia.com:8443/api/v1/send-otp');
    final body = contactInfo.contains('@')
        ? {'email': contactInfo}
        : {'phone': contactInfo};

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send OTP');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
