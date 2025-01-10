// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// Future<void> postMemberDetails(Map<String, String> memberData) async {
//   final url = Uri.parse(
//       'http://ec2-13-232-238-37.ap-south-1.compute.amazonaws.com:8080/api/v1/members');
//
//   try {
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode(memberData), // sending the data as JSON
//     );
//
//     if (response.statusCode == 200) {
//       // Handle success response
//       print('Member details posted successfully');
//     } else {
//       // Handle error response
//       print(
//           'Failed to post member details. Status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }
