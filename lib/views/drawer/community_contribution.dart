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
//       appBar: AppBar(
//         title: const Text('Community Contribution'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Map Container
//             Expanded(
//               flex: 1,
//               child: Container(
//                 height: 300,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Stack(
//                   children: [
//                     Center(
//                       child: Image.network(
//                         'https://example.com/maharashtra_map.png',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Center(
//                       child: Container(
//                         height: 50,
//                         width: 50,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 16),
//
//             // Contribution Steps
//             Expanded(
//               flex: 2,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Community Contribution',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: List.generate(5, (index) {
//                         return Column(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor:
//                                   index == 0 ? Colors.black : Colors.grey[300],
//                               child: Text(
//                                 (index + 1).toString(),
//                                 style: TextStyle(
//                                   color:
//                                       index == 0 ? Colors.white : Colors.black,
//                                 ),
//                               ),
//                             ),
//                             if (index < 4) const SizedBox(height: 8),
//                           ],
//                         );
//                       }),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: const [
//                         Text('Raise Your Query'),
//                         Text('Review & Approval'),
//                         Text('Votes'),
//                         Text('Results'),
//                         Text('Executions'),
//                       ],
//                     ),
//                     const SizedBox(height: 24),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.calendar_today,
//                           color: Colors.red,
//                         ),
//                         SizedBox(width: 8),
//                         Text(
//                           'All services will start after December 25th',
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 24),
//                     Center(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         child: const Text('Get Started'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
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
//               // // Map Container
//               // Container(
//               //   height: 300,
//               //   decoration: BoxDecoration(
//               //     border: Border.all(color: Colors.grey),
//               //     borderRadius: BorderRadius.circular(8),
//               //   ),
//               //   child: Stack(
//               //     children: [
//               //       Center(
//               //         child: Image.asset(
//               //           'assets/images/s5.jpeg',
//               //           fit: BoxFit.cover,
//               //           width: double.infinity,
//               //           height: double.infinity,
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               //
//               // const SizedBox(height: 16),
//
//               // Contribution Steps
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Community Contribution',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Stepper(
//                       physics: const NeverScrollableScrollPhysics(),
//                       currentStep: 0,
//                       controlsBuilder:
//                           (BuildContext context, ControlsDetails details) {
//                         return const SizedBox.shrink();
//                       },
//                       steps: [
//                         Step(
//                           title: const Text(
//                             'Raise Your Query',
//                             style: TextStyle(color: Colors.black, fontSize: 16),
//                           ),
//                           content: const SizedBox.shrink(),
//                           isActive: true,
//                         ),
//                         Step(
//                           title: const Text(
//                             'Review & Approval',
//                             style: TextStyle(color: Colors.black, fontSize: 16),
//                           ),
//                           content: const SizedBox.shrink(),
//                           isActive: false,
//                         ),
//                         Step(
//                           title: const Text(
//                             'Votes',
//                             style: TextStyle(color: Colors.black, fontSize: 16),
//                           ),
//                           content: const SizedBox.shrink(),
//                           isActive: false,
//                         ),
//                         Step(
//                           title: const Text(
//                             'Results',
//                             style: TextStyle(color: Colors.black, fontSize: 16),
//                           ),
//                           content: const SizedBox.shrink(),
//                           isActive: false,
//                         ),
//                         Step(
//                           title: const Text(
//                             'Executions',
//                             style: TextStyle(color: Colors.black, fontSize: 16),
//                           ),
//                           content: const SizedBox.shrink(),
//                           isActive: false,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 24),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.calendar_today,
//                           color: Colors.red,
//                         ),
//                         SizedBox(width: 4),
//                         Text(
//                           'All services will start after December 25th',
//                           style: TextStyle(color: Colors.blue, fontSize: 13),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Center(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 32,
//                               vertical:
//                                   12), // Add padding to make it look like a rectangle
//                           backgroundColor:
//                               Colors.green, // Set the background color
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius
//                                 .zero, // Remove corner radius to make it rectangular
//                           ),
//                         ),
//                         child: const Text(
//                           'Get Started',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white, // Text color inside the button
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
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
//               // SummarySection(),
//               // const SizedBox(height: 16),
//               // //Map Screen
//               // SizedBox(
//               //   height: 400, // Adjust height as necessary
//               //   child: MapScreen(),
//               // ),
//               // const SizedBox(height: 16),
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
