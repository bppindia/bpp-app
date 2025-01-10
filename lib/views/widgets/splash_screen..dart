// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   int currentGoalIndex = 0;
//   bool showAnimatedText = false;
//   bool showObjectText = false;
//   bool showGoalDescription = false;
//   bool showTermsPopup = false;
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   Color currentColor = Color(0xFFAF3A94); // Initial color
//
//   final List<Map<String, dynamic>> goalData = [
//     // {
//     //   'title': 'GOAL 1',
//     //   'color': Color(0xFFAF3A94),
//     //   'icon': Icons.business,
//     //   'description': 'BUILD FUTURE AND\nREADY CITIES',
//     //   'note': 'INFRASTRUCTURE AND\nINDUSTRIAL DEVELOPMENT',
//     // },
//     // {
//     //   'title': 'GOAL 2',
//     //   'color': Color(0xFF2BBFD2),
//     //   'icon': Icons.business,
//     //   'description': 'BUILD FUTURE AND\nREADY CITIES',
//     //   'note': 'INFRASTRUCTURE AND\nINDUSTRIAL DEVELOPMENT',
//     // },
//     {
//       'title': 'GOAL 1',
//       'color': Color(0xFF2FBBB3),
//       'icon': Icons.public,
//       'description': 'UNITED AND STRONG',
//       'note': 'NATIONAL INTEGRITY',
//     },
//     {
//       'title': 'GOAL 2',
//       'color': Color(0xFF2357BC),
//       'icon': Icons.people,
//       'description': ' EQUALITY FOR ALL',
//       'note': 'EQUAL OPPORTUNITY',
//     },
//     {
//       'title': 'GOAL 3',
//       'color': Color(0xFF344B9F),
//       'icon': Icons.healing,
//       'description': 'HEALTHIER & HAPPIER',
//       'note': 'GOOD HEALTH AND\nWELL-BEING',
//       'note1': 'WELL-BEING',
//     },
//     {
//       'title': 'GOAL 4',
//       'color': Color(0xFF4C489B),
//       'icon': Icons.healing,
//       'description': ' STAND FOR TRUTH\nAND FAIRNESS',
//       //'description1': ' AND FAIRNESS',
//       'note': 'AGAINST MUSCLE AND\nMONEY POWER',
//       'note1': 'MONEY POWER',
//     },
//     {
//       'title': 'GOAL 5',
//       'color': Color(0xFF733B97),
//       'icon': Icons.healing,
//       'description': '  FREEDOM OF ALL\n  FAITHS AND BELIEFS',
//       // 'description1': '  FAITHS AND',
//       // 'description2': '  BELIEFS',
//       'note': 'UPHOLD SECULARISM',
//     },
//     {
//       'title': 'GOAL 6',
//       'color': Color(0xFFAF3A94),
//       'image': 'assets/images/building2.png', // Path to the image asset
//       'description': 'BUILD FUTURE AND\nREADY CITIES',
//       //'description1': 'READY CITYS',
//       'note': 'INFRASTRUCTURE AND\nINDUSTRIAL DEVELOPMENT',
//       'note1': 'INDUSTRIAL DEVELOPMENT',
//     },
//
//     {
//       'title': 'GOAL 7',
//       'color': Color(0xFFD52127),
//       'icon': Icons.healing,
//       'description': 'CREATE JOB FOR ALL',
//       'note': 'EMPLOYMENT AND\nECONOMIC GROWTH',
//       'note1': 'ECONOMIC GROWTH',
//     },
//     {
//       'title': 'GOAL 8',
//       'color': Color(0xFFF36621),
//       'icon': Icons.healing,
//       'description': ' PROSPEROUS AND\n PEACEFUL SOCIETY',
//       // 'description1': ' PEACEFUL SOCIETY',
//       'note': 'JUSTICE, PEACE, CALM\nAND PROSPERITY',
//       'note1': 'AND PROSPERITY',
//     },
//     {
//       'title': 'GOAL 9',
//       'color': Color(0xFFF6851E),
//       'icon': Icons.healing,
//       'description': '  EMPOWER OUR\n  FARMERS',
//       //  'description1': '  FARMERS',
//       'note': 'UPLIFTMENT OF\nFARMERS',
//       'note1': 'FARMERS',
//     },
//     {
//       'title': 'GOAL 10',
//       'color': Color(0xFFFBB40F),
//       'icon': Icons.healing,
//       'description': '  OPEN SCHOOL TO\n  EVERY CHILD',
//       // 'description1': '  EVERY CHILD',
//       'note': 'QUALITY EDUCATION',
//     },
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );
//
//     _slideAnimation = Tween<Offset>(
//       begin: Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     // Start animations
//     _startAnimationSequence();
//     _startGoalTransition();
//   }
//
//   void _startAnimationSequence() async {
//     await Future.delayed(Duration(milliseconds: 500));
//     if (mounted) {
//       setState(() {
//         showAnimatedText = true;
//       });
//     }
//
//     await Future.delayed(Duration(milliseconds: 800));
//     if (mounted) {
//       setState(() {
//         showGoalDescription = true;
//       });
//     }
//
//     await Future.delayed(Duration(milliseconds: 800));
//     if (mounted) {
//       setState(() {
//         showObjectText = true;
//       });
//     }
//   }
//
//   void _startGoalTransition() {
//     // Initial delay before starting transitions
//     Future.delayed(Duration(seconds: 2), () {
//       if (mounted) {
//         _transitionToNextGoal();
//       }
//     });
//   }
//
//   void _transitionToNextGoal() {
//     setState(() {
//       // Hide content
//       showGoalDescription = false;
//     });
//
//     // Wait for fade out
//     Future.delayed(Duration(milliseconds: 500), () {
//       if (mounted) {
//         setState(() {
//           // Update index and color
//           currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
//           currentColor = goalData[currentGoalIndex]['color'];
//           // Show content
//           showGoalDescription = true;
//         });
//
//         // Schedule next transition if not on last goal
//         if (currentGoalIndex < goalData.length - 1) {
//           Future.delayed(Duration(seconds: 2), () {
//             if (mounted) {
//               _transitionToNextGoal();
//             }
//           });
//         }
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
//   @override
//   Widget build(BuildContext context) {
//     // Get screen dimensions
//     final screenSize = MediaQuery.of(context).size;
//     final screenWidth = screenSize.width;
//     final screenHeight = screenSize.height;
//
//     // Calculate responsive sizes
//     final titleFontSize = screenWidth * 0.09;
//     final goalTitleFontSize = screenWidth * 0.09;
//     final descriptionFontSize = screenWidth * 0.08;
//     final iconSize = screenWidth * 0.18;
//     final spacing = screenHeight * 0.01;
//
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 500),
//       decoration: BoxDecoration(
//         color: currentColor,
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: screenWidth * 0.05,
//                 vertical: screenHeight * 0.14,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Title Section
//                   Center(
//                     child: AnimatedOpacity(
//                       opacity: showAnimatedText ? 1.0 : 0.0,
//                       duration: Duration(milliseconds: 500),
//                       child: Text(
//                         'WHY USE THIS APP',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: titleFontSize,
//                           fontFamily: 'Impact',
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: spacing * 2),
//
//                   // Current Goal Section
//                   AnimatedOpacity(
//                     opacity: showGoalDescription ? 1.0 : 0.0,
//                     duration: Duration(milliseconds: 500),
//                     child: _buildGoalSection(
//                       goalData[currentGoalIndex],
//                       goalTitleFontSize,
//                       descriptionFontSize,
//                       iconSize,
//                       spacing,
//                     ),
//                   ),
//
//                   SizedBox(height: spacing * 2),
//
//                   // Images and Party Object Section
//                   Center(
//                     child: Column(
//                       children: [
//                         // First Image
//                         Image.asset(
//                           'assets/images/wh1.png',
//                           height: screenHeight * 0.05,
//                           fit: BoxFit.contain,
//                         ),
//
//                         SizedBox(height: 14),
//
//                         // Party Object Section
//                         Container(
//                           width: double.infinity,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Party Object Row
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 30),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Image.asset(
//                                       'assets/images/wh2.png',
//                                       height: screenHeight * 0.06,
//                                       fit: BoxFit.contain,
//                                     ),
//                                     SizedBox(width: spacing),
//                                     Text(
//                                       'PARTY OBJECT',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: goalTitleFontSize,
//                                         fontFamily: 'Impact',
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//
//                               SizedBox(height: spacing * 1),
//
//                               // Description Text
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: screenWidth * 0.07,
//                                 ),
//                                 child: Text(
//                                   goalData[currentGoalIndex]['description'] ??
//                                       '',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: descriptionFontSize,
//                                     fontFamily: 'Impact',
//                                     letterSpacing: 0.5,
//                                     height: 1.2,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         SizedBox(height: spacing * 2),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildGoalSection(
//     Map<String, dynamic> goal,
//     double titleSize,
//     double descriptionSize,
//     double iconSize,
//     double spacing,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 20,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 goal['icon'],
//                 color: Colors.white,
//                 size: iconSize,
//               ),
//               SizedBox(width: spacing),
//               Text(
//                 goal['title'],
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: titleSize,
//                   fontFamily: 'Impact',
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: spacing),
//           Padding(
//             padding: EdgeInsets.only(left: 5, bottom: 10),
//             child: Text(
//               goal['note'],
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: descriptionSize * 0.9,
//                 fontFamily: 'Impact',
//                 letterSpacing: 0.5,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//shubham code
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:bpp_frontend/views/login_screen_view.dart';
// import 'package:bpp_frontend/views/sign_up_screen_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   int currentGoalIndex = 0;
//   bool showAnimatedText = false;
//   bool showObjectText = false;
//   bool showGoalDescription = false;
//   bool showTermsPopup = false;
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   Color currentColor = Color(0xFFAF3A94); // Initial color
//   Key _titleKey = UniqueKey(); // Add this for title re-animation
//
//   final List<Map<String, dynamic>> goalData = [
//     {
//       'title': 'GOAL 1',
//       'color': Color(0xFF2FBBB3),
//       'svgImage': 'assets/images/building3.svg',
//       'description': 'UNITED AND STRONG',
//       'note': 'NATIONAL INTEGRITY',
//     },
//     {
//       'title': 'GOAL 2',
//       'color': Color(0xFF2357BC),
//       'svgImage': 'assets/images/users1.svg',
//       'description': 'EQUALITY FOR ALL',
//       'note': 'EQUAL OPPORTUNITY',
//     },
//     {
//       'title': 'GOAL 3',
//       'color': Color(0xFF344B9F),
//       'svgImage': 'assets/images/heart.svg',
//       'description': 'HEALTHIER AND HAPPIER',
//       'note': 'GOOD HEALTH AND\nWELL-BEING',
//       'note1': 'WELL-BEING',
//     },
//     {
//       'title': 'GOAL 4',
//       'color': Color(0xFF4C489B),
//       'svgImage': 'assets/images/sword.svg',
//       'description': ' STAND FOR TRUTH\n AND FAIRNESS',
//       'note': 'AGAINST MUSCLE AND\nMONEY POWER',
//       'note1': 'MONEY POWER',
//     },
//     {
//       'title': 'GOAL 5',
//       'color': Color(0xFF733B97),
//       'svgImage': 'assets/images/church.svg',
//       'description': 'FREEDOM OF ALL\nFAITHS AND BELIEFS',
//       'note': 'UPHOLD SECULARISM',
//     },
//     {
//       'title': 'GOAL 6',
//       'color': Color(0xFFAF3A94),
//       'svgImage': 'assets/images/factory.svg',
//       'description': 'BUILD FUTURE AND\nREADY CITIES',
//       'note': 'INFRASTRUCTURE AND\nINDUSTRIAL DEVELOPMENT',
//       'note1': 'INDUSTRIAL DEVELOPMENT',
//     },
//     {
//       'title': 'GOAL 7',
//       'color': Color(0xFFD52127),
//       'svgImage': 'assets/images/badge-dollar-sign.svg',
//       'description': 'CREATE JOB FOR ALL',
//       'note': 'EMPLOYMENT AND\nECONOMIC GROWTH',
//       'note1': 'ECONOMIC GROWTH',
//     },
//     {
//       'title': 'GOAL 8',
//       'color': Color(0xFFF36621),
//       'svgImage': 'assets/images/scale.svg',
//       'description': ' PROSPEROUS AND\n PEACEFUL SOCIETY',
//       'note': 'JUSTICE, PEACE, CALM\nAND PROSPERITY',
//       'note1': 'AND PROSPERITY',
//     },
//     {
//       'title': 'GOAL 9',
//       'color': Color(0xFFF6851E),
//       'svgImage': 'assets/images/wheat.svg',
//       'description': 'EMPOWER OUR\nFARMERS',
//       'note': 'UPLIFTMENT OF\nFARMERS',
//       'note1': 'FARMERS',
//     },
//     {
//       'title': 'GOAL 10',
//       'color': Color(0xFFFBB40F),
//       'svgImage': 'assets/images/graduation-cap.svg',
//       'description': 'OPEN SCHOOL TO\nEVERY CHILD',
//       'note': 'QUALITY EDUCATION',
//     },
//   ];
//
//   late Animation<Offset> _partyObjectSlideAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );
//
//     _slideAnimation = Tween<Offset>(
//       begin: Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     // Add this animation for the party object
//     _partyObjectSlideAnimation = Tween<Offset>(
//       begin: Offset(-1.0, 0.0), // Start from left
//       end: Offset.zero, // End at normal position
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     // Start animations
//     _startAnimationSequence();
//     _startGoalTransition();
//     _controller.forward();
//   }
//
//   void _startAnimationSequence() async {
//     await Future.delayed(Duration(milliseconds: 500));
//     if (mounted) {
//       setState(() {
//         showAnimatedText = true;
//       });
//     }
//
//     await Future.delayed(Duration(milliseconds: 800));
//     if (mounted) {
//       setState(() {
//         showGoalDescription = true;
//       });
//     }
//
//     await Future.delayed(Duration(milliseconds: 800));
//     if (mounted) {
//       setState(() {
//         showObjectText = true;
//       });
//     }
//   }
//
//   void _startGoalTransition() {
//     Future.delayed(Duration(seconds: 4), () {
//       if (mounted) {
//         _transitionToNextGoal();
//       }
//     });
//   }
//
//   void _transitionToNextGoal() {
//     setState(() {
//       // Hide content and force title re-animation
//       showGoalDescription = false;
//       _titleKey = UniqueKey();
//     });
//
//     // Wait for fade out
//     Future.delayed(Duration(milliseconds: 720), () {
//       if (mounted) {
//         setState(() {
//           // Update index and color
//           currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
//           currentColor = goalData[currentGoalIndex]['color'];
//           // Show content
//           showGoalDescription = true;
//         });
//
//         // Schedule next transition (infinite loop)
//         Future.delayed(Duration(seconds: 2), () {
//           if (mounted) {
//             _transitionToNextGoal();
//           }
//         });
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
// //   @override
// //   Widget build(BuildContext context) {
// //     final screenSize = MediaQuery.of(context).size;
// //     final screenWidth = screenSize.width;
// //     final screenHeight = screenSize.height;
// //
// //     final titleFontSize = screenWidth * 0.11;
// //     final goalTitleFontSize = screenWidth * 0.09;
// //     final descriptionFontSize = screenWidth * 0.09;
// //     final iconSize = screenWidth * 0.18;
// //     final spacing = screenHeight * 0.01;
// //
// //     return AnimatedContainer(
// //       duration: Duration(milliseconds: 500),
// //       decoration: BoxDecoration(
// //         color: currentColor,
// //       ),
// //       child: Scaffold(
// //         backgroundColor: Colors.transparent,
// //         body: SafeArea(
// //           child: SingleChildScrollView(
// //             child: Padding(
// //               padding: EdgeInsets.symmetric(
// //                 horizontal: screenWidth * 0.05,
// //                 vertical: screenHeight * 0.14,
// //               ),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   // Title Section with re-animation
// //                   Center(
// //                     child: AnimatedTextKit(
// //                       key: _titleKey, // Key for re-animation
// //                       animatedTexts: [
// //                         TypewriterAnimatedText(
// //                           'WHY USE THIS APP',
// //                           textStyle: TextStyle(
// //                             color: Colors.white,
// //                             fontSize: titleFontSize,
// //                             fontFamily: 'Impact',
// //                           ),
// //                           textAlign: TextAlign.center,
// //                           speed: const Duration(milliseconds: 100),
// //                         ),
// //                       ],
// //                       totalRepeatCount: 1,
// //                       pause: const Duration(milliseconds: 500),
// //                       displayFullTextOnTap: true,
// //                     ),
// //                   ),
// //
// //                   SizedBox(height: spacing * 5),
// //
// //                   // Current Goal Section
// //                   AnimatedOpacity(
// //                     opacity: showGoalDescription ? 1.0 : 0.0,
// //                     duration: Duration(milliseconds: 500),
// //                     child: _buildGoalSection(
// //                       goalData[currentGoalIndex],
// //                       goalTitleFontSize,
// //                       descriptionFontSize,
// //                       iconSize,
// //                       spacing,
// //                     ),
// //                   ),
// //
// //                   SizedBox(height: spacing * 2),
// //
// //                   // Images and Party Object Section
// //                   Center(
// //                     child: Column(
// //                       children: [
// //                         // First Image
// //                         Image.asset(
// //                           'assets/images/wh1.png',
// //                           height: screenHeight * 0.05,
// //                           fit: BoxFit.contain,
// //                         ),
// //
// //                         // Party Object Section
// //                         SlideTransition(
// //                           position:
// //                               _partyObjectSlideAnimation, // Using the animation we defined in initState
// //                           child: Container(
// //                             width: double.infinity,
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 // Party Object Row
// //                                 Padding(
// //                                   padding: const EdgeInsets.only(right: 30),
// //                                   child: Row(
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     children: [
// //                                       Image.asset(
// //                                         'assets/images/wh2.png',
// //                                         height: screenHeight * 0.06,
// //                                         fit: BoxFit.contain,
// //                                       ),
// //                                       SizedBox(width: spacing),
// //                                       Text(
// //                                         'PARTY OBJECT',
// //                                         style: TextStyle(
// //                                           color: Colors.white,
// //                                           fontSize: goalTitleFontSize,
// //                                           fontFamily: 'Impact',
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //
// //                                 SizedBox(height: spacing * 1),
// //
// //                                 // Description Text
// //                                 Padding(
// //                                   padding: EdgeInsets.symmetric(
// //                                     horizontal: screenWidth * 0.07,
// //                                   ),
// //                                   child: Text(
// //                                     goalData[currentGoalIndex]['description'] ??
// //                                         '',
// //                                     style: TextStyle(
// //                                       color: Colors.white,
// //                                       fontSize: descriptionFontSize,
// //                                       fontFamily: 'Impact',
// //                                       letterSpacing: 0.5,
// //                                       height: 1.2,
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //
// //                         SizedBox(height: spacing * 2),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildGoalSection(
// //     Map<String, dynamic> goal,
// //     double titleSize,
// //     double descriptionSize,
// //     double iconSize,
// //     double spacing,
// //   ) {
// //     return Padding(
// //       padding: const EdgeInsets.only(
// //         left: 20,
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Row that will be animated
// //           TweenAnimationBuilder<Offset>(
// //             tween: Tween<Offset>(
// //               begin: Offset(-1, 0), // Start position off-screen left
// //               end: Offset.zero, // End position on-screen
// //             ),
// //             duration: Duration(seconds: 1), // Animation duration
// //             curve: Curves.easeInOut, // Smooth easing curve
// //             builder: (context, offset, child) {
// //               return Row(
// //                 children: [
// //                   // Image or SVG icon with slide animation
// //                   if (goal.containsKey('svgImage') && goal['svgImage'] != null)
// //                     SlideTransition(
// //                       position: AlwaysStoppedAnimation(offset),
// //                       child: SvgPicture.asset(
// //                         goal['svgImage'],
// //                         height: iconSize,
// //                         color: Colors.white,
// //                         width: iconSize,
// //                         fit: BoxFit.cover,
// //                       ),
// //                     )
// //                   else if (goal.containsKey('image') && goal['image'] != null)
// //                     SlideTransition(
// //                       position: AlwaysStoppedAnimation(offset),
// //                       child: Image.asset(
// //                         goal['image'],
// //                         height: iconSize,
// //                         color: Colors.white,
// //                         width: iconSize,
// //                         fit: BoxFit.cover,
// //                       ),
// //                     )
// //                   else if (goal.containsKey('icon') && goal['icon'] != null)
// //                     SlideTransition(
// //                       position: AlwaysStoppedAnimation(offset),
// //                       child: Icon(
// //                         goal['icon'],
// //                         color: Colors.white,
// //                         size: iconSize,
// //                       ),
// //                     ),
// //                   SizedBox(width: spacing),
// //                   // Goal title
// //                   Text(
// //                     goal['title'],
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: titleSize,
// //                       fontFamily: 'Impact',
// //                     ),
// //                   ),
// //                 ],
// //               );
// //             },
// //           ),
// //           SizedBox(height: spacing),
// //           Padding(
// //             padding: EdgeInsets.only(left: 5, bottom: 10),
// //             child: Text(
// //               goal['note'],
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: descriptionSize * 0.9,
// //                 fontFamily: 'Impact',
// //                 letterSpacing: 0.5,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final screenWidth = screenSize.width;
//     final screenHeight = screenSize.height;
//
//     final titleFontSize = screenWidth * 0.11;
//     final goalTitleFontSize = screenWidth * 0.09;
//     final descriptionFontSize = screenWidth * 0.09;
//     final iconSize = screenWidth * 0.18;
//     final spacing = screenHeight * 0.01;
//
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 500),
//       decoration: BoxDecoration(
//         color: currentColor,
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.05,
//                       vertical: screenHeight * 0.14,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Title Section with re-animation
//                         Center(
//                           child: AnimatedTextKit(
//                             key: _titleKey,
//                             animatedTexts: [
//                               TypewriterAnimatedText(
//                                 'WHY USE THIS APP',
//                                 textStyle: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: titleFontSize,
//                                   fontFamily: 'Impact',
//                                 ),
//                                 textAlign: TextAlign.center,
//                                 speed: const Duration(milliseconds: 100),
//                               ),
//                             ],
//                             totalRepeatCount: 1,
//                             pause: const Duration(milliseconds: 500),
//                             displayFullTextOnTap: true,
//                           ),
//                         ),
//
//                         SizedBox(height: spacing * 5),
//
//                         // Current Goal Section
//                         AnimatedOpacity(
//                           opacity: showGoalDescription ? 1.0 : 0.0,
//                           duration: Duration(milliseconds: 500),
//                           child: _buildGoalSection(
//                             goalData[currentGoalIndex],
//                             goalTitleFontSize,
//                             descriptionFontSize,
//                             iconSize,
//                             spacing,
//                           ),
//                         ),
//
//                         SizedBox(height: spacing * 2),
//
//                         // Images and Party Object Section
//                         Center(
//                           child: Column(
//                             children: [
//                               // First Image
//                               Image.asset(
//                                 'assets/images/wh1.png',
//                                 height: screenHeight * 0.05,
//                                 fit: BoxFit.contain,
//                               ),
//
//                               // Party Object Section
//                               SlideTransition(
//                                 position: _partyObjectSlideAnimation,
//                                 child: Container(
//                                   width: double.infinity,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       // Party Object Row
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(right: 30),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Image.asset(
//                                               'assets/images/wh2.png',
//                                               height: screenHeight * 0.06,
//                                               fit: BoxFit.contain,
//                                             ),
//                                             SizedBox(width: spacing),
//                                             Text(
//                                               'PARTY OBJECT',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: goalTitleFontSize,
//                                                 fontFamily: 'Impact',
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//
//                                       SizedBox(height: spacing * 1),
//
//                                       // Description Text
//                                       Padding(
//                                         padding: EdgeInsets.symmetric(
//                                           horizontal: screenWidth * 0.07,
//                                         ),
//                                         child: Text(
//                                           goalData[currentGoalIndex]
//                                                   ['description'] ??
//                                               '',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: descriptionFontSize,
//                                             fontFamily: 'Impact',
//                                             letterSpacing: 0.5,
//                                             height: 1.2,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               SizedBox(height: spacing * 2),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//
//               // Footer with Sign In and Sign Up buttons
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _buildButton(
//                       'Sign In',
//                       () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => LoginScreenView()),
//                       ),
//                     ),
//                     _buildButton(
//                       'Sign Up',
//                       () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => SignUpScreenView()),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildButton(String label, VoidCallback onPressed) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         foregroundColor: Colors.black,
//         backgroundColor: Colors.white,
//         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       child: Text(
//         label,
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildGoalSection(
//     Map<String, dynamic> goal,
//     double titleSize,
//     double descriptionSize,
//     double iconSize,
//     double spacing,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 20,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Row that will be animated
//           TweenAnimationBuilder<Offset>(
//             tween: Tween<Offset>(
//               begin: Offset(-1, 0), // Start position off-screen left
//               end: Offset.zero, // End position on-screen
//             ),
//             duration: Duration(seconds: 1), // Animation duration
//             curve: Curves.easeInOut, // Smooth easing curve
//             builder: (context, offset, child) {
//               return Row(
//                 children: [
//                   // Image or SVG icon with slide animation
//                   if (goal.containsKey('svgImage') && goal['svgImage'] != null)
//                     SlideTransition(
//                       position: AlwaysStoppedAnimation(offset),
//                       child: SvgPicture.asset(
//                         goal['svgImage'],
//                         height: iconSize,
//                         color: Colors.white,
//                         width: iconSize,
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   else if (goal.containsKey('image') && goal['image'] != null)
//                     SlideTransition(
//                       position: AlwaysStoppedAnimation(offset),
//                       child: Image.asset(
//                         goal['image'],
//                         height: iconSize,
//                         color: Colors.white,
//                         width: iconSize,
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   else if (goal.containsKey('icon') && goal['icon'] != null)
//                     SlideTransition(
//                       position: AlwaysStoppedAnimation(offset),
//                       child: Icon(
//                         goal['icon'],
//                         color: Colors.white,
//                         size: iconSize,
//                       ),
//                     ),
//                   SizedBox(width: spacing),
//                   // Goal title
//                   Text(
//                     goal['title'],
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: titleSize,
//                       fontFamily: 'Impact',
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//           SizedBox(height: spacing),
//           Padding(
//             padding: EdgeInsets.only(left: 5, bottom: 10),
//             child: Text(
//               goal['note'],
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: descriptionSize * 0.9,
//                 fontFamily: 'Impact',
//                 letterSpacing: 0.5,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:bpp_frontend/views/login_screen_view.dart';
// import 'package:bpp_frontend/views/sign_up_screen_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   int currentGoalIndex = 0;
//   bool showTitle = false;
//   bool showGoalData = false;
//   bool showImages = false;
//   bool showPartyObject = false;
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   Color currentColor = Color(0xFFAF3A94);
//   Key _titleKey = UniqueKey();
//   Key _goalKey = UniqueKey();
//   Key _partyObjectKey = UniqueKey();
//
//   final List<Map<String, dynamic>> goalData = [
//     {
//       'title': 'GOAL 1',
//       'color': Color(0xFF2FBBB3),
//       'svgImage': 'assets/images/building3.svg',
//       'description': 'UNITED AND STRONG',
//       'note': 'NATIONAL INTEGRITY',
//     },
//     {
//       'title': 'GOAL 2',
//       'color': Color(0xFF2357BC),
//       'svgImage': 'assets/images/users1.svg',
//       'description': 'EQUALITY FOR ALL',
//       'note': 'EQUAL OPPORTUNITY',
//     },
//     {
//       'title': 'GOAL 3',
//       'color': Color(0xFF344B9F),
//       'svgImage': 'assets/images/heart.svg',
//       'description': 'HEALTHIER AND HAPPIER',
//       'note': 'GOOD HEALTH AND\nWELL-BEING',
//     },
//     {
//       'title': 'GOAL 4',
//       'color': Color(0xFF4C489B),
//       'svgImage': 'assets/images/sword.svg',
//       'description': ' STAND FOR TRUTH\n AND FAIRNESS',
//       'note': 'AGAINST MUSCLE AND\nMONEY POWER',
//     },
//     {
//       'title': 'GOAL 5',
//       'color': Color(0xFF733B97),
//       'svgImage': 'assets/images/church.svg',
//       'description': 'FREEDOM OF ALL\nFAITHS AND BELIEFS',
//       'note': 'UPHOLD SECULARISM',
//     },
//     {
//       'title': 'GOAL 6',
//       'color': Color(0xFFAF3A94),
//       'svgImage': 'assets/images/factory.svg',
//       'description': 'BUILD FUTURE AND\nREADY CITIES',
//       'note': 'INFRASTRUCTURE AND\nINDUSTRIAL DEVELOPMENT',
//     },
//     {
//       'title': 'GOAL 7',
//       'color': Color(0xFFD52127),
//       'svgImage': 'assets/images/badge-dollar-sign.svg',
//       'description': 'CREATE JOB FOR ALL',
//       'note': 'EMPLOYMENT AND\nECONOMIC GROWTH',
//     },
//     {
//       'title': 'GOAL 8',
//       'color': Color(0xFFF36621),
//       'svgImage': 'assets/images/scale.svg',
//       'description': ' PROSPEROUS AND\n PEACEFUL SOCIETY',
//       'note': 'JUSTICE, PEACE, CALM\nAND PROSPERITY',
//     },
//     {
//       'title': 'GOAL 9',
//       'color': Color(0xFFF6851E),
//       'svgImage': 'assets/images/wheat.svg',
//       'description': 'EMPOWER OUR\nFARMERS',
//       'note': 'UPLIFTMENT OF\nFARMERS',
//     },
//     {
//       'title': 'GOAL 10',
//       'color': Color(0xFFFBB40F),
//       'svgImage': 'assets/images/graduation-cap.svg',
//       'description': 'OPEN SCHOOL TO\nEVERY CHILD',
//       'note': 'QUALITY EDUCATION',
//     },
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 800),
//     );
//
//     _fadeAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     ));
//
//     _startAnimationSequence();
//   }
//
//   void _resetAnimations() {
//     setState(() {
//       showGoalData = false;
//       showImages = false;
//       showPartyObject = false;
//       _goalKey = UniqueKey();
//       _partyObjectKey = UniqueKey();
//     });
//
//     _controller.reset();
//   }
//
//   void _startAnimationSequence() async {
//     // Show title first
//     await Future.delayed(Duration(milliseconds: 500));
//     if (mounted) {
//       setState(() {
//         showTitle = true;
//       });
//     }
//
//     // Show goal data after title
//     await Future.delayed(Duration(milliseconds: 500));
//     if (mounted) {
//       setState(() {
//         showGoalData = true;
//       });
//     }
//
//     // Show images after goal data
//     await Future.delayed(Duration(milliseconds: 800));
//     if (mounted) {
//       setState(() {
//         showImages = true;
//       });
//     }
//
//     // Show party object after images
//     await Future.delayed(Duration(milliseconds: 800));
//     if (mounted) {
//       setState(() {
//         showPartyObject = true;
//       });
//       _controller.forward();
//     }
//
//     // Transition to the next goal after a delay
//     await Future.delayed(Duration(seconds: 4));
//     if (mounted) {
//       _transitionToNextGoal();
//     }
//   }
//
//   void _transitionToNextGoal() {
//     _resetAnimations();
//
//     Future.delayed(Duration(milliseconds: 300), () {
//       if (mounted) {
//         setState(() {
//           currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
//           currentColor = goalData[currentGoalIndex]['color'];
//         });
//
//         // Trigger the sequence again for the next goal
//         _startAnimationSequence();
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
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final screenWidth = screenSize.width;
//     final screenHeight = screenSize.height;
//
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 500),
//       decoration: BoxDecoration(color: currentColor),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.05,
//                       vertical: screenHeight * 0.14,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Animated Title
//                         AnimatedOpacity(
//                           opacity: showTitle ? 1.0 : 0.0,
//                           duration: Duration(milliseconds: 800),
//                           child: Center(
//                             child: AnimatedTextKit(
//                               key: _titleKey,
//                               animatedTexts: [
//                                 TypewriterAnimatedText(
//                                   'WHY USE THIS APP',
//                                   textStyle: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: screenWidth * 0.11,
//                                     fontFamily: 'Impact',
//                                   ),
//                                   speed: Duration(milliseconds: 100),
//                                 ),
//                               ],
//                               totalRepeatCount: 1,
//                               displayFullTextOnTap: true,
//                             ),
//                           ),
//                         ),
//
//                         SizedBox(height: screenHeight * 0.05),
//
//                         // Animated Goal Section
//                         AnimatedOpacity(
//                           opacity: showGoalData ? 1.0 : 0.0,
//                           duration: Duration(milliseconds: 800),
//                           child: SlideTransition(
//                             position: Tween<Offset>(
//                               begin: Offset(
//                                   -1.0, 0.0), // Starts off-screen to the left
//                               end: Offset.zero, // Ends in its natural position
//                             ).animate(CurvedAnimation(
//                               parent:
//                                   _controller, // Assuming _controller is your animation controller
//                               curve: Curves.easeInOut, // Smooth easing
//                             )),
//                             child: _buildGoalSection(
//                               goalData[currentGoalIndex],
//                               screenWidth * 0.09,
//                               screenWidth * 0.09,
//                               screenWidth * 0.18,
//                               screenHeight * 0.01,
//                             ),
//                           ),
//                         ),
//
//                         SizedBox(height: screenHeight * 0.02),
//
//                         // Animated Images
//                         AnimatedOpacity(
//                           opacity: showImages ? 1.0 : 0.0,
//                           duration: Duration(milliseconds: 800),
//                           child: Center(
//                             child: Image.asset(
//                               'assets/images/wh1.png',
//                               height: screenHeight * 0.05,
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//
//                         //  Animated Party Object
//                         AnimatedOpacity(
//                           opacity: showPartyObject ? 1.0 : 0.0,
//                           duration: Duration(milliseconds: 800),
//                           child: SlideTransition(
//                             position: Tween<Offset>(
//                               begin: Offset(-1.0, 0.0),
//                               end: Offset.zero,
//                             ).animate(_controller),
//                             child: _buildPartyObjectSection(
//                               screenWidth,
//                               screenHeight,
//                               goalData[currentGoalIndex],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//
//               // Footer buttons
//               _buildFooterButtons(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildGoalSection(
//     Map<String, dynamic> goal,
//     double titleSize,
//     double descriptionSize,
//     double iconSize,
//     double spacing,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20),
//       child: Column(
//         key: _goalKey,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               if (goal.containsKey('svgImage') && goal['svgImage'] != null)
//                 SvgPicture.asset(
//                   goal['svgImage'],
//                   height: iconSize,
//                   color: Colors.white,
//                   width: iconSize,
//                   fit: BoxFit.cover,
//                 ),
//               SizedBox(width: spacing),
//               Text(
//                 goal['title'] ?? '',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: titleSize,
//                   fontFamily: 'Impact',
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: spacing),
//           Padding(
//             padding: EdgeInsets.only(left: 5, bottom: 10),
//             child: Text(
//               goal['note'] ?? '',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: descriptionSize * 0.9,
//                 fontFamily: 'Impact',
//                 letterSpacing: 0.5,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPartyObjectSection(
//       double screenWidth, double screenHeight, Map<String, dynamic> goal) {
//     return Column(
//       key: _partyObjectKey,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/wh2.png',
//               height: screenHeight * 0.06,
//               fit: BoxFit.contain,
//             ),
//             SizedBox(width: screenWidth * 0.02),
//             Text(
//               'PARTY OBJECT',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: screenWidth * 0.09,
//                 fontFamily: 'Impact',
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: screenHeight * 0.01),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0),
//           child: Text(
//             goal['description'] ?? '',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: screenWidth * 0.09,
//               fontFamily: 'Impact',
//               letterSpacing: 0.5,
//               height: 1.2,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildFooterButtons() {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _buildButton(
//               'Sign In',
//               () => Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => LoginScreenView()),
//                   )),
//           _buildButton(
//               'Sign Up',
//               () => Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SignUpScreenView()),
//                   )),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildButton(String label, VoidCallback onPressed) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         foregroundColor: Colors.black,
//         backgroundColor: Colors.white,
//         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       child: Text(
//         label,
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bpp_frontend/views/login_screen_view.dart';
import 'package:bpp_frontend/views/sign_up_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  int currentGoalIndex = 0;
  bool showTitle = false;
  bool showGoalData = false;
  bool showImages = false;
  bool showPartyObject = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  Color currentColor = Color(0xFFAF3A94);
  Key _titleKey = UniqueKey();
  Key _goalKey = UniqueKey();
  Key _partyObjectKey = UniqueKey();

  final List<Map<String, dynamic>> goalData = [
    {
      'title': 'GOAL 1',
      'color': Color(0xFF2FBBB3),
      'svgImage': 'assets/images/building3.svg',
      'description': 'UNITED AND STRONG',
      'note': 'NATIONAL INTEGRITY',
    },
    {
      'title': 'GOAL 2',
      'color': Color(0xFF2357BC),
      'svgImage': 'assets/images/users1.svg',
      'description': 'EQUALITY FOR ALL',
      'note': 'EQUAL OPPORTUNITY',
    },
    {
      'title': 'GOAL 3',
      'color': Color(0xFF344B9F),
      'svgImage': 'assets/images/heart.svg',
      'description': 'HEALTHIER AND HAPPIER',
      'note': 'GOOD HEALTH AND\nWELL-BEING',
    },
    {
      'title': 'GOAL 4',
      'color': Color(0xFF4C489B),
      'svgImage': 'assets/images/sword.svg',
      'description': ' STAND FOR TRUTH\n AND FAIRNESS',
      'note': 'AGAINST MUSCLE AND\nMONEY POWER',
    },
    {
      'title': 'GOAL 5',
      'color': Color(0xFF733B97),
      'svgImage': 'assets/images/church.svg',
      'description': 'FREEDOM OF ALL\nFAITHS AND BELIEFS',
      'note': 'UPHOLD SECULARISM',
    },
    {
      'title': 'GOAL 6',
      'color': Color(0xFFAF3A94),
      'svgImage': 'assets/images/factory.svg',
      'description': 'BUILD FUTURE AND\nREADY CITIES',
      'note': 'INFRASTRUCTURE AND\nINDUSTRIAL DEVELOPMENT',
    },
    {
      'title': 'GOAL 7',
      'color': Color(0xFFD52127),
      'svgImage': 'assets/images/badge-dollar-sign.svg',
      'description': 'CREATE JOB FOR ALL',
      'note': 'EMPLOYMENT AND\nECONOMIC GROWTH',
    },
    {
      'title': 'GOAL 8',
      'color': Color(0xFFF36621),
      'svgImage': 'assets/images/scale.svg',
      'description': ' PROSPEROUS AND\n PEACEFUL SOCIETY',
      'note': 'JUSTICE, PEACE, CALM\nAND PROSPERITY',
    },
    {
      'title': 'GOAL 9',
      'color': Color(0xFFF6851E),
      'svgImage': 'assets/images/wheat.svg',
      'description': 'EMPOWER OUR\nFARMERS',
      'note': 'UPLIFTMENT OF\nFARMERS',
    },
    {
      'title': 'GOAL 10',
      'color': Color(0xFFFBB40F),
      'svgImage': 'assets/images/graduation-cap.svg',
      'description': 'OPEN SCHOOL TO\nEVERY CHILD',
      'note': 'QUALITY EDUCATION',
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _startAnimationSequence();
  }

  void _resetAnimations() {
    setState(() {
      showGoalData = false;
      showImages = false;
      showPartyObject = false;
      _goalKey = UniqueKey();
      _partyObjectKey = UniqueKey();
    });

    //  _controller.reset();
  }

  void _startAnimationSequence() async {
    // Show title first
    await Future.delayed(Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        showTitle = true;
      });
    }

    // Show goal data after title
    await Future.delayed(Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        showGoalData = true;
      });
    }

    // Show images after goal data
    await Future.delayed(Duration(milliseconds: 800));
    if (mounted) {
      setState(() {
        showImages = true;
      });
    }

    // Show party object after images
    await Future.delayed(Duration(milliseconds: 800));
    if (mounted) {
      setState(() {
        showPartyObject = true;
      });
      _controller.forward();
    }

    // Transition to the next goal after a delay
    await Future.delayed(Duration(seconds: 4));
    if (mounted) {
      _transitionToNextGoal();
    }
  }

  void _transitionToNextGoal() {
    _resetAnimations();

    Future.delayed(Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
          currentColor = goalData[currentGoalIndex]['color'];
        });

        // Trigger the sequence again for the next goal
        _startAnimationSequence();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(color: currentColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Animated Title
                        AnimatedOpacity(
                          opacity: showTitle ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 800),
                          child: Center(
                            child: AnimatedTextKit(
                              key: _titleKey,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'WHY USE THIS APP',
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.11,
                                    fontFamily: 'Impact',
                                  ),
                                  speed: Duration(milliseconds: 100),
                                ),
                              ],
                              totalRepeatCount: 1,
                              displayFullTextOnTap: true,
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.05),

                        // Animated Goal Section
                        AnimatedOpacity(
                          opacity: showGoalData ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 800),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(
                                  -1.0, 0.0), // Starts off-screen to the left
                              end: Offset.zero, // Ends in its natural position
                            ).animate(CurvedAnimation(
                              parent:
                                  _controller, // Assuming _controller is your animation controller
                              curve: Curves.easeInOut, // Smooth easing
                            )),
                            child: _buildGoalSection(
                              goalData[currentGoalIndex],
                              screenWidth * 0.09,
                              screenWidth * 0.09,
                              screenWidth * 0.18,
                              screenHeight * 0.01,
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.02),

                        // Animated Images
                        AnimatedOpacity(
                          opacity: showImages ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 800),
                          child: Center(
                            child: Image.asset(
                              'assets/images/wh1.png',
                              height: screenHeight * 0.05,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        //  Animated Party Object
                        AnimatedOpacity(
                          opacity: showPartyObject ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 800),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(-1.0, 0.0),
                              end: Offset.zero,
                            ).animate(_controller),
                            child: _buildPartyObjectSection(
                              screenWidth,
                              screenHeight,
                              goalData[currentGoalIndex],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Footer buttons
              _buildFooterButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoalSection(
    Map<String, dynamic> goal,
    double titleSize,
    double descriptionSize,
    double iconSize,
    double spacing,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        key: _goalKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (goal.containsKey('svgImage') && goal['svgImage'] != null)
                SvgPicture.asset(
                  goal['svgImage'],
                  height: iconSize,
                  color: Colors.white,
                  width: iconSize,
                  fit: BoxFit.cover,
                ),
              SizedBox(width: spacing),
              Text(
                goal['title'] ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleSize,
                  fontFamily: 'Impact',
                ),
              ),
            ],
          ),
          SizedBox(height: spacing),
          Padding(
            padding: EdgeInsets.only(left: 5, bottom: 10),
            child: Text(
              goal['note'] ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: descriptionSize * 0.9,
                fontFamily: 'Impact',
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartyObjectSection(
      double screenWidth, double screenHeight, Map<String, dynamic> goal) {
    return Column(
      key: _partyObjectKey,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/wh2.png',
              height: screenHeight * 0.06,
              fit: BoxFit.contain,
            ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              'PARTY OBJECT',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.09,
                fontFamily: 'Impact',
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0),
          child: Text(
            goal['description'] ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.09,
              fontFamily: 'Impact',
              letterSpacing: 0.5,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooterButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton(
            'Sign In',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreenView()),
            ),
          ),
          _buildButton(
            'Sign Up',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreenView()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: currentColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
