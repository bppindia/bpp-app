// import 'package:bpp_frontend/views/drawer/dashbaord.dart';
// import 'package:bpp_frontend/views/drawer/my_drawer_header.dart';
// import 'package:bpp_frontend/views/drawer/note.dart';
// import 'package:bpp_frontend/views/drawer/notification.dart';
// import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
// import 'package:bpp_frontend/views/drawer/send_feedback.dart';
// import 'package:bpp_frontend/views/drawer/settings.dart';
// import 'package:flutter/material.dart';
// import '../../views/drawer/contacts.dart';
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
// import 'package:bpp_frontend/views/drawer/dashbaord.dart';
// import 'package:bpp_frontend/views/drawer/events.dart';
// import 'package:bpp_frontend/views/drawer/my_drawer_header.dart';
// import 'package:bpp_frontend/views/drawer/note.dart';
// import 'package:bpp_frontend/views/drawer/notification.dart';
// import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
// import 'package:bpp_frontend/views/drawer/send_feedback.dart';
// import 'package:bpp_frontend/views/drawer/settings.dart';
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
//     return Scaffold(
//       appBar: _showNavigationBar
//           ? AppBar(
//         backgroundColor: Colors.blue,
//       )
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
//                                       _showPopup = false;
//                                     });
//                                   },
//                                   child: Text('Cancel'),
//                                 ),
//                                 SizedBox(width: 8.0),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       _showPopup = false;
//                                     });
//                                   },
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


// import 'package:flutter/material.dart';
// import 'package:confetti/confetti.dart';
// import '../../views/drawer/dashbaord.dart';
// import '../../views/drawer/events.dart';
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



import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:bpp_frontend/views/drawer/dashbaord.dart';
import 'package:bpp_frontend/views/drawer/events.dart';
import 'package:bpp_frontend/views/drawer/my_drawer_header.dart';
import 'package:bpp_frontend/views/drawer/note.dart';
import 'package:bpp_frontend/views/drawer/notification.dart';
import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
import 'package:bpp_frontend/views/drawer/send_feedback.dart';
import 'package:bpp_frontend/views/drawer/settings.dart';
import '../../views/drawer/contacts.dart';
import '../../views/goals.dart';

class ScreenDashbaord extends StatefulWidget {
  @override
  _ScreenDashbaordState createState() => _ScreenDashbaordState();
}

class _ScreenDashbaordState extends State<ScreenDashbaord> {
  var currentPage = DrawerSections.dashboard;
  bool _showNavigationBar = true;
  bool _showPopup = true;
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

  void _hidePopup() {
    setState(() {
      _showPopup = false;
    });
    _confettiController.stop(); // Stop the confetti animation
  }

  @override
  Widget build(BuildContext context) {
    Widget container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = GoalsScreen();
    } else if (currentPage == DrawerSections.events) {
      container = DonorDashboard();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    } else {
      container = Container(); // Default container
    }

    // Trigger confetti when the popup is shown
    if (_showPopup) {
      _confettiController.play(); // Play the confetti animation only once
    }

    return Scaffold(
      appBar: _showNavigationBar
          ? AppBar(
        backgroundColor: Colors.blue,
      )
          : null,
      body: Stack(
        children: [
          container,
          if (_showPopup)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double maxWidth = constraints.maxWidth * 0.8;
                      double maxHeight = constraints.maxHeight * 0.8;
                      return Container(
                        constraints: BoxConstraints(
                          maxWidth: maxWidth,
                          maxHeight: maxHeight,
                        ),
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Congratulations!!!',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'You have successfully joined the BPP platform.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18, // Larger font size for the first part
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'To become a primary member and unlock the access to our services, please pay the joining fee of Rs. 5/-. This will give you the access to the platform and enable you to avail membership benefits, including counselling on legal, professional, and educational matters.',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: _hidePopup, // Hide the popup when Cancel is clicked
                                  child: Text('Cancel'),
                                ),
                                SizedBox(width: 8.0),
                                ElevatedButton(
                                  onPressed: _hidePopup, // Hide the popup and stop confetti
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue, // Button color set to blue
                                  ),
                                  child: Text('Pay Now'),
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          // Confetti widget aligned to the top-left
          if (_showPopup)
            Align(
              alignment: Alignment.topLeft,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                emissionFrequency: 0.02,
                numberOfParticles: 40,
                gravity: 0.1,
                colors: [Colors.purple, Colors.pink, Colors.orange, Colors.yellow],
              ),
            ),
          // Confetti widget aligned to the top-right
          if (_showPopup)
            Align(
              alignment: Alignment.topRight,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                emissionFrequency: 0.02,
                numberOfParticles: 40,
                gravity: 0.1,
                colors: [Colors.purple, Colors.pink, Colors.orange, Colors.yellow],
              ),
            ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
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

  // Widget MyDrawerList() {
  //   return Container(
  //     padding: EdgeInsets.only(
  //       top: 15,
  //     ),
  //     child: Column(
  //       children: [
  //         menuItem(1, "Dashboard", Icons.dashboard_outlined,
  //             currentPage == DrawerSections.dashboard ? true : false),
  //         menuItem(2, "Goals", Icons.people_alt_outlined,
  //             currentPage == DrawerSections.contacts ? true : false),
  //         menuItem(3, "Donate", Icons.event,
  //             currentPage == DrawerSections.events ? true : false),
  //         menuItem(4, "Profile", Icons.notes,
  //             currentPage == DrawerSections.notes ? true : false),
  //         Divider(),
  //         menuItem(5, "Settings", Icons.settings_outlined,
  //             currentPage == DrawerSections.settings ? true : false),
  //         menuItem(6, "Notifications", Icons.notifications_outlined,
  //             currentPage == DrawerSections.notifications ? true : false),
  //         Divider(),
  //         menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
  //             currentPage == DrawerSections.privacy_policy ? true : false),
  //         menuItem(8, "Send feedback", Icons.feedback_outlined,
  //             currentPage == DrawerSections.send_feedback ? true : false),
  //       ],
  //     ),
  //   );
  // }
  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 12,
      ),
      child: Column(
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Goals", Icons.ads_click,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Donate", Icons.volunteer_activism,
              currentPage == DrawerSections.events ? true : false),
          // Profile section with expandable items
          ExpansionTile(
            leading: Icon(Icons.recent_actors),
            title: Text("Profile"),
            children: [
              menuItemSub("Personal Details"),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.account_balance),
            title: Text("Account"),
            children: [
              menuItemSub("Account Details"),
              menuItemSub("Change pin"),
            ],
          ),
          menuItem(6, "Wallet", Icons.account_balance_wallet,
              currentPage == DrawerSections.notifications ? true : false),
          ExpansionTile(
            leading: Icon(Icons.vpn_lock),
            title: Text("Membership"),
            children: [
              menuItemSub("Membership Pass"),
              menuItemSub("Membership Renewals"),
              menuItemSub("Referral Code"),
            ],
          ),
          menuItem(7, "Community Contribution", Icons.support,
              currentPage == DrawerSections.privacy_policy ? true : false),
          ExpansionTile(
            leading: Icon(Icons.vpn_lock),
            title: Text("Community Contribution"),
            children: [
              menuItemSub("Register case"),
              menuItemSub("Review & Approvals"),
              menuItemSub("Voting"),
              menuItemSub("Result"),
              menuItemSub("Execution"),
            ],
          ),
          menuItem(3, "Business Community Join", Icons.add_business,
              currentPage == DrawerSections.events ? true : false),
        ],
      ),
    );
  }

// Sub-menu item widget for child items
//   Widget menuItemSub(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 40.0),
//       child: ListTile(
//         title: Text(title),
//         onTap: () {
//           // Handle the navigation or logic for submenu item
//         },
//       ),
//     );
//   }

  Widget menuItemSub(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0), // Adjust the left padding for alignment
      child: ListTile(
        contentPadding: EdgeInsets.zero, // Removes extra padding around the ListTile
        dense: true, // Reduces the overall height of the ListTile
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16, // Font size for the text
            height: 0.25, // Line height (20px / 16px = 1.25)
          ),
        ),
        onTap: () {
          // Handle the navigation or logic for submenu item
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
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
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
}
