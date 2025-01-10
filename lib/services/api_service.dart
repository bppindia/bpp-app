// // // api_service.dart
// //
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// //
// // // Define the base URL for the API
// // const String apiUrl =
// //     "http://ec2-13-232-238-37.ap-south-1.compute.amazonaws.com:8080/api/v1/members";
// //
// // // Function to submit the form data
// // Future<void> submitForm({
// //   required String username,
// //   required String password,
// //   required String confirmPassword,
// //   required String pin,
// //   required String confirmPin,
// //   required String addressLine1,
// //   required String addressLine2,
// //   required String city,
// //   required String taluka,
// //   required String district,
// //   required String state,
// //   required String pincode,
// // }) async {
// //   final Map<String, dynamic> formData = {
// //     "username": username,
// //     "password": password,
// //     "confirmPassword": confirmPassword,
// //     "pin": pin,
// //     "confirmPin": confirmPin,
// //     "addressLine1": addressLine1,
// //     "addressLine2": addressLine2,
// //     "city": city,
// //     "taluka": taluka,
// //     "district": district,
// //     "state": state,
// //     "pincode": pincode,
// //   };
// //
// //   try {
// //     final response = await http.post(
// //       Uri.parse(apiUrl),
// //       headers: {
// //         "Content-Type": "application/json",
// //       },
// //       body: json.encode(formData),
// //     );
// //
// //     if (response.statusCode == 200) {
// //       // Success
// //       print("Data submitted successfully");
// //     } else {
// //       // Failure
// //       print("Failed to submit data: ${response.body}");
// //     }
// //   } catch (e) {
// //     print("Error submitting data: $e");
// //   }
// // }
//
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// //
// // class ApiService {
// //   static const String baseUrl =
// //       'http://ec2-13-232-238-37.ap-south-1.compute.amazonaws.com:8080/api/v1';
// //
// //   static Future<http.Response> postMemberDetails(
// //       Map<String, dynamic> data) async {
// //     final url = Uri.parse('$baseUrl/members');
// //     final response = await http.post(url,
// //         headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
// //     return response;
// //   }
// //
// //   static Future<http.Response> postAddressDetails(
// //       Map<String, dynamic> data) async {
// //     final url = Uri.parse(
// //         '$baseUrl/members'); // Assuming the endpoint for addresses is '/addresses'
// //     final response = await http.post(url,
// //         headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
// //     return response;
// //   }
// //
// //   static Future<http.Response> postPasswordDetails(
// //       Map<String, dynamic> data) async {
// //     final url = Uri.parse(
// //         '$baseUrl/members'); // Assuming the endpoint for passwords is '/passwords'
// //     final response = await http.post(url,
// //         headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
// //     return response;
// //   }
// // }
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ApiService {
//   static const String baseUrl =
//       'http://ec2-13-232-238-37.ap-south-1.compute.amazonaws.com:8080/api/v1';
//
//   Future<bool> postMemberDetails(Map<String, dynamic> memberData) async {
//     final url = Uri.parse('$baseUrl/members');
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode(memberData),
//       );
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print('Member details successfully saved.');
//         return true;
//       } else {
//         print('Failed to save member details: ${response.body}');
//         return false;
//       }
//     } catch (e) {
//       print('Error posting member details: $e');
//       return false;
//     }
//   }
// }
