// import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/services.dart';
// import './login_screen_view.dart';
// import './sign_up_screen_view.dart';
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
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   int currentGoalIndex = 0;
//   bool showAnimatedText = false;
//   bool showObjectText = false;
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
//       'title': 'GOAL 5',
//       'color': Color(0xFF733B97),
//       'icon': Icons.healing,
//       'description': '  FREEDOM OF ALL',
//       'description1': '  FAITHS AND',
//       'description2': '  BELIEFS',
//       'note': 'UPHOLD SECULARISM',
//     },
//     {
//       'title': 'GOAL 6',
//       'color': Color(0xFFAF3A94),
//       'icon': Icons.healing,
//       'description': ' BUILD FUTURE AND',
//       'description1': ' READY CITYS',
//       'note': 'INFRASTRUCTURE AND',
//       'note1': 'INDUSTRIAL DEVELOPMENT',
//     },
//   ];
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
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
//     _slideAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
//         .animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//
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
//     _startGoalSequence();
//   }
//
//   void _handleContinue() {
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
//       if (currentGoalIndex == 0) {
//         setState(() {
//           showTermsPopup = true;
//         });
//       }
//
//       // Reset all flags related to goal animation
//       setState(() {
//         showAnimatedText = false;
//         showGoalBox = false;
//         showGoalTitle = false;
//         showObjectText = false;
//         showGoalDescription = false;
//         showGoalDescription1 = false;
//         showGoalDescription2 = false;
//       });
//
//       // 1. Show Animated Text
//       await Future.delayed(Duration(milliseconds: 500));
//       setState(() {
//         showAnimatedText = true;
//       });
//
//       // 2. Show Goal Box and Goal Title simultaneously
//       await Future.delayed(Duration(milliseconds: 800));
//       setState(() {
//         showGoalBox = true;
//         showGoalTitle = true;
//       });
//
//       // 3. Show Object Text
//       await Future.delayed(Duration(milliseconds: 800));
//       setState(() {
//         showObjectText = true;
//       });
//
//       // 4. Show Goal Description
//       await Future.delayed(Duration(milliseconds: 800));
//       setState(() {
//         showGoalDescription = true;
//       });
//
//       // 5. Show Goal Description 1
//       await Future.delayed(Duration(milliseconds: 800));
//       setState(() {
//         showGoalDescription1 = true;
//       });
//
//       // 6. Show Goal Description 2
//       await Future.delayed(Duration(milliseconds: 800));
//       setState(() {
//         showGoalDescription2 = true;
//       });
//
//       // Wait before transitioning to the next goal
//       await Future.delayed(Duration(seconds: 2));
//       setState(() {
//         currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
//       });
//     }
//   }
//
//   DeviceType _getDeviceType(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
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
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return _buildResponsiveLayout(context, constraints);
//       },
//     );
//   }
//
//   Widget _buildResponsiveLayout(
//       BuildContext context, BoxConstraints constraints) {
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
//               return screenHeight * 0.56;
//             case 2:
//               return lineNumber == 0
//                   ? screenHeight * 0.62
//                   : screenHeight * 0.68;
//             case 3:
//               return lineNumber == 0
//                   ? screenHeight * 0.62
//                   : lineNumber == 1
//                       ? screenHeight * 0.68
//                       : screenHeight * 0.72;
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
//                       ? screenHeight * 0.35
//                       : screenHeight * 0.42;
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
//                       ? screenHeight * 0.40
//                       : screenHeight * 0.50;
//             default:
//               return screenHeight * 0.35;
//           }
//       }
//     }
//
//     double getDescriptionLeftPosition(int lineNumber) {
//       DeviceType deviceType = _getDeviceType(context);
//
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.2;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.2 : screenWidth * 0.25;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.2
//                   : lineNumber == 1
//                       ? screenWidth * 0.25
//                       : screenWidth * 0.3;
//             default:
//               return screenWidth * 0.2;
//           }
//
//         case DeviceType.Tablet:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.25;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.25 : screenWidth * 0.3;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.25
//                   : lineNumber == 1
//                       ? screenWidth * 0.3
//                       : screenWidth * 0.35;
//             default:
//               return screenWidth * 0.25;
//           }
//
//         case DeviceType.Desktop:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.3;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.3 : screenWidth * 0.35;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.3
//                   : lineNumber == 1
//                       ? screenWidth * 0.35
//                       : screenWidth * 0.4;
//             default:
//               return screenWidth * 0.3;
//           }
//       }
//     }
//
//     double getDescriptionRightPosition(int lineNumber) {
//       DeviceType deviceType = _getDeviceType(context);
//
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.05;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.08 : screenWidth * 0.10;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.08
//                   : lineNumber == 1
//                       ? screenWidth * 0.10
//                       : screenWidth * 0.12;
//             default:
//               return screenWidth * 0.05;
//           }
//
//         case DeviceType.Tablet:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.07;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.09 : screenWidth * 0.12;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.09
//                   : lineNumber == 1
//                       ? screenWidth * 0.12
//                       : screenWidth * 0.15;
//             default:
//               return screenWidth * 0.07;
//           }
//
//         case DeviceType.Desktop:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.10;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.12 : screenWidth * 0.15;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.12
//                   : lineNumber == 1
//                       ? screenWidth * 0.15
//                       : screenWidth * 0.18;
//             default:
//               return screenWidth * 0.10;
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
//               return screenHeight * 0.26;
//             case 3:
//               return screenHeight * 0.26;
//             default:
//               return screenHeight * 0.26;
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
//     double getGoalBoxRightPosition(int lineNumber) {
//       DeviceType deviceType = _getDeviceType(context);
//
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.05;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.08 : screenWidth * 0.10;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.08
//                   : lineNumber == 1
//                       ? screenWidth * 0.10
//                       : screenWidth * 0.12;
//             default:
//               return screenWidth * 0.05;
//           }
//
//         case DeviceType.Tablet:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.07;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.09 : screenWidth * 0.12;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.09
//                   : lineNumber == 1
//                       ? screenWidth * 0.12
//                       : screenWidth * 0.15;
//             default:
//               return screenWidth * 0.07;
//           }
//
//         case DeviceType.Desktop:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.10;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.12 : screenWidth * 0.15;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.12
//                   : lineNumber == 1
//                       ? screenWidth * 0.15
//                       : screenWidth * 0.18;
//             default:
//               return screenWidth * 0.10;
//           }
//       }
//     }
//
//     double getGoalLeftPosition(int lineNumber) {
//       DeviceType deviceType = _getDeviceType(context);
//
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.2;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.32 : screenWidth * 0.45;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.38
//                   : lineNumber == 1
//                       ? screenWidth * 0.25
//                       : screenWidth * 0.3;
//             default:
//               return screenWidth * 0.2;
//           }
//
//         case DeviceType.Tablet:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.25;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.25 : screenWidth * 0.3;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.25
//                   : lineNumber == 1
//                       ? screenWidth * 0.3
//                       : screenWidth * 0.35;
//             default:
//               return screenWidth * 0.25;
//           }
//
//         case DeviceType.Desktop:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.3;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.3 : screenWidth * 0.35;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.3
//                   : lineNumber == 1
//                       ? screenWidth * 0.35
//                       : screenWidth * 0.4;
//             default:
//               return screenWidth * 0.3;
//           }
//       }
//     }
//
//     double getTitleBoxTopPosition() {
//       DeviceType deviceType = _getDeviceType(context);
//
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenHeight * 0.30;
//             case 2:
//               return screenHeight * 0.30;
//             case 3:
//               return screenHeight * 0.30;
//             default:
//               return screenHeight * 0.30;
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
//     double getTitleBoxRightPosition(int lineNumber) {
//       DeviceType deviceType = _getDeviceType(context);
//
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.10;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.20 : screenWidth * 0.88;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.10
//                   : lineNumber == 1
//                       ? screenWidth * 0.20
//                       : screenWidth * 0.12;
//             default:
//               return screenWidth * 0.05;
//           }
//
//         case DeviceType.Tablet:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.07;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.09 : screenWidth * 0.12;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.09
//                   : lineNumber == 1
//                       ? screenWidth * 0.12
//                       : screenWidth * 0.15;
//             default:
//               return screenWidth * 0.07;
//           }
//
//         case DeviceType.Desktop:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.10;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.12 : screenWidth * 0.15;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.12
//                   : lineNumber == 1
//                       ? screenWidth * 0.15
//                       : screenWidth * 0.18;
//             default:
//               return screenWidth * 0.10;
//           }
//       }
//     }
//
//     double getTitleLeftPosition(int lineNumber) {
//       DeviceType deviceType = _getDeviceType(context);
//
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.2;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.38 : screenWidth * 0.45;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.38
//                   : lineNumber == 1
//                       ? screenWidth * 0.25
//                       : screenWidth * 0.3;
//             default:
//               return screenWidth * 0.2;
//           }
//
//         case DeviceType.Tablet:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.25;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.25 : screenWidth * 0.3;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.25
//                   : lineNumber == 1
//                       ? screenWidth * 0.3
//                       : screenWidth * 0.35;
//             default:
//               return screenWidth * 0.25;
//           }
//
//         case DeviceType.Desktop:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.3;
//             case 2:
//               return lineNumber == 0 ? screenWidth * 0.3 : screenWidth * 0.35;
//             case 3:
//               return lineNumber == 0
//                   ? screenWidth * 0.3
//                   : lineNumber == 1
//                       ? screenWidth * 0.35
//                       : screenWidth * 0.4;
//             default:
//               return screenWidth * 0.3;
//           }
//       }
//     }
//
//     double getPartyObjectTopPosition() {
//       DeviceType deviceType = _getDeviceType(context);
//
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenHeight * 0.56;
//             case 2:
//               return screenHeight * 0.56;
//             case 3:
//               return screenHeight * 0.56;
//             default:
//               return screenHeight * 0.40;
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
//     double getPartyObjectLeftPosition() {
//       DeviceType deviceType = _getDeviceType(context);
//
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.35;
//             case 2:
//               return screenWidth * 0.35;
//             case 3:
//               return screenWidth * 0.35;
//             default:
//               return screenWidth * 0.2;
//           }
//
//         case DeviceType.Tablet:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.25;
//             case 2:
//               return screenWidth * 0.3;
//             case 3:
//               return screenWidth * 0.35;
//             default:
//               return screenWidth * 0.25;
//           }
//
//         case DeviceType.Desktop:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.3;
//             case 2:
//               return screenWidth * 0.35;
//             case 3:
//               return screenWidth * 0.4;
//             default:
//               return screenWidth * 0.3;
//           }
//       }
//     }
//
//     double getPartyObjectRightPosition() {
//       DeviceType deviceType = _getDeviceType(context);
//
//       switch (deviceType) {
//         case DeviceType.Mobile:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.1;
//             case 2:
//               return screenWidth * 0.15;
//             case 3:
//               return screenWidth * 0.2;
//             default:
//               return screenWidth * 0.1;
//           }
//
//         case DeviceType.Tablet:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.15;
//             case 2:
//               return screenWidth * 0.2;
//             case 3:
//               return screenWidth * 0.25;
//             default:
//               return screenWidth * 0.15;
//           }
//
//         case DeviceType.Desktop:
//           switch (descriptionLineCount) {
//             case 1:
//               return screenWidth * 0.2;
//             case 2:
//               return screenWidth * 0.25;
//             case 3:
//               return screenWidth * 0.3;
//             default:
//               return screenWidth * 0.2;
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
//                     _buildButton(
//                         'Sign In',
//                         () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => LoginScreenView()),
//                             )),
//                     _buildButton(
//                         'Sign Up',
//                         () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SignUpScreenView()),
//                             )),
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
//                           fontSize: getFontSize(screenWidth * 0.15),
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Anton',
//                           color: Colors.white,
//                           // color: Color.fromRGBO(214, 214, 214, 0.8),
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
//             if (showObjectText)
//               Positioned(
//                 top: getPartyObjectTopPosition(),
//                 left: getPartyObjectLeftPosition(),
//                 right: getPartyObjectRightPosition(),
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     'Party Object',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontFamily: 'Anton',
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//
//             // if (showGoalDescription1 && currentGoal['description1'] != null)
//             //   _buildResponsiveDescription(
//             //       context,
//             //       currentGoal,
//             //       showGoalDescription1,
//             //       getDescriptionTopPosition(1),
//             //       currentGoal['description1'],
//             //       screenWidth,
//             //       screenHeight,
//             //       getFontSize),
//             //
//             // if (showGoalDescription2 && currentGoal['description2'] != null)
//             //   _buildResponsiveDescription(
//             //       context,
//             //       currentGoal,
//             //       showGoalDescription2,
//             //       getDescriptionTopPosition(2),
//             //       currentGoal['description2'],
//             //       screenWidth,
//             //       screenHeight,
//             //       getFontSize),
//             //
//             // if (showGoalDescription && currentGoal['description'] != null)
//             //   _buildResponsiveDescription(
//             //       context,
//             //       currentGoal,
//             //       showGoalDescription,
//             //       getDescriptionTopPosition(
//             //           0), // Assuming position 0 for the description
//             //       currentGoal['description'] ??
//             //           '', // Default to an empty string if null
//             //       screenWidth,
//             //       screenHeight,
//             //       getFontSize),
//
//             if (showGoalDescription1 && currentGoal['description1'] != null)
//               _buildResponsiveDescription(
//                 context,
//                 currentGoal,
//                 showGoalDescription1,
//                 getDescriptionTopPosition(1),
//                 currentGoal['description1'],
//                 screenWidth,
//                 screenHeight,
//                 getFontSize,
//                 getDescriptionLeftPosition(1),
//                 getDescriptionRightPosition(1),
//               ),
//
//             if (showGoalDescription2 && currentGoal['description2'] != null)
//               _buildResponsiveDescription(
//                 context,
//                 currentGoal,
//                 showGoalDescription2,
//                 getDescriptionTopPosition(2),
//                 currentGoal['description2'],
//                 screenWidth,
//                 screenHeight,
//                 getFontSize,
//                 getDescriptionLeftPosition(2),
//                 getDescriptionRightPosition(2),
//               ),
//
//             if (showGoalDescription && currentGoal['description'] != null)
//               _buildResponsiveDescription(
//                 context,
//                 currentGoal,
//                 showGoalDescription,
//                 getDescriptionTopPosition(
//                     0), // Assuming position 0 for the description
//                 currentGoal['description'] ??
//                     '', // Default to an empty string if null
//                 screenWidth,
//                 screenHeight,
//                 getFontSize,
//                 getDescriptionLeftPosition(0),
//                 getDescriptionRightPosition(0),
//               ),
//
//             // Goal Box and Title
//             Positioned(
//               top: getGoalBoxTopPosition(),
//               left: getGoalLeftPosition(0),
//               right: getGoalBoxRightPosition(0),
//               // left: screenWidth * 0.1,
//               // right: screenWidth * 0.1,
//               child: AnimatedSwitcher(
//                 duration: Duration(milliseconds: 200),
//                 child: showGoalBox
//                     ? Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           _buildResponsiveGoalTile(
//                             context,
//                             currentGoalIndex,
//                             currentGoal,
//                             getResponsiveSize(90,
//                                 tabletSize: 120, desktopSize: 150),
//                           ),
//                         ],
//                       )
//                     : SizedBox.shrink(),
//               ),
//             ),
//
//             Positioned(
//               top: getTitleBoxTopPosition() + getResponsiveSize(100),
//               // left: getTitleLeftPosition(0),
//               // right: getTitleBoxRightPosition(0),
//               left: 100,
//               right: 10,
//               child: AnimatedSwitcher(
//                 duration: Duration(milliseconds: 200),
//                 child: showGoalTitle
//                     ? Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(width: screenWidth * 0.07), // Add spacing
//                           Expanded(
//                             child: _buildResponsiveTitleSection(
//                               context,
//                               currentGoal,
//                               screenWidth,
//                               screenHeight,
//                               getFontSize,
//                             ),
//                           ),
//                         ],
//                       )
//                     : SizedBox.shrink(),
//               ),
//             ),
//
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   vertical: getResponsiveSize(10),
//                   horizontal: getResponsiveSize(20),
//                 ),
//                 // decoration: BoxDecoration(
//                 //   color: Colors.white.withOpacity(0.1),
//                 //   borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//                 // ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Expanded(
//                       child: _buildAuthButton(
//                         'SIGN IN',
//                         () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => LoginScreenView()),
//                         ),
//                         deviceType,
//                       ),
//                     ),
//                     SizedBox(width: 16),
//                     Expanded(
//                       child: _buildAuthButton(
//                         'SIGN UP',
//                         () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => SignUpScreenView()),
//                         ),
//                         deviceType,
//                         isPrimary: true,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAuthButton(
//       String label, VoidCallback onPressed, DeviceType deviceType,
//       {bool isPrimary = false}) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isPrimary ? Colors.white : Colors.transparent,
//         foregroundColor: isPrimary ? Colors.black : Colors.white,
//         padding: EdgeInsets.symmetric(
//           vertical: getResponsiveSize(12),
//         ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//           side: BorderSide(color: Colors.white, width: 2),
//         ),
//         elevation: isPrimary ? 2 : 0,
//       ),
//       child: Text(
//         label,
//         style: TextStyle(
//           fontSize: getFontSize(deviceType == DeviceType.Mobile ? 20 : 24),
//           fontWeight: FontWeight.bold,
//           fontFamily: 'OutFit',
//         ),
//       ),
//     );
//   }
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
//   // Widget _buildResponsiveDescription(
//   //   BuildContext context,
//   //   Map<String, dynamic> currentGoal,
//   //   bool showCondition,
//   //   double topPosition,
//   //   String description,
//   //   double screenWidth,
//   //   double screenHeight,
//   //   double Function(double) getFontSize,
//   // ) {
//   //   return showCondition
//   //       ? Positioned(
//   //           top: topPosition,
//   //           left: screenWidth * 0.14,
//   //           // right: screenWidth * 0.1,
//   //           child: SlideTransition(
//   //             position: _slideAnimation,
//   //             child: Text(
//   //               description,
//   //               textAlign: TextAlign.left,
//   //               style: TextStyle(
//   //                 fontSize: getFontSize(screenWidth * 0.11),
//   //                 fontFamily: 'Anton',
//   //                 // fontWeight: FontWeight.w400,
//   //                 color: Colors.white,
//   //                 letterSpacing: 1,
//   //                 height: 0.3,
//   //               ),
//   //             ),
//   //           ),
//   //         )
//   //       : SizedBox.shrink();
//   // }
//
//   Widget _buildResponsiveDescription(
//     BuildContext context,
//     Map<String, dynamic> currentGoal,
//     bool showCondition,
//     double topPosition,
//     String description,
//     double screenWidth,
//     double screenHeight,
//     double Function(double) getFontSize,
//     double leftPosition, // Added parameter for left
//     double rightPosition, // Added parameter for right
//   ) {
//     return showCondition
//         ? Positioned(
//             top: topPosition,
//             left: leftPosition, // Dynamic left position
//             right: rightPosition, // Dynamic right position
//             child: SlideTransition(
//               position: _slideAnimation,
//               child: Text(
//                 description,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: getFontSize(screenWidth * 0.11),
//                   fontFamily: 'Anton',
//                   color: Colors.white,
//                   letterSpacing: 1,
//                   height: 0.3,
//                 ),
//               ),
//             ),
//           )
//         : SizedBox.shrink();
//   }
//
//   Widget _buildResponsiveGoalTile(
//     BuildContext context,
//     int currentGoalIndex,
//     Map<String, dynamic> currentGoal,
//     double tileSize,
//   ) {
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
//   Widget _buildResponsiveTitleSection(
//     BuildContext context,
//     Map<String, dynamic> currentGoal,
//     double screenWidth,
//     double screenHeight,
//     double Function(double) getFontSize,
//   ) {
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
//               fontSize: getFontSize(screenWidth * 0.10),
//               // fontWeight: FontWeight.bold,
//               fontFamily: 'Anton',
//               // color: Color.fromRGBO(214, 214, 214, 0.8),
//               color: Colors.white,
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
//   Widget _buildNoteText(Map<String, dynamic> currentGoal, double screenWidth,
//       double Function(double) getFontSize) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           currentGoal['note'] ?? '',
//           style: TextStyle(
//             fontSize: getFontSize(
//                 screenWidth * (currentGoal['note1'] != null ? 0.048 : 0.060)),
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
//               fontSize: getFontSize(screenWidth * 0.048),
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
// // Move DeviceType enum to top-level
// enum DeviceType { Mobile, Tablet, Desktop }
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
//       alignment: Alignment.centerLeft, // Aligns the icon to the left
//       child: Icon(
//         icon,
//         size: 80.0, // Adjust icon size as needed
//         color: Colors.white,
//       ),
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// //
// // void main() => runApp(MyApp());
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: SplashScreen(),
// //     );
// //   }
// // }
// //
// // class SplashScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.purple, // Purple background
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             // Title
// //             Padding(
// //               padding:
// //                   const EdgeInsets.only(left: 0, right: 0), // Apply padding
// //               child: const Text(
// //                 'WHY USE THIS APP',
// //                 style: TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 36,
// //                   fontFamily: 'Impact',
// //                   // fontWeight: FontWeight.w900,
// //                 ),
// //                 textAlign: TextAlign.center, // Ensure text is left-aligned
// //               ),
// //             ),
// //
// //             const SizedBox(height: 30),
// //
// //             // Row for Icon and GOAL 2
// //             Padding(
// //               padding: const EdgeInsets.only(left: 0, right: 124),
// //               child: Row(
// //                 mainAxisSize:
// //                     MainAxisSize.min, // Shrink the Row to fit contents
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   const Icon(
// //                     Icons.agriculture, // Replace with scale icon
// //                     color: Colors.white,
// //                     size: 80,
// //                   ),
// //                   const SizedBox(
// //                       width: 10), // Reduced space between icon and text
// //                   const Text(
// //                     'GOAL 8',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 32,
// //                       fontFamily: 'Impact',
// //                       // fontWeight: FontWeight.w900,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             // const SizedBox(height: 5),
// //             // Subtitle under GOAL 2
// //             Padding(
// //               padding: const EdgeInsets.only(left: 15, right: 22),
// //               child: const Text(
// //                 'INDUSTRIAL DEVELOPMENT\nAND INFRASTRUCTURE',
// //                 style: TextStyle(
// //                   color: Colors.white,
// //                   // fontWeight: FontWeight.w900,
// //                   fontSize: 28,
// //                   fontFamily: 'Impact',
// //                   letterSpacing: 0.5,
// //                 ),
// //                 textAlign: TextAlign.left,
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             Image.asset(
// //               'assets/images/wh1.png',
// //               fit: BoxFit.cover,
// //               height: 40,
// //               //width: 80,
// //             ),
// //             const SizedBox(height: 20),
// //
// //             // Row for Icon and PARTY OBJECT
// //             Padding(
// //               padding: const EdgeInsets.only(left: 0, right: 50),
// //               child: Row(
// //                 mainAxisSize:
// //                     MainAxisSize.min, // Shrink the Row to fit contents
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   const SizedBox(height: 20),
// //                   Image.asset(
// //                     'assets/images/wh2.png',
// //                     fit: BoxFit.cover,
// //                     height: 50,
// //                     //width: 80,
// //                   ),
// //                   const SizedBox(
// //                       width: 10), // Reduced space between icon and text
// //                   const Text(
// //                     'PARTY OBJECT',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 32,
// //                       fontFamily: 'Impact',
// //                       // fontWeight: FontWeight.w700,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 10),
// //
// //             Padding(
// //               padding: const EdgeInsets.only(left: 15, right: 90),
// //               child: const Text(
// //                 'BUILD FUTURE AND\nREADY BELIEFS', // Add a line break
// //                 style: TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 28,
// //                   fontFamily: 'Impact',
// //                   letterSpacing:
// //                       0.5, // Correct Flutter syntax for letter spacing
// //                 ),
// //                 textAlign: TextAlign.left,
// //               ),
// //             ),
// //
// //             const SizedBox(height: 50),
// //
// //             // Buttons (or placeholders for buttons)
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
