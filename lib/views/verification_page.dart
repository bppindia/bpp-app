// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:bpp_frontend/views/sign_up_screen_view.dart';
// import 'package:bpp_frontend/controller/screens/dashbaord_screen.dart';
//
// import '../utils/primary_config.dart';
// import 'dart:async';
// import 'component/registration/personal_page.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: VerificationPage(contactInfo: "+91-8291899794"),
//     );
//   }
// }
//
// class VerificationPage extends StatefulWidget {
//   final String contactInfo;
//
//   VerificationPage({required this.contactInfo});
//
//   @override
//   _VerificationPageState createState() => _VerificationPageState();
// }
//
// class _VerificationPageState extends State<VerificationPage> {
//   final TextEditingController _codeController = TextEditingController();
//   bool codeSent = false;
//   bool isCodeExpired = false;
//   int remainingTime = 20;
//   late Timer _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
//
//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (remainingTime > 0) {
//         setState(() {
//           remainingTime--;
//         });
//       } else {
//         setState(() {
//           isCodeExpired = true;
//         });
//         _timer.cancel();
//       }
//     });
//   }
//
//   String get formattedTime {
//     int minutes = remainingTime ~/ 60;
//     int seconds = remainingTime % 60;
//     return '$minutes:${seconds.toString().padLeft(2, '0')}';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isEmail = widget.contactInfo.contains("@");
//     final screenSize = MediaQuery.of(context).size;
//     final isSmallScreen = screenSize.width < 600;
//
//     return Scaffold(
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return SingleChildScrollView(
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minHeight: constraints.maxHeight,
//                 ),
//                 child: Center(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: isSmallScreen ? 16.0 : screenSize.width * 0.1,
//                       vertical: 16.0,
//                     ),
//                     child: Container(
//                       width: isSmallScreen ? double.infinity : 500,
//                       padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             spreadRadius: 5,
//                             blurRadius: 10,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Image.asset(
//                             'assets/images/bpp_logo2.png',
//                             height: isSmallScreen ? 76 : 90,
//                           ),
//                           const SizedBox(height: 14),
//                           FittedBox(
//                             child: Text.rich(
//                               TextSpan(
//                                 text: 'Bharatiya Popular Party', // "Welcome to" part in black
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: isSmallScreen ? 24 : 28,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           SizedBox(height: isSmallScreen ? 16 : 20),
//                           Text(
//                             isEmail ? 'Verify your email' : 'Verify your number',
//                             style: TextStyle(
//                               fontSize: isSmallScreen ? 24 : 28,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: isSmallScreen ? 8 : 10),
//                           FittedBox(
//                             fit: BoxFit.scaleDown,
//                             child: Text(
//                               'Please enter the 6-digit verification code sent to ${widget.contactInfo}.\nThe code is valid for 30 minutes.',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: isSmallScreen ? 14 : 16,
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: isSmallScreen ? 16 : 20),
//                           TextField(
//                             controller: _codeController,
//                             keyboardType: TextInputType.number,
//                             maxLength: 6,
//                             decoration: InputDecoration(
//                               labelText: 'Verification Code',
//                               suffixIcon: codeSent
//                                   ? Icon(Icons.check_circle, color: Colors.green)
//                                   : null,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: isSmallScreen ? 16 : 20),
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 const temporaryCode = '456789';
//
//                                 if (_codeController.text != temporaryCode) {
//                                   Get.snackbar(
//                                     'Error',
//                                     'Please enter the correct verification code: $temporaryCode',
//                                     backgroundColor: Colors.redAccent,
//                                     colorText: Colors.white,
//                                   );
//                                   return;
//                                 }
//
//                                 if (isCodeExpired) {
//                                   Get.snackbar(
//                                     'Error',
//                                     'The verification code has expired. Please request a new one.',
//                                     backgroundColor: Colors.redAccent,
//                                     colorText: Colors.white,
//                                   );
//                                   return;
//                                 }
//
//                                 setState(() {
//                                   codeSent = true;
//                                 });
//                                 Get.snackbar(
//                                   'Success',
//                                   'Verification successful!',
//                                   backgroundColor: Colors.green,
//                                   colorText: Colors.white,
//                                 );
//
//                                 Get.to(() => PersonalPage());
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: PrimaryConfig.boxColor,
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: isSmallScreen ? 30 : 50,
//                                   vertical: isSmallScreen ? 12 : 15,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                               ),
//                               child: Text(
//                                 'Next',
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: isSmallScreen ? 8 : 10),
//                           TextButton(
//                             onPressed: isCodeExpired
//                                 ? () {
//                               Get.to(
//                                     () => SignUpScreenView(),
//                                 transition: Transition.rightToLeftWithFade,
//                               );
//                             }
//                                 : null,
//                             child: Text(
//                               isCodeExpired
//                                   ? 'Request a new code'
//                                   : 'Didn\'t receive the code? Request again',
//                               style: TextStyle(
//                                 color: isCodeExpired ? Colors.blue : Colors.grey,
//                                 fontSize: isSmallScreen ? 12 : 14,
//                               ),
//                             ),
//                           ),
//                           if (isCodeExpired)
//                             Text(
//                               'Code expired! Please request a new one.',
//                               style: TextStyle(
//                                 color: Colors.red,
//                                 fontSize: isSmallScreen ? 12 : 14,
//                               ),
//                             ),
//                           if (!isCodeExpired)
//                             Text(
//                               'Remaining time: $formattedTime',
//                               style: TextStyle(
//                                 color: Colors.grey[700],
//                                 fontSize: isSmallScreen ? 12 : 14,
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bpp_frontend/views/sign_up_screen_view.dart';
import 'package:bpp_frontend/controller/screens/dashbaord_screen.dart';

import '../utils/primary_config.dart';
import 'dart:async';
import 'component/registration/personal_page.dart';

class VerificationPage extends StatefulWidget {
  final String contactInfo;

  VerificationPage({required this.contactInfo});

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController _codeController = TextEditingController();
  bool codeSent = false;
  bool isCodeExpired = false;
  int remainingTime = 20;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        setState(() {
          isCodeExpired = true;
        });
        _timer.cancel();
      }
    });
  }

  String get formattedTime {
    int minutes = remainingTime ~/ 60;
    int seconds = remainingTime % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final isDesktop = size.width > 1200;

    final horizontalPadding = size.width * (isDesktop ? 0.2 : isTablet ? 0.1 : 0.05);
    final containerWidth = isDesktop ? 1000.0 : size.width;
    final logoSize = size.width * (isDesktop ? 0.15 : isTablet ? 0.2 : 0.26);
    final titleFontSize = size.width * (isDesktop ? 0.02 : isTablet ? 0.06 : 0.06);
    final labelFontSize = size.width * (isDesktop ? 0.012 : isTablet ? 0.015 : 0.035);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                width: containerWidth,
                padding: EdgeInsets.all(isDesktop ? 32.0 : 24.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/bpp_logo2.png',
                      height: logoSize,
                    ),
                    const SizedBox(height: 14),
                    FittedBox(
                      child: Text.rich(
                        TextSpan(
                          text: 'Bharatiya Popular Party',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: titleFontSize,
                            color: Colors.blue,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: isTablet ? 20 : 16),
                    Text(
                      widget.contactInfo.contains('@') ? 'Verify your email' : 'Verify your number',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: isTablet ? 12 : 10),
                    Text(
                      'Please enter the 6-digit verification code sent to ${widget.contactInfo}. The code is valid for 30 minutes.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: labelFontSize,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: isTablet ? 20 : 16),
                    TextField(
                      controller: _codeController,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      decoration: InputDecoration(
                        labelText: 'Verification Code',
                        suffixIcon: codeSent
                            ? Icon(Icons.check_circle, color: Colors.green)
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: isTablet ? 20 : 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          const temporaryCode = '456789';

                          if (_codeController.text != temporaryCode) {
                            Get.snackbar(
                              'Error',
                              'Please enter the correct verification code: $temporaryCode',
                              backgroundColor: Colors.redAccent,
                              colorText: Colors.white,
                            );
                            return;
                          }

                          if (isCodeExpired) {
                            Get.snackbar(
                              'Error',
                              'The verification code has expired. Please request a new one.',
                              backgroundColor: Colors.redAccent,
                              colorText: Colors.white,
                            );
                            return;
                          }

                          setState(() {
                            codeSent = true;
                          });
                          Get.snackbar(
                            'Success',
                            'Verification successful!',
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );

                          Get.to(() => PersonalPage());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PrimaryConfig.boxColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: isDesktop ? 60 : 50,
                            vertical: isDesktop ? 20 : 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: isTablet ? 12 : 10),
                    TextButton(
                      onPressed: isCodeExpired
                          ? () {
                        Get.to(() => SignUpScreenView(),
                            transition: Transition.rightToLeftWithFade);
                      }
                          : null,
                      child: Text(
                        isCodeExpired
                            ? 'Request a new code'
                            : 'Didn\'t receive the code? Request again',
                        style: TextStyle(
                          color: isCodeExpired ? Colors.blue : Colors.grey,
                          fontSize: labelFontSize,
                        ),
                      ),
                    ),
                    if (isCodeExpired)
                      Text(
                        'Code expired! Please request a new one.',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: labelFontSize,
                        ),
                      ),
                    if (!isCodeExpired)
                      Text(
                        'Remaining time: $formattedTime',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: labelFontSize,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

