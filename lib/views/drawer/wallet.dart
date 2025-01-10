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
//                       foregroundColor: Colors.white,
//                       backgroundColor: Colors.blue,
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

import 'package:bpp_frontend/views/widgets/footer.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  double walletBalance = 5280.00;

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
              '  Wallet',
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
        actions: [
          // You can add more actions here if needed
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Height of the divider
          child: DottedLine(
            dashLength: 2.0, // Length of each dot/dash
            dashColor: Colors.blue, // Color of the dots/dashes
            lineThickness: 1.0, // Thickness of the line
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Wallet Balance Card
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(16),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Balance',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '₹${walletBalance.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FundScreen()),
                          );
                          // Send money functionality
                        },
                        child: Text('Add Fund'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3),

              // Recent Transactions Section
              Card(
                color: Colors.white,
                // color: Colors.white,
                margin: EdgeInsets.all(16),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Transactions',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Contribution Transaction
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade50,
                          child: Icon(Icons.shopping_cart, color: Colors.blue),
                        ),
                        title: Text('Contribution'),
                        subtitle: Text('May 12, 2023'),
                        trailing: Text(
                          '- ₹5.00',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      ),
                      Divider(),
                      // Deposit Transaction
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade50,
                          child: Icon(Icons.account_balance_wallet,
                              color: Colors.green),
                        ),
                        title: Text('Deposit'),
                        subtitle: Text('May 10, 2023'),
                        trailing: Text(
                          '+ ₹5.00',
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                      ),
                      Divider(),
                      // Payment Transaction
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          child: Icon(Icons.payments, color: Colors.grey),
                        ),
                        title: Text('Payment'),
                        subtitle: Text('May 1, 2023'),
                        trailing: Text(
                          '- ₹1.00',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to view all transactions page
                        },
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                'View all transactions',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //SizedBox(height: 3),

              // Payment Methods Section
              Card(
                color: Colors.white,
                //s color: Colors.white,
                margin: EdgeInsets.all(13),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Methods',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Visa Debit Card
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                child:
                                    Icon(Icons.credit_card, color: Colors.blue),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Visa Debit Card',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Ending in 1234',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Edit functionality
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      // Apple Pay
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                child: Icon(Icons.account_balance_wallet,
                                    color: Colors.green),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Apple Pay',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Connected',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Edit functionality
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          // Add new payment method functionality
                        },
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                'Add new payment method',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class FundScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<FundScreen> {
  TextEditingController _upiController = TextEditingController();
  bool _isUPIVerified = false;

  // Simulated UPI Verification Logic
  void _verifyUPI() {
    setState(() {
      if (_upiController.text.isNotEmpty && _upiController.text.contains('@')) {
        _isUPIVerified = true; // Verified
      } else {
        _isUPIVerified = false; // Not Verified
      }
    });
  }

  // Launch the respective UPI app using deep links
  Future<void> _launchUPIApp(String upiAppUrl) async {
    if (await canLaunch(upiAppUrl)) {
      await launch(upiAppUrl);
    } else {
      throw 'Could not launch UPI app';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Payment Screen',
            style: TextStyle(fontSize: 18, color: Colors.white)),
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
              color: Colors.white, // Color of the arrow (if necessary)
              // height: 10.0, // Size of the arrow
              // width: 10.0, // Size of the arrow
            ),
          ),
        ),
        actions: [
          // You can add more actions here if needed
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Height of the divider
          child: DottedLine(
            dashLength: 2.0, // Length of each dot/dash
            dashColor: Colors.blue, // Color of the dots/dashes
            lineThickness: 1.0, // Thickness of the line
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pay with UPI Section
            _buildUPIPaymentSection(),

            // Pay with Card Section
            _buildCardPaymentSection(),

            // Payment Summary
            _buildPaymentSummary(),
          ],
        ),
      ),
    );
  }

  // UPI Payment Section
  Widget _buildUPIPaymentSection() {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Pay with UPI",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Icon(Icons.qr_code, size: 120, color: Colors.black),
          SizedBox(height: 10),
          Text("Scan the QR code with your UPI app to pay."),
          SizedBox(height: 10),
          TextField(
            controller: _upiController,
            onChanged: (value) => _verifyUPI(),
            decoration: InputDecoration(
              hintText: "Enter UPI ID (e.g., mayur@789upi)",
              filled: true,
              fillColor: Colors.grey[200],
              suffixIcon: _isUPIVerified
                  ? Icon(Icons.check_circle, color: Colors.green)
                  : Icon(Icons.error, color: Colors.red),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            _isUPIVerified
                ? "✅ UPI ID Verified: ${_upiController.text}"
                : "❌ Invalid UPI ID",
            style: TextStyle(
              color: _isUPIVerified ? Colors.green : Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16),
          _buildUPIAppsRow(),
        ],
      ),
    );
  }

  // UPI Apps Row
  Widget _buildUPIAppsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildUPIAppIcon('Google Pay', Image.asset('assets/images/g1.png'),
            'upi://pay?pa=9356033669@ybl@upi&pn=mayurpatil&mc=0000&tid=1234567890&tr=1234567890123456&tn=Payment+to+XYZ&am=20.00&cu=INR'),
        _buildUPIAppIcon('PhonePe', Image.asset('assets/images/ph1.png'),
            'upi://pay?pa=yourupi@upi&pn=yourname&mc=0000&tid=1234567890&tr=1234567890123456&tn=Payment+to+XYZ&am=10.00&cu=INR'),
        _buildUPIAppIcon('Paytm', Image.asset('assets/images/paytm.png'),
            'upi://pay?pa=yourupi@upi&pn=yourname&mc=0000&tid=1234567890&tr=1234567890123456&tn=Payment+to+XYZ&am=10.00&cu=INR'),
      ],
    );
  }

  Widget _buildUPIAppIcon(String name, Widget icon, String upiAppUrl) {
    return GestureDetector(
      onTap: () => _launchUPIApp(upiAppUrl),
      child: Column(
        children: [
          Container(
            width: 48, // Set fixed dimensions for the image
            height: 48,
            child: icon, // Pass any widget, e.g., Image.asset
          ),
          SizedBox(height: 6),
          Text(name, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // Card Payment Section
  Widget _buildCardPaymentSection() {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pay with Card",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              labelText: "Card Number",
              prefixIcon: Icon(Icons.credit_card),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Expiry Date",
                    hintText: "MM/YY",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "CVV",
                    hintText: "123",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              labelText: "Cardholder Name",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  // Payment Summary
  Widget _buildPaymentSummary() {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Summary",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          _buildSummaryRow("Subtotal", "Rs 5.00"),
          _buildSummaryRow("Tax", "Rs 0.00"),
          _buildSummaryRow("Total", "Rs 5.00", isBold: true),
          SizedBox(height: 16),
          // The ElevatedButton itself with custom style
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Show the new message in the SnackBar with green background
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "We will start accepting membership fees from 01.01.2025. Please pay from this date to enjoy the benefits of Community Contribution.",
                      style: TextStyle(
                          fontSize: 14), // You can adjust text style here
                    ),
                    backgroundColor: Colors.green, // Set green background color
                    duration: Duration(
                        seconds: 5), // Set the duration for the Snackbar
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
                padding: EdgeInsets.symmetric(
                    vertical: 12, horizontal: 32), // Padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  // Border color and thickness can be added if needed
                ),
              ),
              child: Text(
                "Pay Now",
                style: TextStyle(
                  fontSize: 16, // Text size
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16)),
          Text(
            value,
            style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
