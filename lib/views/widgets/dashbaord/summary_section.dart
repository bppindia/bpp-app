// import 'package:flutter/material.dart';
//
// class SummarySection.dart extends StatefulWidget {
//   @override
//   _SummarySectionState createState() => _SummarySectionState();
// }
//
// class _SummarySectionState extends State<SummarySection.dart> {
//   bool isVisible = false; // Control visibility for Wallet value
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     bool isWideScreen = screenWidth > 600;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
//       child: Column(
//         children: [
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.center,
//           //   crossAxisAlignment: CrossAxisAlignment.start, // Center-align items vertically
//           //   children: [
//           //     Expanded(
//           //       child: _buildSection(
//           //         title: "Wallet (IND)",
//           //         value: "1234",
//           //         isVisible: isVisible,
//           //         isWideScreen: isWideScreen,
//           //         icon: Icons.account_balance_wallet,
//           //         iconColor: Colors.blueAccent,
//           //         onToggleVisibility: () {
//           //           setState(() {
//           //             isVisible = !isVisible;
//           //           });
//           //         },
//           //         showVisibilityIcon: true, // Show visibility icon for Wallet only
//           //       ),
//           //     ),
//           //     SizedBox(width: 20), // Increased spacing between Wallet and Member sections
//           //     Expanded(
//           //       child: _buildSection(
//           //         title: "Member",
//           //         value: "24",
//           //         isVisible: isVisible,
//           //         isWideScreen: isWideScreen,
//           //         icon: Icons.people,
//           //         iconColor: Colors.green,
//           //         onToggleVisibility: () {
//           //           setState(() {
//           //             isVisible = !isVisible;
//           //           });
//           //         },
//           //         showVisibilityIcon: false, // Hide visibility icon for Member
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           // SizedBox(height: 24), // Increased spacing between summary sections and action buttons
//           // Row(
//           //   mainAxisAlignment:
//           //       MainAxisAlignment.center, // Centers buttons horizontally
//           //   children: [
//           //     _buildCustomButton(
//           //       label: "Donate",
//           //       backgroundColor: Colors.grey[300]!,
//           //       textColor: Colors.black,
//           //       onPressed: () {
//           //         // Add functionality here
//           //       },
//           //       isWideScreen: isWideScreen,
//           //     ),
//           //     SizedBox(
//           //         width:
//           //             screenWidth > 600 ? 20 : 16), // Spacing between buttons
//           //     _buildCustomButton(
//           //       label: "Deposit",
//           //       backgroundColor: Colors.indigo[700]!,
//           //       textColor: Colors.white,
//           //       onPressed: () {
//           //         // Add functionality here
//           //       },
//           //       isWideScreen: isWideScreen,
//           //     ),
//           //   ],
//           // ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSection({
//     required String title,
//     required String value,
//     required bool isVisible,
//     required bool isWideScreen,
//     required IconData icon,
//     required Color iconColor,
//     required VoidCallback onToggleVisibility,
//     required bool
//         showVisibilityIcon, // Add parameter to control visibility icon
//   }) {
//     return Column(
//       crossAxisAlignment:
//           CrossAxisAlignment.center, // Center-aligns the text and icon
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment
//               .center, // Center-align icon and title horizontally
//           children: [
//             Icon(icon, color: iconColor, size: isWideScreen ? 28 : 24),
//             SizedBox(width: 10),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: isWideScreen ? 20 : 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[700],
//               ),
//             ),
//           ],
//         ),
//         // SizedBox(height: 4),
//         Row(
//           mainAxisAlignment: MainAxisAlignment
//               .center, // Center-align value and visibility icon
//           children: [
//             AnimatedCrossFade(
//               duration: Duration(milliseconds: 300),
//               crossFadeState: isVisible
//                   ? CrossFadeState.showFirst
//                   : CrossFadeState.showSecond,
//               firstChild: Text(
//                 value,
//                 style: TextStyle(
//                   fontSize: isWideScreen ? 24 : 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               secondChild: Text(
//                 "******",
//                 style: TextStyle(
//                   fontSize: isWideScreen ? 24 : 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             if (showVisibilityIcon) // Conditionally show the visibility icon
//               Padding(
//                 padding: const EdgeInsets.only(top: 1), // Add top padding
//                 child: IconButton(
//                   icon: Icon(
//                     isVisible ? Icons.visibility : Icons.visibility_off,
//                     color: isVisible ? Colors.blue : Colors.grey[600],
//                     size: 20,
//                   ),
//                   onPressed: onToggleVisibility,
//                 ),
//               )
//           ],
//         ),
//       ],
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

// import 'package:bpp_frontend/views/widgets/dashbaord/community_page.dart';
// import 'package:flutter/material.dart';
//
// class SummarySection.dart extends StatefulWidget {
//   @override
//   _SummarySectionState createState() => _SummarySectionState();
// }
//
// class _SummarySectionState extends State<SummarySection.dart> {
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
//               // Section 1: Dashboard and Balance
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
//                       SizedBox(
//                           height:
//                               4), // Adds space between "Dashboard" and "Welcome back"
//                       // Text(
//                       //   "Welcome back, Swapnil!",
//                       //   style: TextStyle(
//                       //     fontSize: isWideScreen ? 18 : 16,
//                       //     color: Colors.grey[700],
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                   Row(
//                     children: [
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
//
//               SizedBox(height: 5),
//               Text(
//                 "Welcome back, Swapnil!",
//                 style: TextStyle(
//                   fontSize: isWideScreen ? 18 : 16,
//                   color: Colors.grey[700],
//                 ),
//               ),
//               SizedBox(height: 8),
//               // Section 2: User Info and Membership
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
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
//                         Text(
//                           "Primary Member",
//                           style: TextStyle(
//                             fontSize: isWideScreen ? 16 : 14,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         "Membership No: 001",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         " Valid until: Mar,  2028",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0,
//                           vertical: 8.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(color: Colors.grey[300]!),
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 1,
//                               blurRadius: 5,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Text(
//                           "0 Referrals",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 7),
//
//               // Section 3: Buttons
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
//                   SizedBox(width: 16),
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

/////////***_7jan
// import 'package:bpp_frontend/views/drawer/donor.dart';
// import 'package:bpp_frontend/views/drawer/wallet.dart';
// import 'package:bpp_frontend/views/widgets/dashbaord/community_page.dart';
// import 'package:flutter/material.dart';
//
// import '../../drawer/notification.dart';
//
// class SummarySection extends StatefulWidget {
//   final String firstName;
//   final String lastName;
//   final String referralCode;
//
//   const SummarySection({
//     required this.firstName,
//     required this.lastName,
//     required this.referralCode,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _SummarySectionState createState() => _SummarySectionState();
// }
//
// class _SummarySectionState extends State<SummarySection> {
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     bool isWideScreen = screenWidth > 600;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//       child: Card(
//         color: Colors.white,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Section 1: Dashboard and Balance
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Welcome back,",
//                         style: TextStyle(
//                           fontSize: isWideScreen ? 24 : 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       // Text(
//                       //   'Swapnil',
//                       //   style: TextStyle(
//                       //       fontSize: 14, fontWeight: FontWeight.bold),
//                       // ),
//                       // SizedBox(height: 4),
//                       //api data
//                       // Text(
//                       //   '${widget.firstName} ${widget.lastName}',
//                       //   style: TextStyle(
//                       //     fontSize: isWideScreen ? 18 : 16,
//                       //     fontWeight: FontWeight.bold,
//                       //     color: Colors.black54,
//                       //   ),
//                       // ),
//                       // SizedBox(height: 4),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Wallet: ",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       Text(
//                         "₹ 0.00",
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
//
//               SizedBox(height: 5),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 10),
//                         Text(
//                           '${widget.firstName} ${widget.lastName}',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             //color: Colors.black54,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Text(
//                           "Primary Member",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         "Membership No: 001",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         " Valid until: Mar, 2028",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0,
//                           vertical: 8.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(color: Colors.grey[300]!),
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 1,
//                               blurRadius: 5,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment
//                               .start, // Align text to the start (left)
//                           children: [
//                             Text(
//                               'referrals',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 4), // Space between the two texts
//                             Text(
//                               '${widget.referralCode}',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color:
//                                     Colors.black54, // You can adjust the color
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 7),
//
//               // Section 3: Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildCustomButton(
//                     label: "Donate",
//                     backgroundColor: Colors.blue,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       // Navigate to DonorDashboard screen when the button is pressed
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DonorDashboard(),
//                         ),
//                       );
//                     },
//                     isWideScreen: isWideScreen,
//                   ),
//                   SizedBox(width: 16),
//                   _buildCustomButton(
//                     label: "Add Fund",
//                     backgroundColor: Colors.green,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => FundScreen()),
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
//               borderRadius: BorderRadius.circular(10),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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

// import 'package:bpp_frontend/views/drawer/donor.dart';
// import 'package:bpp_frontend/views/drawer/wallet.dart';
// import 'package:flutter/material.dart';
//
// class SummarySection extends StatefulWidget {
//   final String firstName;
//   final String lastName;
//   final String referralCode;
//
//   const SummarySection({
//     required this.firstName,
//     required this.lastName,
//     required this.referralCode,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _SummarySectionState createState() => _SummarySectionState();
// }
//
// class _SummarySectionState extends State<SummarySection> {
//   List<String> referralCodes = []; // List to hold referral codes
//   Map<String, int> referralCount =
//       {}; // Map to track usage count of each referral code
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchReferralCodes(); // Fetch referral codes when the screen is loaded
//   }
//
//   // Simulate fetching referral codes from an API
//   void _fetchReferralCodes() async {
//     // Example data simulating API response
//     List<String> apiReferralCodes = ['A123', 'B456', 'C789']; // Example codes
//
//     setState(() {
//       referralCodes = apiReferralCodes;
//       // Initialize count for each referral code with 0 if it's not used yet
//       for (var code in referralCodes) {
//         if (!referralCount.containsKey(code)) {
//           referralCount[code] = 0; // Start count from 0
//         }
//       }
//     });
//   }
//
//   // Simulate user using a referral code
//   void _useReferralCode(String code) {
//     setState(() {
//       if (referralCount.containsKey(code)) {
//         referralCount[code] = referralCount[code]! +
//             1; // Increment the count for the referral code
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     bool isWideScreen = screenWidth > 600;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//       child: Card(
//         color: Colors.white,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Section 1: Dashboard and Balance
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Welcome back,",
//                         style: TextStyle(
//                           fontSize: isWideScreen ? 24 : 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Wallet: ",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       Text(
//                         "₹ 0.00",
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
//
//               SizedBox(height: 5),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 10),
//                         Text(
//                           '${widget.firstName} ${widget.lastName}',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Text(
//                           "Primary Member",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         "Membership No: 001",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         " Valid until: Mar, 2028",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0,
//                           vertical: 8.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(color: Colors.grey[300]!),
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 1,
//                               blurRadius: 5,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               ' 0 referrals ',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             // SizedBox(height: 4), // Space between the two texts
//                             // // Text(
//                             // //   '${widget.referralCode}',
//                             // //   style: TextStyle(
//                             // //     fontSize: 12,
//                             // //     color: Colors.black54,
//                             // //   ),
//                             // // ),
//                             // // SizedBox(height: 8),
//                             // // Show the referral count (0 if not used yet)
//                             // Text(
//                             //   '${referralCount[widget.referralCode] ?? 0}', // Displaying the count label
//                             //   style: TextStyle(
//                             //     fontSize: 12,
//                             //     color: Colors.black54,
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 7),
//
//               // Section 3: Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildCustomButton(
//                     label: "Donate",
//                     backgroundColor: Colors.blue,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       // Navigate to DonorDashboard screen when the button is pressed
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DonorDashboard(),
//                         ),
//                       );
//                     },
//                     isWideScreen: isWideScreen,
//                   ),
//                   SizedBox(width: 16),
//                   _buildCustomButton(
//                     label: "Add Fund",
//                     backgroundColor: Colors.green,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => FundScreen()),
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
//               borderRadius: BorderRadius.circular(10),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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

// //9 jan 2025
// import 'package:bpp_frontend/views/drawer/donor.dart';
// import 'package:bpp_frontend/views/drawer/wallet.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SummarySection extends StatefulWidget {
//   const SummarySection({Key? key}) : super(key: key);
//
//   @override
//   _SummarySectionState createState() => _SummarySectionState();
// }
//
// class _SummarySectionState extends State<SummarySection> {
//   late TextEditingController firstNameController;
//   late TextEditingController lastNameController;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize controllers to avoid late initialization error
//     firstNameController = TextEditingController();
//     lastNameController = TextEditingController();
//
//     _loadProfileData(); // Fetch profile data when the screen is loaded
//   }
//
//   // Method to load profile data from SharedPreferences
//   Future<void> _loadProfileData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     String firstName = prefs.getString('firstName') ?? '';
//     String lastName = prefs.getString('lastName') ?? '';
//
//     print("FirstName: $firstName, LastName: $lastName"); // Debugging log
//
//     setState(() {
//       firstNameController.text = firstName;
//       lastNameController.text = lastName;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     bool isWideScreen = screenWidth > 600;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//       child: Card(
//         color: Colors.white,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Section 1: Dashboard and Balance
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Welcome back,",
//                         style: TextStyle(
//                           fontSize: isWideScreen ? 24 : 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Wallet: ",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       Text(
//                         "₹ 0.00",
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
//
//               SizedBox(height: 10),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 10),
//                         // Dynamically fetch firstName and lastName from SharedPreferences
//                         Text(
//                           '${firstNameController.text} ${lastNameController.text}',
//                           style: TextStyle(
//                               //color: Colors.black,
//                               fontSize: 20,
//                               fontWeight: FontWeight
//                                   .bold), // Use black color for visibility
//                         ),
//
//                         SizedBox(height: 20),
//                         Text(
//                           "Primary Member",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         "Membership No: 001",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         " Valid until: Mar, 2028",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0,
//                           vertical: 8.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(color: Colors.grey[300]!),
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 1,
//                               blurRadius: 5,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               ' 0 referrals ',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 7),
//
//               // Section 3: Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildCustomButton(
//                     label: "Donate",
//                     backgroundColor: Colors.blue,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       // Navigate to DonorDashboard screen when the button is pressed
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DonorDashboard(),
//                         ),
//                       );
//                     },
//                     isWideScreen: isWideScreen,
//                   ),
//                   SizedBox(width: 16),
//                   _buildCustomButton(
//                     label: "Add Fund",
//                     backgroundColor: Colors.green,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => FundScreen()),
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
//               borderRadius: BorderRadius.circular(10),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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

//9 jan 3:10pm
// import 'package:bpp_frontend/views/drawer/donor.dart';
// import 'package:bpp_frontend/views/drawer/wallet.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SummarySection extends StatefulWidget {
//   const SummarySection({Key? key}) : super(key: key);
//
//   @override
//   _SummarySectionState createState() => _SummarySectionState();
// }
//
// class _SummarySectionState extends State<SummarySection> {
//   late TextEditingController firstNameController;
//   late TextEditingController lastNameController;
//   late TextEditingController roleController;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize controllers to avoid late initialization error
//     firstNameController = TextEditingController();
//     lastNameController = TextEditingController();
//
//     _loadProfileData(); // Fetch profile data when the screen is loaded
//   }
//
//   // Method to load profile data from SharedPreferences
//   Future<void> _loadProfileData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String role = prefs.getString('role') ??
//         'Primary Member'; // Default value if role is not set
//
//     //String role = prefs.getString('role') ?? '';
//     String firstName = prefs.getString('firstName') ?? '';
//     String lastName = prefs.getString('lastName') ?? '';
//
//     print(
//         "FirstName: $firstName, LastName: $lastName,role: $role"); // Debugging log
//
//     setState(() {
//       firstNameController.text = firstName;
//       lastNameController.text = lastName;
//       _role = role;
//     });
//   }
//
//   String _role = ''; // Variable to store the role
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     bool isWideScreen = screenWidth > 600;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//       child: Card(
//         color: Colors.white,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Section 1: Dashboard and Balance
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Welcome back,",
//                         style: TextStyle(
//                           fontSize: isWideScreen ? 24 : 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Wallet: ",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       Text(
//                         "₹ 0.00",
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
//
//               SizedBox(height: 10),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 10),
//                         // Dynamically fetch firstName and lastName from SharedPreferences
//                         Text(
//                           '${firstNameController.text} ${lastNameController.text}',
//                           style: TextStyle(
//                               //color: Colors.black,
//                               fontSize: 20,
//                               fontWeight: FontWeight
//                                   .bold), // Use black color for visibility
//                         ),
//
//                         SizedBox(height: 20),
//
//                         Text(
//                           _role,
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         "Membership No: 001",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         " Valid until: Mar, 2028",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0,
//                           vertical: 8.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(color: Colors.grey[300]!),
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 1,
//                               blurRadius: 5,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               ' 0 referrals ',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 7),
//
//               // Section 3: Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildCustomButton(
//                     label: "Donate",
//                     backgroundColor: Colors.blue,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       // Navigate to DonorDashboard screen when the button is pressed
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DonorDashboard(),
//                         ),
//                       );
//                     },
//                     isWideScreen: isWideScreen,
//                   ),
//                   SizedBox(width: 16),
//                   _buildCustomButton(
//                     label: "Add Fund",
//                     backgroundColor: Colors.green,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => FundScreen()),
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
//               borderRadius: BorderRadius.circular(10),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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

import 'package:bpp_frontend/views/drawer/donor.dart';
import 'package:bpp_frontend/views/drawer/wallet.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SummarySection extends StatefulWidget {
  const SummarySection({Key? key}) : super(key: key);

  @override
  _SummarySectionState createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  String _role = 'Primary Member'; // Default
  int _referralCount = 0;

  @override
  void initState() {
    super.initState();
    // Initialize controllers to avoid late initialization error
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();

    _loadProfileData(); // Fetch profile data when the screen is loaded
  }

  // Method to load profile data from SharedPreferences
  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // setState(() {
    //   _referralCount = prefs.getInt('referralCount') ?? 0;
    //   _role = prefs.getString('role') ??
    //       'Primary Member'; // Default role if not set
    //   firstNameController.text = prefs.getString('firstName') ?? '';
    //   lastNameController.text = prefs.getString('lastName') ?? '';
    // });
    setState(() {
      _referralCount = prefs.getInt('referralCount') ?? 0;
      _role = prefs.getString('role') ??
          'Primary Member'; // Default role if not set
      firstNameController.text = prefs.getString('firstName') ?? '';
      lastNameController.text = prefs.getString('lastName') ?? '';

      // Debugging log to see the values
      print('Referral Count: $_referralCount');
      print('Role: $_role');
      print('First Name: ${firstNameController.text}');
      print('Last Name: ${lastNameController.text}');
    });
  }

  // Method to update and increment referral count
  Future<void> _updateReferralCount(String referralCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentCount = prefs.getInt('referralCount') ?? 0;

    // Print the current referral count
    print("Current referral count: $currentCount");

    // Increment the referral count
    currentCount++;

    // Save the updated referral count back to SharedPreferences
    await prefs.setInt('referralCount', currentCount);

    // Optionally, save the used referral code
    await prefs.setString('usedReferralCode', referralCode);

    // Update the UI with the new referral count
    setState(() {
      _referralCount = currentCount;
    });

    // Print the new referral count
    print("Updated referral count: $_referralCount");
  }

  void _onReferralCodeUsed(String referralCode) {
    // Validate referral code
    if (referralCode.isNotEmpty) {
      // Update referral count
      _updateReferralCount(referralCode);
    } else {
      // Show an error if the referral code is invalid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid referral code")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isWideScreen = screenWidth > 600;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section 1: Dashboard and Balance
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back,",
                        style: TextStyle(
                          fontSize: isWideScreen ? 24 : 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Wallet: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "₹ 0.00",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              //SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        // Dynamically fetch firstName and lastName from SharedPreferences
                        Text(
                          '${firstNameController.text} ${lastNameController.text}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ), // Use black color for visibility
                        ),
                        SizedBox(height: 20),
                        Text(
                          _role,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Membership No: 001",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        " Valid until: Mar, 2028",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$_referralCount referrals',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 7),

              // Section 3: Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCustomButton(
                    label: "Donate",
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      // Navigate to DonorDashboard screen when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DonorDashboard(),
                        ),
                      );
                    },
                    isWideScreen: isWideScreen,
                  ),
                  SizedBox(width: 16),
                  _buildCustomButton(
                    label: "Add Fund",
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FundScreen()),
                      );
                    },
                    isWideScreen: isWideScreen,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton({
    required String label,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
    required bool isWideScreen,
  }) {
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: textColor,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            elevation: 2,
          ).copyWith(
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed)) {
                return backgroundColor.withOpacity(0.7);
              }
              if (states.contains(MaterialState.hovered)) {
                return backgroundColor.withOpacity(0.85);
              }
              return null;
            }),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isWideScreen ? 16 : 14,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
    );
  }
}

//shubham
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:bpp_frontend/views/drawer/donor.dart';
// import 'package:bpp_frontend/views/drawer/wallet.dart';
//
// class SummarySection extends StatefulWidget {
//   const SummarySection({Key? key}) : super(key: key);
//
//   @override
//   _SummarySectionState createState() => _SummarySectionState();
// }
//
// class _SummarySectionState extends State<SummarySection> {
//   late TextEditingController firstNameController;
//   late TextEditingController lastNameController;
//   String _role = 'Primary Member';
//   int _referralCount = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     firstNameController = TextEditingController();
//     lastNameController = TextEditingController();
//     _loadProfileData();
//   }
//
//   @override
//   void dispose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     super.dispose();
//   }
//
//   // Load profile data including referral count
//   Future<void> _loadProfileData() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       setState(() {
//         _referralCount = prefs.getInt('referralCount') ?? 0;
//         _role = prefs.getString('role') ?? 'Primary Member';
//         firstNameController.text = prefs.getString('firstName') ?? '';
//         lastNameController.text = prefs.getString('lastName') ?? '';
//
//         // Debug prints
//         print('Loaded Data:');
//         print('Referral Count: $_referralCount');
//         print('Role: $_role');
//         print('Name: ${firstNameController.text} ${lastNameController.text}');
//       });
//     } catch (e) {
//       print('Error loading profile data: $e');
//       // Show error to user
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading profile data')),
//       );
//     }
//   }
//
//   // Update referral count
//   Future<void> _updateReferralCount(String referralCode) async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       int currentCount = prefs.getInt('referralCount') ?? 0;
//       print('Current referral count: $currentCount');
//
//       currentCount++; // Increment count
//
//       await prefs.setInt('referralCount', currentCount);
//       await prefs.setString('usedReferralCode', referralCode);
//
//       setState(() {
//         _referralCount = currentCount;
//       });
//
//       print('Updated referral count: $_referralCount');
//     } catch (e) {
//       print('Error updating referral count: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error updating referral count')),
//       );
//     }
//   }
//
//   // Test function to manually set referral count
//   Future<void> testSetReferralCount(int value) async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setInt('referralCount', value);
//       await _loadProfileData();
//       print('Manually set referral count to: $value');
//     } catch (e) {
//       print('Error setting test referral count: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     bool isWideScreen = screenWidth > 600;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//       child: Card(
//         color: Colors.white,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header Section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Welcome back,",
//                         style: TextStyle(
//                           fontSize: isWideScreen ? 24 : 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Wallet Display
//                   Row(
//                     children: [
//                       Text(
//                         "Wallet: ",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       Text(
//                         "₹ 0.00",
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
//
//               // Profile Info Section
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 10),
//                         Text(
//                           '${firstNameController.text} ${lastNameController.text}',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Text(
//                           _role,
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Membership Info and Referral Count
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         "Membership No: 001",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         "Valid until: Mar, 2028",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       // Referral Count Display
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0,
//                           vertical: 8.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(color: Colors.grey[300]!),
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 1,
//                               blurRadius: 5,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '$_referralCount referrals',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 7),
//
//               // Action Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildCustomButton(
//                     label: "Donate",
//                     backgroundColor: Colors.blue,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DonorDashboard(),
//                         ),
//                       );
//                     },
//                     isWideScreen: isWideScreen,
//                   ),
//                   SizedBox(width: 16),
//                   _buildCustomButton(
//                     label: "Add Fund",
//                     backgroundColor: Colors.green,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => FundScreen()),
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
//               borderRadius: BorderRadius.circular(10),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
