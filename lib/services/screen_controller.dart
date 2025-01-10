// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class ScreenController extends GetxController {
//   var personalEmailController = TextEditingController();
//   var isEligibleChecked = false.obs;
//   var isAcceptTerms = false.obs;
//
//   void toggleEligibleCheckbox() {
//     isEligibleChecked.value = !isEligibleChecked.value;
//   }
//
//   void toggleAcceptTerms() {
//     isAcceptTerms.value = !isAcceptTerms.value;
//   }
//
//   // Method to send OTP to the entered email
//   Future<Map<String, dynamic>> sendOtp({required String email}) async {
//     final String apiUrl =
//         'http://ec2-13-232-238-37.ap-south-1.compute.amazonaws.com:8080/api/v1/send-otp';
//
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': email}),
//       );
//
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body); // Return the response as a Map
//       } else {
//         throw Exception('Failed to send OTP');
//       }
//     } catch (e) {
//       throw Exception('Error occurred: $e');
//     }
//   }
// }
