// import '../views/splash_screen..dart';

// import 'package:bpp_frontend/controller/screens/screen_dashbaord.dart';
// import 'package:bpp_frontend/views/login_screen_view.dart';
// import 'package:bpp_frontend/views/sign_up_screen_view.dart';
// import 'package:bpp_frontend/views/splash_screen..dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class IntroScreen extends StatefulWidget {
//   @override
//   _IntroScreenState createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _logoAnimation;
//   late Animation<Offset> _partyNameSlideAnimation;
//   late Animation<Offset> _indiaTextSlideAnimation;
//   late Animation<Offset> _appTextSlideAnimation;
//   late Animation<Offset> _seamlessAnimation;
//   late Animation<Offset> _communityAnimation;
//   late Animation<Offset> _termsSlideAnimation;
//
//   bool showTermsPopup = false;
//   bool showButtons = false;
//   bool isWallpaperEnabled = false;
//   bool showErrorIcon = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeAnimations();
//     _scheduleTermsPopup();
//     _scheduleAutoNavigation();
//   }
//
//   void _initializeAnimations() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//
//     _logoAnimation = Tween<Offset>(
//       begin: const Offset(0, -1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
//     ));
//
//     _partyNameSlideAnimation = Tween<Offset>(
//       begin: const Offset(1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
//     ));
//
//     _indiaTextSlideAnimation = Tween<Offset>(
//       begin: const Offset(-1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.3, 0.9, curve: Curves.easeOutCubic),
//     ));
//
//     _appTextSlideAnimation = Tween<Offset>(
//       begin: const Offset(1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
//     ));
//
//     _seamlessAnimation = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic),
//     ));
//
//     _communityAnimation = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.6, 1.0, curve: Curves.easeOutCubic),
//     ));
//
//     _termsSlideAnimation = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     _controller.forward();
//   }
//
//   void _scheduleAutoNavigation() {
//     Future.delayed(const Duration(seconds: 2), () {
//       if (mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => SplashScreen()),
//         );
//       }
//     });
//   }
//
//   void _scheduleTermsPopup() {
//     Future.delayed(const Duration(seconds: 1), () {
//       if (mounted) {
//         setState(() => showTermsPopup = true);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _handleContinue() {
//     if (!isWallpaperEnabled) {
//       setState(() => showErrorIcon = true);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please enable Lock screen wallpapers to continue'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//       return;
//     }
//     setState(() {
//       showTermsPopup = false;
//       showButtons = true;
//     });
//   }
//
//   void _handleCancel() => SystemNavigator.pop();
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final textScaleFactor = size.width / 375;
//
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Container(
//             color: Colors.white,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 _buildLogo(constraints),
//                 _buildPartyTexts(constraints, textScaleFactor),
//                 if (showButtons) _buildNavigationButtons(constraints),
//                 if (showTermsPopup) _buildTermsPopup(constraints),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildLogo(BoxConstraints constraints) {
//     return SlideTransition(
//       position: _logoAnimation,
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Padding(
//           padding: EdgeInsets.only(top: constraints.maxHeight * 0.15),
//           child: Image.asset(
//             'assets/images/bpp_logo2.png',
//             height: constraints.maxHeight * 0.20,
//             width: constraints.maxWidth * 0.3,
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Widget _buildPartyTexts(BoxConstraints constraints, double textScaleFactor) {
//   //   return Positioned(
//   //     top: constraints.maxHeight * 0.36,
//   //     left: 0,
//   //     right: 0,
//   //     child: Column(
//   //       children: [
//   //         SlideTransition(
//   //           position: _partyNameSlideAnimation,
//   //           child: Text(
//   //             'Bharatiya Popular Party',
//   //             style: TextStyle(
//   //               fontSize: 36, //*textScaleFactor
//   //               fontWeight: FontWeight.bold,
//   //               color: Colors.blueAccent,
//   //             ),
//   //           ),
//   //         ),
//   //         SizedBox(height: constraints.maxHeight * 0.02),
//   //         SlideTransition(
//   //           position: _indiaTextSlideAnimation,
//   //           child: Text(
//   //             "INDIA'S 1st",
//   //             style: TextStyle(
//   //               fontSize: 28 * textScaleFactor,
//   //               fontFamily: 'Oswald',
//   //               fontWeight: FontWeight.bold,
//   //               color: Colors.blueAccent,
//   //             ),
//   //           ),
//   //         ),
//   //         SizedBox(height: constraints.maxHeight * 0.02),
//   //         SlideTransition(
//   //           position: _appTextSlideAnimation,
//   //           child: Text(
//   //             "POLITICAL PARTY APP",
//   //             style: TextStyle(
//   //               fontSize: 28 * textScaleFactor,
//   //               fontFamily: 'Oswald',
//   //               fontWeight: FontWeight.bold,
//   //               color: Colors.blueAccent,
//   //             ),
//   //           ),
//   //         ),
//   //         SizedBox(height: constraints.maxHeight * 0.03),
//   //         SlideTransition(
//   //           position: _seamlessAnimation,
//   //           child: _buildTagline("Seamless, Impactful", textScaleFactor),
//   //         ),
//   //         SizedBox(height: constraints.maxHeight * 0.01),
//   //         SlideTransition(
//   //           position: _communityAnimation,
//   //           child: _buildTagline("Community Contribution", textScaleFactor),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   // Widget _buildNavigationButtons(BoxConstraints constraints) {
//   //   return Positioned(
//   //     bottom: constraints.maxHeight * 0.0,
//   //     left: 0,
//   //     right: 0,
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //       children: [
//   //         _buildButton('Sign In', () => Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => LoginScreenView()),
//   //         )),
//   //         _buildButton('Sign Up', () => Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => SignUpScreenView()),
//   //         )),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget _buildPartyTexts(BoxConstraints constraints, double textScaleFactor) {
//     double fontSize;
//     // Check the screen width to determine the appropriate font size
//     if (constraints.maxWidth <= 600) {
//       // Phone
//       fontSize = 25; // Font size for phones
//     } else if (constraints.maxWidth <= 1200) {
//       // Tablet
//       fontSize = 36; // Font size for tablets
//     } else {
//       // Desktop
//       fontSize = 48; // Font size for desktop
//     }
//
//     return Positioned(
//       top: constraints.maxHeight * 0.36,
//       left: 0,
//       right: 0,
//       child: Column(
//         children: [
//           SlideTransition(
//             position: _partyNameSlideAnimation,
//             child: Text(
//               'Bharatiya Popular Party',
//               style: TextStyle(
//                 fontSize: fontSize, // Dynamic font size based on screen width
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueAccent,
//               ),
//             ),
//           ),
//           SizedBox(height: constraints.maxHeight * 0.02),
//           SlideTransition(
//             position: _indiaTextSlideAnimation,
//             child: Text(
//               "INDIA'S 1st",
//               style: TextStyle(
//                 fontSize: 28 * textScaleFactor,
//                 fontFamily: 'Oswald',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueAccent,
//               ),
//             ),
//           ),
//           SizedBox(height: constraints.maxHeight * 0.02),
//           SlideTransition(
//             position: _appTextSlideAnimation,
//             child: Text(
//               "POLITICAL PARTY APP",
//               style: TextStyle(
//                 fontSize: 28 * textScaleFactor,
//                 fontFamily: 'Oswald',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueAccent,
//               ),
//             ),
//           ),
//           SizedBox(height: constraints.maxHeight * 0.03),
//           SlideTransition(
//             position: _seamlessAnimation,
//             child: _buildTagline("Seamless, Impactful", textScaleFactor),
//           ),
//           SizedBox(height: constraints.maxHeight * 0.01),
//           SlideTransition(
//             position: _communityAnimation,
//             child: _buildTagline("Community Contribution", textScaleFactor),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Widget _buildNavigationButtons(BoxConstraints constraints) {
//   //   return Positioned(
//   //     top: constraints.maxHeight * 0.05,  // Adjusted for a little space from the top
//   //     left: 0,
//   //     right: 0,
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,  // To place buttons on left and right
//   //       children: [
//   //         Padding(
//   //           padding: EdgeInsets.only(left: constraints.maxWidth * 0.05), // Left padding
//   //           child: _buildButton('Sign In', () => Navigator.push(
//   //             context,
//   //             MaterialPageRoute(builder: (context) => LoginScreenView()),
//   //           )),
//   //         ),
//   //         Padding(
//   //           padding: EdgeInsets.only(right: constraints.maxWidth * 0.05), // Right padding
//   //           child: _buildButton('Sign Up', () => Navigator.push(
//   //             context,
//   //             MaterialPageRoute(builder: (context) => SignUpScreenView()),
//   //           )),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget _buildNavigationButtons(BoxConstraints constraints) {
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.width > 600;
//     final isPhone = size.width <= 600;
//
//     return Positioned(
//       // Adjust top or bottom positioning based on device type
//       top: isTablet
//           ? constraints.maxHeight * 0.05
//           : null, // Position at the top for tablet
//       bottom: isPhone
//           ? constraints.maxHeight * 0.05
//           : null, // Position at the bottom for phone
//       left: 0,
//       right: 0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment
//             .spaceBetween, // To place buttons on left and right
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//                 left: constraints.maxWidth * 0.05), // Left padding
//             child: _buildButton(
//                 'Sign In',
//                 () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => LoginScreenView()),
//                     )),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//                 right: constraints.maxWidth * 0.05), // Right padding
//             child: _buildButton(
//                 'Sign Up',
//                 () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => SignUpScreenView()),
//                     )),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildButton(String text, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: MediaQuery.of(context).size.width * 0.08,
//           vertical: MediaQuery.of(context).size.height * 0.015,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.9),
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 5,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: MediaQuery.of(context).size.width * 0.045,
//             fontWeight: FontWeight.bold,
//             color: const Color(0xFF1D4ED8),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTagline(String text, double textScaleFactor) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: 24 * textScaleFactor,
//         fontWeight: FontWeight.w900,
//         color: const Color(0xFF1D4ED8),
//       ),
//     );
//   }
//
//   Widget _buildTermsPopup(BoxConstraints constraints) {
//     return Positioned(
//       bottom: 0,
//       left: 0,
//       right: 0,
//       child: SlideTransition(
//         position: _termsSlideAnimation,
//         child: Container(
//           padding: EdgeInsets.all(constraints.maxWidth * 0.05),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10,
//                 offset: Offset(0, -2),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildTermsHeader(constraints),
//               SizedBox(height: constraints.maxHeight * 0.02),
//               _buildWallpaperToggle(),
//               SizedBox(height: constraints.maxHeight * 0.02),
//               _buildActionButtons(constraints),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTermsHeader(BoxConstraints constraints) {
//     return Row(
//       children: [
//         const CircleAvatar(
//           backgroundColor: Colors.blue,
//           child: Icon(Icons.security, color: Colors.white),
//         ),
//         SizedBox(width: constraints.maxWidth * 0.03),
//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: constraints.maxWidth * 0.035,
//               ),
//               children: const [
//                 TextSpan(text: 'By continuing, you agree to the '),
//                 TextSpan(
//                   text: 'Terms and Conditions',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//                 TextSpan(text: ' and '),
//                 TextSpan(
//                   text: 'Privacy Policy',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     decoration: TextDecoration.underline,
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
//   Widget _buildWallpaperToggle() {
//     return GestureDetector(
//       onTap: () => setState(() {
//         isWallpaperEnabled = !isWallpaperEnabled;
//         showErrorIcon = false;
//       }),
//       child: Row(
//         children: [
//           Icon(
//             isWallpaperEnabled
//                 ? Icons.check_circle
//                 : Icons.check_circle_outline,
//             color: showErrorIcon ? Colors.red : Colors.blue,
//             size: 28,
//           ),
//           const SizedBox(width: 10),
//           Text(
//             'Turn on Lock screen wallpapers',
//             style: TextStyle(
//               color: showErrorIcon ? Colors.red : Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildActionButtons(BoxConstraints constraints) {
//     return Row(
//       children: [
//         Expanded(
//           child: TextButton(
//             onPressed: _handleCancel,
//             style: TextButton.styleFrom(
//               backgroundColor: Colors.grey[300],
//               padding: EdgeInsets.symmetric(
//                 vertical: constraints.maxHeight * 0.02,
//               ),
//             ),
//             child: const Text('Cancel'),
//           ),
//         ),
//         SizedBox(width: constraints.maxWidth * 0.03),
//         Expanded(
//           child: TextButton(
//             onPressed: _handleContinue,
//             style: TextButton.styleFrom(
//               backgroundColor: Colors.blue,
//               padding: EdgeInsets.symmetric(
//                 vertical: constraints.maxHeight * 0.02,
//               ),
//             ),
//             child: const Text(
//               'Continue',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:bpp_frontend/controller/screens/screen_dashbaord.dart';
// import 'package:bpp_frontend/views/login_screen_view.dart';
// import 'package:bpp_frontend/views/sign_up_screen_view.dart';
// import 'package:bpp_frontend/views/splash_screen..dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class IntroScreen extends StatefulWidget {
//   @override
//   _IntroScreenState createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _logoAnimation;
//   late Animation<Offset> _partyNameSlideAnimation;
//   late Animation<Offset> _indiaTextSlideAnimation;
//   late Animation<Offset> _appTextSlideAnimation;
//   late Animation<Offset> _seamlessAnimation;
//   late Animation<Offset> _communityAnimation;
//   late Animation<Offset> _termsSlideAnimation;
//
//   bool showTermsPopup = false;
//   bool showButtons = false;
//   bool isWallpaperEnabled = false;
//   bool showErrorIcon = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeAnimations();
//     _scheduleTermsPopup();
//     //_scheduleAutoNavigation();
//   }
//
//   void _initializeAnimations() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//
//     _logoAnimation = Tween<Offset>(
//       begin: const Offset(0, -1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
//     ));
//
//     _partyNameSlideAnimation = Tween<Offset>(
//       begin: const Offset(1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
//     ));
//
//     _indiaTextSlideAnimation = Tween<Offset>(
//       begin: const Offset(-1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.3, 0.9, curve: Curves.easeOutCubic),
//     ));
//
//     _appTextSlideAnimation = Tween<Offset>(
//       begin: const Offset(1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
//     ));
//
//     _seamlessAnimation = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic),
//     ));
//
//     _communityAnimation = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.6, 1.0, curve: Curves.easeOutCubic),
//     ));
//
//     _termsSlideAnimation = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     _controller.forward();
//   }
//
//   // void _scheduleAutoNavigation() {
//   //   Future.delayed(const Duration(seconds: 2), () {
//   //     if (mounted) {
//   //       Navigator.pushReplacement(
//   //         context,
//   //         MaterialPageRoute(builder: (context) => SplashScreen()),
//   //       );
//   //     }
//   //   });
//   // }
//
//   void _scheduleTermsPopup() {
//     Future.delayed(const Duration(seconds: 1), () {
//       if (mounted) {
//         setState(() => showTermsPopup = true);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _handleContinue() {
//     setState(() {
//       showTermsPopup = false;
//       showButtons = true;
//     });
//   }
//
//   void _handleCancel() => SystemNavigator.pop();
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final textScaleFactor = size.width / 375;
//
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Container(
//             color: Colors.white,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 _buildLogo(constraints),
//                 _buildPartyTexts(constraints, textScaleFactor),
//                 if (showButtons) _buildNavigationButtons(constraints),
//                 if (showTermsPopup) _buildTermsPopup(constraints),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildLogo(BoxConstraints constraints) {
//     return SlideTransition(
//       position: _logoAnimation,
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Padding(
//           padding: EdgeInsets.only(top: constraints.maxHeight * 0.15),
//           child: Image.asset(
//             'assets/images/bpp_logo2.png',
//             height: constraints.maxHeight * 0.20,
//             width: constraints.maxWidth * 0.3,
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Widget _buildPartyTexts(BoxConstraints constraints, double textScaleFactor) {
//   //   return Positioned(
//   //     top: constraints.maxHeight * 0.36,
//   //     left: 0,
//   //     right: 0,
//   //     child: Column(
//   //       children: [
//   //         SlideTransition(
//   //           position: _partyNameSlideAnimation,
//   //           child: Text(
//   //             'Bharatiya Popular Party',
//   //             style: TextStyle(
//   //               fontSize: 36, //*textScaleFactor
//   //               fontWeight: FontWeight.bold,
//   //               color: Colors.blueAccent,
//   //             ),
//   //           ),
//   //         ),
//   //         SizedBox(height: constraints.maxHeight * 0.02),
//   //         SlideTransition(
//   //           position: _indiaTextSlideAnimation,
//   //           child: Text(
//   //             "INDIA'S 1st",
//   //             style: TextStyle(
//   //               fontSize: 28 * textScaleFactor,
//   //               fontFamily: 'Oswald',
//   //               fontWeight: FontWeight.bold,
//   //               color: Colors.blueAccent,
//   //             ),
//   //           ),
//   //         ),
//   //         SizedBox(height: constraints.maxHeight * 0.02),
//   //         SlideTransition(
//   //           position: _appTextSlideAnimation,
//   //           child: Text(
//   //             "POLITICAL PARTY APP",
//   //             style: TextStyle(
//   //               fontSize: 28 * textScaleFactor,
//   //               fontFamily: 'Oswald',
//   //               fontWeight: FontWeight.bold,
//   //               color: Colors.blueAccent,
//   //             ),
//   //           ),
//   //         ),
//   //         SizedBox(height: constraints.maxHeight * 0.03),
//   //         SlideTransition(
//   //           position: _seamlessAnimation,
//   //           child: _buildTagline("Seamless, Impactful", textScaleFactor),
//   //         ),
//   //         SizedBox(height: constraints.maxHeight * 0.01),
//   //         SlideTransition(
//   //           position: _communityAnimation,
//   //           child: _buildTagline("Community Contribution", textScaleFactor),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   // Widget _buildNavigationButtons(BoxConstraints constraints) {
//   //   return Positioned(
//   //     bottom: constraints.maxHeight * 0.0,
//   //     left: 0,
//   //     right: 0,
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //       children: [
//   //         _buildButton('Sign In', () => Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => LoginScreenView()),
//   //         )),
//   //         _buildButton('Sign Up', () => Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => SignUpScreenView()),
//   //         )),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget _buildPartyTexts(BoxConstraints constraints, double textScaleFactor) {
//     double fontSize;
//     // Check the screen width to determine the appropriate font size
//     if (constraints.maxWidth <= 600) {
//       // Phone
//       fontSize = 25; // Font size for phones
//     } else if (constraints.maxWidth <= 1200) {
//       // Tablet
//       fontSize = 36; // Font size for tablets
//     } else {
//       // Desktop
//       fontSize = 48; // Font size for desktop
//     }
//
//     return Positioned(
//       top: constraints.maxHeight * 0.36,
//       left: 0,
//       right: 0,
//       child: Column(
//         children: [
//           SlideTransition(
//             position: _partyNameSlideAnimation,
//             child: Text(
//               'Bharatiya Popular Party',
//               style: TextStyle(
//                 fontSize: 20, // Dynamic font size based on screen width
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueAccent,
//               ),
//             ),
//           ),
//           SizedBox(height: constraints.maxHeight * 0.02),
//           SlideTransition(
//             position: _indiaTextSlideAnimation,
//             child: Text(
//               "INDIA'S 1st",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontFamily: 'Oswald',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueAccent,
//               ),
//             ),
//           ),
//           SizedBox(height: constraints.maxHeight * 0.02),
//           SlideTransition(
//             position: _appTextSlideAnimation,
//             child: Text(
//               "POLITICAL PARTY APP",
//               style: TextStyle(
//                 fontSize: 28 * textScaleFactor,
//                 fontFamily: 'Oswald',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueAccent,
//               ),
//             ),
//           ),
//           SizedBox(height: constraints.maxHeight * 0.03),
//           SlideTransition(
//             position: _seamlessAnimation,
//             child: _buildTagline("Seamless, Impactful", textScaleFactor),
//           ),
//           SizedBox(height: constraints.maxHeight * 0.01),
//           SlideTransition(
//             position: _communityAnimation,
//             child: _buildTagline("Community Contribution", textScaleFactor),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Widget _buildNavigationButtons(BoxConstraints constraints) {
//   //   return Positioned(
//   //     top: constraints.maxHeight * 0.05,  // Adjusted for a little space from the top
//   //     left: 0,
//   //     right: 0,
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,  // To place buttons on left and right
//   //       children: [
//   //         Padding(
//   //           padding: EdgeInsets.only(left: constraints.maxWidth * 0.05), // Left padding
//   //           child: _buildButton('Sign In', () => Navigator.push(
//   //             context,
//   //             MaterialPageRoute(builder: (context) => LoginScreenView()),
//   //           )),
//   //         ),
//   //         Padding(
//   //           padding: EdgeInsets.only(right: constraints.maxWidth * 0.05), // Right padding
//   //           child: _buildButton('Sign Up', () => Navigator.push(
//   //             context,
//   //             MaterialPageRoute(builder: (context) => SignUpScreenView()),
//   //           )),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget _buildNavigationButtons(BoxConstraints constraints) {
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.width > 600;
//     final isPhone = size.width <= 600;
//
//     return Positioned(
//       // Adjust top or bottom positioning based on device type
//       top: isTablet ? constraints.maxHeight * 0.05 : null,
//       // Position at the top for tablet
//       bottom: isPhone ? constraints.maxHeight * 0.05 : null,
//       // Position at the bottom for phone
//       left: 0,
//       right: 0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment
//             .spaceBetween, // To place buttons on left and right
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//                 left: constraints.maxWidth * 0.05), // Left padding
//             child: _buildButton(
//                 'Sign In',
//                 () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => LoginScreenView()),
//                     )),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//                 right: constraints.maxWidth * 0.05), // Right padding
//             child: _buildButton(
//                 'Sign Up',
//                 () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => SignUpScreenView()),
//                     )),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildButton(String text, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: MediaQuery.of(context).size.width * 0.08,
//           vertical: MediaQuery.of(context).size.height * 0.015,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.9),
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 5,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: MediaQuery.of(context).size.width * 0.045,
//             fontWeight: FontWeight.bold,
//             color: const Color(0xFF1D4ED8),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTagline(String text, double textScaleFactor) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: 24 * textScaleFactor,
//         fontWeight: FontWeight.w900,
//         color: const Color(0xFF1D4ED8),
//       ),
//     );
//   }
//
//   Widget _buildTermsPopup(BoxConstraints constraints) {
//     return Positioned(
//       bottom: 0,
//       left: 0,
//       right: 0,
//       child: SlideTransition(
//         position: _termsSlideAnimation,
//         child: Container(
//           padding: EdgeInsets.all(constraints.maxWidth * 0.05),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10,
//                 offset: Offset(0, -2),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildTermsHeader(constraints),
//               SizedBox(height: constraints.maxHeight * 0.02),
//               _buildActionButtons(constraints),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTermsHeader(BoxConstraints constraints) {
//     return Row(
//       children: [
//         const CircleAvatar(
//           backgroundColor: Colors.blue,
//           child: Icon(Icons.security, color: Colors.white),
//         ),
//         SizedBox(width: constraints.maxWidth * 0.03),
//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: constraints.maxWidth * 0.035,
//               ),
//               children: const [
//                 TextSpan(text: 'By continuing, you agree to the '),
//                 TextSpan(
//                   text: 'Terms and Conditions',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//                 TextSpan(text: ' and '),
//                 TextSpan(
//                   text: 'Privacy Policy',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     decoration: TextDecoration.underline,
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
//   // Widget _buildWallpaperToggle() {
//   //   return GestureDetector(
//   //     onTap: () => setState(() {
//   //       isWallpaperEnabled = !isWallpaperEnabled;
//   //       showErrorIcon = false;
//   //     }),
//   //     child: Row(
//   //       children: [
//   //         Icon(
//   //           isWallpaperEnabled
//   //               ? Icons.check_circle
//   //               : Icons.check_circle_outline,
//   //           color: showErrorIcon ? Colors.red : Colors.blue,
//   //           size: 28,
//   //         ),
//   //         const SizedBox(width: 10),
//   //         Text(
//   //           'Turn on Lock screen wallpapers',
//   //           style: TextStyle(
//   //             color: showErrorIcon ? Colors.red : Colors.black,
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget _buildActionButtons(BoxConstraints constraints) {
//     return Row(
//       children: [
//         Expanded(
//           child: TextButton(
//             onPressed: _handleCancel,
//             style: TextButton.styleFrom(
//               backgroundColor: Colors.grey[300],
//               padding: EdgeInsets.symmetric(
//                 vertical: constraints.maxHeight * 0.01,
//               ),
//             ),
//             child: const Text('Cancel'),
//           ),
//         ),
//         SizedBox(width: constraints.maxWidth * 0.03),
//         Expanded(
//           child: TextButton(
//             onPressed: _handleContinue,
//             style: TextButton.styleFrom(
//               backgroundColor: Colors.blue,
//               padding: EdgeInsets.symmetric(
//                 vertical: constraints.maxHeight * 0.01,
//               ),
//             ),
//             child: const Text(
//               'Continue',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

//correct code
// import 'package:bpp_frontend/controller/screens/screen_dashbaord.dart';
// import 'package:bpp_frontend/views/login_screen_view.dart';
// import 'package:bpp_frontend/views/sign_up_screen_view.dart';
// import 'package:bpp_frontend/views/splash_screen_view.dart';
// import 'package:bpp_frontend/views/widgets/splash_screen..dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class IntroScreen extends StatefulWidget {
//   @override
//   _IntroScreenState createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _logoAnimation;
//   late Animation<Offset> _partyNameSlideAnimation;
//   late Animation<Offset> _indiaTextSlideAnimation;
//   late Animation<Offset> _appTextSlideAnimation;
//   late Animation<Offset> _seamlessAnimation;
//   late Animation<Offset> _communityAnimation;
//   late Animation<Offset> _termsSlideAnimation;
//
//   bool showTermsPopup = false;
//   bool showButtons = false;
//   bool isWallpaperEnabled = false;
//   bool showErrorIcon = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeAnimations();
//     _scheduleTermsPopup();
//     //_scheduleAutoNavigation();
//   }
//
//   void _initializeAnimations() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//
//     _logoAnimation = Tween<Offset>(
//       begin: const Offset(0, -1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
//     ));
//
//     _partyNameSlideAnimation = Tween<Offset>(
//       begin: const Offset(1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
//     ));
//
//     _indiaTextSlideAnimation = Tween<Offset>(
//       begin: const Offset(-1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.3, 0.9, curve: Curves.easeOutCubic),
//     ));
//
//     _appTextSlideAnimation = Tween<Offset>(
//       begin: const Offset(1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
//     ));
//
//     _seamlessAnimation = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic),
//     ));
//
//     _communityAnimation = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.6, 1.0, curve: Curves.easeOutCubic),
//     ));
//
//     _termsSlideAnimation = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     _controller.forward();
//   }
//
//   // void _scheduleAutoNavigation() {
//   //   Future.delayed(const Duration(seconds: 2), () {
//   //     if (mounted) {
//   //       Navigator.pushReplacement(
//   //         context,
//   //         MaterialPageRoute(builder: (context) => SplashScreen()),
//   //       );
//   //     }
//   //   });
//   // }
//
//   void _scheduleTermsPopup() {
//     Future.delayed(const Duration(seconds: 1), () {
//       if (mounted) {
//         setState(() => showTermsPopup = true);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _handleContinue() {
//     setState(() {
//       showTermsPopup = false;
//       showButtons = true;
//     });
//     // Navigate to the SplashScreen
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => SplashScreen()),
//     );
//   }
//
//   void _handleCancel() => SystemNavigator.pop();
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final textScaleFactor = size.width / 375;
//
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Container(
//             color: Colors.white,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 _buildLogo(constraints),
//                 _buildPartyTexts(constraints, textScaleFactor),
//                 // if (showButtons) _buildNavigationButtons(constraints),
//                 if (showTermsPopup) _buildTermsPopup(constraints),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildLogo(BoxConstraints constraints) {
//     return SlideTransition(
//       position: _logoAnimation,
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Padding(
//           padding: EdgeInsets.only(top: constraints.maxHeight * 0.15),
//           child: Image.asset(
//             'assets/images/bpp_logo2.png',
//             height: 150,
//             //  width: constraints.maxWidth * 0.3,
//             //fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Widget _buildPartyTexts(BoxConstraints constraints, double textScaleFactor) {
//   //   return Positioned(
//   //     top: constraints.maxHeight * 0.36,
//   //     left: 0,
//   //     right: 0,
//   //     child: Column(
//   //       children: [
//   //         SlideTransition(
//   //           position: _partyNameSlideAnimation,
//   //           child: Text(
//   //             'Bharatiya Popular Party',
//   //             style: TextStyle(
//   //               fontSize: 36, //*textScaleFactor
//   //               fontWeight: FontWeight.bold,
//   //               color: Colors.blueAccent,
//   //             ),
//   //           ),
//   //         ),
//   //         SizedBox(height: constraints.maxHeight * 0.02),
//   //         SlideTransition(
//   //           position: _indiaTextSlideAnimation,
//   //           child: Text(
//   //             "INDIA'S 1st",
//   //             style: TextStyle(
//   //               fontSize: 28 * textScaleFactor,
//   //               fontFamily: 'Oswald',
//   //               fontWeight: FontWeight.bold,
//   //               color: Colors.blueAccent,
//   //             ),
//   //           ),
//   //         ),
//   //         SizedBox(height: constraints.maxHeight * 0.02),
//   //         SlideTransition(
//   //           position: _appTextSlideAnimation,
//   //           child: Text(
//   //             "POLITICAL PARTY APP",
//   //             style: TextStyle(
//   //               fontSize: 28 * textScaleFactor,
//   //               fontFamily: 'Oswald',
//   //               fontWeight: FontWeight.bold,
//   //               color: Colors.blueAccent,
//   //             ),
//   //           ),
//   //         ),
//   //         SizedBox(height: constraints.maxHeight * 0.03),
//   //         SlideTransition(
//   //           position: _seamlessAnimation,
//   //           child: _buildTagline("Seamless, Impactful", textScaleFactor),
//   //         ),
//   //         SizedBox(height: constraints.maxHeight * 0.01),
//   //         SlideTransition(
//   //           position: _communityAnimation,
//   //           child: _buildTagline("Community Contribution", textScaleFactor),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   // Widget _buildNavigationButtons(BoxConstraints constraints) {
//   //   return Positioned(
//   //     bottom: constraints.maxHeight * 0.0,
//   //     left: 0,
//   //     right: 0,
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //       children: [
//   //         _buildButton('Sign In', () => Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => LoginScreenView()),
//   //         )),
//   //         _buildButton('Sign Up', () => Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => SignUpScreenView()),
//   //         )),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget _buildPartyTexts(BoxConstraints constraints, double textScaleFactor) {
//     double fontSize;
//     // Check the screen width to determine the appropriate font size
//     if (constraints.maxWidth <= 600) {
//       // Phone
//       fontSize = 25; // Font size for phones
//     } else if (constraints.maxWidth <= 1200) {
//       // Tablet
//       fontSize = 36; // Font size for tablets
//     } else {
//       // Desktop
//       fontSize = 48; // Font size for desktop
//     }
//
//     return Positioned(
//       top: constraints.maxHeight * 0.34,
//       left: 0,
//       right: 0,
//       child: Column(
//         children: [
//           SlideTransition(
//             position: _partyNameSlideAnimation,
//             child: Text(
//               'Bharatiya Popular Party',
//               style: TextStyle(
//                 fontSize: 25, // Dynamic font size based on screen width
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueAccent,
//               ),
//             ),
//           ),
//           SizedBox(height: constraints.maxHeight * 0.02),
//           SlideTransition(
//             position: _indiaTextSlideAnimation,
//             child: Text(
//               "INDIA'S 1st",
//               style: TextStyle(
//                 fontSize: 25,
//                 fontFamily: 'Oswald',
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFFE75A32),
//               ),
//             ),
//           ),
//           // SizedBox(height: constraints.maxHeight * 0.00),
//           SlideTransition(
//             position: _appTextSlideAnimation,
//             child: Text(
//               "POLITICAL PARTY APP",
//               style: TextStyle(
//                 fontSize: 25,
//                 fontFamily: 'Oswald',
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFFE75A32),
//               ),
//             ),
//           ),
//           SlideTransition(
//             position: _appTextSlideAnimation,
//             child: Text(
//               "Our Goals ",
//               style: TextStyle(
//                 fontSize: 25,
//                 fontFamily: 'Oswald',
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFFE75A32),
//               ),
//             ),
//           ),
//           //SizedBox(height: constraints.maxHeight * 0.03),
//           SlideTransition(
//             position: _seamlessAnimation,
//             child: _buildTagline("Seamless, Impactful", textScaleFactor),
//           ),
//           // SizedBox(height: constraints.maxHeight * 0.01),
//           SlideTransition(
//             position: _communityAnimation,
//             child: _buildTagline("Community Contribution...!", textScaleFactor),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Widget _buildNavigationButtons(BoxConstraints constraints) {
//   //   return Positioned(
//   //     top: constraints.maxHeight * 0.05,  // Adjusted for a little space from the top
//   //     left: 0,
//   //     right: 0,
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,  // To place buttons on left and right
//   //       children: [
//   //         Padding(
//   //           padding: EdgeInsets.only(left: constraints.maxWidth * 0.05), // Left padding
//   //           child: _buildButton('Sign In', () => Navigator.push(
//   //             context,
//   //             MaterialPageRoute(builder: (context) => LoginScreenView()),
//   //           )),
//   //         ),
//   //         Padding(
//   //           padding: EdgeInsets.only(right: constraints.maxWidth * 0.05), // Right padding
//   //           child: _buildButton('Sign Up', () => Navigator.push(
//   //             context,
//   //             MaterialPageRoute(builder: (context) => SignUpScreenView()),
//   //           )),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   // Widget _buildNavigationButtons(BoxConstraints constraints) {
//   //   final size = MediaQuery.of(context).size;
//   //   final isTablet = size.width > 600;
//   //   final isPhone = size.width <= 600;
//   //
//   //   return Positioned(
//   //     // Adjust top or bottom positioning based on device type
//   //     top: isTablet ? constraints.maxHeight * 0.05 : null,
//   //     // Position at the top for tablet
//   //     bottom: isPhone ? constraints.maxHeight * 0.05 : null,
//   //     // Position at the bottom for phone
//   //     left: 0,
//   //     right: 0,
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment
//   //           .spaceBetween, // To place buttons on left and right
//   //       children: [
//   //         Padding(
//   //           padding: EdgeInsets.only(
//   //               left: constraints.maxWidth * 0.05), // Left padding
//   //           child: _buildButton(
//   //               'Sign In',
//   //               () => Navigator.push(
//   //                     context,
//   //                     MaterialPageRoute(
//   //                         builder: (context) => LoginScreenView()),
//   //                   )),
//   //         ),
//   //         Padding(
//   //           padding: EdgeInsets.only(
//   //               right: constraints.maxWidth * 0.05), // Right padding
//   //           child: _buildButton(
//   //               'Sign Up',
//   //               () => Navigator.push(
//   //                     context,
//   //                     MaterialPageRoute(
//   //                         builder: (context) => SignUpScreenView()),
//   //                   )),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget _buildButton(String text, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: MediaQuery.of(context).size.width * 0.08,
//           vertical: MediaQuery.of(context).size.height * 0.015,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.9),
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 5,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: MediaQuery.of(context).size.width * 0.045,
//             fontWeight: FontWeight.bold,
//             color: const Color(0xFF1D4ED8),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTagline(String text, double textScaleFactor) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w900,
//         // color: const Color(0xFF1D4ED8),
//         color: const Color(0xFFE75A32),
//       ),
//     );
//   }
//
//   Widget _buildTermsPopup(BoxConstraints constraints) {
//     return Positioned(
//       bottom: 0,
//       left: 0,
//       right: 0,
//       child: SlideTransition(
//         position: _termsSlideAnimation,
//         child: Container(
//           padding: EdgeInsets.all(constraints.maxWidth * 0.05),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10,
//                 offset: Offset(0, -2),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildTermsHeader(constraints),
//               SizedBox(height: constraints.maxHeight * 0.02),
//               _buildActionButtons(constraints),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTermsHeader(BoxConstraints constraints) {
//     return Row(
//       children: [
//         const CircleAvatar(
//           backgroundColor: Colors.blue,
//           child: Icon(Icons.security, color: Colors.white),
//         ),
//         SizedBox(width: constraints.maxWidth * 0.03),
//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: constraints.maxWidth * 0.035,
//               ),
//               children: const [
//                 TextSpan(text: 'By continuing, you agree to the '),
//                 TextSpan(
//                   text: 'Terms and Conditions',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//                 TextSpan(text: ' and '),
//                 TextSpan(
//                   text: 'Privacy Policy',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     decoration: TextDecoration.underline,
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
//   // Widget _buildWallpaperToggle() {
//   //   return GestureDetector(
//   //     onTap: () => setState(() {
//   //       isWallpaperEnabled = !isWallpaperEnabled;
//   //       showErrorIcon = false;
//   //     }),
//   //     child: Row(
//   //       children: [
//   //         Icon(
//   //           isWallpaperEnabled
//   //               ? Icons.check_circle
//   //               : Icons.check_circle_outline,
//   //           color: showErrorIcon ? Colors.red : Colors.blue,
//   //           size: 28,
//   //         ),
//   //         const SizedBox(width: 10),
//   //         Text(
//   //           'Turn on Lock screen wallpapers',
//   //           style: TextStyle(
//   //             color: showErrorIcon ? Colors.red : Colors.black,
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget _buildActionButtons(BoxConstraints constraints) {
//     return Row(
//       children: [
//         Expanded(
//           child: TextButton(
//             onPressed: _handleCancel,
//             style: TextButton.styleFrom(
//               backgroundColor: Colors.grey[300],
//               padding: EdgeInsets.symmetric(
//                 vertical: constraints.maxHeight * 0.01,
//               ),
//             ),
//             child: const Text('Cancel'),
//           ),
//         ),
//         SizedBox(width: constraints.maxWidth * 0.03),
//         Expanded(
//           child: TextButton(
//             onPressed: _handleContinue,
//             style: TextButton.styleFrom(
//               backgroundColor: Colors.blue,
//               padding: EdgeInsets.symmetric(
//                 vertical: constraints.maxHeight * 0.01,
//               ),
//             ),
//             child: const Text(
//               'Continue',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:bpp_frontend/views/component/terms_pop_up.dart';
import 'package:bpp_frontend/views/widgets/splash_screen..dart';
import 'package:flutter/material.dart';
// Make sure the SplashScreen is correctly imported

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title: Why Use This App
            const Text(
              'WHY USE THIS APP',
              style: TextStyle(
                fontSize: 34,
                fontFamily: 'Impact',
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 20),

            // Row: Image and Community Contribution Text
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/no2.png', // Ensure this image is available in your assets
                    height: 70,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'COMMUNITY\nCONTRIBUTION',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Impact',
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),

            // Divider Style
            Image.asset(
              'assets/images/wh1.png', // Optional footer divider image
              height: 40,
              color: Colors.purple, // Adjust size as necessary
              fit: BoxFit.cover,
            ),

            // Row: Image and Inspirational Text
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/no3.png', // Ensure this image is available in your assets
                    height: 70,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      "WE CAN'T HELP EVERYONE,\nBUT EVERYONE CAN HELP\nSOMEONE...",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Impact',
                        fontWeight: FontWeight.normal,
                        color: Colors.purple,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Button: Party Goals Object
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SplashScreen1()), // Ensure SplashScreen is correctly defined and imported
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              ),
              child: Row(
                mainAxisSize:
                    MainAxisSize.min, // Adjusts the button size to its content
                children: [
                  const Text(
                    'PARTY GOALS OBJECT',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Impact',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(
                      width: 8), // Space between the text and the arrow
                  CircleAvatar(
                    backgroundColor:
                        Colors.white, // Set the background color to white
                    radius: 15, // Controls the size of the circle
                    child: const Icon(
                      Icons.keyboard_arrow_right_outlined, // Arrow icon
                      color: Colors.purple,
                      size: 30, // Adjust size as needed
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
