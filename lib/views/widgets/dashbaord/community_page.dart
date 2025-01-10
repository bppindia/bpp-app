// import 'package:flutter/material.dart';
//
// class CommunityPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Welcome to Dashboard",
//             style: TextStyle(fontSize: 18),
//           ),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header Section
//             Text(
//               " Maharashtra",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//
//             // Statistics Cards
//             LayoutBuilder(
//               builder: (context, constraints) {
//                 int crossAxisCount =
//                     screenWidth > 600 ? 4 : 2; // Responsive grid columns
//                 double cardWidth =
//                     (constraints.maxWidth - 16 * (crossAxisCount - 1)) /
//                         crossAxisCount;
//
//                 return Wrap(
//                   spacing: 16,
//                   runSpacing: 16,
//                   children: [
//                     _buildStatCard("Total Members", "5329",
//                         "+ 20.1% from last month", Icons.groups, cardWidth),
//                     _buildStatCard(
//                         "Active Members",
//                         "+ 2350",
//                         "+ 180.1% from last month",
//                         Icons.show_chart,
//                         cardWidth),
//                     _buildStatCard(" New Members This Month", "+ 12,234",
//                         "+ 19% from last month", Icons.add, cardWidth),
//                     _buildStatCard("Active Now This Month", "+ 573",
//                         "+ 201 since last hour,month", Icons.person, cardWidth),
//                   ],
//                 );
//               },
//             ),
//
//             //SizedBox(height: 10),
//
//             // Recent Activity Section
//
//             _buildActivityList(),
//
//             //SizedBox(height: 5),
//
//             // Overview Graph Section
//             Text(
//               " Overview",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             _buildGraphPlaceholder(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildStatCard(String title, String value, String subtitle,
//       IconData icon, double width) {
//     return Container(
//       width: width,
//       child: Card(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         elevation: 2,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Icon(icon, size: 20, color: Colors.blue),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       title,
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                       // overflow: TextOverflow.clip,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Text(
//                 value,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 subtitle,
//                 style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildActivityList() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12), // Rounded corners
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2), // Light shadow
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: Offset(0, 3), // Shadow position
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(16.0), // Padding inside the container
//       margin: const EdgeInsets.symmetric(vertical: 16.0), // Spacing above/below
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Recent Activity",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 16),
//           _buildActivityItem("Transaction Successful",
//               "₹2,500 spent on services", "2 hours ago"),
//           _buildActivityItem(
//               "Wallet Fund Added", "₹5,000 added to wallet", "4 hours ago"),
//           _buildActivityItem("Voted Successfully",
//               "Participated in policy voting", "1 day ago"),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildActivityItem(String title, String description, String time) {
//     return Padding(
//       padding:
//           const EdgeInsets.symmetric(vertical: 8.0), // Spacing between items
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(Icons.check_circle, color: Colors.green, size: 24),
//           SizedBox(width: 12), // Space between icon and text
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   description,
//                   style: TextStyle(color: Colors.grey[700]),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: 8), // Space before the time text
//           Text(
//             time,
//             style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGraphPlaceholder() {
//     return Card(
//       color: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       elevation: 2,
//       child: Container(
//         height: 200,
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Text(
//             "Graph Placeholder",
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[600],
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Text(
            " Maharashtra",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          // Statistics Cards
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount =
                  screenWidth > 600 ? 4 : 2; // Responsive grid columns
              double cardWidth =
                  (constraints.maxWidth - 16 * (crossAxisCount - 1)) /
                      crossAxisCount;

              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildStatCard("Total Members", "5329",
                      "+ 20.1% from last month", Icons.groups, cardWidth),
                  _buildStatCard("Active Members", "+ 2350",
                      "+ 180.1% from last month", Icons.show_chart, cardWidth),
                  _buildStatCard("New Members This Month", "+ 12,234",
                      "+ 19% from last month", Icons.add, cardWidth),
                  _buildStatCard("Active Now This Month", "+ 573",
                      "+ 201 since last hour,month", Icons.person, cardWidth),
                ],
              );
            },
          ),

          //SizedBox(height: 10),

          // Recent Activity Section

          _buildActivityList(),

          //SizedBox(height: 5),

          // Overview Graph Section
          // Text(
          //   " Overview",
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(height: 8),
          // _buildGraphPlaceholder(),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle,
      IconData icon, double width) {
    return Container(
      width: width,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 20, color: Colors.blue),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      // overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Light shadow
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0), // Padding inside the container
      margin: const EdgeInsets.symmetric(vertical: 16.0), // Spacing above/below
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Activity",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          _buildActivityItem("Transaction Successful",
              "₹2,500 spent on services", "2 hours ago"),
          _buildActivityItem(
              "Wallet Fund Added", "₹5,000 added to wallet", "4 hours ago"),
          _buildActivityItem("Voted Successfully",
              "Participated in policy voting", "1 day ago"),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String description, String time) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0), // Spacing between items
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 24),
          SizedBox(width: 12), // Space between icon and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          SizedBox(width: 8), // Space before the time text
          Text(
            time,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  // Widget _buildGraphPlaceholder() {
  //   return Card(
  //     color: Colors.green,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     elevation: 2,
  //     child: Container(
  //       height: 100,
  //       padding: const EdgeInsets.all(16.0),
  //       child: Center(
  //         child: Text(
  //           "Graph Placeholder",
  //           style: TextStyle(
  //             fontSize: 16,
  //             color: Colors.grey[600],
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
