// import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/services.dart';
// import './login_screen_view.dart';
// import './sign_up_screen_view.dart';
// import 'component/multipage_registration_flow.dart';
//
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'Anton',
//       ),
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
// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   int currentGoalIndex = 0;
//   bool showAnimatedText = false;
//   bool showGoalDescription = false;
//   bool showGoalDescription1 = false;
//   bool showGoalDescription2 = false;
//   bool showGoalBox = false;
//   bool showGoalTitle = false;
//   bool showTermsPopup = false;
//   bool showButtons = false;
//   bool isWallpaperEnabled = false;
//   bool showErrorIcon = false;
//
//   final List<Map<String, dynamic>> goalData = [
//     {
//       'title': 'GOAL 1',
//       'color': Color(0xFFFA4313),
//       'icon': Icons.public,
//       'description': 'UNITED AND STRONG',
//       'note': 'NATIONAL INTEGRITY',
//     },
//     {
//       'title': 'GOAL 2',
//       'color': Color(0xFA4313FF),
//       'icon': Icons.people,
//       'description': 'EQUALITY FOR ALL',
//       'note': 'EQUAL OPPORTUNITY',
//       'note1': 'WELL-BEING',
//     },
//     {
//       'title': 'GOAL 3',
//       'color': Color(0xFFFF693E),
//       'icon': Icons.healing,
//       'description': 'HEALTHIER,HAPPIER',
//       'description1': 'LIVES',
//       'note': 'GOOD HEALTH AND',
//       'note1': 'WELL-BEING',
//     },
//
//   ];
//
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   late Animation<Offset> _termsSlideAnimation;
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );
//
//     _termsSlideAnimation = Tween<Offset>(
//       begin: Offset(0, 1),
//       end: Offset(0, 0),
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     _slideAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
//         .animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
//     // Show terms popup after 2 seconds
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Future.delayed(Duration(seconds: 2), () {
//         if (mounted) {
//           setState(() {
//             showTermsPopup = true;
//           });
//           _controller.forward();
//         }
//       });
//     });
//
//
//
//     _startGoalSequence();
//   }
//
//   void _handleContinue() {
//     if (!isWallpaperEnabled) {
//       setState(() {
//         showErrorIcon = true;
//       });
//       // Optional: Show a snackbar or toast message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please enable Lock screen wallpapers to continue'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//       return;
//     }
//
//     setState(() {
//       showTermsPopup = false;
//       showButtons = true;
//     });
//   }
//
//   void _handleCancel() {
//     SystemNavigator.pop(); // Exit the app
//   }
//
//   void _startGoalSequence() async {
//     while (mounted) {
//       // Reset all flags related to goal animation
//       setState(() {
//         showAnimatedText = false;
//         showGoalDescription = false;
//         showGoalDescription1 = false;
//         showGoalDescription2 = false;
//         showGoalBox = false;
//         showGoalTitle = false;
//       });
//
//       await Future.delayed(Duration(milliseconds: 500));
//       setState(() {
//         showAnimatedText = true;
//       });
//
//       await Future.delayed(Duration(milliseconds: 1600));
//       setState(() {
//         showGoalDescription = true;
//         Future.delayed(Duration(milliseconds: 500), () {
//           setState(() {
//             showGoalBox = true;
//           });
//         });
//       });
//
//       await Future.delayed(Duration(milliseconds: 300));
//       setState(() {
//         showGoalDescription1 = true;
//         Future.delayed(Duration(milliseconds: 500), () {
//           setState(() {
//             showGoalBox = true;
//           });
//         });
//       });
//
//       await Future.delayed(Duration(milliseconds: 500));
//       setState(() {
//         showGoalDescription2 = true;
//         Future.delayed(Duration(milliseconds: 500), () {
//           setState(() {
//             showGoalBox = true;
//           });
//         });
//       });
//
//       await Future.delayed(Duration(milliseconds: 300));
//
//       setState(() {
//         showGoalTitle = true;
//       });
//
//       await Future.delayed(Duration(seconds: 3));
//       setState(() {
//         currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
//       });
//     }
//   }
//
//
//
//   DeviceType _getDeviceType(BuildContext context) {
//     final width = MediaQuery
//         .of(context)
//         .size
//         .width;
//
//     if (width < 600) {
//       return DeviceType.Mobile;
//     } else if (width < 1200) {
//       return DeviceType.Tablet;
//     } else {
//       return DeviceType.Desktop;
//     }
//   }
//
//   double _getIconSize(DeviceType deviceType) {
//     switch (deviceType) {
//       case DeviceType.Mobile:
//         return 35;
//       case DeviceType.Tablet:
//         return 45;
//       case DeviceType.Desktop:
//         return 55;
//     }
//   }
//
//   double _getNumberFontSize(DeviceType deviceType) {
//     switch (deviceType) {
//       case DeviceType.Mobile:
//         return 16;
//       case DeviceType.Tablet:
//         return 20;
//       case DeviceType.Desktop:
//         return 24;
//     }
//   }
//
//   double getFontSize(double baseSize) {
//     DeviceType deviceType = _getDeviceType(context);
//     switch (deviceType) {
//       case DeviceType.Mobile:
//         return baseSize * 0.8;
//       case DeviceType.Tablet:
//         return baseSize * 0.6;
//       case DeviceType.Desktop:
//         return baseSize * 1.2;
//     }
//   }
//
//   double getResponsiveSize(double mobileSize,
//       {double? tabletSize, double? desktopSize}) {
//     DeviceType deviceType = _getDeviceType(context);
//     switch (deviceType) {
//       case DeviceType.Mobile:
//         return mobileSize;
//       case DeviceType.Tablet:
//         return tabletSize ?? mobileSize * 1.2;
//       case DeviceType.Desktop:
//         return desktopSize ?? mobileSize * 1.5;
//     }
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return _buildResponsiveLayout(context, constraints);
//       },
//     );
//   }
//
//   Widget _buildResponsiveLayout(BuildContext context,
//       BoxConstraints constraints) {
//     final currentGoal = goalData[currentGoalIndex];
//     final screenWidth = constraints.maxWidth;
//     final screenHeight = constraints.maxHeight;
//
//     // Determine device type
//     DeviceType deviceType = _getDeviceType(context);
//
//     // Responsive font and sizing calculations
//     double getFontSize(double baseSize) {
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           return baseSize * 0.8;
//         case DeviceType.Tablet:
//           return baseSize * 1.0;
//         case DeviceType.Desktop:
//           return baseSize * 1.2;
//       }
//     }
//
//     double getResponsiveSize(double mobileSize,
//         {double? tabletSize, double? desktopSize}) {
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           return mobileSize;
//         case DeviceType.Tablet:
//           return tabletSize ?? mobileSize * 1.2;
//         case DeviceType.Desktop:
//           return desktopSize ?? mobileSize * 1.5;
//       }
//     }
//
//     int descriptionLineCount = 1;
//     if (currentGoal['description1'] != null) descriptionLineCount++;
//     if (currentGoal['description2'] != null) descriptionLineCount++;
//
//     double getDescriptionTopPosition(int lineNumber) {
//       DeviceType deviceType = _getDeviceType(context);
//
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenHeight * 0.22;
//             case 2:
//               return lineNumber == 0
//                   ? screenHeight * 0.22
//                   : screenHeight * 0.26;
//             case 3:
//               return lineNumber == 0
//                   ? screenHeight * 0.22
//                   : lineNumber == 1
//                   ? screenHeight * 0.26
//                   : screenHeight * 0.30;
//             default:
//               return screenHeight * 0.25;
//           }
//
//         case DeviceType.Tablet:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenHeight * 0.22;
//             case 2:
//               return lineNumber == 0
//                   ? screenHeight * 0.27
//                   : screenHeight * 0.35;
//             case 3:
//               return lineNumber == 0
//                   ? screenHeight * 0.27
//                   : lineNumber == 1
//                   ? screenHeight * 0.35
//                   : screenHeight * 0.42;
//             default:
//               return screenHeight * 0.30;
//           }
//
//         case DeviceType.Desktop:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenHeight * 0.35;
//             case 2:
//               return lineNumber == 0
//                   ? screenHeight * 0.30
//                   : screenHeight * 0.40;
//             case 3:
//               return lineNumber == 0
//                   ? screenHeight * 0.30
//                   : lineNumber == 1
//                   ? screenHeight * 0.40
//                   : screenHeight * 0.50;
//             default:
//               return screenHeight * 0.35;
//           }
//       }
//     }
//
//     double getGoalBoxTopPosition() {
//       DeviceType deviceType = _getDeviceType(context);
//
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenHeight * 0.26;
//             case 2:
//               return screenHeight * 0.30;
//             case 3:
//               return screenHeight * 0.34;
//             default:
//               return screenHeight * 0.36;
//           }
//
//         case DeviceType.Tablet:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenHeight * 0.40;
//             case 2:
//               return screenHeight * 0.47;
//             case 3:
//               return screenHeight * 0.54;
//             default:
//               return screenHeight * 0.42;
//           }
//
//         case DeviceType.Desktop:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenHeight * 0.45;
//             case 2:
//               return screenHeight * 0.52;
//             case 3:
//               return screenHeight * 0.59;
//             default:
//               return screenHeight * 0.47;
//           }
//       }
//     }
//
//     return Scaffold(
//       backgroundColor: currentGoal['color'],
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Skip, Sign In, and Sign Up buttons
//             if (showButtons) ...[
//               Positioned(
//                 top: 40,
//                 right: 20,
//                 child: GestureDetector(
//                   onTap: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => LoginScreenView()),
//                   ),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.4),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Text(
//                       'Skip',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: currentGoal['color'],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 50,
//                 left: 0,
//                 right: 0,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _buildButton('Sign In', () => Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => LoginScreenView()),
//                     )),
//                     _buildButton('Sign Up', () => Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUpScreenView()),
//                     )),
//                   ],
//                 ),
//               ),
//             ],
//             // Animated Text
//             if (showAnimatedText)
//               Positioned(
//                 top: screenHeight * 0.15,
//                 left: screenWidth * 0.1,
//                 right: screenWidth * 0.1,
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: AnimatedTextKit(
//                     animatedTexts: [
//                       TypewriterAnimatedText(
//                         'WHY USE THIS APP',
//                         textStyle: TextStyle(
//                           fontSize: getFontSize(screenWidth * 0.11),
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Anton',
//                           color: Color.fromRGBO(214, 214, 214, 0.8),
//                           letterSpacing: -1.1,
//                           height: 1.5,
//                         ),
//                         speed: Duration(milliseconds: 100),
//                       ),
//                     ],
//                     totalRepeatCount: 1,
//                     isRepeatingAnimation: false,
//                   ),
//                 ),
//               ),
//
//             // Goal Descriptions
//             _buildResponsiveDescription(
//                 context,
//                 currentGoal,
//                 showGoalDescription,
//                 getDescriptionTopPosition(0),
//                 currentGoal['description'] ?? '',
//                 screenWidth,
//                 screenHeight,
//                 getFontSize
//             ),
//
//             if (showGoalDescription1 && currentGoal['description1'] != null)
//               _buildResponsiveDescription(
//                   context,
//                   currentGoal,
//                   showGoalDescription1,
//                   getDescriptionTopPosition(1),
//                   currentGoal['description1'],
//                   screenWidth,
//                   screenHeight,
//                   getFontSize
//               ),
//
//             if (showGoalDescription2 && currentGoal['description2'] != null)
//               _buildResponsiveDescription(
//                   context,
//                   currentGoal,
//                   showGoalDescription2,
//                   getDescriptionTopPosition(2),
//                   currentGoal['description2'],
//                   screenWidth,
//                   screenHeight,
//                   getFontSize
//               ),
//             if (showTermsPopup)
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: SlideTransition(
//                   position: _termsSlideAnimation,
//                   child: Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20),
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.blue,
//                               child: Icon(Icons.security, color: Colors.white),
//                             ),
//                             SizedBox(width: 10),
//                             Expanded(
//                               child: RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(color: Colors.black),
//                                   children: [
//                                     TextSpan(
//                                       text: 'By continuing, you agree to the ',
//                                     ),
//                                     TextSpan(
//                                       text: 'Terms and Conditions',
//                                       style: TextStyle(
//                                         color: Colors.blue,
//                                         decoration: TextDecoration.underline,
//                                       ),
//                                     ),
//                                     TextSpan(text: ' and '),
//                                     TextSpan(
//                                       text: 'Privacy Policy',
//                                       style: TextStyle(
//                                         color: Colors.blue,
//                                         decoration: TextDecoration.underline,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isWallpaperEnabled = !isWallpaperEnabled;
//                               showErrorIcon = false; // Reset error state when user clicks
//                             });
//                           },
//                           child: Row(
//                             children: [
//                               Icon(
//                                 isWallpaperEnabled
//                                     ? Icons.check_circle
//                                     : Icons.check_circle_outline,
//                                 color: showErrorIcon ? Colors.red : Colors.blue,
//                                 size: 28,
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 'Turn on Lock screen wallpapers',
//                                 style: TextStyle(
//                                   color: showErrorIcon ? Colors.red : Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: TextButton(
//                                 onPressed: _handleCancel,
//                                 child: Text('Cancel'),
//                                 style: TextButton.styleFrom(
//                                   backgroundColor: Colors.grey[300],
//                                   padding: EdgeInsets.symmetric(vertical: 15),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Expanded(
//                               child: TextButton(
//                                 onPressed: _handleContinue,
//                                 child: Text(
//                                   'Continue',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 style: TextButton.styleFrom(
//                                   backgroundColor: Colors.blue,
//                                   padding: EdgeInsets.symmetric(vertical: 15),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//
//             // Goal Box and Title
//             Positioned(
//               top: getGoalBoxTopPosition(),
//               left: screenWidth * 0.1,
//               right: screenWidth * 0.1,
//               child: AnimatedSwitcher(
//                 duration: Duration(milliseconds: 200),
//                 child: showGoalBox
//                     ? Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     _buildResponsiveGoalTile(
//                       context,
//                       currentGoalIndex,
//                       currentGoal,
//                       getResponsiveSize(90, tabletSize: 120, desktopSize: 150),
//                     ),
//                     SizedBox(width: screenWidth * 0.04),
//                     Expanded(
//                       child: showGoalTitle
//                           ? _buildResponsiveTitleSection(
//                           context,
//                           currentGoal,
//                           screenWidth,
//                           screenHeight,
//                           getFontSize
//                       )
//                           : SizedBox.shrink(),
//                     )
//                   ],
//                 )
//                     : SizedBox.shrink(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildButton(String text, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.8),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: goalData[currentGoalIndex]['color'],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildResponsiveDescription(BuildContext context,
//       Map<String, dynamic> currentGoal,
//       bool showCondition,
//       double topPosition,
//       String description,
//       double screenWidth,
//       double screenHeight,
//       double Function(double) getFontSize,) {
//     return showCondition
//         ? Positioned(
//       top: topPosition,
//       left: screenWidth * 0.1,
//       right: screenWidth * 0.1,
//       child: SlideTransition(
//         position: _slideAnimation,
//         child: Text(
//           description,
//           textAlign: TextAlign.left,
//           style: TextStyle(
//             fontSize: getFontSize(screenWidth * 0.10),
//             fontFamily: 'Anton',
//             fontWeight: FontWeight.w400,
//             color: Colors.white,
//             letterSpacing: -1.1,
//             height: 0.3,
//           ),
//         ),
//       ),
//     )
//         : SizedBox.shrink();
//   }
//
//   Widget _buildResponsiveGoalTile(BuildContext context,
//       int currentGoalIndex,
//       Map<String, dynamic> currentGoal,
//       double tileSize,) {
//     DeviceType deviceType = _getDeviceType(context);
//
//     return GoalTile(
//       key: ValueKey(currentGoalIndex),
//       number: "${currentGoalIndex + 1}",
//       color: currentGoal['color'],
//       icon: currentGoal['icon'],
//       title: currentGoal['title'],
//       tileSize: tileSize,
//       iconSize: _getIconSize(deviceType),
//       numberFontSize: _getNumberFontSize(deviceType),
//     );
//   }
//
//   Widget _buildResponsiveTitleSection(BuildContext context,
//       Map<String, dynamic> currentGoal,
//       double screenWidth,
//       double screenHeight,
//       double Function(double) getFontSize,) {
//     return SlideTransition(
//       position: Tween(
//         begin: Offset(0.0, 0.1),
//         end: Offset(0.0, 0.0),
//       ).animate(CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeOut,
//       )),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             currentGoal['title'],
//             style: TextStyle(
//               fontSize: getFontSize(screenWidth * 0.09),
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Anton',
//               color: Color.fromRGBO(214, 214, 214, 0.8),
//               height: 0.9,
//             ),
//           ),
//           SizedBox(height: screenHeight * 0.01),
//           _buildNoteText(currentGoal, screenWidth, getFontSize),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNoteText(Map<String, dynamic> currentGoal,
//       double screenWidth,
//       double Function(double) getFontSize) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           currentGoal['note'] ?? '',
//           style: TextStyle(
//             fontSize: getFontSize(
//                 screenWidth * (currentGoal['note1'] != null ? 0.050 : 0.064)),
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Anton',
//             color: Colors.white,
//             height: 0.8,
//           ),
//         ),
//         if (currentGoal['note1'] != null) ...[
//           SizedBox(height: 8),
//           Text(
//             currentGoal['note1'],
//             style: TextStyle(
//               fontSize: getFontSize(screenWidth * 0.050),
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Anton',
//               color: Colors.white,
//               height: 0.8,
//             ),
//           ),
//         ],
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
//
//
//
// // Move DeviceType enum to top-level
// enum DeviceType {
//   Mobile,
//   Tablet,
//   Desktop
// }
//
//
//
//
// // Move GoalTile to top-level
// class GoalTile extends StatelessWidget {
//   final String number;
//   final Color color;
//   final IconData icon;
//   final String title;
//   final double tileSize;
//   final double iconSize;
//   final double numberFontSize;
//
//   const GoalTile({
//     Key? key,
//     required this.number,
//     required this.color,
//     required this.icon,
//     required this.title,
//     required this.tileSize,
//     required this.iconSize,
//     required this.numberFontSize,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: tileSize,
//       width: tileSize,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(color: Colors.white, width: 3),
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             number,
//             style: TextStyle(
//               fontSize: numberFontSize,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               fontFamily: 'Anton',
//             ),
//           ),
//           const Spacer(),
//           Align(
//             alignment: Alignment.center,
//             child: Icon(
//               icon,
//               size: iconSize,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import './login_screen_view.dart';
import './sign_up_screen_view.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Anton',
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  int currentGoalIndex = 0;
  bool showAnimatedText = false;
  bool showGoalDescription = false;
  bool showGoalDescription1 = false;
  bool showGoalDescription2 = false;
  bool showGoalBox = false;
  bool showGoalTitle = false;
  bool showTermsPopup = false;
  bool showButtons = false;
  bool isWallpaperEnabled = false;
  bool showErrorIcon = false;
  bool isGoalSequenceComplete = false; // New flag to track goal sequence completion

  final List<Map<String, dynamic>> goalData = [
    {
      'title': 'GOAL 1',
      'color': Color(0xFFFA4313),
      'icon': Icons.public,
      'description': 'UNITED AND STRONG',
      'note': 'NATIONAL INTEGRITY',
    },
    {
      'title': 'GOAL 2',
      'color': Color(0xFA4313FF),
      'icon': Icons.people,
      'description': 'EQUALITY FOR ALL',
      'note': 'EQUAL OPPORTUNITY',
      'note1': 'WELL-BEING',
    },
    {
      'title': 'GOAL 3',
      'color': Color(0xFFFF693E),
      'icon': Icons.healing,
      'description': 'HEALTHIER,HAPPIER',
      'description1': 'LIVES',
      'note': 'GOOD HEALTH AND',
      'note1': 'WELL-BEING',
    },

  ];

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _termsSlideAnimation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _termsSlideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _slideAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Show terms popup after 2 seconds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            showTermsPopup = true;
          });
          _controller.forward();
        }
      });
    });



    _startGoalSequence();
  }

  void _handleContinue() {
    if (!isWallpaperEnabled) {
      setState(() {
        showErrorIcon = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enable Lock screen wallpapers to continue'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (isGoalSequenceComplete) {
      setState(() {
        showTermsPopup = false;
        showButtons = true;
      });
    }
  }

  void _handleCancel() {
    SystemNavigator.pop(); // Exit the app
  }

  void _startGoalSequence() async {
    while (mounted) {
      // Reset goal-related flags
      setState(() {
        showAnimatedText = false;
        showGoalDescription = false;
        showGoalDescription1 = false;
        showGoalDescription2 = false;
        showGoalBox = false;
        showGoalTitle = false;
      });

      await Future.delayed(Duration(milliseconds: 500));
      setState(() {
        showAnimatedText = true;
      });

      await Future.delayed(Duration(milliseconds: 1600));
      setState(() {
        showGoalDescription = true;
        showGoalBox = true;
      });

      await Future.delayed(Duration(milliseconds: 300));
      setState(() {
        showGoalDescription1 = true;
      });

      await Future.delayed(Duration(milliseconds: 500));
      setState(() {
        showGoalDescription2 = true;
      });

      await Future.delayed(Duration(milliseconds: 300));
      setState(() {
        showGoalTitle = true;
      });

      await Future.delayed(Duration(seconds: 3));

      // Check if we've reached the last goal
      if (currentGoalIndex == goalData.length - 1) {
        setState(() {
          isGoalSequenceComplete = true;
        });
        break; // Exit the loop after last goal
      }

      setState(() {
        currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
      });
    }
  }



  DeviceType _getDeviceType(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    if (width < 600) {
      return DeviceType.Mobile;
    } else if (width < 1200) {
      return DeviceType.Tablet;
    } else {
      return DeviceType.Desktop;
    }
  }

  double _getIconSize(DeviceType deviceType) {
    switch (deviceType) {
      case DeviceType.Mobile:
        return 35;
      case DeviceType.Tablet:
        return 45;
      case DeviceType.Desktop:
        return 55;
    }
  }

  double _getNumberFontSize(DeviceType deviceType) {
    switch (deviceType) {
      case DeviceType.Mobile:
        return 16;
      case DeviceType.Tablet:
        return 20;
      case DeviceType.Desktop:
        return 24;
    }
  }

  double getFontSize(double baseSize) {
    DeviceType deviceType = _getDeviceType(context);
    switch (deviceType) {
      case DeviceType.Mobile:
        return baseSize * 0.8;
      case DeviceType.Tablet:
        return baseSize * 0.6;
      case DeviceType.Desktop:
        return baseSize * 1.2;
    }
  }

  double getResponsiveSize(double mobileSize,
      {double? tabletSize, double? desktopSize}) {
    DeviceType deviceType = _getDeviceType(context);
    switch (deviceType) {
      case DeviceType.Mobile:
        return mobileSize;
      case DeviceType.Tablet:
        return tabletSize ?? mobileSize * 1.2;
      case DeviceType.Desktop:
        return desktopSize ?? mobileSize * 1.5;
    }
  }




  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return _buildResponsiveLayout(context, constraints);
      },
    );
  }

  Widget _buildResponsiveLayout(BuildContext context,
      BoxConstraints constraints) {
    final currentGoal = goalData[currentGoalIndex];
    final screenWidth = constraints.maxWidth;
    final screenHeight = constraints.maxHeight;

    // Determine device type
    DeviceType deviceType = _getDeviceType(context);

    // Responsive font and sizing calculations
    double getFontSize(double baseSize) {
      switch (deviceType) {
        case DeviceType.Mobile:
          return baseSize * 0.8;
        case DeviceType.Tablet:
          return baseSize * 1.0;
        case DeviceType.Desktop:
          return baseSize * 1.2;
      }
    }

    double getResponsiveSize(double mobileSize,
        {double? tabletSize, double? desktopSize}) {
      switch (deviceType) {
        case DeviceType.Mobile:
          return mobileSize;
        case DeviceType.Tablet:
          return tabletSize ?? mobileSize * 1.2;
        case DeviceType.Desktop:
          return desktopSize ?? mobileSize * 1.5;
      }
    }

    int descriptionLineCount = 1;
    if (currentGoal['description1'] != null) descriptionLineCount++;
    if (currentGoal['description2'] != null) descriptionLineCount++;

    double getDescriptionTopPosition(int lineNumber) {
      DeviceType deviceType = _getDeviceType(context);

      switch (deviceType) {
        case DeviceType.Mobile:
          switch (descriptionLineCount) {
            case 1:
              return screenHeight * 0.22;
            case 2:
              return lineNumber == 0
                  ? screenHeight * 0.22
                  : screenHeight * 0.26;
            case 3:
              return lineNumber == 0
                  ? screenHeight * 0.22
                  : lineNumber == 1
                  ? screenHeight * 0.26
                  : screenHeight * 0.30;
            default:
              return screenHeight * 0.25;
          }

        case DeviceType.Tablet:
          switch (descriptionLineCount) {
            case 1:
              return screenHeight * 0.22;
            case 2:
              return lineNumber == 0
                  ? screenHeight * 0.27
                  : screenHeight * 0.35;
            case 3:
              return lineNumber == 0
                  ? screenHeight * 0.27
                  : lineNumber == 1
                  ? screenHeight * 0.35
                  : screenHeight * 0.42;
            default:
              return screenHeight * 0.30;
          }

        case DeviceType.Desktop:
          switch (descriptionLineCount) {
            case 1:
              return screenHeight * 0.35;
            case 2:
              return lineNumber == 0
                  ? screenHeight * 0.30
                  : screenHeight * 0.40;
            case 3:
              return lineNumber == 0
                  ? screenHeight * 0.30
                  : lineNumber == 1
                  ? screenHeight * 0.40
                  : screenHeight * 0.50;
            default:
              return screenHeight * 0.35;
          }
      }
    }

    double getGoalBoxTopPosition() {
      DeviceType deviceType = _getDeviceType(context);

      switch (deviceType) {
        case DeviceType.Mobile:
          switch (descriptionLineCount) {
            case 1:
              return screenHeight * 0.26;
            case 2:
              return screenHeight * 0.30;
            case 3:
              return screenHeight * 0.34;
            default:
              return screenHeight * 0.36;
          }

        case DeviceType.Tablet:
          switch (descriptionLineCount) {
            case 1:
              return screenHeight * 0.40;
            case 2:
              return screenHeight * 0.47;
            case 3:
              return screenHeight * 0.54;
            default:
              return screenHeight * 0.42;
          }

        case DeviceType.Desktop:
          switch (descriptionLineCount) {
            case 1:
              return screenHeight * 0.45;
            case 2:
              return screenHeight * 0.52;
            case 3:
              return screenHeight * 0.59;
            default:
              return screenHeight * 0.47;
          }
      }
    }

    return Scaffold(
      backgroundColor: currentGoal['color'],
      body: SafeArea(
        child: Stack(
          children: [
            // Skip, Sign In, and Sign Up buttons
            if (showButtons) ...[
              Positioned(
                top: 40,
                right: 20,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreenView()),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: currentGoal['color'],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('Sign In', () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreenView()),
                    )),
                    _buildButton('Sign Up', () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreenView()),
                    )),
                  ],
                ),
              ),
            ],
            // Animated Text
            if (showAnimatedText)
              Positioned(
                top: screenHeight * 0.15,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'WHY USE THIS APP',
                        textStyle: TextStyle(
                          fontSize: getFontSize(screenWidth * 0.11),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Anton',
                          color: Color.fromRGBO(214, 214, 214, 0.8),
                          letterSpacing: -1.1,
                          height: 1.5,
                        ),
                        speed: Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 1,
                    isRepeatingAnimation: false,
                  ),
                ),
              ),

            // Goal Descriptions
            _buildResponsiveDescription(
                context,
                currentGoal,
                showGoalDescription,
                getDescriptionTopPosition(0),
                currentGoal['description'] ?? '',
                screenWidth,
                screenHeight,
                getFontSize
            ),

            if (showGoalDescription1 && currentGoal['description1'] != null)
              _buildResponsiveDescription(
                  context,
                  currentGoal,
                  showGoalDescription1,
                  getDescriptionTopPosition(1),
                  currentGoal['description1'],
                  screenWidth,
                  screenHeight,
                  getFontSize
              ),

            if (showGoalDescription2 && currentGoal['description2'] != null)
              _buildResponsiveDescription(
                  context,
                  currentGoal,
                  showGoalDescription2,
                  getDescriptionTopPosition(2),
                  currentGoal['description2'],
                  screenWidth,
                  screenHeight,
                  getFontSize
              ),
            if (showTermsPopup)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SlideTransition(
                  position: _termsSlideAnimation,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.security, color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'By continuing, you agree to the ',
                                    ),
                                    TextSpan(
                                      text: 'Terms and Conditions',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    TextSpan(text: ' and '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isWallpaperEnabled = !isWallpaperEnabled;
                              showErrorIcon = false; // Reset error state when user clicks
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                isWallpaperEnabled
                                    ? Icons.check_circle
                                    : Icons.check_circle_outline,
                                color: showErrorIcon ? Colors.red : Colors.blue,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Turn on Lock screen wallpapers',
                                style: TextStyle(
                                  color: showErrorIcon ? Colors.red : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: _handleCancel,
                                child: Text('Cancel'),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.grey[300],
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextButton(
                                onPressed: _handleContinue,
                                child: Text(
                                  'Continue',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            // Goal Box and Title
            Positioned(
              top: getGoalBoxTopPosition(),
              left: screenWidth * 0.1,
              right: screenWidth * 0.1,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: showGoalBox
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildResponsiveGoalTile(
                      context,
                      currentGoalIndex,
                      currentGoal,
                      getResponsiveSize(90, tabletSize: 120, desktopSize: 150),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    Expanded(
                      child: showGoalTitle
                          ? _buildResponsiveTitleSection(
                          context,
                          currentGoal,
                          screenWidth,
                          screenHeight,
                          getFontSize
                      )
                          : SizedBox.shrink(),
                    )
                  ],
                )
                    : SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: goalData[currentGoalIndex]['color'],
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveDescription(BuildContext context,
      Map<String, dynamic> currentGoal,
      bool showCondition,
      double topPosition,
      String description,
      double screenWidth,
      double screenHeight,
      double Function(double) getFontSize,) {
    return showCondition
        ? Positioned(
      top: topPosition,
      left: screenWidth * 0.1,
      right: screenWidth * 0.1,
      child: SlideTransition(
        position: _slideAnimation,
        child: Text(
          description,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: getFontSize(screenWidth * 0.10),
            fontFamily: 'Anton',
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: -1.1,
            height: 0.3,
          ),
        ),
      ),
    )
        : SizedBox.shrink();
  }

  Widget _buildResponsiveGoalTile(BuildContext context,
      int currentGoalIndex,
      Map<String, dynamic> currentGoal,
      double tileSize,) {
    DeviceType deviceType = _getDeviceType(context);

    return GoalTile(
      key: ValueKey(currentGoalIndex),
      number: "${currentGoalIndex + 1}",
      color: currentGoal['color'],
      icon: currentGoal['icon'],
      title: currentGoal['title'],
      tileSize: tileSize,
      iconSize: _getIconSize(deviceType),
      numberFontSize: _getNumberFontSize(deviceType),
    );
  }

  Widget _buildResponsiveTitleSection(BuildContext context,
      Map<String, dynamic> currentGoal,
      double screenWidth,
      double screenHeight,
      double Function(double) getFontSize,) {
    return SlideTransition(
      position: Tween(
        begin: Offset(0.0, 0.1),
        end: Offset(0.0, 0.0),
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentGoal['title'],
            style: TextStyle(
              fontSize: getFontSize(screenWidth * 0.09),
              fontWeight: FontWeight.bold,
              fontFamily: 'Anton',
              color: Color.fromRGBO(214, 214, 214, 0.8),
              height: 0.9,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          _buildNoteText(currentGoal, screenWidth, getFontSize),
        ],
      ),
    );
  }

  Widget _buildNoteText(Map<String, dynamic> currentGoal,
      double screenWidth,
      double Function(double) getFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentGoal['note'] ?? '',
          style: TextStyle(
            fontSize: getFontSize(
                screenWidth * (currentGoal['note1'] != null ? 0.050 : 0.064)),
            fontWeight: FontWeight.bold,
            fontFamily: 'Anton',
            color: Colors.white,
            height: 0.8,
          ),
        ),
        if (currentGoal['note1'] != null) ...[
          SizedBox(height: 8),
          Text(
            currentGoal['note1'],
            style: TextStyle(
              fontSize: getFontSize(screenWidth * 0.050),
              fontWeight: FontWeight.bold,
              fontFamily: 'Anton',
              color: Colors.white,
              height: 0.8,
            ),
          ),
        ],
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}



// Move DeviceType enum to top-level
enum DeviceType {
  Mobile,
  Tablet,
  Desktop
}




// Move GoalTile to top-level
class GoalTile extends StatelessWidget {
  final String number;
  final Color color;
  final IconData icon;
  final String title;
  final double tileSize;
  final double iconSize;
  final double numberFontSize;

  const GoalTile({
    Key? key,
    required this.number,
    required this.color,
    required this.icon,
    required this.title,
    required this.tileSize,
    required this.iconSize,
    required this.numberFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tileSize,
      width: tileSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white, width: 3),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: numberFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Anton',
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: iconSize,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
