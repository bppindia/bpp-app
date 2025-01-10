// import 'package:bpp_frontend/views/drawer/dashbaord.dart';
// import 'package:bpp_frontend/views/drawer/donor.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Community Contribution',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const CommunityContributionScreen(),
//     );
//   }
// }
//
// class SummarySection extends StatefulWidget {
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
//                         "Welcome back",
//                         style: TextStyle(
//                           fontSize: isWideScreen ? 24 : 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(height: 4),
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
//                     label: "Votes",
//                     backgroundColor: Colors.green,
//                     textColor: Colors.white,
//                     onPressed: () {},
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
//
// class CommunityContributionScreen extends StatelessWidget {
//   const CommunityContributionScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Summary Section
//               SummarySection(),
//               const SizedBox(height: 16),
//
//               // Contribution Steps in a Card
//               Card(
//                 elevation: 4,
//                 color: Colors.white, // Adds a shadow below the card
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8), // Rounded corners
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Community Contribution',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       // First Row (First 3 Steps)
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _buildStep('Raise Your Query', true),
//                           _buildStep('Review & Approval', false),
//                           _buildStep('Votes', false),
//                         ],
//                       ),
//                       const SizedBox(height: 10), // Space between rows
//                       // Second Row (Last 2 Steps)
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment
//                             .start, // Ensure alignment is the same
//                         children: [
//                           _buildStep('Results', true),
//                           _buildStep('Executions', false),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//                       Row(
//                         children: const [
//                           Icon(
//                             Icons.calendar_today,
//                             color: Colors.red,
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             'All services will start after January 2025',
//                             style: TextStyle(color: Colors.blue, fontSize: 14),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Center(
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 32,
//                                 vertical:
//                                     12), // Add padding to make it look like a rectangle
//                             backgroundColor:
//                                 Colors.green, // Set the background color
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(
//                                   10), // Remove corner radius to make it rectangular
//                             ),
//                           ),
//                           child: const Text(
//                             'Get Started',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color:
//                                   Colors.white, // Text color inside the button
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Custom method to create horizontal steps with text below the line
//   Widget _buildStep(String title, bool isActive) {
//     return Expanded(
//       child: Column(
//         children: [
//           // Horizontal Line representing the step status
//           Container(
//             height: 6,
//             color: isActive ? Colors.blue : Colors.grey,
//             width: 90, // Make the line take full width
//           ),
//           const SizedBox(height: 10), // Space between the line and text
//           // Step Title Below the Line
//           Text(
//             title,
//             textAlign: TextAlign.center, // Ensure text is aligned with the line
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: isActive ? Colors.blue : Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:bpp_frontend/views/drawer/Button_Screen1.dart';
// import 'package:bpp_frontend/views/drawer/dashbaord.dart';
// import 'package:bpp_frontend/views/drawer/donor.dart';
// import 'package:bpp_frontend/views/widgets/dashbaord/summary_section.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Community Contribution',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const CommunityContributionScreen(),
//     );
//   }
// }
//
// class CommunityContributionScreen extends StatelessWidget {
//   const CommunityContributionScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Summary Section
//               SummarySection(),
//               const SizedBox(height: 16),
//               // ButtonsScreen1(),
//               // SizedBox(height: 5),
//               //Map Screen
//               SizedBox(
//                 height: 400, // Adjust height as necessary
//                 child: MapScreen(),
//               ),
//               const SizedBox(height: 16),
//
//               // Contribution Steps in a Card
//               Card(
//                 elevation: 4,
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Community Contribution',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       // First Row (First 3 Steps)
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _buildStep('Raise Your Query', true),
//                           _buildStep('Review & Approval', false),
//                           _buildStep('Votes', false),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       // Second Row (Last 2 Steps)
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _buildStep('Results', true),
//                           _buildStep('Executions', false),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//                       Row(
//                         children: const [
//                           Icon(
//                             Icons.calendar_today,
//                             color: Colors.red,
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             'All services will start after January 2025',
//                             style: TextStyle(color: Colors.blue, fontSize: 14),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Center(
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 32, vertical: 12),
//                             backgroundColor: Colors.green,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           child: const Text(
//                             'Get Started',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Custom method to create horizontal steps with text below the line
//   Widget _buildStep(String title, bool isActive) {
//     return Expanded(
//       child: Column(
//         children: [
//           Container(
//             height: 6,
//             color: isActive ? Colors.blue : Colors.grey,
//             width: 90,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: isActive ? Colors.blue : Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:bpp_frontend/views/drawer/dashbaord.dart';
import 'package:flutter/material.dart';
import 'package:bpp_frontend/views/widgets/dashbaord/summary_section.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Community Contribution',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CommunityContributionScreen(),
    );
  }
}

class CommunityContributionScreen extends StatefulWidget {
  const CommunityContributionScreen({Key? key}) : super(key: key);

  @override
  _CommunityContributionScreenState createState() =>
      _CommunityContributionScreenState();
}

class _CommunityContributionScreenState
    extends State<CommunityContributionScreen> {
  bool showMap = true; // State to toggle between Map and Community screens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard > Community',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // Add your functionality for the arrow button here
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0), // Adjust padding as needed
            child: SvgPicture.asset(
              'assets/images/arrow.svg', // Your SVG file path
              color: Colors.black, // Color of the arrow (if necessary)
              // height: 10.0, // Size of the arrow
              // width: 10.0, // Size of the arrow
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white54,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20.0, left: 10, right: 10, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add SummarySection first
                SummarySection(
                    // firstName: '',
                    // lastName: '',
                    // referralCode: '',
                    ),

                const SizedBox(height: 10),

                // Custom TabBar with rounded rectangular design
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 45, // Fixed height for the tab bar
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(13), // Rounded corners
                      color: Colors.grey[300], // Light background
                    ),
                    child: Row(
                      children: [
                        // Map Tab
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                showMap = true; // Show Map screen
                              });
                            },
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: showMap ? Colors.blue : Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "States",
                                  style: TextStyle(
                                    color:
                                        showMap ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Community Tab
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                showMap = false; // Show Community screen
                              });
                            },
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    !showMap ? Colors.blue : Colors.grey[300],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text(
                                    "Community Contribution",
                                    style: TextStyle(
                                      color: !showMap
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),

                // Tab content display
                SizedBox(
                  height: 500,
                  child: showMap
                      ? const MapScreen() // Display MapScreen when showMap is true
                      : const CommunityContributionScreenContent(), // Display Community screen when showMap is false
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// MapScreen content
class CommunityContributionScreenContent extends StatelessWidget {
  const CommunityContributionScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Make the entire content scrollable
      child: Padding(
        padding: const EdgeInsets.all(30.0), // Add padding for spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Community Contribution Overview',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Introductory text at the start of the body
            const Text(
              'Community Contribution App Services will be operational on 01.01.2026, allowing a large number of citizens to join the party in this one year and to become part of the movement. By joining, you will gain access to social, legal, and health services. The app will start accepting the payments also soon.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Community Contribution',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // First Row (First 3 Steps)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStep('Raise Your Query', true),
                _buildStep('Review & Approval', false),
                _buildStep('Votes', false),
              ],
            ),
            const SizedBox(height: 10),
            // Second Row (Last 2 Steps)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStep('Results', true),
                _buildStep('Executions', false),
              ],
            ),
            const SizedBox(height: 24),
            // Date and message about services starting
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom method to create horizontal steps with text below the line
  Widget _buildStep(String title, bool isActive) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 6,
            color: isActive ? Colors.blue : Colors.grey,
            width: 90,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
