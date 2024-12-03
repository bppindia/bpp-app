// import 'dart:async';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/routes/transitions_type.dart';
//
// class MultiPageRegistrationFlow extends StatefulWidget {
//   final String contactInfo; // This could be an email or phone number
//
//   MultiPageRegistrationFlow({required this.contactInfo});
//
//   @override
//   _MultiPageRegistrationFlowState createState() =>
//       _MultiPageRegistrationFlowState();
// }
//
// class _MultiPageRegistrationFlowState extends State<MultiPageRegistrationFlow> {
//   // PageController to manage page navigation
//   final PageController _pageController = PageController();
//
//   // Current page index
//   int _currentPage = 0;
//
//   // Form keys for validation
//   final _formKeySignUp = GlobalKey<FormState>();
//   final _formKeyVerification = GlobalKey<FormState>();
//   final _formKeyPersonal = GlobalKey<FormState>();
//   final _formKeyAddress = GlobalKey<FormState>();
//   final _formKeyPassword = GlobalKey<FormState>();
//
//   // Controllers for text fields
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _verificationCodeController = TextEditingController();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   final TextEditingController _codeController = TextEditingController();
//
//   // State variables
//   bool _isAgeChecked = false;
//   bool _isTermsChecked = false;
//   bool _isPhoneSelected = false;
//   // bool _isEmailSelected = true;
//   bool isEmail = true; // Can be dynamically set based on your registration flow
//   bool isSmallScreen = false; // For responsive layout detection
//   bool codeSent = false;
//   bool isCodeExpired = false;
//   late Timer _timer;
//   int _remainingSeconds = 30;
//   bool _isTimerActive = true;
//
//   // Method to move to the next page
//   void _nextPage() {
//     // Check current page's form validation before moving
//     switch (_currentPage) {
//       case 0:
//         if (_formKeySignUp.currentState?.validate() ?? false) {
//           if (!_isAgeChecked || !_isTermsChecked) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Please accept age and terms conditions')),
//             );
//             return;
//           }
//           _pageController.nextPage(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//           );
//         }
//         break;
//       case 1:
//         if (_formKeyVerification.currentState?.validate() ?? false) {
//           _pageController.nextPage(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//           );
//         }
//         break;
//       case 2:
//         if (_formKeyPersonal.currentState?.validate() ?? false) {
//           _pageController.nextPage(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//           );
//         }
//         break;
//       case 3:
//         if (_formKeyAddress.currentState?.validate() ?? false) {
//           _pageController.nextPage(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//           );
//         }
//         break;
//     }
//   }
//
//   // Method to move to the previous page
//   void _previousPage() {
//     if (_currentPage > 0) {
//       _pageController.previousPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }
//
//   void _toggleContactMethod() {
//     setState(() {
//       _isPhoneSelected = !_isPhoneSelected;
//       // Clear the other controller when switching
//       if (_isPhoneSelected) {
//         _emailController.clear();
//       } else {
//         _phoneController.clear();
//       }
//     });
//   }
//   // Method to submit the entire registration
//   void _submitRegistration() {
//     if (_formKeyPassword.currentState?.validate() ?? false) {
//       // Perform final registration logic here
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Registration Successful!')),
//       );
//     }
//   }
//
//   // Method to handle Google sign-in
//   void _handleGoogleSignIn() {
//     // Implement Google sign-in logic
//     print('Google Sign-In Pressed');
//   }
//
//   // Method to handle Apple sign-in
//   void _handleAppleSignIn() {
//     // Implement Apple sign-in logic
//     print('Apple Sign-In Pressed');
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // Start the timer when the page is initialized
//     _startTimer();
//   }
//
//
//   void _startTimer() {
//     _remainingSeconds = 30;
//     _isTimerActive = true;
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_remainingSeconds > 0) {
//           _remainingSeconds--;
//         } else {
//           _isTimerActive = false;
//           timer.cancel();
//         }
//       });
//     });
//   }
//
//   void _resendCode() {
//     // Reset the timer and start again
//     _startTimer();
//     // Add logic to resend verification code
//     Get.snackbar(
//       'Code Resent',
//       'A new verification code has been sent',
//       backgroundColor: Colors.green,
//       colorText: Colors.white,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//
//       body: PageView(
//         controller: _pageController,
//         physics: const NeverScrollableScrollPhysics(),
//         onPageChanged: (index) {
//           setState(() {
//             _currentPage = index;
//           });
//         },
//         children: [
//           _buildSignUpPage(context),
//           _buildVerificationPage(screenSize),
//           // _buildPersonalDetailsPage(),
//           // Add Address and Password pages here
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSignUpPage(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Form(
//       key: _formKeySignUp,
//       child: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Party Logo
//               Image.asset(
//                 'assets/images/bpp_logo2.png',
//                 height: 100,
//                 width: 100,
//               ),
//               const SizedBox(height: 8),
//
//               // Welcome Text
//               const Text(
//                 'Welcome to',
//                 textAlign: TextAlign.center,
//                 styles: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//
//               const SizedBox(height: 8),
//
//               // Welcome Text
//               const Text(
//                 'Bharatiya Popular Party',
//                 textAlign: TextAlign.center,
//                 styles: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Sign-up Form Container
//               Container(
//                 padding: const EdgeInsets.all(16.0),
//                 margin: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 10,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Sign-Up Header
//                     const Text(
//                       'Sign up',
//                       styles: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     // const SizedBox(height: 16),
//                     const SizedBox(height: 10),
//                     TextField(
//                       controller: _isPhoneSelected ? _phoneController : _emailController,
//                       decoration: InputDecoration(
//                         hintText: 'Email/Phone Number',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                     ),
//
//
//                     const SizedBox(height: 16),
//                     // Checkboxes for Age and Terms
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: _isAgeChecked,
//                           onChanged: (bool? value) {
//                             setState(() {
//                               _isAgeChecked = value ?? false;
//                             });
//                           },
//                         ),
//                         const Expanded(
//                           child: Text(
//                             'Eligible for individuals 18 Years and above.',
//                             styles: TextStyle(fontSize: 14),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: _isTermsChecked,
//                           onChanged: (bool? value) {
//                             setState(() {
//                               _isTermsChecked = value ?? false;
//                             });
//                           },
//                         ),
//                         Expanded(
//                           child: RichText(
//                             text: TextSpan(
//                               styles: const TextStyle(color: Colors.black, fontSize: 14),
//                               children: [
//                                 const TextSpan(text: 'By creating an account, I agree to BPP\'s '),
//                                 TextSpan(
//                                   text: 'Terms of Service',
//                                   styles: const TextStyle(
//                                     color: Colors.blue,
//                                     decoration: TextDecoration.underline,
//                                   ),
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () {
//                                       // Navigate to Terms of Service
//                                     },
//                                 ),
//                                 const TextSpan(text: ' and '),
//                                 TextSpan(
//                                   text: 'Privacy Policy',
//                                   styles: const TextStyle(
//                                     color: Colors.blue,
//                                     decoration: TextDecoration.underline,
//                                   ),
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () {
//                                       // Navigate to Privacy Policy
//                                     },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//
//                     // Next Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: _isAgeChecked && _isTermsChecked ? _nextPage : null,
//                         styles: ElevatedButton.styleFrom(
//                           backgroundColor: _isAgeChecked && _isTermsChecked
//                               ? Colors.blue
//                               : Colors.grey,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           'Next',
//                           styles: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     // Divider with "or"
//                     Row(
//                       children: [
//                         const Expanded(child: Divider()),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             'or',
//                             styles: TextStyle(
//                               fontSize: screenWidth * 0.045,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         const Expanded(child: Divider()),
//                       ],
//                     ),
//
//                     const SizedBox(height: 16),
//
//                     // Google Sign-in Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: OutlinedButton.icon(
//                         icon: Image.asset(
//                           'assets/images/google_logo.png',
//                           width: screenWidth * 0.1,
//                         ),
//                         label: Text(
//                           'Continue with Google',
//                           styles: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: screenWidth * 0.045,
//                           ),
//                         ),
//                         onPressed: _handleGoogleSignIn,
//                         styles: OutlinedButton.styleFrom(
//                           padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//                           side: const BorderSide(color: Colors.grey),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 16),
//
//                     // Apple Sign-in Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: OutlinedButton.icon(
//                         icon: Image.asset(
//                           'assets/images/apple_logo4.png',
//                           width: screenWidth * 0.1,
//                         ),
//                         label: Text(
//                           'Continue with Apple',
//                           styles: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: screenWidth * 0.045,
//                           ),
//                         ),
//                         onPressed: _handleAppleSignIn,
//                         styles: OutlinedButton.styleFrom(
//                           padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//                           side: const BorderSide(color: Colors.grey),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Login Link
//               TextButton(
//                 onPressed: () {
//                   // Navigate to Login Page
//                 },
//                 child: const Text(
//                   'Log in to Bharatiya Popular',
//                   styles: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildVerificationPage(Size screenSize) {
//     // Determine if the contact is email or phone
//     final bool isEmail = widget.contactInfo.contains("@");
//     final screenSize = MediaQuery.of(context).size;
//     final isSmallScreen = screenSize.width < 600;
//
//     return Form(
//       key: _formKeyVerification,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 minHeight: constraints.maxHeight,
//               ),
//               child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: isSmallScreen ? 16.0 : screenSize.width * 0.1,
//                     vertical: 16.0,
//                   ),
//                   child: Container(
//                     width: isSmallScreen ? double.infinity : 500,
//                     padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12.0),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.2),
//                           spreadRadius: 5,
//                           blurRadius: 10,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Image.asset(
//                           'assets/images/bpp_logo2.png',
//                           height: isSmallScreen ? 70 : 90,
//                         ),
//                         SizedBox(height: isSmallScreen ? 16 : 20),
//                         Text(
//                           isEmail ? 'Verify your email' : 'Verify your number',
//                           styles: TextStyle(
//                             fontSize: isSmallScreen ? 24 : 28,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: isSmallScreen ? 8 : 10),
//                         FittedBox(
//                           fit: BoxFit.scaleDown,
//                           child: Text(
//                             'Please enter the 6-digit verification code sent to ${widget.contactInfo}.\nThe code is valid for 30 minutes.',
//                             textAlign: TextAlign.center,
//                             styles: TextStyle(
//                               fontSize: isSmallScreen ? 14 : 16,
//                               color: Colors.grey[700],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: isSmallScreen ? 16 : 20),
//                         TextFormField(
//                           controller: _codeController,
//                           keyboardType: TextInputType.number,
//                           maxLength: 6,
//                           validator: (value) {
//                             if (value == null || value.length != 6) {
//                               return 'Please enter a valid 6-digit code';
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             labelText: 'Verification Code',
//                             suffixIcon: codeSent
//                                 ? Icon(Icons.check_circle, color: Colors.green)
//                                 : null,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         // Timer Display
//                         Text(
//                           _isTimerActive
//                               ? 'Code expires in $_remainingSeconds seconds'
//                               : 'Verification code expired',
//                           styles: TextStyle(
//                             color: _isTimerActive ? Colors.blue : Colors.red,
//                             fontSize: 14,
//                           ),
//                         ),
//                         SizedBox(height: isSmallScreen ? 16 : 20),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               const temporaryCode = '456789';
//
//                               if (_codeController.text != temporaryCode) {
//                                 Get.snackbar(
//                                   'Error',
//                                   'Please enter the correct verification code: $temporaryCode',
//                                   backgroundColor: Colors.redAccent,
//                                   colorText: Colors.white,
//                                 );
//                                 return;
//                               }
//
//                               if (!_isTimerActive) {
//                                 Get.snackbar(
//                                   'Error',
//                                   'Verification code has expired. Please request a new one.',
//                                   backgroundColor: Colors.redAccent,
//                                   colorText: Colors.white,
//                                 );
//                                 return;
//                               }
//
//                               // Cancel the timer
//                               _timer.cancel();
//
//                               // Verify code and update state
//                               setState(() {
//                                 codeSent = true;
//                               });
//
//                               Get.snackbar(
//                                 'Success',
//                                 'Verification successful!',
//                                 backgroundColor: Colors.green,
//                                 colorText: Colors.white,
//                               );
//
//                               // Move to the next page (Personal Details)
//                               _pageController.nextPage(
//                                 duration: const Duration(milliseconds: 300),
//                                 curve: Curves.easeInOut,
//                               );
//                             },
//                             styles: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: isSmallScreen ? 30 : 50,
//                                 vertical: isSmallScreen ? 12 : 15,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                             child: Text(
//                               'Next',
//                               styles: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: isSmallScreen ? 8 : 10),
//                         TextButton(
//                           onPressed: !_isTimerActive ? _resendCode : null,
//                           child: Text(
//                             'Resend Code',
//                             styles: TextStyle(
//                               color: !_isTimerActive ? Colors.blue : Colors.grey,
//                               fontSize: isSmallScreen ? 12 : 14,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers to prevent memory leaks
//     _phoneController.dispose();
//     _verificationCodeController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _addressController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _pageController.dispose();
//     super.dispose();
//     _timer.cancel();
//
//   }
// }
//
