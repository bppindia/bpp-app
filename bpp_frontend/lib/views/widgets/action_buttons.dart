// import 'package:flutter/material.dart';
//
// class ActionButtons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: _buildCustomButton(
//               label: "Contribution",    //Community contribution
//               backgroundColor: Colors.grey[300]!,
//               textColor: Colors.black,
//               onPressed: () {
//                 // Add your functionality here
//               },
//               isWideScreen: screenWidth > 400,
//             ),
//           ),
//           SizedBox(width: screenWidth * 0.04), // Responsive spacing between buttons
//           Expanded(
//             child: _buildCustomButton(
//               label: "Deposit",
//               backgroundColor: Colors.indigo[700]!,
//               textColor: Colors.white,
//               onPressed: () {
//                 // Add your functionality here
//               },
//               isWideScreen: screenWidth > 400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Custom button widget with responsive properties
//   Widget _buildCustomButton({
//     required String label,
//     required Color backgroundColor,
//     required Color textColor,
//     required VoidCallback onPressed,
//     required bool isWideScreen,
//   }) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 200),
//       curve: Curves.easeInOut,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           foregroundColor: textColor,
//           backgroundColor: backgroundColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20), // Adjusted for a compact look
//           ),
//           padding: EdgeInsets.symmetric(
//             vertical: isWideScreen ? 10 : 8, // Smaller padding on narrow screens
//             horizontal: isWideScreen ? 0 : 8, // Extra horizontal padding for narrow screens
//           ),
//           elevation: 2,
//         ).copyWith(
//           overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
//             if (states.contains(MaterialState.pressed)) {
//               return backgroundColor.withOpacity(0.7);
//             }
//             if (states.contains(MaterialState.hovered)) {
//               return backgroundColor.withOpacity(0.85);
//             }
//             return null;
//           }),
//         ),
//         child: Text(
//           label,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: isWideScreen ? 16 : 14, // Smaller font size on narrow screens
//             fontWeight: FontWeight.bold,
//             color: textColor,
//             letterSpacing: 0.2,
//           ),
//         ),
//       ),
//     );
//   }
// }
