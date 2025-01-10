import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MembershipCertificateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
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
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Text(
                'Membership Certificate',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'View your membership certificate',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16),

              // QR Code Section
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Scan QR Code",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.qr_code,
                      size: 100,
                      color: Colors.black54,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Scan the QR code to access your membership certificate.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Certificate Preview Section
              GestureDetector(
                onTap: () {
                  // Show certificate image in a dialog
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Image
                          Image.asset(
                            'assets/images/bpp_logo1.png', // Replace with the path to your image
                            fit: BoxFit.contain,
                          ),
                          // Close Button
                          // TextButton(
                          //   onPressed: () {
                          //     Navigator.of(context).pop(); // Close the dialog
                          //   },
                          //   child: Text(
                          //     'Close',
                          //     style: TextStyle(color: Colors.blueAccent),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.grey,
                        child: Text(
                          'Certificate Preview',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Click the image to preview your certificate.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
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
    );
  }
}
