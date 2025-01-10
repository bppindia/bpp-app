// import 'package:bpp_frontend/views/drawer/dashbaord.dart';
// import 'package:bpp_frontend/views/drawer/my_drawer_header.dart';
// import 'package:bpp_frontend/views/drawer/note.dart';
// import 'package:bpp_frontend/views/drawer/notification.dart';
// import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
// import 'package:bpp_frontend/views/drawer/send_feedback.dart';
// import 'package:bpp_frontend/views/drawer/settings.dart';
// import 'package:flutter/material.dart';
// import '../../views/drawer/donor.dart';
// import '../../views/goals.dart';
//
// class ScreenDashbaord extends StatefulWidget {
//   @override
//   _ScreenDashbaordState createState() => _ScreenDashbaordState();
// }
//
// class _ScreenDashbaordState extends State<ScreenDashbaord> {
//   var currentPage = DrawerSections.dashboard;
//   bool _showNavigationBar = true;
//
//   @override
//   Widget build(BuildContext context) {
//     Widget container;
//     if (currentPage == DrawerSections.dashboard) {
//       container = DashboardPage();
//     } else if (currentPage == DrawerSections.contacts) {
//       container = GoalsScreen();
//     } else if (currentPage == DrawerSections.events) {
//       container = DonorDashboard();
//     } else if (currentPage == DrawerSections.notes) {
//       container = NotesPage();
//     } else if (currentPage == DrawerSections.settings) {
//       container = SettingsPage();
//     } else if (currentPage == DrawerSections.notifications) {
//       container = NotificationsPage();
//     } else if (currentPage == DrawerSections.privacy_policy) {
//       container = PrivacyPolicyPage();
//     } else if (currentPage == DrawerSections.send_feedback) {
//       container = SendFeedbackPage();
//     } else {
//       container = Container(); // Provide a default value for the container
//     }
//
//     return Scaffold(
//       appBar: _showNavigationBar
//           ? AppBar(
//         backgroundColor: Colors.blue,
//       )
//           : null,
//       body: container,
//       drawer: Drawer(
//         child: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: [
//                 MyHeaderDrawer(),
//                 MyDrawerList(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Widget MyDrawerList() {
//   //   return Container(
//   //     padding: EdgeInsets.only(
//   //       top: 15,
//   //     ),
//   //     child: Column(
//   //       children: [
//   //         menuItem(1, "Dashboard", Icons.dashboard_outlined,
//   //             currentPage == DrawerSections.dashboard ? true : false),
//   //         menuItem(2, "Goals", Icons.people_alt_outlined,
//   //             currentPage == DrawerSections.contacts ? true : false),
//   //         menuItem(3, "Donate", Icons.volunteer_activism,
//   //             currentPage == DrawerSections.events ? true : false),
//   //         Divider(),
//   //         menuItem(4, "Profile", Icons.notes,
//   //             currentPage == DrawerSections.notes ? true : false),
//   //         menuItem(5, "Account", Icons.settings_outlined,
//   //             currentPage == DrawerSections.settings ? true : false),
//   //         menuItem(6, "Wallet", Icons.notifications_outlined,
//   //             currentPage == DrawerSections.notifications ? true : false),
//   //         Divider(),
//   //         menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
//   //             currentPage == DrawerSections.privacy_policy ? true : false),
//   //         menuItem(8, "Send feedback", Icons.feedback_outlined,
//   //             currentPage == DrawerSections.send_feedback ? true : false),
//   //       ],
//   //     ),
//   //   );
//   // }
//
// //   Widget MyDrawerList() {
// //     return Container(
// //       padding: EdgeInsets.only(
// //         top: 15,
// //       ),
// //       child: Column(
// //         children: [
// //           menuItem(1, "Dashboard", Icons.dashboard_outlined,
// //               currentPage == DrawerSections.dashboard ? true : false),
// //           menuItem(2, "Goals", Icons.ads_click,
// //               currentPage == DrawerSections.contacts ? true : false),
// //           menuItem(3, "Donate", Icons.volunteer_activism,
// //               currentPage == DrawerSections.events ? true : false),
// //           // Profile section with expandable items
// //           ExpansionTile(
// //             leading: Icon(Icons.recent_actors),
// //             title: Text("Profile"),
// //             children: [
// //               menuItemSub("Personal Details"),
// //             ],
// //           ),
// //           ExpansionTile(
// //             leading: Icon(Icons.account_balance),
// //             title: Text("Account"),
// //             children: [
// //               menuItemSub("Account Details"),
// //               menuItemSub("Change pin"),
// //             ],
// //           ),
// //           menuItem(6, "Wallet", Icons.account_balance_wallet,
// //               currentPage == DrawerSections.notifications ? true : false),
// //           ExpansionTile(
// //             leading: Icon(Icons.vpn_lock),
// //             title: Text("Membership"),
// //             children: [
// //               menuItemSub("Membership Pass"),
// //               menuItemSub("Membership Renewals"),
// //               menuItemSub("Referral Code"),
// //             ],
// //           ),
// //           menuItem(7, "Community Contribution", Icons.support,
// //               currentPage == DrawerSections.privacy_policy ? true : false),
// //           ExpansionTile(
// //             leading: Icon(Icons.vpn_lock),
// //             title: Text("Community Contribution"),
// //             children: [
// //               menuItemSub("Register case"),
// //               menuItemSub("Review & Approvals"),
// //               menuItemSub("Voting"),
// //               menuItemSub("Result"),
// //               menuItemSub("Execution"),
// //             ],
// //           ),
// //           menuItem(3, "Business Community Join", Icons.add_business,
// //               currentPage == DrawerSections.events ? true : false),
// //         ],
// //       ),
// //     );
// //   }
// //
// // // Sub-menu item widget for child items
// //   Widget menuItemSub(String title) {
// //     return Padding(
// //       padding: const EdgeInsets.only(left: 40.0),
// //       child: ListTile(
// //         title: Text(title),
// //         onTap: () {
// //           // Handle the navigation or logic for submenu item
// //         },
// //       ),
// //     );
// //   }
//
// // Original menu item widget
// //   Widget menuItem(int id, String title, IconData icon, bool selected) {
// //     return Material(
// //       color: selected ? Colors.grey[200] : Colors.transparent,
// //       child: InkWell(
// //         onTap: () {
// //           // Handle tap and navigation logic
// //         },
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Row(
// //             children: [
// //               Icon(icon, color: selected ? Colors.blue : Colors.black),
// //               SizedBox(width: 10),
// //               Text(title,
// //                   style: TextStyle(
// //                     color: selected ? Colors.blue : Colors.black,
// //                   )),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
//
//
//   Widget menuItem(int id, String title, IconData icon, bool selected) {
//     return Material(
//       color: selected ? Colors.grey[300] : Colors.transparent,
//       child: InkWell(
//         onTap: () {
//           Navigator.pop(context);
//           setState(() {
//             if (id == 1) {
//               currentPage = DrawerSections.dashboard;
//               _showNavigationBar = true;
//             } else if (id == 2) {
//               currentPage = DrawerSections.contacts;
//               _showNavigationBar = false;
//             } else if (id == 3) {
//               currentPage = DrawerSections.events;
//             } else if (id == 4) {
//               currentPage = DrawerSections.notes;
//             } else if (id == 5) {
//               currentPage = DrawerSections.settings;
//             } else if (id == 6) {
//               currentPage = DrawerSections.notifications;
//             } else if (id == 7) {
//               currentPage = DrawerSections.privacy_policy;
//             } else if (id == 8) {
//               currentPage = DrawerSections.send_feedback;
//             }
//           });
//         },
//         child: Padding(
//           padding: EdgeInsets.all(15.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Icon(
//                   icon,
//                   size: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
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
//
// enum DrawerSections {
//   dashboard,
//   contacts,
//   events,
//   notes,
//   settings,
//   notifications,
//   privacy_policy,
//   send_feedback,
// }

// import 'package:flutter/material.dart';
// import 'package:confetti/confetti.dart';
// import '../../views/drawer/dashbaord.dart';
// import '../../views/drawer/personal_details.dart';
// import '../../views/drawer/my_drawer_header.dart';
// import '../../views/drawer/note.dart';
// import '../../views/drawer/notification.dart';
// import '../../views/drawer/privacy_policy.dart';
// import '../../views/drawer/send_feedback.dart';
// import '../../views/drawer/settings.dart';
// import '../../views/goals.dart'; // Import the confetti package
//
// class ScreenDashbaord extends StatefulWidget {
//   @override
//   _ScreenDashbaordState createState() => _ScreenDashbaordState();
// }
//
// class _ScreenDashbaordState extends State<ScreenDashbaord> {
//   var currentPage = DrawerSections.dashboard;
//   bool _showNavigationBar = true;
//   bool _showPopup = true;
//   late ConfettiController _confettiController;
//
//   @override
//   void initState() {
//     super.initState();
//     _confettiController = ConfettiController(duration: Duration(seconds: 5));
//   }
//
//   @override
//   void dispose() {
//     _confettiController.dispose(); // Dispose of the controller when done
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget container;
//     if (currentPage == DrawerSections.dashboard) {
//       container = DashboardPage();
//     } else if (currentPage == DrawerSections.contacts) {
//       container = GoalsScreen();
//     } else if (currentPage == DrawerSections.events) {
//       container = EventsPage();
//     } else if (currentPage == DrawerSections.notes) {
//       container = NotesPage();
//     } else if (currentPage == DrawerSections.settings) {
//       container = SettingsPage();
//     } else if (currentPage == DrawerSections.notifications) {
//       container = NotificationsPage();
//     } else if (currentPage == DrawerSections.privacy_policy) {
//       container = PrivacyPolicyPage();
//     } else if (currentPage == DrawerSections.send_feedback) {
//       container = SendFeedbackPage();
//     } else {
//       container = Container(); // Provide a default value for the container
//     }
//
//     // Trigger confetti when the popup is shown
//     if (_showPopup) {
//       _confettiController.play(); // Play the confetti animation
//     }
//
//     return Scaffold(
//       appBar: _showNavigationBar
//           ? AppBar(
//         // title: Text('Website Title'),
//         backgroundColor: Colors.blue,
//       )
//           : null, // Use null if you don't want an AppBar
//       body: Stack(
//         children: [
//           container,
//           if (_showPopup)
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black.withOpacity(0.5),
//                 child: Center(
//                   child: LayoutBuilder(
//                     builder: (context, constraints) {
//                       double maxWidth = constraints.maxWidth * 0.8;
//                       double maxHeight = constraints.maxHeight * 0.8;
//                       return Container(
//                         constraints: BoxConstraints(
//                           maxWidth: maxWidth,
//                           maxHeight: maxHeight,
//                         ),
//                         padding: EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               'Congratulations!!!',
//                               style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 16.0),
//                             Text(
//                               'You have successfully joined the BPP platform.',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 18, // Larger font size for the first part
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             SizedBox(height: 16.0),
//                             Text(
//                               'To become a primary member and unlock the access to our services, please pay the joining fee of Rs. 5/-. This will give you the access to the platform and enable you to avail membership benefits, including counselling on legal, professional, and educational matters.',
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 16.0),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 TextButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       _showPopup = false; // Close the popup when Cancel is clicked
//                                     });
//                                   },
//                                   child: Text('Cancel'),
//                                 ),
//                                 SizedBox(width: 8.0),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     // Hide the popup and stop the confetti animation
//                                     setState(() {
//                                       _showPopup = false; // Hide the popup
//                                     });
//                                     _confettiController.stop(); // Stop the confetti animation
//                                   },
//                                   child: Text('Pay Now'),
//                                 ),
//                               ],
//                             ),
//                             // Confetti widget
//                             Align(
//                               alignment: Alignment.topCenter,
//                               child: ConfettiWidget(
//                                 confettiController: _confettiController,
//                                 blastDirectionality: BlastDirectionality.explosive,
//                                 shouldLoop: false,
//                                 emissionFrequency: 0.05,
//                                 numberOfParticles: 20,
//                                 gravity: 0.1,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           // Confetti widget is placed here
//           Align(
//             alignment: Alignment.center,
//             child: ConfettiWidget(
//               confettiController: _confettiController,
//               blastDirectionality: BlastDirectionality.explosive,
//               shouldLoop: false,
//               colors: [Colors.green, Colors.blue, Colors.pink, Colors.orange],
//             ),
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: [
//                 MyHeaderDrawer(),
//                 MyDrawerList(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget MyDrawerList() {
//     return Container(
//       padding: EdgeInsets.only(
//         top: 15,
//       ),
//       child: Column(
//         children: [
//           menuItem(1, "Dashboard", Icons.dashboard_outlined,
//               currentPage == DrawerSections.dashboard ? true : false),
//           menuItem(2, "Goals", Icons.people_alt_outlined,
//               currentPage == DrawerSections.contacts ? true : false),
//           menuItem(3, "Donate", Icons.event,
//               currentPage == DrawerSections.events ? true : false),
//           menuItem(4, "Profile", Icons.notes,
//               currentPage == DrawerSections.notes ? true : false),
//           Divider(),
//           menuItem(5, "Settings", Icons.settings_outlined,
//               currentPage == DrawerSections.settings ? true : false),
//           menuItem(6, "Notifications", Icons.notifications_outlined,
//               currentPage == DrawerSections.notifications ? true : false),
//           Divider(),
//           menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
//               currentPage == DrawerSections.privacy_policy ? true : false),
//           menuItem(8, "Send feedback", Icons.feedback_outlined,
//               currentPage == DrawerSections.send_feedback ? true : false),
//         ],
//       ),
//     );
//   }
//
//   Widget menuItem(int id, String title, IconData icon, bool selected) {
//     return Material(
//       color: selected ? Colors.grey[300] : Colors.transparent,
//       child: InkWell(
//         onTap: () {
//           Navigator.pop(context);
//           setState(() {
//             if (id == 1) {
//               currentPage = DrawerSections.dashboard;
//               _showNavigationBar = true;
//             } else if (id == 2) {
//               currentPage = DrawerSections.contacts;
//               _showNavigationBar = false;
//             } else if (id == 3) {
//               currentPage = DrawerSections.events;
//             } else if (id == 4) {
//               currentPage = DrawerSections.notes;
//             } else if (id == 5) {
//               currentPage = DrawerSections.settings;
//             } else if (id == 6) {
//               currentPage = DrawerSections.notifications;
//             } else if (id == 7) {
//               currentPage = DrawerSections.privacy_policy;
//             } else if (id == 8) {
//               currentPage = DrawerSections.send_feedback;
//             }
//           });
//         },
//         child: Padding(
//           padding: EdgeInsets.all(15.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Icon(
//                   icon,
//                   size: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
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
//
// enum DrawerSections {
//   dashboard,
//   contacts,
//   events,
//   notes,
//   settings,
//   notifications,
//   privacy_policy,
//   send_feedback,
// }

//
// import 'package:bpp_frontend/views/drawer/account_details.dart';
// import 'package:bpp_frontend/views/drawer/change_pin_screen.dart';
// import 'package:bpp_frontend/views/drawer/community_contribution.dart';
//
// import 'package:bpp_frontend/views/drawer/membership_pass.dart';
// import 'package:bpp_frontend/views/drawer/membership_renewals.dart';
// import 'package:bpp_frontend/views/drawer/referral%20code.dart';
// import 'package:bpp_frontend/views/drawer/register_case_screen.dart';
// import 'package:bpp_frontend/views/drawer/voting.dart';
// import 'package:flutter/material.dart';
// import 'package:confetti/confetti.dart';
// import 'package:bpp_frontend/views/drawer/dashbaord.dart';
// import 'package:bpp_frontend/views/drawer/personal_details.dart';
// import 'package:bpp_frontend/views/drawer/my_drawer_header.dart';
// import 'package:bpp_frontend/views/drawer/note.dart';
// import 'package:bpp_frontend/views/drawer/notification.dart';
// import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
// import 'package:bpp_frontend/views/drawer/send_feedback.dart';
// import 'package:bpp_frontend/views/drawer/settings.dart';
// import '../../views/drawer/donor.dart';
// import '../../views/goals.dart';
//
// class ScreenDashbaord extends StatefulWidget {
//   @override
//   _ScreenDashbaordState createState() => _ScreenDashbaordState();
// }
//
// class _ScreenDashbaordState extends State<ScreenDashbaord> {
//   var currentPage = DrawerSections.dashboard;
//   bool _showNavigationBar = true;
//   bool _showPopup = true;
//   late ConfettiController _confettiController;
//
//   @override
//   void initState() {
//     super.initState();
//     _confettiController = ConfettiController(duration: Duration(seconds: 3));
//   }
//
//   @override
//   void dispose() {
//     _confettiController.dispose();
//     super.dispose();
//   }
//
//   void _hidePopup() {
//     setState(() {
//       _showPopup = false;
//     });
//     _confettiController.stop(); // Stop the confetti animation
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget container;
//     if (currentPage == DrawerSections.dashboard) {
//       container = DashboardPage();
//     } else if (currentPage == DrawerSections.contacts) {
//       container = GoalsScreen();
//     } else if (currentPage == DrawerSections.events) {
//       container = DonorDashboard();
//     } else if (currentPage == DrawerSections.notes) {
//       container = NotesPage();
//     } else if (currentPage == DrawerSections.settings) {
//       container = SettingsPage();
//     } else if (currentPage == DrawerSections.notifications) {
//       container = WalletPage();
//     } else if (currentPage == DrawerSections.privacy_policy) {
//       container = CommunityContributionScreen();
//     } else if (currentPage == DrawerSections.send_feedback) {
//       container = SendFeedbackPage();
//     } else {
//       container = Container(); // Default container
//     }
//
//     // Trigger confetti when the popup is shown
//     if (_showPopup) {
//       _confettiController.play(); // Play the confetti animation only once
//     }
//
//     return Scaffold(
//       appBar: _showNavigationBar
//           ? AppBar(
//               backgroundColor: Colors.blue,
//
//               title: currentPage == DrawerSections.notifications
//                   ? Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Dashboard  > ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           'Profile',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     )
//                   : currentPage ==
//                           DrawerSections.events // Check for DonorDashboard
//                       ? Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Dashboard  > ',
//                               style: TextStyle(
//                                 fontSize: 18,
//                               ),
//                             ),
//                             Text(
//                               'Donate',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         )
//                       : Text(''), // Default empty AppBar title
//             )
//           : null,
//       body: Stack(
//         children: [
//           container,
//           if (_showPopup)
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black.withOpacity(0.5),
//                 child: Center(
//                   child: LayoutBuilder(
//                     builder: (context, constraints) {
//                       double maxWidth = constraints.maxWidth * 0.8;
//                       double maxHeight = constraints.maxHeight * 0.8;
//                       return Container(
//                         constraints: BoxConstraints(
//                           maxWidth: maxWidth,
//                           maxHeight: maxHeight,
//                         ),
//                         padding: EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               'Congratulations!!!',
//                               style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 16.0),
//                             Text(
//                               'You have successfully joined the BPP platform.',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize:
//                                     18, // Larger font size for the first part
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             SizedBox(height: 16.0),
//                             Text(
//                               'To become a primary member and unlock the access to our services, please pay the joining fee of Rs. 5/-. This will give you the access to the platform and enable you to avail membership benefits, including counselling on legal, professional, and educational matters.',
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 16.0),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 TextButton(
//                                   onPressed:
//                                       _hidePopup, // Hide the popup when Cancel is clicked
//                                   child: Text('Cancel'),
//                                 ),
//                                 SizedBox(width: 8.0),
//                                 ElevatedButton(
//                                   onPressed:
//                                       _hidePopup, // Hide the popup and stop confetti
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor:
//                                         Colors.blue, // Button color set to blue
//                                   ),
//                                   child: Text('Pay Now'),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           // Confetti widget aligned to the top-left
//           if (_showPopup)
//             Align(
//               alignment: Alignment.topLeft,
//               child: ConfettiWidget(
//                 confettiController: _confettiController,
//                 blastDirectionality: BlastDirectionality.explosive,
//                 emissionFrequency: 0.02,
//                 numberOfParticles: 40,
//                 gravity: 0.1,
//                 colors: [
//                   Colors.purple,
//                   Colors.pink,
//                   Colors.orange,
//                   Colors.yellow
//                 ],
//               ),
//             ),
//           // Confetti widget aligned to the top-right
//           if (_showPopup)
//             Align(
//               alignment: Alignment.topRight,
//               child: ConfettiWidget(
//                 confettiController: _confettiController,
//                 blastDirectionality: BlastDirectionality.explosive,
//                 emissionFrequency: 0.02,
//                 numberOfParticles: 40,
//                 gravity: 0.1,
//                 colors: [
//                   Colors.purple,
//                   Colors.pink,
//                   Colors.orange,
//                   Colors.yellow
//                 ],
//               ),
//             ),
//         ],
//       ),
//       drawer: Drawer(
//         child: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: [
//                 MyHeaderDrawer(),
//                 MyDrawerList(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget MyDrawerList() {
//     return Container(
//       padding: EdgeInsets.only(
//         top: 12,
//       ),
//       child: Column(
//         children: [
//           menuItem(1, "Dashboard", Icons.dashboard_outlined,
//               currentPage == DrawerSections.dashboard ? true : false),
//           menuItem(2, "Goals", Icons.ads_click,
//               currentPage == DrawerSections.contacts ? true : false),
//           menuItem(3, "Donate", Icons.volunteer_activism,
//               currentPage == DrawerSections.events ? true : false),
//           // Profile section with expandable items
//           ExpansionTile(
//             leading: Icon(Icons.recent_actors),
//             title: Text("Profile"),
//             children: [
//               menuItemSub("Personal Details"),
//             ],
//           ),
//           ExpansionTile(
//             leading: Icon(Icons.account_balance),
//             title: Text("Account"),
//             children: [
//               menuItemSub("Account Details"),
//               menuItemSub("Change pin"),
//             ],
//           ),
//           menuItem(6, "Wallet", Icons.account_balance_wallet,
//               currentPage == DrawerSections.notifications ? true : false),
//           ExpansionTile(
//             leading: Icon(Icons.vpn_lock),
//             title: Text("Membership"),
//             children: [
//               menuItemSub("Membership Card"),
//               menuItemSub("Membership Renewals"),
//               menuItemSub("Referral Code"),
//             ],
//           ),
//           menuItem(7, "Community Contribution", Icons.support,
//               currentPage == DrawerSections.privacy_policy ? true : false),
//           ExpansionTile(
//             leading: Icon(Icons.vpn_lock),
//             title: Text("Community Contribution"),
//             children: [
//               menuItemSub("Register case"),
//               menuItemSub("Review & Approvals"),
//               menuItemSub("Voting"),
//               menuItemSub("Result"),
//               menuItemSub("Execution"),
//             ],
//           ),
//           menuItem(3, "Business Community Join", Icons.add_business,
//               currentPage == DrawerSections.events ? true : false),
//           ExpansionTile(
//             leading: Icon(Icons.logout_outlined),
//             title: Text("Sign out"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget menuItemSub(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 40.0), // Adjust the left padding
//       child: ListTile(
//         contentPadding:
//             EdgeInsets.zero, // Removes extra padding around the ListTile
//         dense: true, // Reduces the overall height of the ListTile
//         title: Text(
//           title,
//           style: TextStyle(
//             fontSize: 16,
//             height: 1.5, // Adjust line height
//           ),
//         ),
//         onTap: () {
//           // Navigate to specific screens1 based on the title
//           if (title == "Account Details") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AccountSettingsScreen()),
//             );
//           } else if (title == "Change pin") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ChangePinScreen()),
//             );
//           } else if (title == "Personal Details") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfileScreen()),
//             );
//           } else if (title == "Membership Card") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => MembershipCertificateScreen()),
//             );
//           } else if (title == "Membership Renewals") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MembershipScreen()),
//             );
//           } else if (title == "Referral Code") {
//             // Add navigation for ReferralScreen
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ReferralScreen()),
//             );
//           } else if (title == "Register case") {
//             // Add navigation for ReferralScreen
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => CaseRegistrationScreen()),
//             );
//           } else if (title == "Voting") {
//             // Add navigation for ReferralScreen
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DashboardScreen5()),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Widget menuItem(int id, String title, IconData icon, bool selected) {
//     return Material(
//       color: selected ? Colors.grey[300] : Colors.transparent,
//       child: InkWell(
//         onTap: () {
//           Navigator.pop(context);
//           setState(() {
//             if (id == 1) {
//               currentPage = DrawerSections.dashboard;
//               _showNavigationBar = true;
//             } else if (id == 2) {
//               currentPage = DrawerSections.contacts;
//               _showNavigationBar = false;
//             } else if (id == 3) {
//               currentPage = DrawerSections.events;
//             } else if (id == 4) {
//               currentPage = DrawerSections.notes;
//             } else if (id == 5) {
//               currentPage = DrawerSections.settings;
//             } else if (id == 6) {
//               currentPage = DrawerSections.notifications;
//             } else if (id == 7) {
//               currentPage = DrawerSections.privacy_policy;
//             } else if (id == 8) {
//               currentPage = DrawerSections.send_feedback;
//             }
//           });
//         },
//         child: Padding(
//           padding: EdgeInsets.all(10.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Icon(
//                   icon,
//                   size: 15,
//                   color: Colors.black,
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
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
//
// enum DrawerSections {
//   dashboard,
//   contacts,
//   events,
//   notes,
//   settings,
//   notifications,
//   privacy_policy,
//   send_feedback,
// }

// import 'package:bpp_frontend/views/drawer/account_details.dart';
// import 'package:bpp_frontend/views/drawer/change_pin_screen.dart';
// import 'package:bpp_frontend/views/drawer/community_contribution.dart';
//
// import 'package:bpp_frontend/views/drawer/membership_pass.dart';
// import 'package:bpp_frontend/views/drawer/membership_renewals.dart';
// import 'package:bpp_frontend/views/drawer/referral%20code.dart';
// import 'package:bpp_frontend/views/drawer/register_case_screen.dart';
// import 'package:bpp_frontend/views/drawer/voting.dart';
// import 'package:flutter/material.dart';
// import 'package:confetti/confetti.dart';
// import 'package:bpp_frontend/views/drawer/dashbaord.dart';
// import 'package:bpp_frontend/views/drawer/personal_details.dart';
// import 'package:bpp_frontend/views/drawer/my_drawer_header.dart';
// import 'package:bpp_frontend/views/drawer/note.dart';
// import 'package:bpp_frontend/views/drawer/notification.dart';
// import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
// import 'package:bpp_frontend/views/drawer/send_feedback.dart';
// import 'package:bpp_frontend/views/drawer/settings.dart';
// import '../../views/drawer/donor.dart';
// import '../../views/goals.dart';
//
// class ScreenDashbaord extends StatefulWidget {
//   @override
//   _ScreenDashbaordState createState() => _ScreenDashbaordState();
// }
//
// class _ScreenDashbaordState extends State<ScreenDashbaord> {
//   var currentPage = DrawerSections.dashboard;
//   bool _showNavigationBar = true;
//   bool _showPopup = true;
//   late ConfettiController _confettiController;
//
//   @override
//   void initState() {
//     super.initState();
//     _confettiController = ConfettiController(duration: Duration(seconds: 3));
//   }
//
//   @override
//   void dispose() {
//     _confettiController.dispose();
//     super.dispose();
//   }
//
//   void _hidePopup() {
//     setState(() {
//       _showPopup = false;
//     });
//     _confettiController.stop(); // Stop the confetti animation
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget container;
//     if (currentPage == DrawerSections.dashboard) {
//       container = DashboardPage();
//     } else if (currentPage == DrawerSections.contacts) {
//       container = GoalsScreen();
//     } else if (currentPage == DrawerSections.events) {
//       container = DonorDashboard();
//     } else if (currentPage == DrawerSections.notes) {
//       container = NotesPage();
//     } else if (currentPage == DrawerSections.settings) {
//       container = SettingsPage();
//     } else if (currentPage == DrawerSections.notifications) {
//       container = WalletPage();
//     } else if (currentPage == DrawerSections.privacy_policy) {
//       container = CommunityContributionScreen();
//     } else if (currentPage == DrawerSections.send_feedback) {
//       container = SendFeedbackPage();
//     } else {
//       container = Container(); // Default container
//     }
//
//     // Trigger confetti when the popup is shown
//     if (_showPopup) {
//       _confettiController.play(); // Play the confetti animation only once
//     }
//
//     return Scaffold(
//       appBar: _showNavigationBar
//           ? AppBar(
//               backgroundColor: Colors.blue,
//
//               title: currentPage == DrawerSections.notifications
//                   ? Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Dashboard  > ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           'Profile',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     )
//                   : currentPage ==
//                           DrawerSections.events // Check for DonorDashboard
//                       ? Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Dashboard  > ',
//                               style: TextStyle(
//                                 fontSize: 18,
//                               ),
//                             ),
//                             Text(
//                               'Donate',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         )
//                       : Text(''), // Default empty AppBar title
//             )
//           : null,
//       body: Stack(
//         children: [
//           container,
//           if (_showPopup)
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black.withOpacity(0.5),
//                 child: Center(
//                   child: LayoutBuilder(
//                     builder: (context, constraints) {
//                       double maxWidth = constraints.maxWidth * 0.8;
//                       double maxHeight = constraints.maxHeight * 0.8;
//                       return Container(
//                         constraints: BoxConstraints(
//                           maxWidth: maxWidth,
//                           maxHeight: maxHeight,
//                         ),
//                         padding: EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               'Congratulations!!!',
//                               style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 16.0),
//                             Text(
//                               'You have successfully joined the BPP platform.',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize:
//                                     18, // Larger font size for the first part
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             SizedBox(height: 16.0),
//                             Text(
//                               'To become a primary member and unlock the access to our services, please pay the joining fee of Rs. 5/-. This will give you the access to the platform and enable you to avail membership benefits, including counselling on legal, professional, and educational matters.',
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 16.0),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 TextButton(
//                                   onPressed:
//                                       _hidePopup, // Hide the popup when Cancel is clicked
//                                   child: Text('Cancel'),
//                                 ),
//                                 SizedBox(width: 8.0),
//                                 ElevatedButton(
//                                   onPressed:
//                                       _hidePopup, // Hide the popup and stop confetti
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor:
//                                         Colors.blue, // Button color set to blue
//                                   ),
//                                   child: Text('Pay Now'),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           // Confetti widget aligned to the top-left
//           if (_showPopup)
//             Align(
//               alignment: Alignment.topLeft,
//               child: ConfettiWidget(
//                 confettiController: _confettiController,
//                 blastDirectionality: BlastDirectionality.explosive,
//                 emissionFrequency: 0.02,
//                 numberOfParticles: 40,
//                 gravity: 0.1,
//                 colors: [
//                   Colors.purple,
//                   Colors.pink,
//                   Colors.orange,
//                   Colors.yellow
//                 ],
//               ),
//             ),
//           // Confetti widget aligned to the top-right
//           if (_showPopup)
//             Align(
//               alignment: Alignment.topRight,
//               child: ConfettiWidget(
//                 confettiController: _confettiController,
//                 blastDirectionality: BlastDirectionality.explosive,
//                 emissionFrequency: 0.02,
//                 numberOfParticles: 40,
//                 gravity: 0.1,
//                 colors: [
//                   Colors.purple,
//                   Colors.pink,
//                   Colors.orange,
//                   Colors.yellow
//                 ],
//               ),
//             ),
//         ],
//       ),
//       drawer: Drawer(
//         child: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: [
//                 MyHeaderDrawer(),
//                 MyDrawerList(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget MyDrawerList() {
//     return Container(
//       padding: EdgeInsets.only(
//         top: 12,
//       ),
//       child: Column(
//         children: [
//           menuItem(1, "Dashboard", Icons.dashboard_outlined,
//               currentPage == DrawerSections.dashboard ? true : false),
//           menuItem(2, "Goals", Icons.ads_click,
//               currentPage == DrawerSections.contacts ? true : false),
//           menuItem(3, "Donate", Icons.volunteer_activism,
//               currentPage == DrawerSections.events ? true : false),
//           // Profile section with expandable items
//           ExpansionTile(
//             leading: Icon(Icons.recent_actors),
//             title: Text("Profile"),
//             children: [
//               menuItemSub("Personal Details"),
//             ],
//           ),
//           ExpansionTile(
//             leading: Icon(Icons.account_balance),
//             title: Text("Account"),
//             children: [
//               menuItemSub("Account Details"),
//               menuItemSub("Change pin"),
//             ],
//           ),
//           menuItem(6, "Wallet", Icons.account_balance_wallet,
//               currentPage == DrawerSections.notifications ? true : false),
//           ExpansionTile(
//             leading: Icon(Icons.vpn_lock),
//             title: Text("Membership"),
//             children: [
//               menuItemSub("Membership Card"),
//               menuItemSub("Membership Renewals"),
//               menuItemSub("Referral Code"),
//             ],
//           ),
//           menuItem(7, "Community Contribution", Icons.support,
//               currentPage == DrawerSections.privacy_policy ? true : false),
//           ExpansionTile(
//             leading: Icon(Icons.vpn_lock),
//             title: Text("Community Contribution"),
//             children: [
//               menuItemSub("Register case"),
//               menuItemSub("Review & Approvals"),
//               menuItemSub("Voting"),
//               menuItemSub("Result"),
//               menuItemSub("Execution"),
//             ],
//           ),
//           menuItem(3, "Business Community Join", Icons.add_business,
//               currentPage == DrawerSections.events ? true : false),
//           ExpansionTile(
//             leading: Icon(Icons.logout_outlined),
//             title: Text("Sign out"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget menuItemSub(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 40.0), // Adjust the left padding
//       child: ListTile(
//         contentPadding:
//             EdgeInsets.zero, // Removes extra padding around the ListTile
//         dense: true, // Reduces the overall height of the ListTile
//         title: Text(
//           title,
//           style: TextStyle(
//             fontSize: 16,
//             height: 1.5, // Adjust line height
//           ),
//         ),
//         onTap: () {
//           // Navigate to specific screens1 based on the title
//           if (title == "Account Details") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AccountSettingsScreen()),
//             );
//           } else if (title == "Change pin") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ChangePinScreen()),
//             );
//           } else if (title == "Personal Details") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfileScreen()),
//             );
//           } else if (title == "Membership Card") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => MembershipCertificateScreen()),
//             );
//           } else if (title == "Membership Renewals") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MembershipScreen()),
//             );
//           } else if (title == "Referral Code") {
//             // Add navigation for ReferralScreen
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ReferralScreen()),
//             );
//           } else if (title == "Register case") {
//             // Add navigation for ReferralScreen
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => CaseRegistrationScreen()),
//             );
//           } else if (title == "Voting") {
//             // Add navigation for ReferralScreen
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DashboardScreen5()),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Widget menuItem(int id, String title, IconData icon, bool selected) {
//     return Material(
//       color: selected ? Colors.grey[300] : Colors.transparent,
//       child: InkWell(
//         onTap: () {
//           Navigator.pop(context);
//           setState(() {
//             if (id == 1) {
//               currentPage = DrawerSections.dashboard;
//               _showNavigationBar = true;
//             } else if (id == 2) {
//               currentPage = DrawerSections.contacts;
//               _showNavigationBar = false;
//             } else if (id == 3) {
//               currentPage = DrawerSections.events;
//             } else if (id == 4) {
//               currentPage = DrawerSections.notes;
//             } else if (id == 5) {
//               currentPage = DrawerSections.settings;
//             } else if (id == 6) {
//               currentPage = DrawerSections.notifications;
//             } else if (id == 7) {
//               currentPage = DrawerSections.privacy_policy;
//             } else if (id == 8) {
//               currentPage = DrawerSections.send_feedback;
//             }
//           });
//         },
//         child: Padding(
//           padding: EdgeInsets.all(10.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Icon(
//                   icon,
//                   size: 15,
//                   color: Colors.black,
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
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
//
// enum DrawerSections {
//   dashboard,
//   contacts,
//   events,
//   notes,
//   settings,
//   notifications,
//   privacy_policy,
//   send_feedback, membership,
// }

//correct
import 'dart:ui';

import 'package:bpp_frontend/views/drawer/account_details.dart';
import 'package:bpp_frontend/views/drawer/change_pin_screen.dart';
import 'package:bpp_frontend/views/drawer/community_contribution.dart';

import 'package:bpp_frontend/views/drawer/membership_pass.dart';
import 'package:bpp_frontend/views/drawer/membership_renewals.dart';
import 'package:bpp_frontend/views/drawer/referral%20code.dart';
import 'package:bpp_frontend/views/drawer/register_case_screen.dart';
import 'package:bpp_frontend/views/drawer/voting.dart';
import 'package:bpp_frontend/views/sign_up_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:bpp_frontend/views/drawer/dashbaord.dart';
import 'package:bpp_frontend/views/drawer/personal_details.dart';
import 'package:bpp_frontend/views/drawer/my_drawer_header.dart';
import 'package:bpp_frontend/views/drawer/note.dart';
import 'package:bpp_frontend/views/drawer/notification.dart';
import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
import 'package:bpp_frontend/views/drawer/send_feedback.dart';
import 'package:bpp_frontend/views/drawer/settings.dart';
import 'package:flutter/services.dart';
import '../../views/drawer/donor.dart';
import '../../views/goals.dart';

class ScreenDashbaord extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String referralCode;
  const ScreenDashbaord({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.referralCode,
  }) : super(key: key);

  @override
  _ScreenDashbaordState createState() => _ScreenDashbaordState();
}

class _ScreenDashbaordState extends State<ScreenDashbaord> {
  var currentPage = DrawerSections.dashboard;
  bool _showNavigationBar = true;
  bool _showPopup = true;
  bool _showFundPopup = true; // Track if the fund popup is shown
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 3));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _hideFundPopup() {
    setState(() {
      _showFundPopup = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage(
        firstName: widget.firstName, // Replace with actual data
        lastName: widget.lastName,
        referralCode: widget.referralCode, // Replace with actual data
      );
    } else if (currentPage == DrawerSections.contacts) {
      container = GoalsScreen();
    } else if (currentPage == DrawerSections.events) {
      container = DonorDashboard();
    } else if (currentPage == DrawerSections.notes) {
      container = WalletPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = WalletPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = CommunityContributionScreen();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    } else {
      container = Container(); // Default container
    }

    return WillPopScope(
      onWillPop: () async {
        // Check if the current page is not the dashboard
        if (currentPage != DrawerSections.dashboard) {
          setState(() {
            currentPage = DrawerSections.dashboard;
          });
          return false; // Prevent default back behavior
        }
        return true; // Allow default back behavior (exit the app)
      },
      child: Scaffold(
        appBar: (_showNavigationBar &&
                currentPage != DrawerSections.events &&
                currentPage != DrawerSections.privacy_policy)
            ? AppBar(
                backgroundColor: Colors.blue,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage:
                          AssetImage('assets/images/bpp_logo1.png'),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Bhartiya Popular Party',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : null,
        body: Stack(
          children: [
            // Main content
            container,

            // Add blur effect when _showFundPopup is true
            // if (_showFundPopup)
            //   Positioned.fill(
            //     child: BackdropFilter(
            //       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            //       child: Container(
            //         color: Colors.black.withOpacity(0.5),
            //       ),
            //     ),
            //   ),

            // Show fund popup
            // if (_showFundPopup)
            //   Center(
            //     child: Container(
            //       padding: EdgeInsets.all(16.0),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(8.0),
            //       ),
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Text(
            //             'Add to Fund',
            //             style: TextStyle(
            //               fontSize: 20.0,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           SizedBox(height: 16.0),
            //           Text(
            //             'To proceed, please add 5 rupees to your account.',
            //             textAlign: TextAlign.center,
            //           ),
            //           SizedBox(height: 16.0),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               TextButton(
            //                 onPressed: _hideFundPopup,
            //                 child: Text('Cancel'),
            //               ),
            //               SizedBox(width: 8.0),
            //               ElevatedButton(
            //                 onPressed: () {
            //                   // Handle add fund action here
            //                   _hideFundPopup();
            //                 },
            //                 style: ElevatedButton.styleFrom(
            //                   backgroundColor: Colors.blue,
            //                 ),
            //                 child: Text(
            //                   'Add Now',
            //                   style: TextStyle(color: Colors.white),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
          ],
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      color: Colors.white54,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          // Menu items
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard),
          menuItem(2, "Goals", Icons.ads_click,
              currentPage == DrawerSections.contacts),
          menuItem(3, "Donate", Icons.volunteer_activism,
              currentPage == DrawerSections.events),
          menuItem(4, "Wallet", Icons.account_balance_wallet,
              currentPage == DrawerSections.notifications),
          menuItem(7, "Community Contribution", Icons.support,
              currentPage == DrawerSections.privacy_policy),

          // Profile section with expandable items
          ExpansionTile(
            leading: Icon(Icons.recent_actors),
            title: Text("Profile"),
            childrenPadding: EdgeInsets.only(left: 6.0),
            // Align child items with proper padding
            children: [
              menuItemSub("Personal Details"),
            ],
          ),

          // Account section with expandable items
          ExpansionTile(
            leading: Icon(Icons.account_balance),
            title: Text("Account"),
            childrenPadding: EdgeInsets.only(left: 5.0),
            // Align child items with proper padding
            children: [
              menuItemSub(
                "Account Details",
              ),
              menuItemSub("Change pin"),
            ],
          ),

          // menuItem(6, "Wallet", Icons.account_balance_wallet,
          //     currentPage == DrawerSections.notifications),

          // Membership section with expandable items
          ExpansionTile(
            leading: Icon(Icons.wallet_membership),
            title: Text("Membership"),
            childrenPadding: EdgeInsets.only(left: 6.0),
            // Align child items with proper padding
            children: [
              menuItemSub("Membership Card"),
              menuItemSub("Membership Renewals"),
              menuItemSub("Referral Code"),
            ],
          ),

          // menuItem(7, "Community Contribution", Icons.support,
          //     currentPage == DrawerSections.privacy_policy),

          // Another expandable section
          ExpansionTile(
            leading: Icon(Icons.support),
            title: Padding(
              padding: EdgeInsets.only(
                  left: 0.0), // Add padding to the title to adjust alignment
              child: Text(
                "Community Contribution",
                style:
                    TextStyle(fontSize: 16), // Optionally adjust the font size
              ),
            ),
            childrenPadding: EdgeInsets.only(
                left: 10.0), // Align child items with proper padding
            children: [
              menuItemSub("Register case"),
              menuItemSub("Review & Approvals"),
              menuItemSub("Voting"),
              menuItemSub("Result"),
              menuItemSub("Execution"),
            ],
          ),

          menuItem(3, "Business Community Join", Icons.add_business,
              currentPage == DrawerSections.events),

          // Sign out section
          ExpansionTile(
            leading: Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ),
            title: Text("Sign out"),
            childrenPadding: EdgeInsets.only(left: 10.0),
            children: [
              ListTile(
                title: Text(
                  "Confirm Sign Out",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  _showSignOutConfirmationDialog(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSignOutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Sign Out"),
          content: Text("Are you sure you want to sign out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreenView()),
                );
                // Perform sign-out and close the app
                // _signOutAndExit();
              },
              child: Text("Sign Out"),
            ),
          ],
        );
      },
    );
  }

  void _signOutAndExit() {
    // Perform any sign-out logic here (e.g., clearing shared preferences, tokens)

    // Exit the app
    SystemNavigator.pop(); // Exits the app
  }

  Widget menuItemSub(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      // Adjust the left padding to match other items
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        // Removes extra padding around the ListTile
        dense: true,
        // Reduces the overall height of the ListTile
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            height: 1.5, // Adjust line height
          ),
        ),
        onTap: () {
          // Navigate to specific screens based on the title
          if (title == "Account Details") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountSettingsScreen()),
            );
          } else if (title == "Change pin") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChangePinScreen()),
            );
          } else if (title == "Personal Details") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          } else if (title == "Membership Card") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MembershipCertificateScreen()),
            );
          } else if (title == "Membership Renewals") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MembershipScreen()),
            );
          } else if (title == "Referral Code") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReferralScreen()),
            );
          } else if (title == "Register case") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CaseRegistrationScreen()),
            );
          } else if (title == "Voting") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen5()),
            );
          }
        },
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
              _showNavigationBar = true;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
              _showNavigationBar = false;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20, // Adjust icon size
                color: Colors.black,
              ),
              SizedBox(width: 12), // Add space between the icon and text
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
  membership,
}

// correct profile
// import 'dart:ui';
//
// import 'package:bpp_frontend/views/drawer/account_details.dart';
// import 'package:bpp_frontend/views/drawer/change_pin_screen.dart';
// import 'package:bpp_frontend/views/drawer/community_contribution.dart';
//
// import 'package:bpp_frontend/views/drawer/membership_pass.dart';
// import 'package:bpp_frontend/views/drawer/membership_renewals.dart';
// import 'package:bpp_frontend/views/drawer/referral%20code.dart';
// import 'package:bpp_frontend/views/drawer/register_case_screen.dart';
// import 'package:bpp_frontend/views/drawer/voting.dart';
// import 'package:flutter/material.dart';
// import 'package:confetti/confetti.dart';
// import 'package:bpp_frontend/views/drawer/dashbaord.dart';
// import 'package:bpp_frontend/views/drawer/personal_details.dart';
// import 'package:bpp_frontend/views/drawer/my_drawer_header.dart';
// import 'package:bpp_frontend/views/drawer/note.dart';
// import 'package:bpp_frontend/views/drawer/notification.dart';
// import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
// import 'package:bpp_frontend/views/drawer/send_feedback.dart';
// import 'package:bpp_frontend/views/drawer/settings.dart';
// import '../../views/drawer/donor.dart';
// import '../../views/goals.dart';
//
// class ScreenDashbaord extends StatefulWidget {
//   @override
//   _ScreenDashbaordState createState() => _ScreenDashbaordState();
// }
//
// class _ScreenDashbaordState extends State<ScreenDashbaord> {
//   var currentPage = DrawerSections.dashboard;
//   bool _showNavigationBar = true;
//   bool _showPopup = true;
//   bool _showFundPopup = true; // Track if the fund popup is shown
//   late ConfettiController _confettiController;
//
//   @override
//   void initState() {
//     super.initState();
//     _confettiController = ConfettiController(duration: Duration(seconds: 3));
//   }
//
//   @override
//   void dispose() {
//     _confettiController.dispose();
//     super.dispose();
//   }
//
//   void _hideFundPopup() {
//     setState(() {
//       _showFundPopup = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget container;
//     if (currentPage == DrawerSections.dashboard) {
//       container = DashboardPage();
//     } else if (currentPage == DrawerSections.contacts) {
//       container = GoalsScreen();
//     } else if (currentPage == DrawerSections.events) {
//       container = DonorDashboard();
//     } else if (currentPage == DrawerSections.notes) {
//       container = NotesPage();
//     } else if (currentPage == DrawerSections.settings) {
//       container = SettingsPage();
//     } else if (currentPage == DrawerSections.notifications) {
//       container = WalletPage();
//     } else if (currentPage == DrawerSections.privacy_policy) {
//       container = CommunityContributionScreen();
//     } else if (currentPage == DrawerSections.membership) {
//       container = MembershipCertificateScreen();
//     } else {
//       container = Container(); // Default container
//     }
//
//     return Scaffold(
//       appBar: (_showNavigationBar &&
//               currentPage != DrawerSections.events &&
//               currentPage != DrawerSections.privacy_policy)
//           ? AppBar(
//               backgroundColor: Colors.blue,
//               title: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 18,
//                     backgroundImage: AssetImage('assets/images/bpp_logo1.png'),
//                   ),
//                   SizedBox(width: 14),
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Bhartiya Popular Party',
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           : null,
//       body: Stack(
//         children: [
//           // Main content
//           container,
//
//           // Add blur effect when _showFundPopup is true
//           if (_showFundPopup)
//             Positioned.fill(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                 child: Container(
//                   color: Colors.black.withOpacity(0.5),
//                 ),
//               ),
//             ),
//
//           // Show fund popup
//           if (_showFundPopup)
//             Center(
//               child: Container(
//                 padding: EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'Add to Fund',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 16.0),
//                     Text(
//                       'To proceed, please add 5 rupees to your account.',
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 16.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TextButton(
//                           onPressed: _hideFundPopup,
//                           child: Text('Cancel'),
//                         ),
//                         SizedBox(width: 8.0),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle add fund action here
//                             _hideFundPopup();
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                           ),
//                           child: Text(
//                             'Add Now',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//       drawer: Drawer(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               MyHeaderDrawer(),
//               MyDrawerList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget MyDrawerList() {
//     return Container(
//       color: Colors.white54,
//       padding: EdgeInsets.all(10),
//       child: Column(
//         children: [
//           // Menu items
//           menuItem(1, "Dashboard", Icons.dashboard_outlined,
//               currentPage == DrawerSections.dashboard),
//           menuItem(2, "Goals", Icons.ads_click,
//               currentPage == DrawerSections.contacts),
//           menuItem(3, "Donate", Icons.volunteer_activism,
//               currentPage == DrawerSections.events),
//
//           // Profile menu item to navigate to ProfileScreen
//           menuItem(4, "Profile", Icons.person,
//               currentPage == DrawerSections.contacts),
//           menuItem(
//               5,
//               "Account details",
//               Icons.account_balance,
//               currentPage ==
//                   DrawerSections.account), // You can change the icon here
//
//           // Profile section with expandable items
//
//           // Account section with expandable items
//           // ExpansionTile(
//           //   leading: Icon(Icons.account_balance),
//           //   title: Text("Account"),
//           //   childrenPadding: EdgeInsets.only(left: 5.0),
//           //   children: [
//           //     // menuItemSub(
//           //     //   "Account Details",
//           //     // ),
//           //     // menuItemSub("Change pin"),
//           //   ],
//           // ),
//
//           menuItem(6, "Wallet", Icons.account_balance_wallet,
//               currentPage == DrawerSections.notifications),
//
//           // Membership section with expandable items
//           // ExpansionTile(
//           //   leading: Icon(Icons.wallet_membership),
//           //   title: Text("Membership"),
//           //   childrenPadding: EdgeInsets.only(left: 6.0),
//           //   children: [
//           //     // menuItemSub("Membership Card"),
//           //     // menuItemSub("Membership Renewals"),
//           //     // menuItemSub("Referral Code"),
//           //   ],
//           // ),
//
//           menuItem(7, "Community contribution", Icons.support,
//               currentPage == DrawerSections.privacy_policy),
//           menuItem(8, "Membership card", Icons.account_balance_wallet,
//               currentPage == DrawerSections.membership),
//           menuItem(9, "Membership renewals", Icons.account_balance_wallet,
//               currentPage == DrawerSections.renewals),
//           menuItem(10, "Membership referrals", Icons.account_balance_wallet,
//               currentPage == DrawerSections.renewals),
//
//           menuItem(3, "Business community join", Icons.add_business,
//               currentPage == DrawerSections.events),
//           ExpansionTile(
//             leading: Icon(Icons.support),
//             title: Text("Community Contribution"),
//             childrenPadding:
//                 EdgeInsets.only(left: 16.0), // Add padding for sub-items
//             children: [
//               menuItemSub("Register case"),
//               menuItemSub("Review & Approvals"),
//               menuItemSub("Voting"),
//               menuItemSub("Result"),
//               menuItemSub("Execution"),
//             ],
//           ),
//
//           // Sign out section
//           ExpansionTile(
//             leading: Icon(Icons.logout_outlined),
//             title: Text("Sign out"),
//             childrenPadding: EdgeInsets.only(
//                 left: 10.0), // Align child items with proper padding
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget menuItemSub(String title) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: () {
//           // Handle navigation when "Register case" is clicked
//           if (title == "Register case") {
//             // Navigate to CaseRegistrationScreen
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => CaseRegistrationScreen()),
//             );
//           } else {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DashboardScreen5()),
//             );
//             // Handle other menu item actions (if needed)
//             print('Selected: $title');
//           }
//         },
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//           child: Row(
//             children: [
//               SizedBox(width: 10),
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget menuItem(int id, String title, IconData icon, bool selected) {
//     return Material(
//       color: selected ? Colors.grey[300] : Colors.transparent,
//       child: InkWell(
//         onTap: () {
//           Navigator.pop(context);
//           setState(() {
//             if (id == 1) {
//               currentPage = DrawerSections.dashboard;
//               _showNavigationBar = true;
//             } else if (id == 2) {
//               currentPage = DrawerSections.contacts;
//               _showNavigationBar = false;
//             } else if (id == 3) {
//               currentPage = DrawerSections.events;
//             } else if (id == 4) {
//               currentPage = DrawerSections.personal_details;
//               // Navigate to ProfileScreen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ProfileScreen()),
//               );
//             } else if (id == 5) {
//               currentPage = DrawerSections.account;
//               // Navigate to ProfileScreen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => AccountSettingsScreen()),
//               );
//             } else if (id == 8) {
//               currentPage = DrawerSections.membership;
//               // Navigate to ProfileScreen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => MembershipCertificateScreen()),
//               );
//             } else if (id == 9) {
//               currentPage = DrawerSections.membership;
//               // Navigate to ProfileScreen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MembershipScreen()),
//               );
//             } else if (id == 10) {
//               currentPage = DrawerSections.referrals;
//               // Navigate to ProfileScreen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ReferralScreen()),
//               );
//             } else if (id == 5) {
//               currentPage = DrawerSections.settings;
//             } else if (id == 6) {
//               currentPage = DrawerSections.notifications;
//             } else if (id == 7) {
//               currentPage = DrawerSections.privacy_policy;
//             } else if (id == 8) {
//               currentPage = DrawerSections.membership;
//             }
//           });
//         },
//         child: Padding(
//           padding: EdgeInsets.all(10.0),
//           child: Row(
//             children: [
//               Icon(
//                 icon,
//                 size: 20, // Adjust icon size
//                 color: Colors.black,
//               ),
//               SizedBox(width: 12), // Add space between the icon and text
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   height: 1.5,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// enum DrawerSections {
//   dashboard,
//   contacts,
//   events,
//   notes,
//   settings,
//   notifications,
//   privacy_policy,
//
//   personal_details,
//   account,
//   membership,
//   renewals,
//   referrals,
// }

// import 'package:bpp_frontend/views/drawer/account_details.dart';
// import 'package:bpp_frontend/views/drawer/change_pin_screen.dart';
// import 'package:bpp_frontend/views/drawer/community_contribution.dart';
//
// import 'package:bpp_frontend/views/drawer/membership_pass.dart';
// import 'package:bpp_frontend/views/drawer/membership_renewals.dart';
// import 'package:bpp_frontend/views/drawer/referral%20code.dart';
// import 'package:bpp_frontend/views/drawer/register_case_screen.dart';
// import 'package:bpp_frontend/views/drawer/voting.dart';
// import 'package:flutter/material.dart';
// import 'package:confetti/confetti.dart';
// import 'package:bpp_frontend/views/drawer/dashbaord.dart';
// import 'package:bpp_frontend/views/drawer/personal_details.dart';
// import 'package:bpp_frontend/views/drawer/my_drawer_header.dart';
// import 'package:bpp_frontend/views/drawer/note.dart';
// import 'package:bpp_frontend/views/drawer/notification.dart';
// import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
// import 'package:bpp_frontend/views/drawer/send_feedback.dart';
// import 'package:bpp_frontend/views/drawer/settings.dart';
// import '../../views/drawer/donor.dart';
// import '../../views/goals.dart';
//
// class ScreenDashbaord extends StatefulWidget {
//   @override
//   _ScreenDashbaordState createState() => _ScreenDashbaordState();
// }
//
// class _ScreenDashbaordState extends State<ScreenDashbaord> {
//   var currentPage = DrawerSections.dashboard;
//   bool _showNavigationBar = true;
//   bool _showPopup = true;
//   late ConfettiController _confettiController;
//
//   @override
//   void initState() {
//     super.initState();
//     _confettiController = ConfettiController(duration: Duration(seconds: 3));
//   }
//
//   @override
//   void dispose() {
//     _confettiController.dispose();
//     super.dispose();
//   }
//
//   void _hidePopup() {
//     setState(() {
//       _showPopup = false;
//     });
//     _confettiController.stop(); // Stop the confetti animation
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget container;
//     if (currentPage == DrawerSections.dashboard) {
//       container = DashboardPage();
//     } else if (currentPage == DrawerSections.contacts) {
//       container = GoalsScreen();
//     } else if (currentPage == DrawerSections.events) {
//       container = DonorDashboard();
//     } else if (currentPage == DrawerSections.notes) {
//       container = NotesPage();
//     } else if (currentPage == DrawerSections.settings) {
//       container = SettingsPage();
//     } else if (currentPage == DrawerSections.notifications) {
//       container = WalletPage();
//     } else if (currentPage == DrawerSections.privacy_policy) {
//       container = CommunityContributionScreen();
//     } else if (currentPage == DrawerSections.send_feedback) {
//       container = SendFeedbackPage();
//     } else {
//       container = Container(); // Default container
//     }
//
//     // Trigger confetti when the popup is shown
//     if (_showPopup) {
//       _confettiController.play(); // Play the confetti animation only once
//     }
//
//     return Scaffold(
//       appBar: _showNavigationBar
//           ? AppBar(
//               backgroundColor: Colors.blue,
//
//               title: currentPage == DrawerSections.notifications
//                   ? Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Dashboard  > ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           'Profile',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     )
//                   : currentPage ==
//                           DrawerSections.events // Check for DonorDashboard
//                       ? Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Dashboard  > ',
//                               style: TextStyle(
//                                 fontSize: 18,
//                               ),
//                             ),
//                             Text(
//                               'Donate',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         )
//                       : Text(''), // Default empty AppBar title
//             )
//           : null,
//       body: Stack(
//         children: [
//           container,
//           if (_showPopup)
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black.withOpacity(0.5),
//                 child: Center(
//                   child: LayoutBuilder(
//                     builder: (context, constraints) {
//                       double maxWidth = constraints.maxWidth * 0.8;
//                       double maxHeight = constraints.maxHeight * 0.8;
//                       return Container(
//                         constraints: BoxConstraints(
//                           maxWidth: maxWidth,
//                           maxHeight: maxHeight,
//                         ),
//                         padding: EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               'Congratulations!!!',
//                               style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 16.0),
//                             Text(
//                               'You have successfully joined the BPP platform.',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize:
//                                     18, // Larger font size for the first part
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             SizedBox(height: 16.0),
//                             Text(
//                               'To become a primary member and unlock the access to our services, please pay the joining fee of Rs. 5/-. This will give you the access to the platform and enable you to avail membership benefits, including counselling on legal, professional, and educational matters.',
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 16.0),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 TextButton(
//                                   onPressed:
//                                       _hidePopup, // Hide the popup when Cancel is clicked
//                                   child: Text('Cancel'),
//                                 ),
//                                 SizedBox(width: 8.0),
//                                 ElevatedButton(
//                                   onPressed:
//                                       _hidePopup, // Hide the popup and stop confetti
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor:
//                                         Colors.blue, // Button color set to blue
//                                   ),
//                                   child: Text('Pay Now'),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           // Confetti widget aligned to the top-left
//           if (_showPopup)
//             Align(
//               alignment: Alignment.topLeft,
//               child: ConfettiWidget(
//                 confettiController: _confettiController,
//                 blastDirectionality: BlastDirectionality.explosive,
//                 emissionFrequency: 0.02,
//                 numberOfParticles: 40,
//                 gravity: 0.1,
//                 colors: [
//                   Colors.purple,
//                   Colors.pink,
//                   Colors.orange,
//                   Colors.yellow
//                 ],
//               ),
//             ),
//           // Confetti widget aligned to the top-right
//           if (_showPopup)
//             Align(
//               alignment: Alignment.topRight,
//               child: ConfettiWidget(
//                 confettiController: _confettiController,
//                 blastDirectionality: BlastDirectionality.explosive,
//                 emissionFrequency: 0.02,
//                 numberOfParticles: 40,
//                 gravity: 0.1,
//                 colors: [
//                   Colors.purple,
//                   Colors.pink,
//                   Colors.orange,
//                   Colors.yellow
//                 ],
//               ),
//             ),
//         ],
//       ),
//       drawer: Drawer(
//         child: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: [
//                 MyHeaderDrawer(),
//                 MyDrawerList(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget MyDrawerList() {
//     return Container(
//       padding: EdgeInsets.only(
//         top: 12,
//       ),
//       child: Column(
//         children: [
//           menuItem(1, "Dashboard", Icons.dashboard_outlined,
//               currentPage == DrawerSections.dashboard ? true : false),
//           menuItem(2, "Goals", Icons.ads_click,
//               currentPage == DrawerSections.contacts ? true : false),
//           menuItem(3, "Donate", Icons.volunteer_activism,
//               currentPage == DrawerSections.events ? true : false),
//           // Profile section with expandable items
//           ExpansionTile(
//             leading: Icon(Icons.recent_actors),
//             title: Text("Profile"),
//             children: [
//               menuItemSub("Personal Details"),
//             ],
//           ),
//           ExpansionTile(
//             leading: Icon(Icons.account_balance),
//             title: Text("Account"),
//             children: [
//               menuItemSub("Account Details"),
//               menuItemSub("Change pin"),
//             ],
//           ),
//           menuItem(6, "Wallet", Icons.account_balance_wallet,
//               currentPage == DrawerSections.notifications ? true : false),
//           ExpansionTile(
//             leading: Icon(Icons.vpn_lock),
//             title: Text("Membership"),
//             children: [
//               menuItemSub("Membership Card"),
//               menuItemSub("Membership Renewals"),
//               menuItemSub("Referral Code"),
//             ],
//           ),
//           menuItem(7, "Community Contribution", Icons.support,
//               currentPage == DrawerSections.privacy_policy ? true : false),
//           ExpansionTile(
//             leading: Icon(Icons.vpn_lock),
//             title: Text("Community Contribution"),
//             children: [
//               menuItemSub("Register case"),
//               menuItemSub("Review & Approvals"),
//               menuItemSub("Voting"),
//               menuItemSub("Result"),
//               menuItemSub("Execution"),
//             ],
//           ),
//           menuItem(3, "Business Community Join", Icons.add_business,
//               currentPage == DrawerSections.events ? true : false),
//           ExpansionTile(
//             leading: Icon(Icons.logout_outlined),
//             title: Text("Sign out"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget menuItemSub(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 40.0), // Adjust the left padding
//       child: ListTile(
//         contentPadding:
//             EdgeInsets.zero, // Removes extra padding around the ListTile
//         dense: true, // Reduces the overall height of the ListTile
//         title: Text(
//           title,
//           style: TextStyle(
//             fontSize: 16,
//             height: 1.5, // Adjust line height
//           ),
//         ),
//         onTap: () {
//           // Navigate to specific screens1 based on the title
//           if (title == "Account Details") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AccountSettingsScreen()),
//             );
//           } else if (title == "Change pin") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ChangePinScreen()),
//             );
//           } else if (title == "Personal Details") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfileScreen()),
//             );
//           } else if (title == "Membership Card") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => MembershipCertificateScreen()),
//             );
//           } else if (title == "Membership Renewals") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MembershipScreen()),
//             );
//           } else if (title == "Referral Code") {
//             // Add navigation for ReferralScreen
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ReferralScreen()),
//             );
//           } else if (title == "Register case") {
//             // Add navigation for ReferralScreen
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => CaseRegistrationScreen()),
//             );
//           } else if (title == "Voting") {
//             // Add navigation for ReferralScreen
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DashboardScreen5()),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Widget menuItem(int id, String title, IconData icon, bool selected) {
//     return Material(
//       color: selected ? Colors.grey[300] : Colors.transparent,
//       child: InkWell(
//         onTap: () {
//           Navigator.pop(context);
//           setState(() {
//             if (id == 1) {
//               currentPage = DrawerSections.dashboard;
//               _showNavigationBar = true;
//             } else if (id == 2) {
//               currentPage = DrawerSections.contacts;
//               _showNavigationBar = false;
//             } else if (id == 3) {
//               currentPage = DrawerSections.events;
//             } else if (id == 4) {
//               currentPage = DrawerSections.notes;
//             } else if (id == 5) {
//               currentPage = DrawerSections.settings;
//             } else if (id == 6) {
//               currentPage = DrawerSections.notifications;
//             } else if (id == 7) {
//               currentPage = DrawerSections.privacy_policy;
//             } else if (id == 8) {
//               currentPage = DrawerSections.send_feedback;
//             }
//           });
//         },
//         child: Padding(
//           padding: EdgeInsets.all(10.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Icon(
//                   icon,
//                   size: 15,
//                   color: Colors.black,
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
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
//
// enum DrawerSections {
//   dashboard,
//   contacts,
//   events,
//   notes,
//   settings,
//   notifications,
//   privacy_policy,
//   send_feedback,
// }

// Widget MyDrawerList() {
//   return Container(
//     padding: EdgeInsets.only(
//       top: 12,
//     ),
//     child: Column(
//       children: [
//         menuItem(1, "Dashboard", Icons.dashboard_outlined,
//             currentPage == DrawerSections.dashboard ? true : false),
//         menuItem(2, "Goals", Icons.ads_click,
//             currentPage == DrawerSections.contacts ? true : false),
//         menuItem(3, "Donate", Icons.volunteer_activism,
//             currentPage == DrawerSections.events ? true : false),
//         // Profile section with expandable items
//         ExpansionTile(
//           leading: Icon(Icons.recent_actors),
//           title: Text("     Profile"),
//           children: [
//             menuItemSub("Personal Details"),
//           ],
//         ),
//         ExpansionTile(
//           leading: Icon(Icons.account_balance),
//           title: Text("Account"),
//           children: [
//             menuItemSub("Account Details"),
//             menuItemSub("Change pin"),
//           ],
//         ),
//         menuItem(6, "Wallet", Icons.account_balance_wallet,
//             currentPage == DrawerSections.notifications ? true : false),
//         ExpansionTile(
//           leading: Icon(Icons.vpn_lock),
//           title: Text("Membership"),
//           children: [
//             menuItemSub("Membership Card"),
//             menuItemSub("Membership Renewals"),
//             menuItemSub("Referral Code"),
//           ],
//         ),
//         menuItem(7, "Community Contribution", Icons.support,
//             currentPage == DrawerSections.privacy_policy ? true : false),
//         ExpansionTile(
//           leading: Icon(Icons.vpn_lock),
//           title: Text("Community Contribution"),
//           children: [
//             menuItemSub("Register case"),
//             menuItemSub("Review & Approvals"),
//             menuItemSub("Voting"),
//             menuItemSub("Result"),
//             menuItemSub("Execution"),
//           ],
//         ),
//         menuItem(3, "Business Community Join", Icons.add_business,
//             currentPage == DrawerSections.events ? true : false),
//         ExpansionTile(
//           leading: Icon(Icons.logout_outlined),
//           title: Text("Sign out"),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget menuItemSub(String title) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 40.0), // Adjust the left padding
//     child: ListTile(
//       contentPadding:
//       EdgeInsets.zero, // Removes extra padding around the ListTile
//       dense: true, // Reduces the overall height of the ListTile
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: 16,
//           height: 1.5, // Adjust line height
//         ),
//       ),
//       onTap: () {
//         // Navigate to specific screens1 based on the title
//         if (title == "Account Details") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AccountSettingsScreen()),
//           );
//         } else if (title == "Change pin") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ChangePinScreen()),
//           );
//         } else if (title == "Personal Details") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ProfileScreen()),
//           );
//         } else if (title == "Membership Card") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => MembershipCertificateScreen()),
//           );
//         } else if (title == "Membership Renewals") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => MembershipScreen()),
//           );
//         } else if (title == "Referral Code") {
//           // Add navigation for ReferralScreen
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ReferralScreen()),
//           );
//         } else if (title == "Register case") {
//           // Add navigation for ReferralScreen
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CaseRegistrationScreen()),
//           );
//         } else if (title == "Voting") {
//           // Add navigation for ReferralScreen
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => DashboardScreen5()),
//           );
//         }
//       },
//     ),
//   );
// }
//
// Widget menuItem(int id, String title, IconData icon, bool selected) {
//   return Material(
//     color: selected ? Colors.grey[300] : Colors.transparent,
//     child: InkWell(
//       onTap: () {
//         Navigator.pop(context);
//         setState(() {
//           if (id == 1) {
//             currentPage = DrawerSections.dashboard;
//             _showNavigationBar = true;
//           } else if (id == 2) {
//             currentPage = DrawerSections.contacts;
//             _showNavigationBar = false;
//           } else if (id == 3) {
//             currentPage = DrawerSections.events;
//           } else if (id == 4) {
//             currentPage = DrawerSections.notes;
//           } else if (id == 5) {
//             currentPage = DrawerSections.settings;
//           } else if (id == 6) {
//             currentPage = DrawerSections.notifications;
//           } else if (id == 7) {
//             currentPage = DrawerSections.privacy_policy;
//           } else if (id == 8) {
//             currentPage = DrawerSections.send_feedback;
//           }
//         });
//       },
//       child: Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: Icon(
//                 icon,
//                 size: 15,
//                 color: Colors.black,
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// }
//
// enum DrawerSections {
//   dashboard,
//   contacts,
//   events,
//   notes,
//   settings,
//   notifications,
//   privacy_policy,
//   send_feedback,
// }
