// import 'package:flutter/material.dart';
//
// class DonationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8.0),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 blurRadius: 5,
//                 spreadRadius: 2,
//                 offset: Offset(0, 3), // Shadow position
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Total ad donations',
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black54,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '₹1,35,97,39,013.31',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(width: 4.0),
//                   Icon(
//                     Icons.info_outline,
//                     size: 20.0,
//                     color: Colors.black54,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4.0),
//                     ),
//                   ),
//                   onPressed: () {
//                     // Add your donation logic here
//                   },
//                   child: Text(
//                     'Donate',
//                     style: TextStyle(fontSize: 16.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
