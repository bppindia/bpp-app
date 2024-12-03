import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bpp_frontend/views/sign_up_screen_view.dart';
import '../utils/primary_config.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VerificationPage(contactInfo: "+91-8291899794"), // Replace with dynamic data
    );
  }
}

class VerificationPage extends StatefulWidget {
  final String contactInfo; // Can be email or phone number

  VerificationPage({required this.contactInfo});

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController _codeController = TextEditingController();
  bool codeSent = false;
  bool isCodeExpired = false;
  int remainingTime = 20; // 30 minutes in seconds = 1800
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer for code expiration
    _startTimer();
  }

  @override
  void dispose() {
    // Cancel the timer when the page is disposed
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
    final bool isEmail = widget.contactInfo.contains("@");

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
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
                  'assets/images/bpp_logo2.png', // Ensure you add the image in assets and update pubspec.yaml
                  height: 90,
                ),
                SizedBox(height: 20),
                Text(
                  isEmail ? 'Verify your email' : 'Verify your number',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Please enter the 6-digit verification code sent to ${widget.contactInfo}.\nThe code is valid for 30 minutes.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_codeController.text.length != 6) {
                      Get.snackbar(
                        'Error',
                        'Please enter a valid 6-digit verification code.',
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

                    // Simulate verification success
                    setState(() {
                      codeSent = true;
                    });
                    Get.snackbar(
                      'Success',
                      'Verification successful!',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                    // Navigate to the next screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PrimaryConfig.boxColor,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: isCodeExpired
                      ? () {
                    // Navigate to SignUpScreenView when the code is expired and the user clicks to request again
                    Get.to(() => SignUpScreenView(), transition: Transition.rightToLeftWithFade);
                  }
                      : null,
                  child: Text(
                    isCodeExpired
                        ? 'Request a new code'
                        : 'Didn\'t receive the code? Request again',
                    style: TextStyle(
                      color: isCodeExpired ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),

                SizedBox(height: 10),
                if (isCodeExpired)
                  Text(
                    'Code expired! Please request a new one.',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                SizedBox(height: 10),
                if (!isCodeExpired)
                  Text(
                    'Remaining time: $formattedTime',
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
