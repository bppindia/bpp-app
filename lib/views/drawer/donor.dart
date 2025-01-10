// import 'package:flutter/material.dart';
//
// class DonorDashboard extends StatefulWidget {
//   const DonorDashboard({Key? key}) : super(key: key);
//
//   @override
//   State<DonorDashboard> createState() => _DonorDashboardState();
// }
//
// class _DonorDashboardState extends State<DonorDashboard> {
//   bool _showAllRows = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   title: Text(
//       //     'Donor Dashboard',
//       //     style: Theme.of(context).textTheme.titleLarge,
//       //   ),
//       //   centerTitle: false,
//       //   actions: [
//       //     IconButton(
//       //       icon: Icon(Icons.notifications_outlined),
//       //       onPressed: () {
//       //         // TODO: Implement notifications
//       //       },
//       //     ),
//       //   ],
//       // ),
//       body: SafeArea(
//         child: RefreshIndicator(
//           onRefresh: () async {
//             // TODO: Implement data refresh logic
//             await Future.delayed(Duration(seconds: 2));
//           },
//           child: SingleChildScrollView(
//             physics: AlwaysScrollableScrollPhysics(),
//             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Header Section with Adaptive Layout
//                 LayoutBuilder(
//                   builder: (context, constraints) {
//                     return constraints.maxWidth > 600
//                         ? _buildWideHeader(context)
//                         : _buildNarrowHeader(context);
//                   },
//                 ),
//
//                 SizedBox(height: 14),
//
//                 // Donation Metrics Cards
//                 _buildDonationMetrics(context),
//
//                 SizedBox(height: 24),
//
//                 // Donation History
//                 _buildDonationHistory(context),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildWideHeader(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Welcome, Donor',
//                 style: Theme.of(context).textTheme.headlineSmall,
//               ),
//               SizedBox(height: 8),
//               Text(
//                 'View your donation history and manage your account.',
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//             ],
//           ),
//         ),
//         SizedBox(width: 16),
//         ElevatedButton.icon(
//           onPressed: () {
//             // Handle donation
//           },
//           icon: Icon(Icons.favorite_border),
//           label: Text('Make a Donation'),
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildNarrowHeader(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Welcome, Donor',
//           style: Theme.of(context).textTheme.headlineSmall,
//         ),
//         SizedBox(height: 8),
//         Text(
//           'View your donation history and manage your account.',
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//         SizedBox(height: 16),
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton.icon(
//             onPressed: () {
//               // Handle donation
//             },
//             icon: Icon(Icons.favorite_border),
//             label: Text('Make a Donation'),
//             style: ElevatedButton.styleFrom(
//               padding: EdgeInsets.symmetric(vertical: 12),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDonationMetrics(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       childAspectRatio: 1.8,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//       children: [
//         _buildDonationCard(
//           context,
//           title: 'Total Donations',
//           amount: 'Rs 5,329',
//           percentage: '+10%',
//           icon: Icons.monetization_on_outlined,
//           color: Colors.blue,
//         ),
//         _buildDonationCard(
//           context,
//           title: 'Recurring Donations',
//           amount: 'Rs 1,200',
//           percentage: '+5%',
//           icon: Icons.autorenew,
//           color: Colors.green,
//         ),
//         _buildDonationCard(
//           context,
//           title: 'One-Time Donations',
//           amount: 'Rs 4,129',
//           percentage: '-12%',
//           icon: Icons.payments_outlined,
//           color: Colors.deepPurple,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDonationCard(
//       BuildContext context, {
//         required String title,
//         required String amount,
//         required String percentage,
//         required IconData icon,
//         required Color color,
//       }) {
//     return Card(
//       elevation: 8,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Icon(icon, color: color, size: 32),
//                 Text(
//                   percentage,
//                   style: TextStyle(
//                     color: percentage.contains('-') ? Colors.red : Colors.green,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: Theme.of(context).textTheme.titleSmall,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 Text(
//                   amount,
//                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                     color: color,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDonationHistory(BuildContext context) {
//     final rows = [
//       DataRow(cells: [
//         DataCell(Text('2023-07-01')),
//         DataCell(Text('Rs 200')),
//         DataCell(Text('One Time')),
//         DataCell(Text('Completed')),
//       ]),
//       DataRow(cells: [
//         DataCell(Text('2023-06-15')),
//         DataCell(Text('Rs 100')),
//         DataCell(Text('One Time')),
//         DataCell(Text('Completed')),
//       ]),
//       DataRow(cells: [
//         DataCell(Text('2023-06-01')),
//         DataCell(Text('Rs 50')),
//         DataCell(Text('Recurring')),
//         DataCell(Text('Completed')),
//       ]),
//       DataRow(cells: [
//         DataCell(Text('2023-04-01')),
//         DataCell(Text('Rs 50')),
//         DataCell(Text('Recurring')),
//         DataCell(Text('Completed')),
//       ]),
//       DataRow(cells: [
//         DataCell(Text('2023-03-15')),
//         DataCell(Text('Rs 75')),
//         DataCell(Text('One Time')),
//         DataCell(Text('Completed')),
//       ]),
//       DataRow(cells: [
//         DataCell(Text('2023-02-01')),
//         DataCell(Text('Rs 50')),
//         DataCell(Text('Recurring')),
//         DataCell(Text('Completed')),
//       ]),
//     ];
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Donation History',
//           style: Theme.of(context).textTheme.titleLarge,
//         ),
//         SizedBox(height: 16),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: DataTable(
//             columns: [
//               DataColumn(label: Text('Date')),
//               DataColumn(label: Text('Amount')),
//               DataColumn(label: Text('Type')),
//               DataColumn(label: Text('Status')),
//             ],
//             rows: _showAllRows ? rows : rows.take(4).toList(),
//           ),
//         ),
//         if (rows.length > 4)
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 _showAllRows = !_showAllRows;
//               });
//             },
//             child: Text(_showAllRows ? 'View Less' : 'View All'),
//           ),
//       ],
//     );
//   }
// }

import 'package:bpp_frontend/views/drawer/donor1.dart';
import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/footer.dart';

class DonorDashboard extends StatefulWidget {
  const DonorDashboard({Key? key}) : super(key: key);

  @override
  State<DonorDashboard> createState() => _DonorDashboardState();
}

class _DonorDashboardState extends State<DonorDashboard> {
  bool _showAllRows = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // AppBar with blue color
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '  Dashboard  >',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              '  Donate',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
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
              color: Colors.white, // Color of the arrow (if necessary)
              // height: 10.0, // Size of the arrow
              // width: 10.0, // Size of the arrow
            ),
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add),
        //     color: Colors.black,
        //     onPressed: () {
        //       // Add money to wallet functionality
        //       print("Add money to wallet clicked");
        //     },
        //   ),
        // ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Height of the divider
          child: DottedLine(
            dashLength: 2.0, // Length of each dot/dash
            dashColor: Colors.blue, // Color of the dots/dashes
            lineThickness: 1.0, // Thickness of the line
            // Color of the line
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 2));
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return constraints.maxWidth > 600
                          ? _buildWideHeader(context)
                          : _buildWideHeader(context);
                    },
                  ),
                  SizedBox(height: 14),
                  _buildDonationMetrics(context),
                  SizedBox(height: 24),
                  _buildDonationHistory(context),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }

  Widget _buildWideHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text and Description Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Donor Dashboard',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black, // Ensure proper visibility
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'View your donation history and manage your account.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors
                          .grey, // Matches the light gray description style
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        // Row to hold both buttons (Make a Donation & Community Contribution)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // "Make a Donation" Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonationScreen()),
                );
              },
              icon: Icon(
                Icons.add, // "+" icon for donation
                size: 16,
              ),
              label: Text(
                'Make a Donation',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Blue background as per the design
                foregroundColor: Colors.white,
                // elevation: 0, // No shadow for a flat design
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 1, vertical: 5), // Padding for spacing
              ),
            ),

            SizedBox(width: 5), // Space between the buttons

            // "Community Contribution" Button
            ElevatedButton(
              onPressed: () {
                // Handle Community Contribution button press
                Get.to(() => CommunityContributionScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue background for visibility
                foregroundColor: Colors.white, // White text
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.people, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Community Contribution',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDonationMetrics(BuildContext context) {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 2.5,
      mainAxisSpacing: 5,
      crossAxisSpacing: 10,
      children: [
        _buildDonationCard(
          context,
          title: 'Total Donations',
          amount: 'Rs 5,329',
          percentage: '+10%',
          icon: Icons.monetization_on_outlined,
          color: Colors.blue,
        ),
        _buildDonationCard(
          context,
          title: 'Recurring Donations',
          amount: 'Rs 1,200',
          percentage: '+5%',
          icon: Icons.autorenew,
          color: Colors.green,
        ),
        _buildDonationCard(
          context,
          title: 'One-Time Donations',
          amount: 'Rs 4,129',
          percentage: '-12%',
          icon: Icons.payments_outlined,
          color: Colors.deepPurple,
        ),
      ],
    );
  }

  Widget _buildDonationCard(
    BuildContext context, {
    required String title,
    required String amount,
    required String percentage,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 25),
                Text(
                  percentage,
                  style: TextStyle(
                    color: percentage.contains('-') ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  amount,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationHistory(BuildContext context) {
    final rows = [
      DataRow(cells: [
        DataCell(Text('2023-07-01')),
        DataCell(Text('Rs 200')),
        DataCell(Text('One Time')),
        DataCell(Text('Completed')),
      ]),
      DataRow(cells: [
        DataCell(Text('2023-06-15')),
        DataCell(Text('Rs 100')),
        DataCell(Text('One Time')),
        DataCell(Text('Completed')),
      ]),
      DataRow(cells: [
        DataCell(Text('2023-06-01')),
        DataCell(Text('Rs 50')),
        DataCell(Text('Recurring')),
        DataCell(Text('Completed')),
      ]),
      DataRow(cells: [
        DataCell(Text('2023-04-01')),
        DataCell(Text('Rs 50')),
        DataCell(Text('Recurring')),
        DataCell(Text('Completed')),
      ]),
      DataRow(cells: [
        DataCell(Text('2023-03-15')),
        DataCell(Text('Rs 75')),
        DataCell(Text('One Time')),
        DataCell(Text('Completed')),
      ]),
      DataRow(cells: [
        DataCell(Text('2023-02-01')),
        DataCell(Text('Rs 50')),
        DataCell(Text('Recurring')),
        DataCell(Text('Completed')),
      ]),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' Donation History',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Amount')),
              DataColumn(label: Text('Type')),
              DataColumn(label: Text('Status')),
            ],
            rows: _showAllRows ? rows : rows.take(4).toList(),
          ),
        ),
        if (rows.length > 4)
          TextButton(
            onPressed: () {
              setState(() {
                _showAllRows = !_showAllRows;
              });
            },
            child: Text(_showAllRows ? 'View Less' : 'View All'),
          ),
      ],
    );
  }
}
