// import 'package:flutter/material.dart';
//
// class WalletPage extends StatefulWidget {
//   @override
//   _WalletPageState createState() => _WalletPageState();
// }
//
// class _WalletPageState extends State<WalletPage> {
//   double walletBalance = 5234.56;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Wallet'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               // Add money to wallet functionality
//             },
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           // Wallet Balance
//           Card(
//             margin: EdgeInsets.all(16),
//             elevation: 4,
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Balance',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         '₹$walletBalance',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.green,
//                         ),
//                       ),
//                     ],
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Send money functionality
//                     },
//                     child: Text('Send'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.blue,
//                       onPrimary: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           // Recent Transactions
//           Expanded(
//             child: ListView(
//               children: [
//                 ListTile(
//                   leading: Icon(Icons.add, color: Colors.green),
//                   title: Text('Contribution'),
//                   subtitle: Text('May 12, 2023'),
//                   trailing: Text('+₹500.0'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.payments, color: Colors.blue),
//                   title: Text('Payment'),
//                   subtitle: Text('May 1, 2023'),
//                   trailing: Text('-₹100.0'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Add money to wallet functionality
//         },
//         child: Icon(Icons.add),
//         backgroundColor: Colors.blue,
//       ),
//     );
//   }
// }