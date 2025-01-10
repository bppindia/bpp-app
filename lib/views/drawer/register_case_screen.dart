// import 'package:flutter/material.dart';
//
// class SupportForm extends StatelessWidget {
//   const SupportForm({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Support Form'),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Case Registration',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//               ),
//               const SizedBox(height: 10.0),
//               const Text(
//                 'Please provide detailed information about the issue you are facing and the support you are seeking.',
//                 style: TextStyle(fontSize: 14.0),
//               ),
//               const SizedBox(height: 16.0),
//               const Text(
//                 '1. Personal Information',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//               ),
//               const SizedBox(height: 8.0),
//               // Personal Information section
//               Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text('Full Name'),
//                         const SizedBox(height: 4.0),
//                         TextField(
//                           decoration: const InputDecoration(
//                             hintText: 'Enter your full name',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 16.0),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text('Membership ID (optional)'),
//                         const SizedBox(height: 4.0),
//                         TextField(
//                           decoration: const InputDecoration(
//                             hintText: 'Enter membership ID',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text('Email Address'),
//                         const SizedBox(height: 4.0),
//                         TextField(
//                           decoration: const InputDecoration(
//                             hintText: 'Enter your email',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 16.0),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text('Phone Number'),
//                         const SizedBox(height: 4.0),
//                         TextField(
//                           decoration: const InputDecoration(
//                             hintText: 'Enter your phone number',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               const Text(
//                 '2. Case Details',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//               ),
//               const SizedBox(height: 8.0),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text('Title of the Issue'),
//                         const SizedBox(height: 4.0),
//                         DropdownButtonFormField(
//                           decoration: const InputDecoration(
//                             border: OutlineInputBorder(),
//                           ),
//                           items: [
//                             DropdownMenuItem(
//                               value: 'Issue 1',
//                               child: const Text('Issue 1'),
//                             ),
//                             DropdownMenuItem(
//                               value: 'Issue 2',
//                               child: const Text('Issue 2'),
//                             ),
//                             // Add more items as needed
//                           ],
//                           onChanged: (value) {
//                             // Handle dropdown selection
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               const Text('Detailed Description of the Issue'),
//               const SizedBox(height: 8.0),
//               TextField(
//                 maxLines: 5,
//                 decoration: const InputDecoration(
//                   hintText:
//                       'Provide a detailed description of the issue you are facing',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               const Text(
//                 '3. Type of Support Needed',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//               ),
//               const SizedBox(height: 8.0),
//               const Text('Select Support Types'),
//               const SizedBox(height: 8.0),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: false,
//                     onChanged: (value) {
//                       // Handle checkbox change
//                     },
//                   ),
//                   const Text('Financial Assistance'),
//                 ],
//               ),
//               // Add other checkbox rows as needed
//               const SizedBox(height: 16.0),
//               const Text(
//                 '4. Additional Information',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//               ),
//               const SizedBox(height: 8.0),
//               TextField(
//                 maxLines: 5,
//                 decoration: const InputDecoration(
//                   hintText:
//                       'Have you received support from any other individual or institution?',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               const Text(
//                 '5. Consent',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//               ),
//               const SizedBox(height: 8.0),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Checkbox(
//                     value: false,
//                     onChanged: (value) {
//                       // Handle checkbox change
//                     },
//                   ),
//                   const Text(
//                       "I give my consent for my case to be reviewed and for"
//                       "\n"
//                       "relevant community members to be informed."),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle form submission
//                 },
//                 child: const Text('Submit Case'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CaseRegistrationScreen extends StatefulWidget {
  const CaseRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<CaseRegistrationScreen> createState() => _CaseRegistrationScreenState();
}

class _CaseRegistrationScreenState extends State<CaseRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    bool isConsentGiven = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Case Registration',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
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
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please provide detailed information about the issue you are facing and the support you are seeking.',
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // Section 1: Personal Information
              const Text(
                '1. Personal Information',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Full Name Field
              const Text('Full Name'),
              const SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your full name',
                ),
              ),
              const SizedBox(height: 15),

              // Email Address Field
              const Text('Email Address'),
              const SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),

              // Membership ID Field
              const Text('Membership ID (optional)'),
              const SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter membership ID',
                ),
              ),
              const SizedBox(height: 15),

              // Phone Number Field
              const Text('Phone Number'),
              const SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your phone number',
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              // Section 2: Case Details
              const Text(
                '2. Case Details',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Title of the Issue Dropdown
              const Text('Title of the Issue'),
              const SizedBox(height: 5),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                ),
                items: const [
                  DropdownMenuItem(
                      value: 'Technical Issue', child: Text('Technical Issue')),
                  DropdownMenuItem(
                      value: 'Billing Issue', child: Text('Billing Issue')),
                  DropdownMenuItem(
                      value: 'General Query', child: Text('General Query')),
                ],
                onChanged: (value) {
                  // Handle the value change
                },
                hint: const Text('Select issue category'),
              ),
              const SizedBox(height: 15),

              // Detailed Description Field
              const Text('Detailed Description of the Issue'),
              const SizedBox(height: 5),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      'Provide a detailed description of the issue you are facing',
                ),
              ),
              const SizedBox(height: 20),
              // Section 3: Type of Support Needed
              const Text(
                '3. Type of Support Needed',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              const Text(
                'Select Support Types',
                style: TextStyle(fontSize: 14.0),
              ),
              const SizedBox(height: 5),

              // Checkbox Options for Support Types
              Wrap(
                spacing: 5.0,
                // runSpacing: 5.0,
                children: [
                  _buildCheckBoxOption('Financial Assistance'),
                  _buildCheckBoxOption(
                      'Resources (e.g., food, clothes, books, wheelchairs)'),
                  _buildCheckBoxOption('Counselling (psychological)'),
                  _buildCheckBoxOption('Advocacy or Legal Support'),
                  _buildCheckBoxOption(
                      'Social Assistance (Marriage, House, etc)'),
                  _buildCheckBoxOption(
                      'Education (Scholarship, Higher Studies, Admissions)'),
                  _buildCheckBoxOption('Other'),
                ],
              ),
              const SizedBox(height: 10),

              // Specify Other Support Type
              const Text('Specify Other Support Type'),
              const SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter other support type',
                ),
              ),
              const SizedBox(height: 20),

              // Describe Support Needed
              const Text('Describe Support Needed'),
              const SizedBox(height: 5),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      'Provide more information about how the community can assist you',
                ),
              ),
              const SizedBox(height: 20),

              // Section 4: Additional Information
              const Text(
                '4. Additional Information',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Previous Support Received',
                style: TextStyle(fontSize: 14.0),
              ),
              const SizedBox(height: 5),

              TextField(
                maxLines: 2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Provide any additional details if required',
                ),
              ),
              const SizedBox(height: 20),

              // Section 5: Consent
              const Text(
                '5. Consent',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isConsentGiven,
                    onChanged: (bool? value) {
                      setState(() {
                        isConsentGiven = value ?? false;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isConsentGiven = !isConsentGiven;
                      });
                    },
                    child: Text(
                      "I give my consent for my case to be"
                      "\n"
                      " reviewed and for relevant community"
                      "\n"
                      " members to be informed.",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: isConsentGiven
                            ? Colors.black
                            : Colors.grey, // Dynamic color
                        decoration: isConsentGiven
                            ? TextDecoration.underline
                            : null, // Optional styling
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (isConsentGiven) {
                      // Handle form submission when consent is given
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form Submitted')),
                      );
                    } else {
                      // Show error message if consent is not given
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Please give your consent to proceed')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: const Text(
                    'Submit Case',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Submit Button
  Widget _buildCheckBoxOption(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: false,
          onChanged: (bool? value) {
            // Handle checkbox state change
          },
        ),
        Flexible(child: Text(label)),
      ],
    );
  }
}
