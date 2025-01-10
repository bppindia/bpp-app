// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class ChangePinScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Welcome to Change Pin',
//           style: TextStyle(
//               fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
//         ),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         leading: GestureDetector(
//           onTap: () {
//             // Add your functionality for the arrow button here
//             Navigator.pop(context);
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(10.0), // Adjust padding as needed
//             child: SvgPicture.asset(
//               'assets/images/arrow.svg', // Your SVG file path
//               color: Colors.white, // Color of the arrow (if necessary)
//               // height: 10.0, // Size of the arrow
//               // width: 10.0, // Size of the arrow
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Change Pin Section
//               Container(
//                 padding: const EdgeInsets.all(20.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.shade300,
//                       blurRadius: 10,
//                       spreadRadius: 1,
//                       offset: Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Change Pin",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     // Current Pin
//                     Text(
//                       "Current Pin",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: "Enter your current pin",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(color: Colors.grey.shade300),
//                         ),
//                         filled: true,
//                         fillColor: Colors.grey.shade100,
//                       ),
//                       obscureText: true,
//                       keyboardType: TextInputType.number,
//                     ),
//                     SizedBox(height: 16),
//                     // New Pin
//                     Text(
//                       "New Pin",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: "Enter your new pin",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(color: Colors.grey.shade300),
//                         ),
//                         filled: true,
//                         fillColor: Colors.grey.shade100,
//                       ),
//                       obscureText: true,
//                       keyboardType: TextInputType.number,
//                     ),
//                     SizedBox(height: 16),
//                     // Confirm Pin
//                     Text(
//                       "Confirm Pin",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: "Confirm your new pin",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(color: Colors.grey.shade300),
//                         ),
//                         filled: true,
//                         fillColor: Colors.grey.shade100,
//                       ),
//                       obscureText: true,
//                       keyboardType: TextInputType.number,
//                     ),
//                     SizedBox(height: 20),
//                     // Save Changes Button
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 10),
//                         backgroundColor: Colors.black,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: const Text(
//                         'Save Changes',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.grey.shade100,
//     );
//   }
// }
