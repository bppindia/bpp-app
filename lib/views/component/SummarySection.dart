// import 'package:bpp_frontend/views/widgets/dashbaord/community_page.dart';
// import 'package:flutter/material.dart';
//
// class SummarySection extends StatefulWidget {
//   @override
//   _SummarySectionState createState() => _SummarySectionState();
// }
//
// class _SummarySectionState extends State<SummarySection> {
//   bool isVisible = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     bool isWideScreen = screenWidth > 600;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Card(
//         color: Colors.white,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Section 1: Header and Membership
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Dashboard",
//                         style: TextStyle(
//                           fontSize: isWideScreen ? 24 : 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         "Welcome back, Swapnil!",
//                         style: TextStyle(
//                           fontSize: isWideScreen ? 18 : 16,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.person, color: Colors.grey[700]),
//                       SizedBox(width: 8),
//                       Text(
//                         "Membership No: 001",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//
//               // Section 2: User Info and Wallet
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Swapnil Kishor Mahadik",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Row(
//                           children: [
//                             Text(
//                               "Primary Member",
//                               style: TextStyle(
//                                 fontSize: isWideScreen ? 16 : 14,
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                             SizedBox(width: 8),
//                             Icon(
//                               Icons.person,
//                               color: Colors.grey[600],
//                               size: isWideScreen ? 20 : 18,
//                             ),
//                             Icon(
//                               Icons.sync,
//                               color: Colors.grey[600],
//                               size: isWideScreen ? 24 : 20,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.account_balance_wallet,
//                           color: Colors.grey[700]),
//                       SizedBox(width: 8),
//                       Text(
//                         "Balance: ",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       Text(
//                         "₹-229",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//
//               // Section 3: Membership Validity Details
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(Icons.calendar_today, color: Colors.grey[700]),
//                       SizedBox(width: 8),
//                       Text(
//                         "Valid until: Mar 26, 2028",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 12),
//
//               // Section 4: Referrals
//               Center(
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 8,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.grey[300]!),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     "0 Referrals",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Section 5: Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildCustomButton(
//                     label: "Map",
//                     backgroundColor: Colors.blue,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       // Handle Map button action
//                     },
//                     isWideScreen: isWideScreen,
//                   ),
//                   SizedBox(width: 16), // Add spacing between buttons
//                   _buildCustomButton(
//                     label: "Join Community",
//                     backgroundColor: Colors.green,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CommunityPage(),
//                         ),
//                       );
//                     },
//                     isWideScreen: isWideScreen,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCustomButton({
//     required String label,
//     required Color backgroundColor,
//     required Color textColor,
//     required VoidCallback onPressed,
//     required bool isWideScreen,
//   }) {
//     return Expanded(
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 200),
//         curve: Curves.easeInOut,
//         child: ElevatedButton(
//           onPressed: onPressed,
//           style: ElevatedButton.styleFrom(
//             foregroundColor: textColor,
//             backgroundColor: backgroundColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             padding: EdgeInsets.symmetric(
//               vertical: isWideScreen ? 12 : 10,
//               horizontal: isWideScreen ? 20 : 8,
//             ),
//             elevation: 2,
//           ).copyWith(
//             overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
//               if (states.contains(MaterialState.pressed)) {
//                 return backgroundColor.withOpacity(0.7);
//               }
//               if (states.contains(MaterialState.hovered)) {
//                 return backgroundColor.withOpacity(0.85);
//               }
//               return null;
//             }),
//           ),
//           child: Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: isWideScreen ? 16 : 14,
//               fontWeight: FontWeight.bold,
//               color: textColor,
//               letterSpacing: 0.2,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
