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
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2));
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return constraints.maxWidth > 600
                        ? _buildWideHeader(context)
                        : _buildNarrowHeader(context);
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
      bottomNavigationBar: Footer(),
    );
  }

  Widget _buildWideHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, Donor',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 8),
              Text(
                'View your donation history and manage your account.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {
            // Handle donation
          },
          icon: Icon(Icons.favorite_border),
          label: Text('Make a Donation'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome, Donor',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 8),
        Text(
          'View your donation history and manage your account.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              // Handle donation
            },
            icon: Icon(Icons.favorite_border),
            label: Text('Make a Donation'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDonationMetrics(BuildContext context) {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 1.8,
      mainAxisSpacing: 10,
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
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 32),
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
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
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
          'Donation History',
          style: Theme.of(context).textTheme.titleLarge,
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
