// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:bpp_frontend/controller/screens/screen_controller.dart';
// import 'package:bpp_frontend/views/sign_up_screen_view.dart';
//
// import '../utils/primary_config.dart';
//
// class LoginScreenView extends GetView<ScreenController> {
//   const LoginScreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     // Determine device type (phone, tablet, desktop)
//     bool isMobile = screenWidth < 600;
//     bool isTablet = screenWidth >= 600 && screenWidth < 1200;
//     bool isDesktop = screenWidth >= 1200;
//
//     return GestureDetector(
//       onTap: () {
//         controller.personalPhoneFocusNode.unfocus();
//         controller.personalEmailFocusNode.unfocus();
//         controller.passwordFocusNode.unfocus();
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: isMobile
//                   ? screenWidth * 0.05
//                   : isTablet
//                       ? screenWidth * 0.1
//                       : screenWidth * 0.2,
//             ).copyWith(top: screenHeight * 0.08),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                     height: 30), // Spacing between top of screen and container
//
//                 // Box containing the logo, welcome text, and form
//                 Container(
//                   padding: EdgeInsets.all(
//                     isMobile
//                         ? screenWidth * 0.05
//                         : isTablet
//                             ? screenWidth * 0.07
//                             : screenWidth * 0.1,
//                   ), // Responsive padding inside the box
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 5,
//                         blurRadius: 10,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Logo
//                       Center(
//                         child: Image.asset(
//                           'assets/images/bpp_logo2.png',
//                           width: isMobile
//                               ? screenWidth * 0.3
//                               : isTablet
//                                   ? screenWidth * 0.2
//                                   : screenWidth * 0.15,
//                         ),
//                       ),
//
//                       const SizedBox(height: 14),
//
//                       // Welcome Text
//                       FittedBox(
//                         child: Text.rich(
//                           TextSpan(
//                             text:
//                                 'Bharatiya Popular Party', // "Welcome to" part in black
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: isMobile
//                                   ? screenWidth * 0.05
//                                   : isTablet
//                                       ? screenWidth * 0.07
//                                       : screenWidth * 0.08,
//                               color: Colors.blue,
//                             ),
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//
//                       const SizedBox(height: 16),
//
//                       // Log in label and Email/Phone Input Field
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Sign In',
//                             style: TextStyle(
//                               fontSize: isMobile
//                                   ? screenWidth * 0.05
//                                   : isTablet
//                                       ? screenWidth * 0.06
//                                       : screenWidth * 0.07,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           TextField(
//                             controller: controller.personalEmailController,
//                             decoration: InputDecoration(
//                               hintText: 'Email/Phone Number',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           TextField(
//                             controller: controller.personalEmailController,
//                             decoration: InputDecoration(
//                               hintText: 'Enter a Password',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       const SizedBox(height: 20),
//
//                       // Next Button
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Next button action
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             padding: EdgeInsets.symmetric(
//                                 vertical: screenHeight * 0.01),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           child: Text(
//                             'Login',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: isMobile
//                                   ? screenWidth * 0.05
//                                   : isTablet
//                                       ? screenWidth * 0.06
//                                       : screenWidth * 0.07,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 20),
//
//                       // Divider with "or"
//                       Row(
//                         children: [
//                           const Expanded(child: Divider()),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Text(
//                               'or',
//                               style: TextStyle(
//                                 fontSize: isMobile
//                                     ? screenWidth * 0.04
//                                     : isTablet
//                                         ? screenWidth * 0.045
//                                         : screenWidth * 0.05,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                           const Expanded(child: Divider()),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//
//                       // Google Sign-in Button
//                       // SizedBox(
//                       //   width: double.infinity,
//                       //   child: OutlinedButton.icon(
//                       //     icon: Image.asset(
//                       //       'assets/images/google_logo.png',
//                       //       width: isMobile
//                       //           ? screenWidth * 0.08
//                       //           : isTablet
//                       //               ? screenWidth * 0.07
//                       //               : screenWidth * 0.06,
//                       //     ),
//                       //     label: Text(
//                       //       'Continue with Google',
//                       //       style: TextStyle(
//                       //         fontWeight: FontWeight.bold,
//                       //         fontSize: isMobile
//                       //             ? screenWidth * 0.045
//                       //             : isTablet
//                       //                 ? screenWidth * 0.05
//                       //                 : screenWidth * 0.06,
//                       //       ),
//                       //     ),
//                       //     onPressed: () {
//                       //       // Google sign-in action
//                       //     },
//                       //     style: OutlinedButton.styleFrom(
//                       //       padding: EdgeInsets.symmetric(
//                       //           vertical: screenHeight * 0.02),
//                       //       side: const BorderSide(color: Colors.grey),
//                       //       shape: RoundedRectangleBorder(
//                       //         borderRadius: BorderRadius.circular(8),
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                       //
//                       // const SizedBox(height: 20),
//                       //
//                       // // Apple Sign-in Button
//                       // SizedBox(
//                       //   width: double.infinity,
//                       //   child: OutlinedButton.icon(
//                       //     icon: Image.asset(
//                       //       'assets/images/apple_logo4.png',
//                       //       width: isMobile
//                       //           ? screenWidth * 0.12
//                       //           : isTablet
//                       //               ? screenWidth * 0.1
//                       //               : screenWidth * 0.08,
//                       //     ),
//                       //     label: Text(
//                       //       'Continue with Apple',
//                       //       style: TextStyle(
//                       //         fontWeight: FontWeight.bold,
//                       //         fontSize: isMobile
//                       //             ? screenWidth * 0.045
//                       //             : isTablet
//                       //                 ? screenWidth * 0.05
//                       //                 : screenWidth * 0.06,
//                       //       ),
//                       //     ),
//                       //     onPressed: () {
//                       //       // Apple sign-in action
//                       //     },
//                       //     style: OutlinedButton.styleFrom(
//                       //       padding: EdgeInsets.symmetric(
//                       //           vertical: screenHeight * 0.02),
//                       //       side: const BorderSide(color: Colors.grey),
//                       //       shape: RoundedRectangleBorder(
//                       //         borderRadius: BorderRadius.circular(8),
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                       // const SizedBox(height: 20),
//
//                       // Create Account link
//                       GestureDetector(
//                         onTap: () {
//                           Get.to(() => const SignUpScreenView(),
//                               transition: Transition.rightToLeftWithFade);
//                         },
//                         child: Text(
//                           'Create a Bharatiya Popular Party Account',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: isMobile
//                                 ? screenWidth * 0.038
//                                 : isTablet
//                                     ? screenWidth * 0.032
//                                     : screenWidth * 0.045,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:bpp_frontend/views/sign_up_screen_view.dart';
// import 'package:flutter/material.dart';
//
// class LoginScreenView extends StatefulWidget {
//   const LoginScreenView({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreenView> createState() => _LoginScreenViewState();
// }
//
// class _LoginScreenViewState extends State<LoginScreenView> {
//   bool isPasswordVisible =
//       false; // State variable for toggling password visibility
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context)
//               .unfocus(), // Dismiss the keyboard when tapping outside
//           child: SingleChildScrollView(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//             ), // Automatically adjust for keyboard
//             child: Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // Logo
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundImage: const AssetImage(
//                           'assets/images/bpp_logo1.png'), // Replace with your logo
//                     ),
//                     const SizedBox(height: 10),
//
//                     // Welcome Text
//                     const Text(
//                       "Welcome to",
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     const Text(
//                       "Bharatiya Popular Party",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//
//                     // Subtext
//                     const Text(
//                       "Log in with your email & phone",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//
//                     // Email/Phone Field
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Email/Phone number",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade200, // Background color
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: TextField(
//                             decoration: const InputDecoration(
//                               hintText: 'mayur@1gmail.com',
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 12,
//                                   horizontal: 10), // Adjust height
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//
//                     // Password Field
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Password",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade200, // Background color
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: TextField(
//                             obscureText:
//                                 !isPasswordVisible, // Toggle visibility
//                             decoration: InputDecoration(
//                               hintText: '******',
//                               border: InputBorder.none,
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 12,
//                                   horizontal: 10), // Adjust height
//                               suffixIcon: IconButton(
//                                 icon: Icon(isPasswordVisible
//                                     ? Icons.visibility
//                                     : Icons.visibility_off),
//                                 onPressed: () {
//                                   setState(() {
//                                     isPasswordVisible = !isPasswordVisible;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 3),
//
//                     // Forgot Password
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           "Forgot your password?",
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ),
//
//                     // Login Button
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(double.infinity, 40),
//                         backgroundColor: Colors.black87,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         "Login",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//
//                     // Sign up
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text("Don’t have an account yet? "),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SignUpScreenView()),
//                             );
//                           },
//                           child: const Text(
//                             'Sign up',
//                             style: TextStyle(color: Colors.blue),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//correct code app
// import 'package:bpp_frontend/controller/screens/screen_dashbaord.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'sign_up_screen_view.dart';
//
// class LoginScreenView extends StatefulWidget {
//   const LoginScreenView({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreenView> createState() => _LoginScreenViewState();
// }
//
// class _LoginScreenViewState extends State<LoginScreenView> {
//   bool isPasswordVisible = false;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isLoading = false;
//
//   Future<void> login() async {
//     final String email = emailController.text.trim();
//     final String password = passwordController.text.trim();
//
//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please enter email and password")),
//       );
//       return;
//     }
//
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final response = await http.post(
//         Uri.parse('https://api.bppindia.com:8443/api/v1/login'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({"email": email, "password": password}),
//       );
//
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         final token = data['token'];
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               "Login successful!",
//               style: TextStyle(
//                   color: Colors.white), // Optional: To ensure text contrast
//             ),
//             backgroundColor: Colors.green, // Set the background color to green
//           ),
//         );
//
//         // Navigate to ScreenDashboard
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => ScreenDashbaord()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content:
//                   Text("email/password is wrong: ${response.reasonPhrase}")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("An error occurred: $e")),
//       );
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: SingleChildScrollView(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundImage:
//                           const AssetImage('assets/images/bpp_logo1.png'),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       "Welcome to",
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     const Text(
//                       "Bharatiya Popular Party",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       "Log in with your email & phone",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 24),
//
//                     // Email Field
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Email/Phone number",
//                           style: TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.w500),
//                         ),
//                         const SizedBox(height: 8),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: TextField(
//                             controller: emailController,
//                             decoration: const InputDecoration(
//                               hintText: 'mayur@1gmail.com',
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 10),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//
//                     // Password Field
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Password",
//                           style: TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.w500),
//                         ),
//                         const SizedBox(height: 8),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: TextField(
//                             controller: passwordController,
//                             obscureText: !isPasswordVisible,
//                             decoration: InputDecoration(
//                               hintText: '******',
//                               border: InputBorder.none,
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 10),
//                               suffixIcon: IconButton(
//                                 icon: Icon(isPasswordVisible
//                                     ? Icons.visibility
//                                     : Icons.visibility_off),
//                                 onPressed: () {
//                                   setState(() {
//                                     isPasswordVisible = !isPasswordVisible;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 3),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           "Forgot your password?",
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: isLoading ? null : login,
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(double.infinity, 40),
//                         backgroundColor: Colors.black87,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: isLoading
//                           ? CircularProgressIndicator(color: Colors.white)
//                           : const Text("Login",
//                               style: TextStyle(color: Colors.white)),
//                     ),
//                     const SizedBox(height: 5),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text("Don’t have an account yet? "),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SignUpScreenView()),
//                             );
//                           },
//                           child: const Text('Sign up',
//                               style: TextStyle(color: Colors.blue)),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//8jan
// import 'package:bpp_frontend/controller/screens/screen_dashbaord.dart';
// import 'package:bpp_frontend/views/widgets/forgot_password.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'sign_up_screen_view.dart';
//
// class LoginScreenView extends StatefulWidget {
//   const LoginScreenView({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreenView> createState() => _LoginScreenViewState();
// }
//
// class _LoginScreenViewState extends State<LoginScreenView> {
//   bool isPasswordVisible = false;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isLoading = false;
//
//   Future<void> login() async {
//     final String email = emailController.text.trim();
//     final String password = passwordController.text.trim();
//
//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enter email and password")),
//       );
//       return;
//     }
//
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final response = await http.post(
//         Uri.parse('https://api.bppindia.com:8443/api/v1/login'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({"email": email, "password": password}),
//       );
//
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         final token = data['token'];
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text(
//               "Login successful!",
//               style: TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Colors.green,
//           ),
//         );
//
//         // Navigate to ScreenDashboard
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => ScreenDashbaord(firstName: '', lastName: '', referralCode: '',)),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content:
//                   Text("Email/password is wrong: ${response.reasonPhrase}")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("An error occurred: $e")),
//       );
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(240, 240, 240, 240),
//      // resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Center(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Card(
//                   color: Colors.white,
//                   //elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Center(
//                           child: Image.asset(
//                             'assets/images/bpp_logo2.png',
//                             height: 80,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//
//                         // const SizedBox(height: 10),
//                         const Text(
//                           "Welcome to",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         // const SizedBox(height: 5),
//                         const Text(
//                           "Bharatiya Popular Party",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         const Text(
//                           "Log in with your email & phone",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 24),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               " Email/Phone number",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade200,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: TextField(
//                                 controller: emailController,
//                                 decoration: const InputDecoration(
//                                   hintText: 'Enter email/phone number',
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 12, horizontal: 10),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "  Password",
//                               style: TextStyle(
//                                   fontSize: 14, fontWeight: FontWeight.w500),
//                             ),
//                             const SizedBox(height: 8),
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade200,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: TextField(
//                                 controller: passwordController,
//                                 obscureText: !isPasswordVisible,
//                                 decoration: InputDecoration(
//                                   hintText: 'Enter password',
//                                   border: InputBorder.none,
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       vertical: 12, horizontal: 10),
//                                   suffixIcon: IconButton(
//                                     icon: Icon(isPasswordVisible
//                                         ? Icons.visibility
//                                         : Icons.visibility_off),
//                                     onPressed: () {
//                                       setState(() {
//                                         isPasswordVisible = !isPasswordVisible;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 3),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         ResetPasswordScreen()),
//                               );
//                             },
//                             child: const Text(
//                               "Forgot your password?",
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: isLoading ? null : login,
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(double.infinity, 40),
//                             backgroundColor: Colors.black87,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           child: isLoading
//                               ? const CircularProgressIndicator(
//                                   color: Colors.white)
//                               : const Text("Login",
//                                   style: TextStyle(color: Colors.white)),
//                         ),
//                         //   const SizedBox(height: 5),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text("Don’t have an account yet? "),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => SignUpScreenView()),
//                                 );
//                               },
//                               child: const Text('Sign up',
//                                   style: TextStyle(color: Colors.blue)),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:bpp_frontend/controller/screens/screen_dashbaord.dart';
import 'package:bpp_frontend/views/widgets/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'sign_up_screen_view.dart';

class LoginScreenView extends StatefulWidget {
  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  bool isPasswordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  // Save user data locally
  Future<void> saveUserDataLocally(Map<String, dynamic> userData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_data', json.encode(userData));
  }

  Future<void> login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://api.bppindia.com:8443/api/v1/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final token = data['token'];

        // Save user data locally
        await saveUserDataLocally(data);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Login successful!",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to ScreenDashboard
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenDashbaord(
              firstName: data['firstName'] ?? '',
              lastName: data['lastName'] ?? '',
              referralCode: data['referralCode'] ?? '',
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Email/password is wrong: ${response.reasonPhrase}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(240, 240, 240, 240),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/bpp_logo2.png',
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Welcome to",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "Bharatiya Popular Party",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Log in with your email & phone",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 24),
                        _buildInputField("Email/Phone number", emailController,
                            "Enter email/phone number"),
                        const SizedBox(height: 10),
                        _buildPasswordField(),
                        const SizedBox(height: 3),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResetPasswordScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Forgot your password?",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: isLoading ? null : login,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 40),
                            backgroundColor: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                              color: Colors.white)
                              : const Text("Login",
                              style: TextStyle(color: Colors.white)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don’t have an account yet? "),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreenView()),
                                );
                              },
                              child: const Text('Sign up',
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller,
      String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Password",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: passwordController,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Enter password',
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 10),
              suffixIcon: IconButton(
                icon: Icon(isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
