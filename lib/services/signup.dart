// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ApiService {
//   static const String baseUrl =
//       'http://ec2-13-232-238-37.ap-south-1.compute.amazonaws.com:8080/api/v1/signup';
//
//   static Future<Map<String, dynamic>> signup(
//       Map<String, dynamic> userData) async {
//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(userData),
//     );
//
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to sign up');
//     }
//   }
// }
//correct code

//mayur code

///////Latest Comm///

// import 'dart:convert';
// import 'dart:io'; // for File
// import 'dart:typed_data';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart'; // for MediaType
//
// class ApiService {
//   static const String baseUrl = "https://api.bppindia.com:8443/api/v1/signup";
//
//   // Function to send data via multipart/form-data POST request
//   static Future<Map<String, dynamic>> postData(
//       Map<String, dynamic> data, List<File> files) async {
//     try {
//       var uri = Uri.parse(baseUrl);
//
//       var request = http.MultipartRequest('POST', uri);
//
//       // Add form fields (non-file data)
//       data.forEach((key, value) {
//         if (value != null) {
//           request.fields[key] = value.toString();
//         }
//       });
//
//       // Add files to the form data (if any)
//       if (files.isNotEmpty) {
//         for (var file in files) {
//           var fileBytes = await file.readAsBytes();
//           var fileName = file.path.split('/').last;
//           request.files.add(http.MultipartFile.fromBytes(
//             'file', // the field name on the server side (check the API docs for the correct field name)
//             fileBytes,
//             filename: fileName,
//             contentType: MediaType(
//                 'image', 'jpeg'), // Or the file type (jpeg, png, etc.)
//           ));
//         }
//       }
//
//       // Send the request
//       var response = await request.send();
//
//       // Check for success status code
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var responseBody = await response.stream.bytesToString();
//         return jsonDecode(responseBody);
//       } else {
//         print("Error Status Code: ${response.statusCode}");
//         var responseBody = await response.stream.bytesToString();
//         print("Error Response Body: $responseBody");
//         throw Exception('Failed to post data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Exception: $e");
//       throw Exception('Error: $e');
//     }
//   }
//
//   // Function to submit data from all screens, including files
//   static Future<void> submitDataFromAllScreens({
//     required String qualification,
//     required String profession,
//     required String position,
//     required String password,
//     required String firstName,
//     required String lastName,
//     required String title,
//     required String email,
//     required String middleName,
//     required String phone,
//     required String dob,
//     required String gender,
//     required String addressLine1,
//     required String addressLine2,
//     required String cityOrVillage,
//     required String state,
//     required String pincode,
//     required String district,
//     required String taluka,
//     required String referralCode,
//     required String aadhaarNumber,
//     required String voterId,
//     required String aadhaarFront,
//     required String aadhaarBack,
//     required String voterFront,
//     required String voterBack,
//     required String age,
//     required List<File> files,
//     // Add the list of files here
//   }) async {
//     Map<String, dynamic> data = {
//       'qualification': qualification,
//       'profession': profession,
//       'position': position,
//       'password': password,
//       'middleName': middleName.isEmpty ? null : middleName,
//       'firstName': firstName,
//       'lastName': lastName,
//       'title': title,
//       'age': age,
//       'email': email,
//       'gender': gender,
//       'phone': phone,
//       'dateOfBirth': dob,
//       'addressLine1': addressLine1,
//       'addressLine2': addressLine2,
//       'cityOrVillage': cityOrVillage,
//       'state': state,
//       'pincode': pincode,
//       'district': district,
//       'taluka': taluka,
//       'referralCode': referralCode.isEmpty ? null : referralCode,
//       'voterId': voterId,
//       'voterFront': voterFront,
//       'voterBack': voterBack,
//       'aadhaarNumber': aadhaarNumber,
//       'aadhaarFront': aadhaarFront,
//       'aadhaarBack': aadhaarBack,
//     };
//
//     print('Payload being sent: $data');
//     await postData(data, files);
//   }
// }

///////02-01-2025
// import 'dart:convert';
// import 'dart:io'; // for File
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart'; // for MediaType
//
// class ApiService {
//   static const String baseUrl = "https://api.bppindia.com:8443/api/v1/signup";
//
//   // Function to send multipart/form-data POST request
//   static Future<Map<String, dynamic>> postData(
//       Map<String, dynamic> data, Map<String, File> fileMap) async {
//     try {
//       var uri = Uri.parse(baseUrl);
//       var request = http.MultipartRequest('POST', uri);
//
//       // Add form fields (non-file data)
//       data.forEach((key, value) {
//         if (value != null && value.toString().isNotEmpty) {
//           request.fields[key] = value.toString();
//         }
//       });
//
//       // Add files to the request
//       for (var entry in fileMap.entries) {
//         var file = entry.value;
//         if (file.existsSync()) {
//           request.files.add(await http.MultipartFile.fromPath(
//             entry.key,
//             file.path,
//             contentType:
//                 MediaType('image', 'jpeg'), // Adjust MIME type if needed
//           ));
//         }
//       }
//
//       // Send the request
//       var response = await request.send();
//
//       // Handle the response
//       var responseBody = await response.stream.bytesToString();
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return jsonDecode(responseBody);
//       } else {
//         print("Error Status Code: ${response.statusCode}");
//         print("Error Response Body: $responseBody");
//         throw Exception('Failed to post data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Exception: $e");
//       throw Exception('Error: $e');
//     }
//   }
//
//   // Function to prepare data and send a request
//   static Future<void> submitDataFromAllScreens({
//     // required String qualification,
//     // required String profession,
//     // required String position,
//     // required String password,
//     // required String firstName,
//     // required String lastName,
//     // required String title,
//     // required String age,
//     // required String email,
//     // required String middleName,
//     // required String phone,
//     // required String dob,
//     // required String gender,
//     // required String addressLine1,
//     // required String addressLine2,
//     // required String cityOrVillage,
//     // required String state,
//     // required String pincode,
//     // required String district,
//     // String? taluka,
//     // String? referralCode,
//     required String aadhaarNumber,
//     String? voterId,
//     File? aadhaarFront,
//     File? aadhaarBack,
//     File? voterFront,
//     File? voterBack,
//   }) async {
//     // Form fields
//     Map<String, dynamic> data = {
//       // 'qualification': qualification,
//       // 'profession': profession,
//       // 'position': position,
//       // 'password': password,
//       // 'middleName': middleName.isNotEmpty ? middleName : null,
//       // 'firstName': firstName,
//       // 'lastName': lastName,
//       // 'title': title,
//       // 'email': email,
//       // 'age': age,
//       // 'gender': gender,
//       // 'phone': phone,
//       // 'dateOfBirth': dob,
//       // 'addressLine1': addressLine1,
//       // 'addressLine2': addressLine2,
//       // 'cityOrVillage': cityOrVillage,
//       // 'state': state,
//       // 'pincode': pincode,
//       // 'district': district,
//       // 'taluka': taluka,
//       // 'referralCode': referralCode?.isEmpty == true ? null : referralCode,
//       'aadhaarNumber': aadhaarNumber,
//       'voterId': voterId,
//     };
//
//     // File fields (add to map only if not null)
//     Map<String, File> fileMap = {
//       if (aadhaarFront != null) 'aadhaarFront': aadhaarFront,
//       if (aadhaarBack != null) 'aadhaarBack': aadhaarBack,
//       if (voterFront != null) 'voterFront': voterFront,
//       if (voterBack != null) 'voterBack': voterBack,
//     };
//
//     // Debugging: Print data and files
//     print('Payload being sent: $data');
//     print('Files being sent: ${fileMap.keys}');
//
//     // Send the request
//     await postData(data, fileMap);
//   }
// }

// import 'dart:convert';
// import 'dart:io'; // for File
// import 'dart:typed_data';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart'; // for MediaType
//
// class ApiService {
//   static const String baseUrl = "https://api.bppindia.com:8443/api/v1/signup";
//
//   // Function to send data via multipart/form-data POST request
//   static Future<Map<String, dynamic>> postData(
//       Map<String, dynamic> data, List<File> files) async {
//     try {
//       var uri = Uri.parse(baseUrl);
//
//       var request = http.MultipartRequest('POST', uri);
//
//       // Add form fields (non-file data)
//       data.forEach((key, value) {
//         if (value != null) {
//           request.fields[key] = value.toString();
//         }
//       });
//
//       // Add files to the form data (if any)
//       if (files.isNotEmpty) {
//         for (var file in files) {
//           var fileBytes = await file.readAsBytes();
//           var fileName = file.path.split('/').last;
//           request.files.add(http.MultipartFile.fromBytes(
//             'file', // the field name on the server side (check the API docs for the correct field name)
//             fileBytes,
//             filename: fileName,
//             contentType: MediaType(
//                 'image', 'jpeg'), // Or the file type (jpeg, png, etc.)
//           ));
//         }
//       }
//
//       // Send the request
//       var response = await request.send();
//
//       // Check for success status code
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var responseBody = await response.stream.bytesToString();
//         return jsonDecode(responseBody);
//       } else {
//         print("Error Status Code: ${response.statusCode}");
//         var responseBody = await response.stream.bytesToString();
//         print("Error Response Body: $responseBody");
//         throw Exception('Failed to post data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Exception: $e");
//       throw Exception('Error: $e');
//     }
//   }
//
//   // Function to submit data from all screens, including files
//   static Future<void> submitDataFromAllScreens({
//     // required String qualification,
//     // required String profession,
//     // required String position,
//     required String password,
//     // required String firstName,
//     // required String lastName,
//     // required String title,
//     // required String email,
//     // required String middleName,
//     // required String phone,
//     // required String dob,
//     // required String gender,
//     // required String addressLine1,
//     // required String addressLine2,
//     // required String cityOrVillage,
//     // required String state,
//     // required String pincode,
//     // required String district,
//     // required String taluka,
//     required String referralCode,
//     required String aadhaarNumber,
//     required String voterId,
//     required String aadhaarFront,
//     required String aadhaarBack,
//     required String voterFront,
//     required String voterBack,
//     //required String age,
//     required List<File> files,
//     // Add the list of files here
//   }) async {
//     Map<String, dynamic> data = {
//       // 'qualification': qualification,
//       // 'profession': profession,
//       // 'position': position,
//       'password': password,
//       // 'middleName': middleName.isEmpty ? null : middleName,
//       // 'firstName': firstName,
//       // 'lastName': lastName,
//       // 'title': title,
//       // 'age': age,
//       // 'email': email,
//       // 'gender': gender,
//       // 'phone': phone,
//       // 'dateOfBirth': dob,
//       // 'addressLine1': addressLine1,
//       // 'addressLine2': addressLine2,
//       // 'cityOrVillage': cityOrVillage,
//       // 'state': state,
//       // 'pincode': pincode,
//       // 'district': district,
//       // 'taluka': taluka,
//       'referralCode': referralCode.isEmpty ? null : referralCode,
//       'voterId': voterId,
//       'voterFront': voterFront,
//       'voterBack': voterBack,
//       'aadhaarNumber': aadhaarNumber,
//       'aadhaarFront': aadhaarFront,
//       'aadhaarBack': aadhaarBack,
//     };
//
//     print('Payload being sent: $data');
//     await postData(data, files);
//   }
// }

// class ApiService {
//   static const String baseUrl = "https://api.bppindia.com:8443/api/v1/signup";
//
//   // Modified to handle both file bytes and Base64 strings
//   static Future<Map<String, dynamic>> postData(
//       Map<String, dynamic> data, Map<String, Uint8List> fileBytes) async {
//     try {
//       var uri = Uri.parse(baseUrl);
//       var request = http.MultipartRequest('POST', uri);
//
//       // Add form fields (non-file data)
//       data.forEach((key, value) {
//         if (value != null) {
//           request.fields[key] = value.toString();
//         }
//       });
//
//       // Add files to the request
//       fileBytes.forEach((key, value) {
//         request.files.add(
//           http.MultipartFile.fromBytes(
//             key,
//             value,
//             filename:
//                 '${key}.jpg', // Adjust file extension based on actual type
//             contentType: MediaType('image', 'jpeg'),
//           ),
//         );
//       });
//
//       var response = await request.send();
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var responseBody = await response.stream.bytesToString();
//         return jsonDecode(responseBody);
//       } else {
//         print("Error Status Code: ${response.statusCode}");
//         var responseBody = await response.stream.bytesToString();
//         print("Error Response Body: $responseBody");
//         throw Exception('Failed to post data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Exception: $e");
//       throw Exception('Error: $e');
//     }
//   }
//
//   static Future<void> submitDataFromAllScreens({
//     required String qualification,
//     required String profession,
//     required String position,
//     required String password,
//     required String firstName,
//     required String lastName,
//     required String title,
//     required String email,
//     required String middleName,
//     required String phone,
//     required String dob,
//     required String gender,
//     required String addressLine1,
//     required String addressLine2,
//     required String cityOrVillage,
//     required String state,
//     required String pincode,
//     required String district,
//     required String taluka,
//     required String referralCode,
//     required String aadhaarNumber,
//     required String voterId,
//     required Uint8List aadhaarFront,
//     required Uint8List aadhaarBack,
//     required Uint8List voterFront,
//     required Uint8List voterBack,
//     required String age,
//   }) async {
//     // Regular form data
//     Map<String, dynamic> data = {
//       'qualification': qualification,
//       'profession': profession,
//       'position': position,
//       'password': password,
//       'middleName': middleName.isEmpty ? null : middleName,
//       'firstName': firstName,
//       'lastName': lastName,
//       'title': title,
//       'age': age,
//       'email': email,
//       'gender': gender,
//       'phone': phone,
//       'dateOfBirth': dob,
//       'addressLine1': addressLine1,
//       'addressLine2': addressLine2,
//       'cityOrVillage': cityOrVillage,
//       'state': state,
//       'pincode': pincode,
//       'district': district,
//       'taluka': taluka,
//       'referralCode': referralCode.isEmpty ? null : referralCode,
//       'voterId': voterId,
//       'aadhaarNumber': aadhaarNumber,
//     };
//
//     // File data
//     Map<String, Uint8List> fileBytes = {
//       'aadhaarFront': aadhaarFront,
//       'aadhaarBack': aadhaarBack,
//       'voterFront': voterFront,
//       'voterBack': voterBack,
//     };
//
//     print('Payload being sent: $data');
//     await postData(data, fileBytes);
//   }
// }
//multipart
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'dart:io';
//
// class ApiService {
//   static const String baseUrl = "https://api.bppindia.com:8443/api/v1/signup";
//
//   // Function to send multipart request
//   static Future<Map<String, dynamic>> postDataWithFiles({
//     required Map<String, String> fields,
//     required File aadhaarCard,
//     required File voterCard,
//   }) async {
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
//
//       // Add text fields
//       request.fields.addAll(fields);
//
//       // Add file fields
//       request.files.add(await http.MultipartFile.fromPath(
//         'aadhaarCard',
//         aadhaarCard.path,
//       ));
//
//       request.files.add(await http.MultipartFile.fromPath(
//         'voterCard',
//         voterCard.path,
//       ));
//
//       var streamedResponse = await request.send();
//       var response = await http.Response.fromStream(streamedResponse);
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return jsonDecode(response.body);
//       } else {
//         print("Error Status Code: ${response.statusCode}");
//         print("Error Response Body: ${response.body}");
//         throw Exception('Failed to post data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Exception: $e");
//       throw Exception('Error: $e');
//     }
//   }
//
//   // Updated function to submit all data including files
//   static Future<void> submitDataFromAllScreens({
//     required String qualification,
//     required String profession,
//     required String position,
//     required String password,
//     required String firstName,
//     required String lastName,
//     required String title,
//     required String email,
//     required String middleName,
//     required String phone,
//     required String age,
//     required String dob,
//     required String gender,
//     required String addressLine1,
//     required String addressLine2,
//     required String cityOrVillage,
//     required String state,
//     required String pincode,
//     required String district,
//     required String taluka,
//     required String referralCode,
//     required String voterId,
//     required String aadhaarNumber,
//     required File aadhaarCard, // Changed to File type
//     required File voterCard, // Changed to File type
//   }) async {
//     Map<String, String> fields = {
//       'qualification': qualification,
//       'profession': profession,
//       'position': position,
//       'password': password,
//       'middleName': middleName.isEmpty ? '' : middleName,
//       'firstName': firstName,
//       'lastName': lastName,
//       'title': title,
//       'email': email,
//       'gender': gender,
//       'phone': phone,
//       'dateOfBirth': dob,
//       'addressLine1': addressLine1,
//       'addressLine2': addressLine2,
//       'cityOrVillage': cityOrVillage,
//       'state': state,
//       'pincode': pincode,
//       'district': district,
//       'taluka': taluka,
//       'referralCode': referralCode.isEmpty ? '' : referralCode,
//       'voterId': voterId,
//       'aadhaarNumber': aadhaarNumber,
//     };
//
//     print('Payload being sent: $fields');
//     await postDataWithFiles(
//       fields: fields,
//       aadhaarCard: aadhaarCard,
//       voterCard: voterCard,
//     );
//   }
// }

// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'dart:typed_data';
// import 'package:http_parser/http_parser.dart';
// import 'package:path/path.dart' as path;
//
// class ApiService {
//   static const String baseUrl = "https://api.bppindia.com:8443/api/v1/signup";
//
//   static MediaType _getMediaType(String fileName) {
//     String ext = path.extension(fileName).toLowerCase();
//     switch (ext) {
//       case '.pdf':
//         return MediaType('application', 'pdf');
//       case '.png':
//         return MediaType('image', 'png');
//       case '.jpg':
//       case '.jpeg':
//         return MediaType('image', 'jpeg');
//       default:
//         return MediaType('application', 'octet-stream');
//     }
//   }
//
//   static Future<void> submitDataFromAllScreens({
//     required String qualification,
//     required String profession,
//     required String position,
//     required String password,
//     required String firstName,
//     required String lastName,
//     required String title,
//     required String email,
//     required String middleName,
//     required String phone,
//     required String dob,
//     required String gender,
//     required String addressLine1,
//     required String addressLine2,
//     required String cityOrVillage,
//     required String state,
//     required String pincode,
//     required String district,
//     required String taluka,
//     required String referralCode,
//     required String aadhaarNumber,
//     required String aadhaarFront,
//     required String aadhaarBack,
//     required String voterId,
//     required String voterFront,
//     required String voterBack,
//     required String age,
//   }) async {
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
//
//       // Add text fields
//       Map<String, String> fields = {
//         'title': title,
//         'firstName': firstName,
//         'lastName': lastName,
//         'email': email,
//         'phone': phone,
//         'dateOfBirth': dob,
//         'gender': gender,
//         'age': age,
//         'addressLine1': addressLine1,
//         'cityOrVillage': cityOrVillage,
//         'district': district,
//         'state': state,
//         'pincode': pincode,
//         'password': password,
//       };
//
//       // Add optional fields if they're not empty
//       if (middleName.isNotEmpty) fields['middleName'] = middleName;
//       if (addressLine2.isNotEmpty) fields['addressLine2'] = addressLine2;
//       if (qualification.isNotEmpty) fields['qualification'] = qualification;
//       if (profession.isNotEmpty) fields['profession'] = profession;
//       if (position.isNotEmpty) fields['position'] = position;
//       if (referralCode.isNotEmpty) fields['referralCode'] = referralCode;
//       if (taluka.isNotEmpty) fields['taluka'] = taluka;
//
//       // Add ID document fields if provided
//       if (aadhaarNumber.isNotEmpty) fields['aadhaarNumber'] = aadhaarNumber;
//       if (voterId.isNotEmpty) fields['voterId'] = voterId;
//
//       request.fields.addAll(fields);
//
//       // Add file attachments if they exist
//       if (aadhaarFront.isNotEmpty) {
//         File aadhaarFrontFile = File(aadhaarFront);
//         String fileName = path.basename(aadhaarFront);
//         request.files.add(await http.MultipartFile.fromPath(
//             'aadhaarFront', aadhaarFrontFile.path,
//             contentType: _getMediaType(fileName)));
//       }
//
//       if (aadhaarBack.isNotEmpty) {
//         File aadhaarBackFile = File(aadhaarBack);
//         String fileName = path.basename(aadhaarBack);
//         request.files.add(await http.MultipartFile.fromPath(
//             'aadhaarBack', aadhaarBackFile.path,
//             contentType: _getMediaType(fileName)));
//       }
//
//       if (voterFront.isNotEmpty) {
//         File voterFrontFile = File(voterFront);
//         String fileName = path.basename(voterFront);
//         request.files.add(await http.MultipartFile.fromPath(
//             'voterFront', voterFrontFile.path,
//             contentType: _getMediaType(fileName)));
//       }
//
//       if (voterBack.isNotEmpty) {
//         File voterBackFile = File(voterBack);
//         String fileName = path.basename(voterBack);
//         request.files.add(await http.MultipartFile.fromPath(
//             'voterBack', voterBackFile.path,
//             contentType: _getMediaType(fileName)));
//       }
//
//       // Send the request
//       var response = await request.send();
//       var responseBody = await response.stream.bytesToString();
//
//       if (response.statusCode != 200 && response.statusCode != 201) {
//         print("Error Status Code: ${response.statusCode}");
//         print("Error Response Body: $responseBody");
//         throw Exception('Failed to submit data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Exception: $e");
//       throw Exception('Error submitting data: $e');
//     }
//   }
// }

//swapnil code
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'dart:typed_data';
// import 'package:http_parser/http_parser.dart';
// import 'package:path/path.dart' as path;
//
// class ApiService {
//   static const String baseUrl = "https://api.bppindia.com:8443/api/v1/signup";
//
//   static MediaType _getMediaType(String fileName) {
//     String ext = fileName.toLowerCase().split('.').last;
//     switch (ext) {
//       case 'pdf':
//         return MediaType('application', 'pdf');
//       case 'png':
//         return MediaType('image', 'png');
//       case 'jpg':
//       case 'jpeg':
//         return MediaType('image', 'jpeg');
//       default:
//         return MediaType('application', 'octet-stream');
//     }
//   }
//
//   static Future<void> submitDataFromAllScreens({
//     required String qualification,
//     required String profession,
//     required String position,
//     required String password,
//     required String firstName,
//     required String lastName,
//     required String title,
//     required String email,
//     required String middleName,
//     required String phone,
//     required String dob,
//     required String gender,
//     required String addressLine1,
//     required String addressLine2,
//     required String cityOrVillage,
//     required String state,
//     required String pincode,
//     required String district,
//     required String taluka,
//     required String referralCode,
//     required String aadhaarNumber,
//     required String aadhaarFront,
//     required String aadhaarBack,
//     required String voterId,
//     required String voterFront,
//     required String voterBack,
//     required String age,
//   }) async {
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
//
//       // Add text fields
//       Map<String, String> fields = {
//         'title': title,
//         'firstName': firstName,
//         'lastName': lastName,
//         'email': email,
//         'phone': phone,
//         'dateOfBirth': dob,
//         'gender': gender,
//         'age': age,
//         'addressLine1': addressLine1,
//         'cityOrVillage': cityOrVillage,
//         'district': district,
//         'state': state,
//         'pincode': pincode,
//         'password': password,
//       };
//
//       // Add optional fields if they're not empty
//       if (middleName.isNotEmpty) fields['middleName'] = middleName;
//       if (addressLine2.isNotEmpty) fields['addressLine2'] = addressLine2;
//       if (qualification.isNotEmpty) fields['qualification'] = qualification;
//       if (profession.isNotEmpty) fields['profession'] = profession;
//       if (position.isNotEmpty) fields['position'] = position;
//       if (referralCode.isNotEmpty) fields['referralCode'] = referralCode;
//       if (taluka.isNotEmpty) fields['taluka'] = taluka;
//
//       // Add ID document fields if provided
//       if (aadhaarNumber.isNotEmpty) fields['aadhaarNumber'] = aadhaarNumber;
//       if (voterId.isNotEmpty) fields['voterId'] = voterId;
//
//       request.fields.addAll(fields);
//
//       // Add file attachments if they exist
//       if (aadhaarFront.isNotEmpty) {
//         File aadhaarFrontFile = File(aadhaarFront);
//         String fileName = path.basename(aadhaarFront);
//         request.files.add(await http.MultipartFile.fromPath(
//             'aadhaarFront', aadhaarFrontFile.path,
//             contentType: _getMediaType(fileName)));
//       }
//
//       if (aadhaarBack.isNotEmpty) {
//         File aadhaarBackFile = File(aadhaarBack);
//         String fileName = path.basename(aadhaarBack);
//         request.files.add(await http.MultipartFile.fromPath(
//             'aadhaarBack', aadhaarBackFile.path,
//             contentType: _getMediaType(fileName)));
//       }
//
//       if (voterFront.isNotEmpty) {
//         File voterFrontFile = File(voterFront);
//         String fileName = path.basename(voterFront);
//         request.files.add(await http.MultipartFile.fromPath(
//             'voterFront', voterFrontFile.path,
//             contentType: _getMediaType(fileName)));
//       }
//
//       if (voterBack.isNotEmpty) {
//         File voterBackFile = File(voterBack);
//         String fileName = path.basename(voterBack);
//         request.files.add(await http.MultipartFile.fromPath(
//             'voterBack', voterBackFile.path,
//             contentType: _getMediaType(fileName)));
//       }
//
//       // Send the request
//       var response = await request.send();
//       var responseBody = await response.stream.bytesToString();
//
//       if (response.statusCode != 200 && response.statusCode != 201) {
//         print("Error Status Code: ${response.statusCode}");
//         print("Error Response Body: $responseBody");
//         throw Exception('Failed to submit data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Exception: $e");
//       throw Exception('Error submitting data: $e');
//     }
//   }
// }

// import 'dart:convert';
// import 'dart:io'; // for File
// import 'dart:typed_data';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart'; // for MediaType
//
// class ApiService {
//   static const String baseUrl = "https://api.bppindia.com:8443/api/v1/signup";
//
//   // Function to send data via multipart/form-data POST request
//   static Future<Map<String, dynamic>> postData(
//       Map<String, dynamic> data, List<File> files) async {
//     try {
//       var uri = Uri.parse(baseUrl);
//
//       var request = http.MultipartRequest('POST', uri);
//
//       // Add form fields (non-file data)
//       data.forEach((key, value) {
//         if (value != null) {
//           request.fields[key] = value.toString();
//         }
//       });
//
//       // Add files to the form data (if any)
//       if (files.isNotEmpty) {
//         for (var file in files) {
//           var fileBytes = await file.readAsBytes();
//           var fileName = file.path.split('/').last;
//           request.files.add(http.MultipartFile.fromBytes(
//             'file', // the field name on the server side (check the API docs for the correct field name)
//             fileBytes,
//             filename: fileName,
//             contentType: MediaType(
//                 'image', 'jpeg'), // Or the file type (jpeg, png, etc.)
//           ));
//         }
//       }
//
//       // Send the request
//       var response = await request.send();
//
//       // Check for success status code
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var responseBody = await response.stream.bytesToString();
//         return jsonDecode(responseBody);
//       } else {
//         print("Error Status Code: ${response.statusCode}");
//         var responseBody = await response.stream.bytesToString();
//         print("Error Response Body: $responseBody");
//         throw Exception('Failed to post data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Exception: $e");
//       throw Exception('Error: $e');
//     }
//   }
//
//   // Function to submit data from all screens, including files
//   static Future<void> submitDataFromAllScreens({
//     required String qualification,
//     required String profession,
//     required String position,
//     required String password,
//     required String firstName,
//     required String lastName,
//     required String title,
//     required String email,
//     required String middleName,
//     required String phone,
//     required String dob,
//     required String gender,
//     required String addressLine1,
//     required String addressLine2,
//     required String cityOrVillage,
//     required String state,
//     required String pincode,
//     required String district,
//     required String taluka,
//     required String referralCode,
//     required String aadhaarNumber,
//     required String voterId,
//     required String aadhaarFront,
//     required String aadhaarBack,
//     required String voterFront,
//     required String voterBack,
//     required String age,
//     required List<File> files,
//
//     // Add the list of files here
//   }) async {
//     Map<String, dynamic> data = {
//       'qualification': qualification,
//       'profession': profession,
//       'position': position,
//       'password': password,
//       'middleName': middleName.isEmpty ? null : middleName,
//       'firstName': firstName,
//       'lastName': lastName,
//       'title': title,
//       'age': age,
//       'email': email,
//       'gender': gender,
//       'phone': phone,
//       'dateOfBirth': dob,
//       'addressLine1': addressLine1,
//       'addressLine2': addressLine2,
//       'cityOrVillage': cityOrVillage,
//       'state': state,
//       'pincode': pincode,
//       'district': district,
//       'taluka': taluka,
//       'referralCode': referralCode.isEmpty ? null : referralCode,
//       'voterId': voterId,
//       'voterFront': voterFront,
//       'voterBack': voterBack,
//       'aadhaarNumber': aadhaarNumber,
//       'aadhaarFront': aadhaarFront,
//       'aadhaarBack': aadhaarBack,
//     };
//
//     print('Payload being sent: $data');
//     await postData(data, files);
//   }
// }

//latest

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

class ApiService {
  static const String baseUrl = "https://api.bppindia.com:8443/api/v1/signup";

  static Future<Map<String, dynamic>> postData(
      Map<String, dynamic> data, List<File> files) async {
    try {
      var uri = Uri.parse(baseUrl);
      var request = http.MultipartRequest('POST', uri);

      data.forEach((key, value) {
        if (value != null) {
          request.fields[key] = value.toString();
        }
      });

      if (files.isNotEmpty) {
        for (var file in files) {
          var fileBytes = await file.readAsBytes();
          var fileName = file.path.split('/').last;
          request.files.add(http.MultipartFile.fromBytes(
            'file',
            fileBytes,
            filename: fileName,
            contentType: MediaType('image', 'jpeg'),
          ));
        }
      }

      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        return jsonDecode(responseBody);
      } else {
        print("Error Status Code: ${response.statusCode}");
        var responseBody = await response.stream.bytesToString();
        print("Error Response Body: $responseBody");
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception('Error: $e');
    }
  }

  static Future<void> submitDataFromAllScreens({
    required String qualification,
    required String profession,
    required String position,
    required String password,
    required String firstName,
    required String lastName,
    required String title,
    required String email,
    required String middleName,
    required String phone,
    required String dob,
    required String gender,
    required String addressLine1,
    required String addressLine2,
    required String cityOrVillage,
    required String state,
    required String pincode,
    required String district,
    required String taluka,
    required String referralCode,
    required String aadhaarNumber,
    required String voterId,
    required String age,
    required List<File> files,
    required String voterFront,
    required String voterBack,
    required String aadhaarBack,
    required String aadhaarFront,
  }) async {
    Map<String, dynamic> data = {
      'qualification': qualification,
      'profession': profession,
      'position': position,
      'password': password,
      'middleName': middleName.isEmpty ? null : middleName,
      'firstName': firstName,
      'lastName': lastName,
      'title': title,
      'age': age,
      'email': email,
      'gender': gender,
      'phone': phone,
      'dateOfBirth': dob,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'cityOrVillage': cityOrVillage,
      'state': state,
      'pincode': pincode,
      'district': district,
      'taluka': taluka,
      'referralCode': referralCode.isEmpty ? null : referralCode,
      'voterId': voterId,
      'aadhaarNumber': aadhaarNumber,
    };

    print('Payload being sent: $data');
    // await postData(data, files);
    await postData(data, [
      File(voterFront),
      File(voterBack),
      File(aadhaarFront),
      File(aadhaarBack),
    ]);
  }
}

// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart' as path;
// import 'package:http_parser/http_parser.dart';
// import 'package:path/path.dart';
//
// class ApiService {
//   static const String baseUrl = "https://api.bppindia.com:8443/api/v1/signup";
//
//   // Helper function to add files to the request
//   static Future<void> addFileToRequest(http.MultipartRequest request,
//       File? file, String? fileType, String fieldName) async {
//     if (file != null) {
//       print('Uploading $fieldName: ${file.path}');
//       try {
//         request.files.add(await http.MultipartFile.fromPath(
//           fieldName,
//           file.path,
//           filename:
//               '${fieldName}_${DateTime.now().millisecondsSinceEpoch}.$fileType',
//         ));
//       } catch (e) {
//         print("Error uploading $fieldName: $e");
//       }
//     } else {
//       print('No file to upload for $fieldName');
//     }
//   }
//
//   // Post data method to send data and files
//   static Future<Map<String, dynamic>> postData(
//       Map<String, dynamic> data, List<File> files) async {
//     try {
//       var uri = Uri.parse(baseUrl);
//       var request = http.MultipartRequest('POST', uri);
//
//       // Add fields to the request
//       data.forEach((key, value) {
//         if (value != null) {
//           request.fields[key] = value.toString();
//         }
//       });
//
//       // Add files to the request
//       if (files.isNotEmpty) {
//         for (var file in files) {
//           var fileBytes = await file.readAsBytes();
//           var fileName = file.path.split('/').last;
//           request.files.add(http.MultipartFile.fromBytes(
//             'file',
//             fileBytes,
//             filename: fileName,
//             contentType: MediaType('image', 'jpeg'),
//           ));
//         }
//       }
//
//       // Send the request
//       var response = await request.send();
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var responseBody = await response.stream.bytesToString();
//         return jsonDecode(responseBody);
//       } else {
//         print("Error Status Code: ${response.statusCode}");
//         var responseBody = await response.stream.bytesToString();
//         print("Error Response Body: $responseBody");
//         throw Exception('Failed to post data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Exception: $e");
//       throw Exception('Error: $e');
//     }
//   }
//
//   // Submit data from all screens including files
//   static Future<void> submitDataFromAllScreens({
//     required String qualification,
//     required String profession,
//     required String position,
//     required String password,
//     required String firstName,
//     required String lastName,
//     required String title,
//     required String email,
//     required String middleName,
//     required String phone,
//     required String dob,
//     required String gender,
//     required String addressLine1,
//     required String addressLine2,
//     required String cityOrVillage,
//     required String state,
//     required String pincode,
//     required String district,
//     required String taluka,
//     required String referralCode,
//     required String aadhaarNumber,
//     required String voterId,
//     required String age,
//     required List<File> files,
//     File? voterFront,
//     File? voterBack,
//     File? aadhaarBack,
//     File? aadhaarFront,
//     required BuildContext context, // Pass BuildContext to the method
//   }) async {
//     Map<String, dynamic> data = {
//       'qualification': qualification,
//       'profession': profession,
//       'position': position,
//       'password': password,
//       'middleName': middleName.isEmpty ? null : middleName,
//       'firstName': firstName,
//       'lastName': lastName,
//       'title': title,
//       'age': age,
//       'email': email,
//       'gender': gender,
//       'phone': phone,
//       'dateOfBirth': dob,
//       'addressLine1': addressLine1,
//       'addressLine2': addressLine2,
//       'cityOrVillage': cityOrVillage,
//       'state': state,
//       'pincode': pincode,
//       'district': district,
//       'taluka': taluka,
//       'referralCode': referralCode.isEmpty ? null : referralCode,
//       'voterId': voterId,
//       'aadhaarNumber': aadhaarNumber,
//     };
//
//     print('Payload being sent: $data');
//
//     try {
//       var uri = Uri.parse(baseUrl);
//       var request = http.MultipartRequest('POST', uri);
//
//       // Add fields to the request
//       data.forEach((key, value) {
//         if (value != null) {
//           request.fields[key] = value.toString();
//         }
//       });
//
//       // Add files using the helper function
//       await addFileToRequest(request, voterFront, 'jpeg', 'voterFront');
//       await addFileToRequest(request, voterBack, 'jpeg', 'voterBack');
//       await addFileToRequest(request, aadhaarFront, 'jpeg', 'aadhaarFront');
//       await addFileToRequest(request, aadhaarBack, 'jpeg', 'aadhaarBack');
//
//       // Send the request
//       var response = await request.send();
//       var responseBody = await response.stream.bytesToString();
//
//       print('Response status: ${response.statusCode}');
//       print('Response body: $responseBody');
//
//       if (response.statusCode == 201) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Signup successful!')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Signup failed: $responseBody')),
//         );
//       }
//     } catch (error) {
//       print('Error: $error');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred. Please try again.')),
//       );
//     }
//   }
// }
