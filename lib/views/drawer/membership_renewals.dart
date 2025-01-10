import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MembershipScreen(),
    );
  }
}

class MembershipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Membership Plan & Benefits',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
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
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Primary Plan Card
            MembershipCard(
              title: "Primary",
              subtitle: "For Common man",
              price: "Rs 5/2yr",
              features: [
                "No referral required",
                "For Common man",
                "24/7 Support"
              ],
              buttonLabel: "Choose Plan",
              color: Colors.green[100]!,
            ),
            SizedBox(height: 16),
            // Active Plan Card
            MembershipCard(
              title: "Active",
              subtitle: "For Professionals",
              price: "Rs 250/2yr",
              features: [
                "Minimum 10 Referrals Require",
                "For Professionals",
                "Priority Support"
              ],
              buttonLabel: "Choose Plan",
              color: Colors.blue[100]!,
            ),
          ],
        ),
      ),
    );
  }
}

class MembershipCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final List<String> features;
  final String buttonLabel;
  final Color color;

  const MembershipCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.features,
    required this.buttonLabel,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 16),
          Text(
            price,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          ...features
              .map((feature) => Row(
                    children: [
                      Icon(Icons.check, color: Colors.green, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          feature,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ],
                  ))
              .toList(),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(buttonLabel),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
