// import 'package:flutter/material.dart';
// import 'package:bpp_frontend/views/widgets/footer.dart';
//
// class GoalsScreen extends StatefulWidget {
//   @override
//   _GoalsScreenState createState() => _GoalsScreenState();
// }
//
// class _GoalsScreenState extends State<GoalsScreen> {
//   double _scrollOffset = 0.0; // Variable to track scroll offset
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final double walletAmount = 00.00;  // Example wallet amount, dynamically set as needed
//
//     return Scaffold(
//       backgroundColor: Colors.black, // Dark background for the screen
//       body: NotificationListener<ScrollNotification>(
//         onNotification: (ScrollNotification notification) {
//           setState(() {
//             _scrollOffset = notification.metrics.pixels; // Update scroll offset
//           });
//           return true;
//         },
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               expandedHeight: 350,  // Fixed height for the header
//               floating: false,
//               pinned: true,
//               leading: IconButton(
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: _scrollOffset > 50 ? Colors.white : Colors.white, // Change icon color based on scroll
//                 ),
//                 onPressed: () {
//                   if (Navigator.canPop(context)) {
//                     Navigator.pop(context); // Go back to the previous screen if there's a screen in the stack
//                   } else {
//                     // Navigate to the Dashboard screen if there's no previous screen in the stack
//                     Navigator.pushReplacementNamed(context, '/dashboard');
//                   }
//                 },
//               ),
//               actions: [
//                 // Display Rupees Amount with Wallet Icon
//                 Padding(
//                   padding: const EdgeInsets.only(right: 10.0, top: 10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.account_balance_wallet,  // Wallet icon
//                         color: Colors.white,
//                         size: screenWidth * 0.06,  // Adjust icon size based on screen width
//                       ),
//                       SizedBox(width: 8),  // Space between icon and text
//                       Text(
//                         "₹$walletAmount", // Dynamically show wallet amount
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: screenWidth * 0.045,  // Adjust font size for wallet amount
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Dropdown menu
//                 PopupMenuButton<String>(
//                   icon: Icon(Icons.more_vert, color: Colors.white),
//                   onSelected: (String value) {
//                     print("Selected: $value");
//                   },
//                   itemBuilder: (BuildContext context) => [
//                     PopupMenuItem(value: "How to use", child: Text("How to use")),
//                     PopupMenuItem(value: "Donation history", child: Text("Donation history")),
//                     PopupMenuItem(value: "Home screen widget", child: Text("Home screen widget")),
//                     PopupMenuItem(value: "FAQ", child: Text("FAQ")),
//                     PopupMenuItem(value: "App info", child: Text("App info")),
//                     PopupMenuItem(value: "Contact us", child: Text("Contact us")),
//                     PopupMenuItem(value: "Settings", child: Text("Settings")),
//                   ],
//                 ),
//               ],
//               backgroundColor: _scrollOffset > 50 ? Colors.black : Colors.transparent, // Change background color based on scroll
//               flexibleSpace: FlexibleSpaceBar(
//                 background: Container(
//                   width: MediaQuery.of(context).size.width * 2.2,  // Increase width by 20%
//                   height: 700,  // Increased height for background (you can adjust this value)
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/land4.jpg'),
//                       fit: BoxFit.cover,  // Ensure the image covers the container
//                     ),
//                   ),
//                   child: Container(
//                     padding: EdgeInsets.all(20),
//                     color: Colors.black.withOpacity(0.5),  // Apply a dark overlay for better text readability
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Learn about the Bharatiya Popular Party Goals More...",
//                           style: TextStyle(
//                             fontFamily: 'Roboto',  // Use Roboto font
//                             fontSize: screenWidth * 0.06,  // Adjusted to a larger size
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Our party is dedicated to a united, prosperous India. We fight for equal opportunity, quality healthcare, "
//                               "education, industrial growth, and upliftment of farmers.",
//                           style: TextStyle(
//                             fontFamily: 'Roboto',  // Use Roboto font
//                             fontSize: screenWidth * 0.045,  // Responsive font size
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // SliverList for Goal Tiles
//             SliverList(
//               delegate: SliverChildListDelegate(
//                 [
//                   // Add GoalTile widgets here
//                   GridView.count(
//                     padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
//                     shrinkWrap: true,
//                     crossAxisCount: screenWidth > 600 ? 4 : 2,  // Adjust grid items based on screen width
//                     childAspectRatio: 1,
//                     crossAxisSpacing: 6,
//                     mainAxisSpacing: 20,
//                     physics: NeverScrollableScrollPhysics(),
//                     children: [
//                       GoalTile(number: "1", title: "NATIONAL\nINTEGRITY", color: Colors.red, icon: Icons.public),
//                       GoalTile(number: "2", title: "GENDER\nEQUALITY", color: Colors.orange, icon: Icons.people),
//                       GoalTile(number: "3", title: "UPHOLD\nSECULARISM", color: Colors.pink, icon: Icons.brightness_6),
//                       GoalTile(number: "4", title: "INDUSTRIAL\nDEVELOPMENT", color: Colors.blue, icon: Icons.factory),
//                       GoalTile(number: "5", title: "NATIONAL\nINTEGRITY", color: Colors.red, icon: Icons.public),
//                       GoalTile(number: "6", title: "UPLIFTMENT\nOF FARMERS", color: Colors.green, icon: Icons.agriculture),
//                       GoalTile(number: "7", title: "QUALITY\nEDUCATION", color: Colors.lightGreen, icon: Icons.school),
//                       GoalTile(number: "8", title: "JUSTICE AND\nPEACE", color: Colors.deepOrange, icon: Icons.balance),
//                       GoalTile(number: "9", title: "AGAINST MUSCLE\nMONEY POWER", color: Colors.purple, icon: Icons.security),
//                       GoalTile(number: "10", title: "EMPLOYMENT\nGROWTH", color: Colors.teal, icon: Icons.trending_up),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Footer(),
//     );
//   }
// }
//
// class GoalTile extends StatelessWidget {
//   final String number;
//   final String title;
//   final Color color;
//   final IconData icon;
//
//   const GoalTile({
//     required this.number,
//     required this.title,
//     required this.color,
//     required this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final iconSize = screenWidth * 0.20;
//
//     return Container(
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 "$number",
//                 style: TextStyle(
//                   fontFamily: 'Oswald',
//                   color: Colors.white,
//                   fontSize: screenWidth * 0.12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(width: 8),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                       fontFamily: 'Oswald',  // Use the Oswald font
//                       color: Colors.white,
//                       fontSize: screenWidth * 0.049,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Spacer(),
//           Align(
//             alignment: Alignment.center,
//             child: Icon(icon, size: iconSize, color: Colors.white),  // Adjusted icon
//             // Adjusted icon size based on screen width
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:bpp_frontend/views/widgets/footer.dart';
//
// class GoalsScreen extends StatefulWidget {
//   @override
//   _GoalsScreenState createState() => _GoalsScreenState();
// }
//
// class _GoalsScreenState extends State<GoalsScreen> {
//   double _scrollOffset = 0.0; // Variable to track scroll offset
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final double walletAmount = 00.00; // Example wallet amount
//
//     return Scaffold(
//       backgroundColor: Colors.black, // Dark background for the screen
//       body: NotificationListener<ScrollNotification>(
//         onNotification: (ScrollNotification notification) {
//           setState(() {
//             _scrollOffset = notification.metrics.pixels; // Update scroll offset
//           });
//           return true;
//         },
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               expandedHeight: 300, // Fixed height for the header
//               floating: false,
//               pinned: true,
//               actions: [
//                 // Empty for now, account balance and PopupMenu will be positioned below the text
//               ],
//               backgroundColor: _scrollOffset > 50
//                   ? Colors.black
//                   : Colors
//                       .transparent, // Change background color based on scroll
//               flexibleSpace: FlexibleSpaceBar(
//                 background: Container(
//                   width: MediaQuery.of(context).size.width *
//                       2.2, // Increase width by 20%
//                   height:
//                       700, // Increased height for background (you can adjust this value)
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/land4.jpg'),
//                       fit:
//                           BoxFit.cover, // Ensure the image covers the container
//                     ),
//                   ),
//                   child: Container(
//                     padding: EdgeInsets.fromLTRB(40, 80, 5, 0),
//                     color: Colors.black.withOpacity(
//                         0.5), // Apply a dark overlay for better text readability
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Learn about the Bharatiya Popular Party Goals More...",
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: screenWidth * 0.06,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Our party is dedicated to a united, prosperous India. We fight for equal opportunity, quality healthcare, "
//                           "education, industrial growth, and upliftment of farmers.",
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: screenWidth * 0.045,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         // Row for account balance and PopupMenuButton
//                         // Row for account balance and PopupMenuButton
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment
//                               .center, // Align elements on the center vertically
//                           mainAxisAlignment: MainAxisAlignment
//                               .end, // Align elements to the right horizontally
//                           children: [
//                             // Account balance
//                             Padding(
//                               padding: const EdgeInsets.only(right: 2.0),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.account_balance_wallet,
//                                     color: Colors.white,
//                                     size: screenWidth *
//                                         0.06, // Adjust icon size based on screen width
//                                   ),
//                                   SizedBox(
//                                       width: 4), // Space between icon and text
//                                   Text(
//                                     "₹$walletAmount", // Dynamically show wallet amount
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: screenWidth *
//                                           0.045, // Adjust font size for wallet amount
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // PopupMenuButton
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left:
//                                       2.0), // Add left padding to space out the popup
//                               child: PopupMenuButton<String>(
//                                 icon:
//                                     Icon(Icons.more_vert, color: Colors.white),
//                                 onSelected: (String value) {
//                                   print("Selected: $value");
//                                 },
//                                 itemBuilder: (BuildContext context) => [
//                                   PopupMenuItem(
//                                       value: "How to use",
//                                       child: Text("How to use")),
//                                   PopupMenuItem(
//                                       value: "Donation history",
//                                       child: Text("Donation history")),
//                                   PopupMenuItem(
//                                       value: "Home screen widget",
//                                       child: Text("Home screen widget")),
//                                   PopupMenuItem(
//                                       value: "FAQ", child: Text("FAQ")),
//                                   PopupMenuItem(
//                                       value: "App info",
//                                       child: Text("App info")),
//                                   PopupMenuItem(
//                                       value: "Contact us",
//                                       child: Text("Contact us")),
//                                   PopupMenuItem(
//                                       value: "Settings",
//                                       child: Text("Settings")),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // SliverList for Goal Tiles
//             SliverList(
//               delegate: SliverChildListDelegate(
//                 [
//                   // Add GoalTile widgets here
//
//                   GridView.count(
//                     padding: EdgeInsets.symmetric(horizontal: 0, vertical: 7),
//                     shrinkWrap: true,
//                     crossAxisCount: screenWidth > 600 ? 4 : 2,
//                     childAspectRatio: 1,
//                     crossAxisSpacing: 9,
//                     mainAxisSpacing: 10,
//                     physics: NeverScrollableScrollPhysics(),
//                     children: [
//                       GoalTile(
//                           number: "1",
//                           title: "NATIONAL\nINTEGRITY",
//                           color: Colors.red,
//                           icon: Icons.public),
//                       GoalTile(
//                           number: "2",
//                           title: "GENDER\nEQUALITY",
//                           color: Colors.orange,
//                           icon: Icons.people),
//                       GoalTile(
//                           number: "3",
//                           title: "Good\nHealth",
//                           color: Colors.pink,
//                           icon: Icons.favorite),
//                       GoalTile(
//                           number: "4",
//                           title: "AGAINST MUSCLE\nMONEY POWER",
//                           color: Colors.blue,
//                           icon: Icons.security),
//                       GoalTile(
//                           number: "5",
//                           title: "UPHOLD\nSECULARISM",
//                           color: Colors.red,
//                           icon: Icons.brightness_6),
//                       GoalTile(
//                           number: "6",
//                           title: "Industrial\nDevelopment",
//                           color: Colors.green,
//                           icon: Icons.agriculture),
//                       GoalTile(
//                           number: "7",
//                           title: "EMPLOYMENT\nGROWTH",
//                           color: Colors.lightGreen,
//                           icon: Icons.trending_up),
//                       GoalTile(
//                           number: "8",
//                           title: "JUSTICE AND\nPEACE",
//                           color: Colors.deepOrange,
//                           icon: Icons.balance),
//                       GoalTile(
//                           number: "9",
//                           title: "UPLIFTMENT\nOF FARMERS",
//                           color: Colors.purple,
//                           icon: Icons.agriculture),
//                       GoalTile(
//                           number: "10",
//                           title: "QUALITY\nEDUCATION",
//                           color: Colors.teal,
//                           icon: Icons.school),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Footer(),
//     );
//   }
// }
//
// class GoalTile extends StatelessWidget {
//   final String number;
//   final String title;
//   final Color color;
//   final IconData icon;
//
//   const GoalTile({
//     required this.number,
//     required this.title,
//     required this.color,
//     required this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final iconSize = screenWidth * 0.20;
//
//     return Container(
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 "$number",
//                 style: TextStyle(
//                   fontFamily: 'Oswald',
//                   color: Colors.white,
//                   fontSize: screenWidth * 0.12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(width: 8),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                       fontFamily: 'Oswald',
//                       color: Colors.white,
//                       fontSize: screenWidth * 0.049,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Spacer(),
//           Align(
//             alignment: Alignment.center,
//             child: Icon(icon, size: iconSize, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:bpp_frontend/views/widgets/footer.dart';
import 'package:flutter_svg/svg.dart';

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  double _scrollOffset = 0.0; // Variable to track scroll offset

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double walletAmount = 30.00; // Example wallet amount

    return Scaffold(
      backgroundColor: Colors.black,

      // Dark background for the screen
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          setState(() {
            _scrollOffset = notification.metrics.pixels; // Update scroll offset
          });
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300, // Fixed height for the header
              floating: false,
              pinned: true,
              leading: GestureDetector(
                onTap: () {
                  // Add your functionality for the arrow button here
                  Navigator.pop(context);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.all(10.0), // Adjust padding as needed
                  child: SvgPicture.asset(
                    'assets/images/arrow.svg', // Your SVG file path
                    color: Colors.white, // Color of the arrow (if necessary)
                    // height: 10.0, // Size of the arrow
                    // width: 10.0, // Size of the arrow
                  ),
                ),
              ),
              actions: [],
              backgroundColor: _scrollOffset > 50
                  ? Colors.black
                  : Colors
                      .transparent, // Change background color based on scroll
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: MediaQuery.of(context).size.width * 2.2,
                  height: 700, // Increased height for background
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/land4.jpg'),
                      fit:
                          BoxFit.cover, // Ensure the image covers the container
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 80, 5, 0),
                    color: Colors.black.withOpacity(
                        0.5), // Apply a dark overlay for better text readability
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Learn about the Bharatiya Popular Party Goals More...",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Our party is dedicated to a united, prosperous India. We fight for equal opportunity, quality healthcare, "
                          "education, industrial growth, and upliftment of farmers.",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: screenWidth * 0.045,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Row for Community Button, Account Balance, and PopupMenuButton
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Community Button
                            Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CommunityContributionScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue, // Button color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Rounded corners
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                ),
                                icon: Icon(Icons.group,
                                    size: screenWidth * 0.05,
                                    color: Colors.white),
                                label: Text(
                                  "Contribution",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            // Account balance and PopupMenuButton
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 2.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.account_balance_wallet,
                                        color: Colors.white,
                                        size: screenWidth * 0.06,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "₹$walletAmount",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenWidth * 0.045,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: PopupMenuButton<String>(
                                    icon: Icon(Icons.more_vert,
                                        color: Colors.white),
                                    onSelected: (String value) {
                                      print("Selected: $value");
                                    },
                                    itemBuilder: (BuildContext context) => [
                                      PopupMenuItem(
                                          value: "How to use",
                                          child: Text("How to use")),
                                      PopupMenuItem(
                                          value: "Donation history",
                                          child: Text("Donation history")),
                                      PopupMenuItem(
                                          value: "Home screen widget",
                                          child: Text("Home screen widget")),
                                      PopupMenuItem(
                                          value: "FAQ", child: Text("FAQ")),
                                      PopupMenuItem(
                                          value: "App info",
                                          child: Text("App info")),
                                      PopupMenuItem(
                                          value: "Contact us",
                                          child: Text("Contact us")),
                                      PopupMenuItem(
                                          value: "Settings",
                                          child: Text("Settings")),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // SliverList for Goal Tiles
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  GridView.count(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                    shrinkWrap: true,
                    crossAxisCount: screenWidth > 600 ? 4 : 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 9,
                    mainAxisSpacing: 10,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GoalTile(
                          number: "1",
                          title: "NATIONAL\nINTEGRITY",
                          color: Colors.red,
                          icon: Icons.public),
                      GoalTile(
                          number: "2",
                          title: "GENDER\nEQUALITY",
                          color: Colors.orange,
                          icon: Icons.people),
                      GoalTile(
                          number: "3",
                          title: "Good\nHealth",
                          color: Colors.pink,
                          icon: Icons.favorite),
                      GoalTile(
                          number: "4",
                          title: "AGAINST MUSCLE\nMONEY POWER",
                          color: Colors.blue,
                          icon: Icons.security),
                      GoalTile(
                          number: "5",
                          title: "UPHOLD\nSECULARISM",
                          color: Colors.red,
                          icon: Icons.brightness_6),
                      GoalTile(
                          number: "6",
                          title: "Industrial\nDevelopment",
                          color: Colors.green,
                          icon: Icons.agriculture),
                      GoalTile(
                          number: "7",
                          title: "EMPLOYMENT\nGROWTH",
                          color: Colors.lightGreen,
                          icon: Icons.trending_up),
                      GoalTile(
                          number: "8",
                          title: "JUSTICE AND\nPEACE",
                          color: Colors.deepOrange,
                          icon: Icons.balance),
                      GoalTile(
                          number: "9",
                          title: "UPLIFTMENT\nOF FARMERS",
                          color: Colors.purple,
                          icon: Icons.agriculture),
                      GoalTile(
                          number: "10",
                          title: "QUALITY\nEDUCATION",
                          color: Colors.teal,
                          icon: Icons.school),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class GoalTile extends StatelessWidget {
  final String number;
  final String title;
  final Color color;
  final IconData icon;

  const GoalTile({
    required this.number,
    required this.title,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.20;

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "$number",
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: Colors.white,
                  fontSize: screenWidth * 0.12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: Colors.white,
                      fontSize: screenWidth * 0.049,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: Icon(icon, size: iconSize, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:bpp_frontend/views/widgets/footer.dart';
// import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
//
// class GoalsScreen extends StatefulWidget {
//   @override
//   _GoalsScreenState createState() => _GoalsScreenState();
// }
//
// class _GoalsScreenState extends State<GoalsScreen> {
//   double _scrollOffset = 0.0; // Variable to track scroll offset
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final double walletAmount = 00.00; // Example wallet amount
//
//     return Scaffold(
//       backgroundColor: Colors.black, // Dark background for the screen
//       body: NotificationListener<ScrollNotification>(
//         onNotification: (ScrollNotification notification) {
//           setState(() {
//             _scrollOffset = notification.metrics.pixels; // Update scroll offset
//           });
//           return true;
//         },
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               expandedHeight: 300, // Reduced the height to prevent overflow
//               floating: false,
//               pinned: true,
//               actions: [
//                 // Empty for now, account balance and PopupMenu will be positioned below the text
//               ],
//               backgroundColor: _scrollOffset > 50
//                   ? Colors.black
//                   : Colors
//                       .transparent, // Change background color based on scroll
//               flexibleSpace: FlexibleSpaceBar(
//                 background: Container(
//                   width: MediaQuery.of(context).size.width *
//                       2.2, // Increase width by 20%
//                   height:
//                       700, // Increased height for background (you can adjust this value)
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/land4.jpg'),
//                       fit:
//                           BoxFit.cover, // Ensure the image covers the container
//                     ),
//                   ),
//                   child: Container(
//                     padding: EdgeInsets.all(40),
//                     color: Colors.black.withOpacity(
//                         0.5), // Apply a dark overlay for better text readability
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Learn about the Bharatiya Popular Party Goals More...",
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: screenWidth * 0.06,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Our party is dedicated to a united, prosperous India. We fight for equal opportunity, quality healthcare, "
//                           "education, industrial growth, and upliftment of farmers.",
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: screenWidth * 0.045,
//                             color: Colors.white,
//                           ),
//                         ),
//                         // SizedBox(height: 10),
//                         // Row for account balance and PopupMenuButton
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment
//                               .center, // Align elements on the center vertically
//                           mainAxisAlignment: MainAxisAlignment
//                               .end, // Align elements to the right horizontally
//                           children: [
//                             // Account balance
//                             Padding(
//                               padding: const EdgeInsets.only(right: 2.0),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.account_balance_wallet,
//                                     color: Colors.white,
//                                     size: screenWidth *
//                                         0.06, // Adjust icon size based on screen width
//                                   ),
//                                   SizedBox(
//                                       width: 4), // Space between icon and text
//                                   Text(
//                                     "₹$walletAmount", // Dynamically show wallet amount
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: screenWidth *
//                                           0.045, // Adjust font size for wallet amount
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // PopupMenuButton
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left:
//                                       2.0), // Add left padding to space out the popup
//                               child: PopupMenuButton<String>(
//                                 icon:
//                                     Icon(Icons.more_vert, color: Colors.white),
//                                 onSelected: (String value) {
//                                   print("Selected: $value");
//                                 },
//                                 itemBuilder: (BuildContext context) => [
//                                   PopupMenuItem(
//                                       value: "How to use",
//                                       child: Text("How to use")),
//                                   PopupMenuItem(
//                                       value: "Donation history",
//                                       child: Text("Donation history")),
//                                   PopupMenuItem(
//                                       value: "Home screen widget",
//                                       child: Text("Home screen widget")),
//                                   PopupMenuItem(
//                                       value: "FAQ", child: Text("FAQ")),
//                                   PopupMenuItem(
//                                       value: "App info",
//                                       child: Text("App info")),
//                                   PopupMenuItem(
//                                       value: "Contact us",
//                                       child: Text("Contact us")),
//                                   PopupMenuItem(
//                                       value: "Settings",
//                                       child: Text("Settings")),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 20),
//
//                         // Community Contribution Button
//                         // Center(
//                         //   child: ElevatedButton(
//                         //     onPressed: () {
//                         //       // Handle Community Contribution button press
//                         //       Get.to(() => CommunityContributionScreen());
//                         //     },
//                         //     style: ElevatedButton.styleFrom(
//                         //       backgroundColor:
//                         //           Colors.blue, // Blue background for visibility
//                         //       foregroundColor: Colors.white, // White text
//                         //       shape: RoundedRectangleBorder(
//                         //         borderRadius: BorderRadius.circular(8),
//                         //       ),
//                         //       padding: EdgeInsets.symmetric(
//                         //           vertical: 10, horizontal: 10),
//                         //     ),
//                         //     child: Row(
//                         //       mainAxisSize: MainAxisSize.min,
//                         //       children: [
//                         //         Icon(Icons.people, size: 20),
//                         //         SizedBox(width: 8),
//                         //         Text(
//                         //           'Community Contribution',
//                         //           style: TextStyle(
//                         //               fontSize: 14,
//                         //               fontWeight: FontWeight.w500),
//                         //         ),
//                         //       ],
//                         //     ),
//                         //   ),
//                         // )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // SliverList for Goal Tiles
//             SliverList(
//               delegate: SliverChildListDelegate(
//                 [
//                   // GridView for Goal Tiles
//                   GridView.count(
//                     padding: EdgeInsets.symmetric(horizontal: 0, vertical: 7),
//                     shrinkWrap: true,
//                     crossAxisCount: screenWidth > 600 ? 4 : 2,
//                     childAspectRatio: 1,
//                     crossAxisSpacing: 9,
//                     mainAxisSpacing: 10,
//                     physics: NeverScrollableScrollPhysics(),
//                     children: [
//                       GoalTile(
//                           number: "1",
//                           title: "NATIONAL\nINTEGRITY",
//                           color: Colors.red,
//                           icon: Icons.public),
//                       GoalTile(
//                           number: "2",
//                           title: "GENDER\nEQUALITY",
//                           color: Colors.orange,
//                           icon: Icons.people),
//                       GoalTile(
//                           number: "3",
//                           title: "Good\nHealth",
//                           color: Colors.pink,
//                           icon: Icons.favorite),
//                       GoalTile(
//                           number: "4",
//                           title: "AGAINST MUSCLE\nMONEY POWER",
//                           color: Colors.blue,
//                           icon: Icons.security),
//                       GoalTile(
//                           number: "5",
//                           title: "UPHOLD\nSECULARISM",
//                           color: Colors.red,
//                           icon: Icons.brightness_6),
//                       GoalTile(
//                           number: "6",
//                           title: "Industrial\nDevelopment",
//                           color: Colors.green,
//                           icon: Icons.agriculture),
//                       GoalTile(
//                           number: "7",
//                           title: "EMPLOYMENT\nGROWTH",
//                           color: Colors.lightGreen,
//                           icon: Icons.trending_up),
//                       GoalTile(
//                           number: "8",
//                           title: "JUSTICE AND\nPEACE",
//                           color: Colors.deepOrange,
//                           icon: Icons.balance),
//                       GoalTile(
//                           number: "9",
//                           title: "UPLIFTMENT\nOF FARMERS",
//                           color: Colors.purple,
//                           icon: Icons.agriculture),
//                       GoalTile(
//                           number: "10",
//                           title: "QUALITY\nEDUCATION",
//                           color: Colors.teal,
//                           icon: Icons.school),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Footer(),
//     );
//   }
// }
//
// class GoalTile extends StatelessWidget {
//   final String number;
//   final String title;
//   final Color color;
//   final IconData icon;
//
//   const GoalTile({
//     required this.number,
//     required this.title,
//     required this.color,
//     required this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final iconSize = screenWidth * 0.20;
//
//     return Container(
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 "$number",
//                 style: TextStyle(
//                   fontFamily: 'Oswald',
//                   color: Colors.white,
//                   fontSize: screenWidth * 0.12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(width: 8),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                       fontFamily: 'Oswald',
//                       color: Colors.white,
//                       fontSize: screenWidth * 0.049,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Spacer(),
//           Align(
//             alignment: Alignment.center,
//             child: Icon(icon, size: iconSize, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }
