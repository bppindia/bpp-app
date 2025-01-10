// import 'package:flutter/material.dart';
//
// class TermsPopup extends StatefulWidget {
//   final VoidCallback? onAccept;
//   final VoidCallback? onCancel;
//
//   const TermsPopup({Key? key, this.onAccept, this.onCancel}) : super(key: key);
//
//   @override
//   _TermsPopupState createState() => _TermsPopupState();
// }
//
// class _TermsPopupState extends State<TermsPopup>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   bool _isWallpaperEnabled = true;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _slideAnimation = Tween<Offset>(
//       begin: Offset(0, 1),
//       end: Offset(0, 0),
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     Future.delayed(Duration(milliseconds: 200), () {
//       _controller.forward();
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
//     return SlideTransition(
//       position: _slideAnimation,
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Terms and Conditions Row
//                 Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.blue,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(Icons.check, color: Colors.white, size: 20),
//                     ),
//                     SizedBox(width: 15),
//                     Expanded(
//                       child: RichText(
//                         text: TextSpan(
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.black87,
//                           ),
//                           children: [
//                             TextSpan(text: 'By continuing, you agree to the '),
//                             TextSpan(
//                               text: 'Terms and Conditions',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                             TextSpan(text: ' and '),
//                             TextSpan(
//                               text: 'Privacy Policy',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                             TextSpan(text: '.'),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//
//                 // Wallpaper Option Row
//                 Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.blue,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(Icons.check, color: Colors.white, size: 20),
//                     ),
//                     SizedBox(width: 15),
//                     Expanded(
//                       child: Text(
//                         '',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 25),
//
//                 // Buttons Row
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           _controller.reverse().then((_) {
//                             if (widget.onCancel != null) {
//                               widget.onCancel!();
//                             }
//                           });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.grey[200],
//                           foregroundColor: Colors.black87,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.symmetric(vertical: 15),
//                         ),
//                         child: Text('Cancel'),
//                       ),
//                     ),
//                     SizedBox(width: 15),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           _controller.reverse().then((_) {
//                             if (widget.onAccept != null) {
//                               widget.onAccept!();
//                             }
//                           });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.symmetric(vertical: 15),
//                         ),
//                         child: Text('Continue'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
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
//       home: SplashScreen1(),
//     );
//   }
// }
//
// class SplashScreen1 extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen1>
//     with SingleTickerProviderStateMixin {
//   int currentGoalIndex = 0;
//   bool showAnimatedText = false;
//   bool showObjectText = false;
//   bool showGoalDescription = false;
//   bool showTermsPopup = false;
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   late Animation<Offset> _partyObjectSlideAnimation;
//   Color currentColor = Color(0xFFAF3A94);
//   Key _titleKey = UniqueKey();
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
//       'description': 'STAND FOR TRUTH\nAND FAIRNESS',
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
//       'description': 'PROSPEROUS AND\nPEACEFUL SOCIETY',
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
//     _slideAnimation = Tween<Offset>(
//       begin: Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     _partyObjectSlideAnimation = Tween<Offset>(
//       begin: Offset(-1.0, 0.0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     _startAnimationSequence();
//     _startGoalTransition();
//   }
//
//   void _startAnimationSequence() async {
//     _controller.reset();
//     await Future.delayed(Duration(milliseconds: 500));
//     if (mounted) {
//       setState(() {
//         showAnimatedText = true;
//       });
//       _controller.forward();
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
//       showGoalDescription = false;
//       showObjectText = false;
//       _titleKey = UniqueKey();
//       _controller.reset();
//     });
//
//     Future.delayed(Duration(milliseconds: 720), () {
//       if (mounted) {
//         setState(() {
//           currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
//           currentColor = goalData[currentGoalIndex]['color'];
//           showGoalDescription = true;
//           showObjectText = true;
//         });
//         _controller.forward();
//
//         Future.delayed(Duration(seconds: 3), () {
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
//                         SizedBox(height: spacing * 3),
//                         // AnimatedOpacity(
//                         //   opacity: showGoalDescription ? 1.0 : 0.0,
//                         //   duration: Duration(milliseconds: 500),
//                         //   child: _buildGoalSection(
//                         //     goalData[currentGoalIndex],
//                         //     goalTitleFontSize,
//                         //     descriptionFontSize,
//                         //     iconSize,
//                         //     spacing,
//                         //   ),
//                         // ),
//                         AnimatedOpacity(
//                           opacity: showObjectText ? 1.0 : 0.0,
//                           duration: Duration(milliseconds: 500),
//                           child: SlideTransition(
//                             position: _partyObjectSlideAnimation,
//                             child: Container(
//                               width: double.infinity,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: screenWidth * 0.07,
//                                     ),
//                                     child: _buildGoalSection(
//                                       goalData[currentGoalIndex],
//                                       goalTitleFontSize,
//                                       descriptionFontSize,
//                                       iconSize,
//                                       spacing,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: spacing * 1),
//                         Center(
//                           child: Column(
//                             children: [
//                               Image.asset(
//                                 'assets/images/wh1.png',
//                                 height: screenHeight * 0.05,
//                                 fit: BoxFit.contain,
//                               ),
//                               SizedBox(height: 10),
//                               AnimatedOpacity(
//                                 opacity: showObjectText ? 1.0 : 0.0,
//                                 duration: Duration(milliseconds: 500),
//                                 child: SlideTransition(
//                                   position: _partyObjectSlideAnimation,
//                                   child: Container(
//                                     width: double.infinity,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(right: 30),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Image.asset(
//                                                 'assets/images/wh2.png',
//                                                 height: screenHeight * 0.06,
//                                                 fit: BoxFit.contain,
//                                               ),
//                                               SizedBox(width: spacing),
//                                               Text(
//                                                 'PARTY OBJECT',
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: goalTitleFontSize,
//                                                   fontFamily: 'Impact',
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(height: spacing * 1),
//                                         Padding(
//                                           padding: EdgeInsets.symmetric(
//                                             horizontal: screenWidth * 0.07,
//                                           ),
//                                           child: Text(
//                                             goalData[currentGoalIndex]
//                                                     ['description'] ??
//                                                 '',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: descriptionFontSize,
//                                               fontFamily: 'Impact',
//                                               letterSpacing: 0.5,
//                                               height: 1.2,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _buildButton(
//                       'SIGN IN ',
//                       () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => LoginScreenView(),
//                         ),
//                       ),
//                     ),
//                     _buildButton(
//                       'SIGN UP',
//                       () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SignUpScreenView(),
//                         ),
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
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Slide the goal section from right
//           TweenAnimationBuilder<Offset>(
//             tween: Tween<Offset>(
//               begin: Offset(1, 0), // Start from the right
//               end: Offset.zero,
//             ),
//             duration: Duration(seconds: 1),
//             curve: Curves.easeInOut,
//             builder: (context, offset, child) {
//               return Row(
//                 children: [
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
//
//   Widget _buildButton(String text, VoidCallback onPressed) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       onPressed: onPressed,
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
// }

//8 jan
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
//       home: SplashScreen1(),
//     );
//   }
// }
//
// class SplashScreen1 extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen1>
//     with SingleTickerProviderStateMixin {
//   int currentGoalIndex = 0;
//   bool showAnimatedText = false;
//   bool showObjectText = false;
//   bool showGoalDescription = false;
//   bool showTermsPopup = false;
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   late Animation<Offset> _partyObjectSlideAnimation;
//   Color currentColor = Color(0xFFAF3A94);
//   Key _titleKey = UniqueKey();
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
//       'description': 'STAND FOR TRUTH\nAND FAIRNESS',
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
//       'description': 'PROSPEROUS AND\nPEACEFUL SOCIETY',
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
//     _slideAnimation = Tween<Offset>(
//       begin: Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     _partyObjectSlideAnimation = Tween<Offset>(
//       begin: Offset(-1.0, 0.0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     _startAnimationSequence();
//     _startGoalTransition();
//   }
//
//   void _startAnimationSequence() async {
//     _controller.reset();
//     await Future.delayed(Duration(milliseconds: 500));
//     if (mounted) {
//       setState(() {
//         showAnimatedText = true;
//       });
//       _controller.forward();
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
//       showGoalDescription = false;
//       showObjectText = false;
//       _titleKey = UniqueKey();
//       _controller.reset();
//     });
//
//     Future.delayed(Duration(milliseconds: 720), () {
//       if (mounted) {
//         setState(() {
//           currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
//           currentColor = goalData[currentGoalIndex]['color'];
//           showGoalDescription = true;
//           showObjectText = true;
//         });
//         _controller.forward();
//
//         Future.delayed(Duration(seconds: 3), () {
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
//                         SizedBox(height: spacing * 3),
//                         // AnimatedOpacity(
//                         //   opacity: showGoalDescription ? 1.0 : 0.0,
//                         //   duration: Duration(milliseconds: 500),
//                         //   child: _buildGoalSection(
//                         //     goalData[currentGoalIndex],
//                         //     goalTitleFontSize,
//                         //     descriptionFontSize,
//                         //     iconSize,
//                         //     spacing,
//                         //   ),
//                         // ),
//                         AnimatedOpacity(
//                           opacity: showObjectText ? 1.0 : 0.0,
//                           duration: Duration(milliseconds: 500),
//                           child: SlideTransition(
//                             position: _partyObjectSlideAnimation,
//                             child: Container(
//                               width: double.infinity,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: screenWidth * 0.07,
//                                     ),
//                                     child: _buildGoalSection(
//                                       goalData[currentGoalIndex],
//                                       goalTitleFontSize,
//                                       descriptionFontSize,
//                                       iconSize,
//                                       spacing,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: spacing * 1),
//                         Center(
//                           child: Column(
//                             children: [
//                               Image.asset(
//                                 'assets/images/wh1.png',
//                                 height: screenHeight * 0.05,
//                                 fit: BoxFit.contain,
//                               ),
//                               SizedBox(height: 10),
//                               AnimatedOpacity(
//                                 opacity: showObjectText ? 1.0 : 0.0,
//                                 duration: Duration(milliseconds: 500),
//                                 child: SlideTransition(
//                                   position: _partyObjectSlideAnimation,
//                                   child: Container(
//                                     width: double.infinity,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(right: 30),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Image.asset(
//                                                 'assets/images/wh2.png',
//                                                 height: screenHeight * 0.06,
//                                                 fit: BoxFit.contain,
//                                               ),
//                                               SizedBox(width: spacing),
//                                               Text(
//                                                 'PARTY OBJECT',
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: goalTitleFontSize,
//                                                   fontFamily: 'Impact',
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(height: spacing * 1),
//                                         Padding(
//                                           padding: EdgeInsets.symmetric(
//                                             horizontal: screenWidth * 0.07,
//                                           ),
//                                           child: Text(
//                                             goalData[currentGoalIndex]
//                                                     ['description'] ??
//                                                 '',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: descriptionFontSize,
//                                               fontFamily: 'Impact',
//                                               letterSpacing: 0.5,
//                                               height: 1.2,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _buildButton(
//                       'SIGN IN ',
//                       () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => LoginScreenView(),
//                         ),
//                       ),
//                     ),
//                     _buildButton(
//                       'SIGN UP',
//                       () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SignUpScreenView(),
//                         ),
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
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Slide the goal section from right
//           TweenAnimationBuilder<Offset>(
//             tween: Tween<Offset>(
//               begin: Offset(1, 0), // Start from the right
//               end: Offset.zero,
//             ),
//             duration: Duration(seconds: 1),
//             curve: Curves.easeInOut,
//             builder: (context, offset, child) {
//               return Row(
//                 children: [
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
//
//   Widget _buildButton(String text, VoidCallback onPressed) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       onPressed: onPressed,
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen1(),
    );
  }
}

class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen1>
    with SingleTickerProviderStateMixin {
  int currentGoalIndex = 0;
  bool showAnimatedText = false;
  bool showObjectText = false;
  bool showGoalDescription = false;
  bool showTermsPopup = false;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _partyObjectSlideAnimation;
  Color currentColor = Color(0xFFAF3A94);
  Key _titleKey = UniqueKey();

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
      'description': 'STAND FOR TRUTH\nAND FAIRNESS',
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
      'description': 'PROSPEROUS AND\nPEACEFUL SOCIETY',
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

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _partyObjectSlideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _startAnimationSequence();
    _startGoalTransition();
  }

  void _startAnimationSequence() async {
    _controller.reset();
    await Future.delayed(Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        showAnimatedText = true;
      });
      _controller.forward();
    }

    await Future.delayed(Duration(milliseconds: 800));
    if (mounted) {
      setState(() {
        showGoalDescription = true;
      });
    }

    await Future.delayed(Duration(milliseconds: 800));
    if (mounted) {
      setState(() {
        showObjectText = true;
      });
    }
  }

  void _startGoalTransition() {
    Future.delayed(Duration(seconds: 4), () {
      if (mounted) {
        _transitionToNextGoal();
      }
    });
  }

  void _transitionToNextGoal() {
    setState(() {
      showGoalDescription = false;
      showObjectText = false;
      _titleKey = UniqueKey();
      _controller.reset();
    });

    Future.delayed(Duration(milliseconds: 720), () {
      if (mounted) {
        setState(() {
          currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
          currentColor = goalData[currentGoalIndex]['color'];
          showGoalDescription = true;
          showObjectText = true;
        });
        _controller.forward();

        Future.delayed(Duration(seconds: 3), () {
          if (mounted) {
            _transitionToNextGoal();
          }
        });
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

    final titleFontSize = screenWidth * 0.11;
    final goalTitleFontSize = screenWidth * 0.09;
    final descriptionFontSize = screenWidth * 0.09;
    final iconSize = screenWidth * 0.18;
    final spacing = screenHeight * 0.01;

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
                        Center(
                          child: AnimatedTextKit(
                            key: _titleKey,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'WHY USE THIS APP',
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: titleFontSize,
                                  fontFamily: 'Impact',
                                ),
                                textAlign: TextAlign.center,
                                speed: const Duration(milliseconds: 100),
                              ),
                            ],
                            totalRepeatCount: 1,
                            pause: const Duration(milliseconds: 500),
                            displayFullTextOnTap: true,
                          ),
                        ),
                        SizedBox(height: spacing * 3),
                        // AnimatedOpacity(
                        //   opacity: showGoalDescription ? 1.0 : 0.0,
                        //   duration: Duration(milliseconds: 500),
                        //   child: _buildGoalSection(
                        //     goalData[currentGoalIndex],
                        //     goalTitleFontSize,
                        //     descriptionFontSize,
                        //     iconSize,
                        //     spacing,
                        //   ),
                        // ),
                        AnimatedOpacity(
                          opacity: showObjectText ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 500),
                          child: SlideTransition(
                            position: _partyObjectSlideAnimation,
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.04,
                                    ),
                                    child: _buildGoalSection(
                                      goalData[currentGoalIndex],
                                      goalTitleFontSize,
                                      descriptionFontSize,
                                      iconSize,
                                      spacing,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacing * 1),
                        Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/wh1.png',
                                height: screenHeight * 0.05,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 10),
                              AnimatedOpacity(
                                opacity: showObjectText ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 500),
                                child: SlideTransition(
                                  position: _partyObjectSlideAnimation,
                                  child: Container(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/wh2.png',
                                                height: screenHeight * 0.06,
                                                fit: BoxFit.contain,
                                              ),
                                              SizedBox(width: spacing),
                                              Text(
                                                'PARTY OBJECT',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: goalTitleFontSize,
                                                  fontFamily: 'Impact',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: spacing * 1),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.08,
                                          ),
                                          child: Text(
                                            goalData[currentGoalIndex]
                                                    ['description'] ??
                                                '',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: descriptionFontSize,
                                              fontFamily: 'Impact',
                                              letterSpacing: 0.5,
                                              height: 1.2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildButton(
                      'SIGN IN ',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreenView(),
                        ),
                      ),
                    ),
                    _buildButton(
                      'SIGN UP',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreenView(),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Slide the goal section from right
          TweenAnimationBuilder<Offset>(
            tween: Tween<Offset>(
              begin: Offset(1, 0), // Start from the right
              end: Offset.zero,
            ),
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            builder: (context, offset, child) {
              return Row(
                children: [
                  if (goal.containsKey('svgImage') && goal['svgImage'] != null)
                    SlideTransition(
                      position: AlwaysStoppedAnimation(offset),
                      child: SvgPicture.asset(
                        goal['svgImage'],
                        height: iconSize,
                        color: Colors.white,
                        width: iconSize,
                        fit: BoxFit.cover,
                      ),
                    )
                  else if (goal.containsKey('image') && goal['image'] != null)
                    SlideTransition(
                      position: AlwaysStoppedAnimation(offset),
                      child: Image.asset(
                        goal['image'],
                        height: iconSize,
                        color: Colors.white,
                        width: iconSize,
                        fit: BoxFit.cover,
                      ),
                    )
                  else if (goal.containsKey('icon') && goal['icon'] != null)
                    SlideTransition(
                      position: AlwaysStoppedAnimation(offset),
                      child: Icon(
                        goal['icon'],
                        color: Colors.white,
                        size: iconSize,
                      ),
                    ),
                  SizedBox(width: spacing),
                  Text(
                    goal['title'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleSize,
                      fontFamily: 'Impact',
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: spacing),
          Padding(
            padding: EdgeInsets.only(left: 5, bottom: 10),
            child: Text(
              goal['note'],
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

  Widget _buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
