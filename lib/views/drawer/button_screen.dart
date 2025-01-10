// import 'package:bpp_frontend/views/drawer/community_contribution.dart';
// import 'package:bpp_frontend/views/drawer/dashbaord.dart';
// import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
// import 'package:flutter/material.dart';
//
// class ButtonScreen1 extends StatefulWidget {
//   @override
//   _ButtonScreen1State createState() => _ButtonScreen1State();
// }
//
// class _ButtonScreen1State extends State<ButtonScreen1> {
//   bool showMap = true; // State to toggle between MapScreen and StatisticsScreen
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   showMap = true; // Show MapScreen
//                 });
//               },
//               child: Text('Map'),
//             ),
//             SizedBox(width: 8),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   showMap = false; // Show StatisticsScreen
//                 });
//               },
//               child: Text('Statistics'),
//             ),
//           ],
//         ),
//         SizedBox(height: 16),
//         // Display the screen based on the `showMap` state
//         if (showMap) MapScreen(),
//         if (!showMap) CommunityContributionScreen(),
//       ],
//     );
//   }
// }
