// import 'package:bpp_frontend/views/component/india_map.dart';
// import 'package:bpp_frontend/views/widgets/dashbaord/community_page.dart';
// import 'package:flutter/material.dart';
//
// class ButtonsScreen extends StatefulWidget {
//   @override
//   _ButtonsScreenState createState() => _ButtonsScreenState();
// }
//
// class _ButtonsScreenState extends State<ButtonsScreen> {
//   bool showMap = true; // Set to true by default to display the map
//   bool showStatistics = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 1.0),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Button Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   width: 130,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         showMap = true; // Show map
//                         showStatistics = false; // Hide statistics
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                       padding:
//                           EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
//                     ),
//                     child: Text(
//                       'Map',
//                       style: TextStyle(fontSize: 14, color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Container(
//                   width: 130,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         showStatistics = true; // Show statistics
//                         showMap = false; // Hide map
//                         print(
//                             "Statistics button clicked: showStatistics = $showStatistics");
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                       padding:
//                           EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
//                     ),
//                     child: Text(
//                       'Statistics',
//                       style: TextStyle(fontSize: 14, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             // Conditionally display map or statistics based on state
//             if (showMap) IndiaMap(), // Show India map by default
//             if (showStatistics) CommunityPage(), // Show statistics if selected
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:bpp_frontend/views/component/india_map.dart';
// import 'package:bpp_frontend/views/drawer/dashbaord.dart';
// import 'package:bpp_frontend/views/widgets/dashbaord/community_page.dart';
// import 'package:flutter/material.dart';
//
// class ButtonsScreen extends StatefulWidget {
//   @override
//   _ButtonsScreenState createState() => _ButtonsScreenState();
// }
//
// class _ButtonsScreenState extends State<ButtonsScreen> {
//   bool showMap = true; // Default to "Map" tab
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
//       child: Column(
//         children: [
//           // Tab buttons
//           Container(
//             height: 40, // Fixed height for the tabs
//             decoration: BoxDecoration(
//               borderRadius:
//                   BorderRadius.zero, // Rounded corners for the whole container
//               color: Colors.grey[200], // Light background for the tab container
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Map Tab
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       setState(() {
//                         showMap = true; // Show "Map" tab
//                       });
//                     },
//                     child: Container(
//                       height: double.infinity, // Ensure full height for the tab
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: showMap ? Colors.blue : Colors.transparent,
//                         // borderRadius: BorderRadius.circular(
//                         //     25), // Apply rounded corners to each tab
//                       ),
//                       child: Text(
//                         'Map',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: showMap ? Colors.white : Colors.grey,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Statistics Tab
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       setState(() {
//                         showMap = false; // Show "Statistics" tab
//                       });
//                     },
//                     child: Container(
//                       height: double.infinity, // Ensure full height for the tab
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: showMap ? Colors.transparent : Colors.blue,
//                         // borderRadius: BorderRadius.circular(
//                         //     25), // Apply rounded corners to each tab
//                       ),
//                       child: Text(
//                         'Statistics',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: showMap ? Colors.grey : Colors.white,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // SizedBox(height: 20),
//           // Conditionally display content based on selected tab
//           showMap
//               ? SizedBox(
//                   height: 400, // Set a fixed height for the map
//                   child: MapScreen(), // Show the MapScreen widget
//                 )
//               : CommunityPage(), // Show the statistics page
//         ],
//       ),
//     );
//   }
// }

import 'package:bpp_frontend/views/component/india_map.dart';
import 'package:bpp_frontend/views/drawer/dashbaord.dart';
import 'package:bpp_frontend/views/widgets/dashbaord/community_page.dart';
import 'package:flutter/material.dart';

class ButtonsScreen extends StatefulWidget {
  @override
  _ButtonsScreenState createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  bool showMap = true; // Default to "Map" tab

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
      child: Column(
        children: [
          // Tab buttons
          Container(
            height: 40, // Fixed height for the tabs
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  13), // Rounded corners for the whole container
              color: Colors.grey[200], // Light background for the tab container
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Map Tab
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        showMap = true; // Show "Map" tab
                      });
                    },
                    child: Container(
                      height: double.infinity, // Ensure full height for the tab
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: showMap ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(
                            10), // Apply rounded corners to each tab
                      ),
                      child: Text(
                        'States',
                        style: TextStyle(
                          fontSize: 16,
                          color: showMap ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                // Statistics Tab
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        showMap = false; // Show "Statistics" tab
                      });
                    },
                    child: Container(
                      height: double.infinity, // Ensure full height for the tab
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: showMap ? Colors.transparent : Colors.blue,
                        borderRadius: BorderRadius.circular(
                            10), // Apply rounded corners to each tab
                      ),
                      child: Text(
                        'Statistics',
                        style: TextStyle(
                          fontSize: 16,
                          color: showMap ? Colors.grey : Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 20),
          // Conditionally display content based on selected tab
          showMap
              ? SizedBox(
                  height: 400, // Set a fixed height for the map
                  child: MapScreen(), // Show the MapScreen widget
                )
              : CommunityPage(), // Show the statistics page
        ],
      ),
    );
  }
}
