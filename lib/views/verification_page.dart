import 'dart:async';
import 'dart:convert';
import 'package:bpp_frontend/views/component/registration/personal_page.dart';
import 'package:bpp_frontend/views/component/registration/registration_page.dart';
import 'package:bpp_frontend/views/sign_up_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VerificationPage extends StatefulWidget {
  final String contactInfo; // Either phone number or email

  VerificationPage({required this.contactInfo});

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final List<TextEditingController> _codeControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  bool isCodeExpired = false;
  int remainingTime = 180; // 3 minutes timer
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in _codeControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
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

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  Future<void> _verifyOtp() async {
    String enteredCode =
        _codeControllers.map((controller) => controller.text).join();

    if (enteredCode.length < 4) {
      Get.snackbar(
        'Error',
        'Please enter a complete 4-digit OTP.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    if (isCodeExpired) {
      Get.snackbar(
        'Error',
        'The OTP has expired. Please request a new one.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    // Prepare the dynamic payload
    final payload = {
      widget.contactInfo.contains('@') ? 'email' : 'phone': widget.contactInfo,
      'otp': enteredCode, // The OTP entered by the user
    };

    final url = Uri.parse('https://api.bppindia.com:8443/api/v1/validate-otp');

    try {
      print('Payload: $payload'); // Debug payload
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(payload),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Handle different response types
      if (response.statusCode == 200) {
        if (response.body.startsWith('{')) {
          // If the response is in JSON format
          final responseBody = json.decode(response.body);
          if (responseBody['status'] == 'success') {
            Get.snackbar(
              'Success',
              'OTP verified successfully!',
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
            Get.to(() => PersonalPage());
          } else {
            Get.snackbar(
              'Error',
              responseBody['message'] ?? 'Invalid OTP. Please try again.',
              backgroundColor: Colors.redAccent,
              colorText: Colors.white,
            );
          }
        } else {
          // If the response is a plain string (e.g., "OTP is valid!")
          Get.snackbar(
            'Success',
            response.body, // Use the plain text response
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          // Get.to(() => PersonalPage());
          Get.to(() => RegistrationPage());
        }
      } else {
        Get.snackbar(
          'Error',
          'Server error: ${response.statusCode}. Please try again later.',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      print('Network error: $error'); // Debug network error
      Get.snackbar(
        'Error',
        'Network error: Unable to reach the server.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void _clearFields() {
    for (var controller in _codeControllers) {
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              // This will center the card in the screen
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  // Adjusted vertical padding
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/bpp_logo2.png', height: 90),
                      Text(
                        'Bharatiya Popular Party',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Enter OTP sent to ${widget.contactInfo}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 5),
                            width: 40,
                            height: 50,
                            child: TextField(
                              controller: _codeControllers[index],
                              focusNode: _focusNodes[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              onChanged: (value) => _onChanged(value, index),
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 16),
                      Text(
                        isCodeExpired
                            ? 'Code expired! Please request a new one.'
                            : 'Time remaining: $formattedTime',
                        style: TextStyle(
                          fontSize: 14,
                          color: isCodeExpired ? Colors.red : Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _verifyOtp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Verify OTP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10),
                      if (isCodeExpired)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isCodeExpired = false;
                              remainingTime = 180;
                              _clearFields();
                              _startTimer();
                            });
                          },
                          child: Text(
                            'Resend OTP',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
