// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   bool _isEmailNotificationsEnabled = true;
//   bool _isPushNotificationsEnabled = false;
//   bool _isSmsNotificationsEnabled = false;
//   final ImagePicker _picker = ImagePicker();
//   String? _imagePath; // Path of the selected image
//
//   Future<void> _pickImage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _imagePath = image.path; // Update profile image path
//       });
//     }
//   }
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _fetchData();
//   // }
//
//   // void _fetchData() async {
//   //   final userData = await fetchUserData();
//   //   setState(() {
//   //     // Update the UI with the fetched data
//   //     firstName = userData['firstName']!;
//   //     _lastName = userData['lastName']!;
//   //     _email = userData['email']!;
//   //     _phone = userData['phone']!;
//   //     // Other fields as necessary
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Welcome to Profile',
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         leading: GestureDetector(
//           onTap: () {
//             // Add your functionality for the arrow button here
//             Navigator.pop(context);
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(10.0), // Adjust padding as needed
//             child: SvgPicture.asset(
//               'assets/images/arrow.svg', // Your SVG file path
//               color: Colors.white, // Color of the arrow (if necessary)
//               // height: 10.0, // Size of the arrow
//               // width: 10.0, // Size of the arrow
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile Picture Section
//             Row(
//               children: [
//                 Stack(
//                   children: [
//                     CircleAvatar(
//                       radius: 45,
//                       backgroundImage: _imagePath != null
//                           ? FileImage(File(_imagePath!))
//                           : const AssetImage('assets/images/s1.png')
//                       as ImageProvider, // Default image if none is selected
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: GestureDetector(
//                         onTap: _pickImage,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             color: Colors.black,
//                             shape: BoxShape.circle,
//                           ),
//                           padding: const EdgeInsets.all(5),
//                           child: const Icon(
//                             Icons.camera_alt,
//                             color: Colors.white,
//                             size: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(width: 20),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       'Swapnil Mahadik',
//                       style:
//                       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'Primary Member',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 24),
//
//             // Profile Information Section in a Card
//             _buildProfileInfoSection(),
//             const SizedBox(height: 10),
//
//             _buildProfileInfoSection1(),
//
//             const SizedBox(height: 10),
//
//             // Notification Settings Section in a Card
//             _buildNotificationSettingsSection(),
//
//             const SizedBox(height: 10),
//
//             // Additional Information Section in a Card
//             _buildAdditionalInfoSection(),
//
//             const SizedBox(height: 10),
//
//             // Government IDs Section in a Card
//             _buildGovernmentIdsSection(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProfileInfoSection() {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       elevation: 2.0,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Profile Information',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 5),
//             const Text(
//               "Update your account's profile information.",
//               style: TextStyle(),
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(
//               label: 'First Name',
//               hintText: '',
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(
//               label: 'Middle Name',
//               hintText: '',
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(
//               label: 'Last Name',
//               hintText: '',
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(
//               label: 'Date of Birth',
//               hintText: '',
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(
//               label: 'age',
//               hintText: '',
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(
//               label: 'gender',
//               hintText: '',
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProfileInfoSection1() {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       elevation: 2.0,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Professional Details',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 5),
//             const Text(
//               "Need to update your profession.",
//               style: TextStyle(),
//             ),
//             const SizedBox(height: 15),
//             const Text(
//               'Education Details',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Divider(
//               color: Colors.grey, // Black color
//               thickness: 1.0, // Line thickness
//             ),
//             const SizedBox(height: 5),
//             _buildTextField(
//               label: 'Name of University/Institution/Organization',
//               hintText: 'Pune University',
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(
//               label: 'Passout Year',
//               hintText: '2016,2017',
//             ),
//             const SizedBox(height: 25),
//             const Text(
//               'Professional Details',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Divider(
//               color: Colors.grey, // Black color
//               thickness: 1.0, // Line thickness
//             ),
//             const SizedBox(height: 5),
//             _buildTextField(
//               label: 'Professional Categories',
//               hintText: 'Social',
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(
//                 label: 'Current Profession', hintText: 'Senior surgeon'),
//             const SizedBox(height: 16),
//             _buildTextField(label: 'Years of Experience', hintText: '4,8,10'),
//             const SizedBox(height: 16),
//             _buildTextField(
//                 label: 'Tell Me Your Professional Summary',
//                 maxLines: 3,
//                 hintText:
//                 'ex.Experience cardiac surgeon with 10+ years of experience'),
//             const Text('500/500 limit'),
//             const SizedBox(height: 5),
//             const Text(
//               'Upload Documents',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Divider(
//               color: Colors.black, // Black color
//               thickness: 1.0, // Line thickness
//             ),
//             const SizedBox(height: 5),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Professional Degree *',
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(height: 8),
//                 _buildColoredFilePickerField(
//                   label: 'Select your degree',
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   'Experience Certificate (if any)',
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(height: 8),
//                 _buildColoredFilePickerField(
//                   label: 'Select your certificate',
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Terms and Conditions',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             const Divider(
//               color: Colors.black, // Black color
//               thickness: 1.0, // Line thickness
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               '• Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec venenatis metus.',
//             ),
//             const SizedBox(height: 4),
//             const Text(
//               '• Quisque volutpat velit eu sapien auctor, in ultrices augue tincidunt.',
//             ),
//             const SizedBox(height: 4),
//             const Text(
//               '• Ut malesuada, sem sit amet vulputate pretium, tortor enim efficitur risus, at scelerisque est metus id leo.',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildColoredFilePickerField({required String label}) {
//     return GestureDetector(
//       onTap: () async {
//         FilePickerResult? result = await FilePicker.platform.pickFiles();
//         if (result != null) {
//           // Handle the file here (e.g., show the file name or path)
//           print('Selected file: ${result.files.single.path}');
//         } else {
//           // User canceled the picker
//           print('No file selected');
//         }
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade400, // Light background color
//           borderRadius: BorderRadius.circular(8.0),
//           border: Border.all(
//             color: Colors.grey.shade400, // Border color
//             width: 1.0,
//           ),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 label,
//                 style: const TextStyle(color: Colors.black54),
//               ),
//             ),
//             const Icon(Icons.attach_file, color: Colors.black54),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildFilePickerField({required String label}) {
//     return GestureDetector(
//       onTap: () async {
//         FilePickerResult? result = await FilePicker.platform.pickFiles();
//         if (result != null) {
//           // Handle the file here (e.g., show the file name or path)
//           print('Selected file: ${result.files.single.path}');
//         } else {
//           // User canceled the picker
//           print('No file selected');
//         }
//       },
//       child: AbsorbPointer(
//         // Prevent text editing while allowing file pick
//         child: TextFormField(
//           decoration: InputDecoration(
//             labelText: label,
//             hintText: 'Choose file...',
//             suffixIcon: Icon(Icons.attach_file),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNotificationSettingsSection() {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       elevation: 2.0,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Notification Settings',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 5),
//             const Text(
//               "Manage your account's notification preferences.",
//               style: TextStyle(
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildNotificationSwitch(
//               title: 'Email Notifications',
//               subtitle: 'Receive email notifications for important updates.',
//               value: _isEmailNotificationsEnabled,
//               onChanged: (val) {
//                 setState(() {
//                   _isEmailNotificationsEnabled = val;
//                 });
//               },
//             ),
//             const SizedBox(height: 16),
//             _buildNotificationSwitch(
//               title: 'Push Notifications',
//               subtitle: 'Receive push notifications for real-time updates.',
//               value: _isPushNotificationsEnabled,
//               onChanged: (val) {
//                 setState(() {
//                   _isPushNotificationsEnabled = val;
//                 });
//               },
//             ),
//             const SizedBox(height: 16),
//             _buildNotificationSwitch(
//               title: 'SMS Notifications',
//               subtitle: 'Receive SMS notifications for critical alerts.',
//               value: _isSmsNotificationsEnabled,
//               onChanged: (val) {
//                 setState(() {
//                   _isSmsNotificationsEnabled = val;
//                 });
//               },
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAdditionalInfoSection() {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       elevation: 2.0,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Additional Information',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 5),
//             const Text(
//               "Update your current residential address.",
//               style: TextStyle(
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(
//                 label: 'Address Line 1', hintText: '123 Main Street'),
//             const SizedBox(height: 16),
//             _buildTextField(
//                 label: 'Address Line 2', hintText: '123 Main Street'),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildTextField(label: 'City', hintText: 'Mumbai'),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child:
//                   _buildTextField(label: 'State', hintText: 'Maharashtra'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child:
//                   _buildTextField(label: 'Postal Code', hintText: '400001'),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: _buildTextField(label: 'Country', hintText: 'India'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildGovernmentIdsSection() {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       elevation: 2.0,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Government IDs',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               "Update your Voter ID and Aadhaar number.",
//               style: TextStyle(color: Colors.grey),
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(label: 'Voter ID Number', hintText: 'BTC390831'),
//             const SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: () async {
//                 // Handle Voter Front upload
//                 final result = await FilePicker.platform.pickFiles(
//                   type: FileType.custom,
//                   allowedExtensions: ['jpg', 'png', 'pdf'], // File types
//                 );
//                 if (result != null) {
//                   String filePath = result.files.single.path!;
//                   print("Selected Voter Front file: $filePath");
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.grey,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.0), // Rounded corners
//                 ),
//               ),
//               child: const Text(
//                 'Upload Voter Front',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: () async {
//                 // Handle Voter Back upload
//                 final result = await FilePicker.platform.pickFiles(
//                   type: FileType.custom,
//                   allowedExtensions: ['jpg', 'png', 'pdf'], // File types
//                 );
//                 if (result != null) {
//                   String filePath = result.files.single.path!;
//                   print("Selected Voter Back file: $filePath");
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.grey,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.0), // Rounded corners
//                 ),
//               ),
//               child: const Text(
//                 'Upload Voter Back',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(
//                 label: 'Aadhaar Number', hintText: '4980 2961 2316'),
//             const SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: () async {
//                 // Handle Aadhaar Front upload
//                 final result = await FilePicker.platform.pickFiles(
//                   type: FileType.custom,
//                   allowedExtensions: ['jpg', 'png', 'pdf'], // File types
//                 );
//                 if (result != null) {
//                   String filePath = result.files.single.path!;
//                   print("Selected Aadhaar Front file: $filePath");
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.grey,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.0), // Rounded corners
//                 ),
//               ),
//               child: const Text(
//                 'Upload Aadhaar Front',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: () async {
//                 // Handle Aadhaar Back upload
//                 final result = await FilePicker.platform.pickFiles(
//                   type: FileType.custom,
//                   allowedExtensions: ['jpg', 'png', 'pdf'], // File types
//                 );
//                 if (result != null) {
//                   String filePath = result.files.single.path!;
//                   print("Selected Aadhaar Back file: $filePath");
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.grey,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.0), // Rounded corners
//                 ),
//               ),
//               child: const Text(
//                 'Upload Aadhaar Back',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField({
//     required String label,
//     required String hintText,
//     int maxLines = 1,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 14,
//           ),
//         ),
//         const SizedBox(height: 8),
//         TextField(
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: const TextStyle(color: Colors.grey),
//             filled: true,
//             fillColor: Colors.grey.shade400,
//             // Background color for the text field
//             contentPadding:
//             const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//             // Reduced vertical padding
//             border: OutlineInputBorder(
//               borderSide: BorderSide.none, // No visible border
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildNotificationSwitch({
//     required String title,
//     required String subtitle,
//     required bool value,
//     required ValueChanged<bool> onChanged,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 subtitle,
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//         Switch(
//           value: value,
//           onChanged: onChanged, // Trigger the state update
//         ),
//       ],
//     );
//   }
// }
//
// // Future<Map<String, String>> fetchUserData() async {
// //   final SharedPreferences prefs = await SharedPreferences.getInstance();
// //
// //   return {
// //     'firstName': prefs.getString('firstName') ?? '',
// //     'lastName': prefs.getString('lastName') ?? '',
// //     'email': prefs.getString('email') ?? '',
// //     'phone': prefs.getString('phone') ?? '',
// //     'addressLine1': prefs.getString('addressLine1') ?? '',
// //     'addressLine2': prefs.getString('addressLine2') ?? '',
// //     'cityOrVillage': prefs.getString('cityOrVillage') ?? '',
// //     'state': prefs.getString('state') ?? '',
// //     'pincode': prefs.getString('pincode') ?? '',
// //     'taluka': prefs.getString('taluka') ?? '',
// //     'gender': prefs.getString('gender') ?? '',
// //     'dateOfBirth': prefs.getString('dateOfBirth') ?? '',
// //     'aadhaarNumber': prefs.getString('aadhaarNumber') ?? '',
// //     'voterId': prefs.getString('voterId') ?? '',
// //   };
// // }

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  final String firstName;
  final String middleName;
  final String lastName;
  final String dateOfBirth;
  final String age;
  final String gender; ProfileScreen({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.dateOfBirth,
    required this.age,
    required this.gender,
  });



  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEmailNotificationsEnabled = true;
  bool _isPushNotificationsEnabled = false;
  bool _isSmsNotificationsEnabled = false;
  final ImagePicker _picker = ImagePicker();
  String? _imagePath; // Path of the selected image

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imagePath = image.path; // Update profile image path
      });
    }
  }


  Future<Widget> buildProfileSectionFromData() async {
    final prefs = await SharedPreferences.getInstance();
    final firstName = prefs.getString('firstName') ?? '';
    final middleName = prefs.getString('middleName') ?? '';
    final lastName = prefs.getString('lastName') ?? '';
    final dob = prefs.getString('dateOfBirth') ?? '';
   // final age = prefs.getString('age') ?? '';
   // final gender = prefs.getString('gender') ?? '';

    return Column(
      children: [
        _buildProfileInfoSection('First Name', firstName),
        _buildProfileInfoSection('Middle Name', middleName),
        _buildProfileInfoSection('Last Name', lastName),
        _buildProfileInfoSection('Date of Birth', dob),
       // _buildProfileInfoSection('Age', age),
        //_buildProfileInfoSection('Gender', gender),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to Profile',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: _imagePath != null
                          ? FileImage(File(_imagePath!))
                          : const AssetImage('assets/images/s1.png')
                      as ImageProvider, // Default image if none is selected
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Swapnil Mahadik',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Primary Member',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Profile Information Section in a Card
           // _buildProfileInfoSection(),
            _buildProfileInfoSection('First Name', ''),

            const SizedBox(height: 10),

            _buildProfileInfoSection1(),

            const SizedBox(height: 10),

            // Notification Settings Section in a Card
            _buildNotificationSettingsSection(),

            const SizedBox(height: 10),

            // Additional Information Section in a Card
            _buildAdditionalInfoSection(),

            const SizedBox(height: 10),

            // Government IDs Section in a Card
            _buildGovernmentIdsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoSection(String label, String value) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label, // Use the label dynamically
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              value.isNotEmpty ? value : 'Not Provided', // Show value or placeholder
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }


  Widget _buildProfileInfoSection1() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Professional Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Need to update your profession.",
              style: TextStyle(),
            ),
            const SizedBox(height: 15),
            const Text(
              'Education Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.grey, // Black color
              thickness: 1.0, // Line thickness
            ),
            const SizedBox(height: 5),
            _buildTextField(
              label: 'Name of University/Institution/Organization',
              hintText: 'Pune University',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Passout Year',
              hintText: '2016,2017',
            ),
            const SizedBox(height: 25),
            const Text(
              'Professional Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.grey, // Black color
              thickness: 1.0, // Line thickness
            ),
            const SizedBox(height: 5),
            _buildTextField(
              label: 'Professional Categories',
              hintText: 'Social',
            ),
            const SizedBox(height: 16),
            _buildTextField(
                label: 'Current Profession', hintText: 'Senior surgeon'),
            const SizedBox(height: 16),
            _buildTextField(label: 'Years of Experience', hintText: '4,8,10'),
            const SizedBox(height: 16),
            _buildTextField(
                label: 'Tell Me Your Professional Summary',
                maxLines: 3,
                hintText:
                'ex.Experience cardiac surgeon with 10+ years of experience'),
            const Text('500/500 limit'),
            const SizedBox(height: 5),
            const Text(
              'Upload Documents',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.black, // Black color
              thickness: 1.0, // Line thickness
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Professional Degree *',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                _buildColoredFilePickerField(
                  label: 'Select your degree',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Experience Certificate (if any)',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                _buildColoredFilePickerField(
                  label: 'Select your certificate',
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Terms and Conditions',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Divider(
              color: Colors.black, // Black color
              thickness: 1.0, // Line thickness
            ),
            const SizedBox(height: 10),
            const Text(
              '• Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec venenatis metus.',
            ),
            const SizedBox(height: 4),
            const Text(
              '• Quisque volutpat velit eu sapien auctor, in ultrices augue tincidunt.',
            ),
            const SizedBox(height: 4),
            const Text(
              '• Ut malesuada, sem sit amet vulputate pretium, tortor enim efficitur risus, at scelerisque est metus id leo.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColoredFilePickerField({required String label}) {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          // Handle the file here (e.g., show the file name or path)
          print('Selected file: ${result.files.single.path}');
        } else {
          // User canceled the picker
          print('No file selected');
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade400, // Light background color
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey.shade400, // Border color
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: Colors.black54),
              ),
            ),
            const Icon(Icons.attach_file, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  Widget _buildFilePickerField({required String label}) {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          // Handle the file here (e.g., show the file name or path)
          print('Selected file: ${result.files.single.path}');
        } else {
          // User canceled the picker
          print('No file selected');
        }
      },
      child: AbsorbPointer(
        // Prevent text editing while allowing file pick
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            hintText: 'Choose file...',
            suffixIcon: Icon(Icons.attach_file),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationSettingsSection() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notification Settings',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Manage your account's notification preferences.",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            _buildNotificationSwitch(
              title: 'Email Notifications',
              subtitle: 'Receive email notifications for important updates.',
              value: _isEmailNotificationsEnabled,
              onChanged: (val) {
                setState(() {
                  _isEmailNotificationsEnabled = val;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildNotificationSwitch(
              title: 'Push Notifications',
              subtitle: 'Receive push notifications for real-time updates.',
              value: _isPushNotificationsEnabled,
              onChanged: (val) {
                setState(() {
                  _isPushNotificationsEnabled = val;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildNotificationSwitch(
              title: 'SMS Notifications',
              subtitle: 'Receive SMS notifications for critical alerts.',
              value: _isSmsNotificationsEnabled,
              onChanged: (val) {
                setState(() {
                  _isSmsNotificationsEnabled = val;
                });
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalInfoSection() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Additional Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Update your current residential address.",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(
                label: 'Address Line 1', hintText: '123 Main Street'),
            const SizedBox(height: 16),
            _buildTextField(
                label: 'Address Line 2', hintText: '123 Main Street'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(label: 'City', hintText: 'Mumbai'),
                ),
                const SizedBox(width: 16),
                Expanded(

                  child:
                  _buildTextField(label: 'State', hintText: 'Maharashtra'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child:
                  _buildTextField(label: 'Postal Code', hintText: '400001'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(label: 'Country', hintText: 'India'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGovernmentIdsSection() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Government IDs',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Update your Voter ID and Aadhaar number.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            _buildTextField(label: 'Voter ID Number', hintText: 'BTC390831'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                // Handle Voter Front upload
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'png', 'pdf'], // File types
                );
                if (result != null) {
                  String filePath = result.files.single.path!;
                  print("Selected Voter Front file: $filePath");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
              ),
              child: const Text(
                'Upload Voter Front',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                // Handle Voter Back upload
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'png', 'pdf'], // File types
                );
                if (result != null) {
                  String filePath = result.files.single.path!;
                  print("Selected Voter Back file: $filePath");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
              ),
              child: const Text(
                'Upload Voter Back',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(
                label: 'Aadhaar Number', hintText: '4980 2961 2316'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                // Handle Aadhaar Front upload
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'png', 'pdf'], // File types
                );
                if (result != null) {
                  String filePath = result.files.single.path!;
                  print("Selected Aadhaar Front file: $filePath");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
              ),
              child: const Text(
                'Upload Aadhaar Front',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                // Handle Aadhaar Back upload
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'png', 'pdf'], // File types
                );
                if (result != null) {
                  String filePath = result.files.single.path!;
                  print("Selected Aadhaar Back file: $filePath");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
              ),
              child: const Text(
                'Upload Aadhaar Back',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField1({
    required String label,
    required String hintText,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),

        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade400,
            // Background color for the text field
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            // Reduced vertical padding
            border: OutlineInputBorder(
              borderSide: BorderSide.none, // No visible border
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildTextField({
    required String label,
    required String hintText,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),

        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade400,
            // Background color for the text field
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            // Reduced vertical padding
            border: OutlineInputBorder(
              borderSide: BorderSide.none, // No visible border
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged, // Trigger the state update
        ),
      ],
    );
  }
}

