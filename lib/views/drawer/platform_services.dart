import 'package:flutter/material.dart';

class PlatformServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Congratulations!!!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'You have successfully joined the BPP platform.\n\n'
                            'To become a primary member and unlock the access to our services, '
                            'please pay the joining fee of Rs. 5/-. This will give you the access to the platform and '
                            'enable you to avail membership benefits, including counselling on legal, professional, and educational matters.',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Add payment functionality here
                            },
                            child: Text('Pay Now'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Text('Show Popup'),
        ),
      ),
    );
  }
}
