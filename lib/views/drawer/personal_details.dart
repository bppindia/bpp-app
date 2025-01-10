//8jan 2025
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
//   //names
//   late TextEditingController firstNameController;
//   late TextEditingController middleNameController;
//   late TextEditingController lastNameController;
//   late TextEditingController dateOfBirthController;
//   late TextEditingController ageController;
//   late TextEditingController genderController;
//
//   //address
//   late TextEditingController addressLine1Controller;
//   late TextEditingController addressLine2Controller;
//   late TextEditingController cityOrVillageController;
//   late TextEditingController stateController;
//   late TextEditingController pinCodeController;
//
//   //files
//   late TextEditingController voterIdController;
//   late TextEditingController aadhaarController;
//
//   String? voterFrontFilePath;
//   String? voterBackFilePath;
//   String? aadhaarFrontFilePath;
//   String? aadhaarBackFilePath;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadProfileData();
//     _loadAdditionalInfo();
//     _loadGovernment();
//   }
//
//   Future<void> _loadProfileData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     setState(() {
//       firstNameController =
//           TextEditingController(text: prefs.getString('firstName') ?? '');
//       middleNameController =
//           TextEditingController(text: prefs.getString('middleName') ?? '');
//       lastNameController =
//           TextEditingController(text: prefs.getString('lastName') ?? '');
//       dateOfBirthController =
//           TextEditingController(text: prefs.getString('dateOfBirth') ?? '');
//       ageController = TextEditingController(text: prefs.getString('age') ?? '');
//       genderController =
//           TextEditingController(text: prefs.getString('gender') ?? '');
//
//       // addressLine1Controller =
//       //     TextEditingController(text: prefs.getString('addressLine1') ?? '');
//       // addressLine2Controller =
//       //     TextEditingController(text: prefs.getString('addressLine1') ?? '');
//       // cityOrVillageController =
//       //     TextEditingController(text: prefs.getString('cityOrVillage') ?? '');
//       // stateController =
//       //     TextEditingController(text: prefs.getString('state') ?? '');
//       // pinCodeController =
//       //     TextEditingController(text: prefs.getString('pin') ?? '');
//     });
//   }
//
//   Future<void> _loadAdditionalInfo() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     setState(() {
//       addressLine1Controller =
//           TextEditingController(text: prefs.getString('addressLine1') ?? '');
//       addressLine2Controller =
//           TextEditingController(text: prefs.getString('addressLine2') ?? '');
//       cityOrVillageController =
//           TextEditingController(text: prefs.getString('cityOrVillage') ?? '');
//       stateController =
//           TextEditingController(text: prefs.getString('state') ?? '');
//       pinCodeController =
//           TextEditingController(text: prefs.getString('pinCode') ?? '');
//     });
//   }
//
//   Future<void> _loadGovernment() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     setState(() {
//       voterIdController =
//           TextEditingController(text: prefs.getString('voterId') ?? '');
//       voterFrontFilePath = prefs.getString('voterFront') ?? '';
//       voterBackFilePath = prefs.getString('voterBack') ?? '';
//       aadhaarController =
//           TextEditingController(text: prefs.getString('aadhaarNumber') ?? '');
//       aadhaarFrontFilePath = prefs.getString('aadhaarFront') ?? '';
//       aadhaarBackFilePath = prefs.getString('aadhaarBack') ?? '';
//     });
//   }
//
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
//                       radius: 40,
//                       backgroundImage: _imagePath != null
//                           ? FileImage(File(_imagePath!))
//                           : const AssetImage('assets/images/s1.png')
//                               as ImageProvider, // Default image if none is selected
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
//                   children: [
//                     // Display the first name and last name dynamically
//                     Text(
//                       '${firstNameController.text} ${lastNameController.text}',
//                       style: const TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     // Optional: Display additional information
//                     // Text(
//                     //   'Primary Member',
//                     //   style: TextStyle(color: Colors.grey),
//                     // ),
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
//             _buildTextField2(
//                 label: 'First Name', controller: firstNameController),
//             const SizedBox(height: 16),
//             _buildTextField2(
//                 label: 'Middle Name', controller: middleNameController),
//             const SizedBox(height: 16),
//             _buildTextField2(
//                 label: 'Last Name', controller: lastNameController),
//             const SizedBox(height: 16),
//             _buildTextField2(
//                 label: 'Date of Birth', controller: dateOfBirthController),
//             const SizedBox(height: 16),
//             _buildTextField2(label: 'Age', controller: ageController),
//             const SizedBox(height: 16),
//             _buildTextField2(label: 'Gender', controller: genderController),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _saveProfileData,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Background color of the button
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 13.0), // Custom padding
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8), // Rounded corners
//                 ),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'Save',
//                   style: TextStyle(
//                       fontSize: 16, color: Colors.white), // Text color
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _saveProfileData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     await prefs.setString('firstName', firstNameController.text);
//     await prefs.setString('middleName', middleNameController.text);
//     await prefs.setString('lastName', lastNameController.text);
//     await prefs.setString('dateOfBirth', dateOfBirthController.text);
//     await prefs.setString('age', ageController.text);
//     await prefs.setString('gender', genderController.text);
//
//     // await prefs.setString('addressLine1', addressLine1Controller.text);
//     // await prefs.setString('addressLine1', addressLine2Controller.text);
//     // await prefs.setString('cityOrVillage', cityOrVillageController.text);
//     // await prefs.setString('state', stateController.text);
//     // await prefs.setString('pinCode', pinCodeController.text);
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Profile updated successfully!')),
//     );
//   }
//
//   // Widget _buildTextField2({
//   //   required String label,
//   //   required TextEditingController controller,
//   // }) {
//   //   return Column(
//   //     crossAxisAlignment: CrossAxisAlignment.start,
//   //     children: [
//   //       Text(
//   //         label,
//   //         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//   //       ),
//   //       const SizedBox(height: 8),
//   //       TextFormField(
//   //         controller: controller,
//   //         decoration: const InputDecoration(
//   //           border: OutlineInputBorder(),
//   //         ),
//   //       ),
//   //     ],
//   //   );
//   // }
//
//   Widget _buildTextField2({
//     required String label,
//     required TextEditingController controller,
//     int maxLines = 1,
//     String? hintText,
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
//         TextFormField(
//           controller: controller,
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: const TextStyle(color: Colors.grey),
//             filled: true,
//             fillColor: Colors.grey.shade400,
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//             border: const OutlineInputBorder(
//               borderSide: BorderSide.none, // No visible border
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTextField3({
//     required String label,
//     required TextEditingController controller,
//     int maxLines = 1,
//     String? hintText,
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
//         TextFormField(
//           controller: controller,
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: const TextStyle(color: Colors.grey),
//             filled: true,
//             fillColor: Colors.grey.shade400,
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//             border: const OutlineInputBorder(
//               borderSide: BorderSide.none, // No visible border
//             ),
//           ),
//         ),
//       ],
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
//                     'ex.Experience cardiac surgeon with 10+ years of experience'),
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
//   // Widget _buildAdditionalInfoSection() {
//   //   return Card(
//   //     shape: RoundedRectangleBorder(
//   //       borderRadius: BorderRadius.circular(12.0),
//   //     ),
//   //     elevation: 2.0,
//   //     child: Padding(
//   //       padding: const EdgeInsets.all(16.0),
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: [
//   //           const Text(
//   //             'Additional Information',
//   //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//   //           ),
//   //           const SizedBox(height: 5),
//   //           const Text(
//   //             "Update your current residential address.",
//   //             style: TextStyle(
//   //               color: Colors.grey,
//   //             ),
//   //           ),
//   //           const SizedBox(height: 16),
//   //           _buildTextField3(
//   //               label: 'Address Line 1',
//   //               hintText: '123 Main Street',
//   //               controller: addressLine1Controller),
//   //           const SizedBox(height: 16),
//   //           _buildTextField3(
//   //               label: 'Address Line 2',
//   //               hintText: '123 Main Street',
//   //               controller: addressLine2Controller),
//   //           const SizedBox(height: 16),
//   //           Row(
//   //             children: [
//   //               Expanded(
//   //                 child: _buildTextField3(
//   //                     label: 'City',
//   //                     hintText: 'Mumbai',
//   //                     controller: cityOrVillageController),
//   //               ),
//   //               const SizedBox(width: 16),
//   //               Expanded(
//   //                 child: _buildTextField3(
//   //                     label: 'State',
//   //                     hintText: 'Maharashtra',
//   //                     controller: stateController),
//   //               ),
//   //             ],
//   //           ),
//   //           const SizedBox(height: 16),
//   //           Row(
//   //             children: [
//   //               Expanded(
//   //                 child: _buildTextField3(
//   //                     label: 'Postal Code',
//   //                     hintText: '400001',
//   //                     controller: pinCodeController),
//   //               ),
//   //               const SizedBox(width: 16),
//   //               // Expanded(
//   //               //   child: _buildTextField3(label: 'Country', hintText: 'India'),
//   //               // ),
//   //             ],
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   Future<void> _saveAdditionalInfo() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     await prefs.setString('addressLine1', addressLine1Controller.text);
//     await prefs.setString('addressLine2', addressLine2Controller.text);
//     await prefs.setString('cityOrVillage', cityOrVillageController.text);
//     await prefs.setString('state', stateController.text);
//     await prefs.setString('pinCode', pinCodeController.text);
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Address updated successfully!')),
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
//             _buildTextField3(
//                 label: 'Address Line 1',
//                 hintText: '123 Main Street',
//                 controller: addressLine1Controller),
//             const SizedBox(height: 16),
//             _buildTextField3(
//                 label: 'Address Line 2',
//                 hintText: 'Apt 4B',
//                 controller: addressLine2Controller),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildTextField3(
//                       label: 'City',
//                       hintText: 'Mumbai',
//                       controller: cityOrVillageController),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: _buildTextField3(
//                       label: 'State',
//                       hintText: 'Maharashtra',
//                       controller: stateController),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildTextField3(
//                       label: 'Postal Code',
//                       hintText: '400001',
//                       controller: pinCodeController),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _saveProfileData,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Background color of the button
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 13.0), // Custom padding
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8), // Rounded corners
//                 ),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'Save',
//                   style: TextStyle(
//                       fontSize: 16, color: Colors.white), // Text color
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _saveGovernmentIdsData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     await prefs.setString('voterId', voterIdController.text);
//     await prefs.setString('aadhaarNumber', aadhaarController.text);
//     await prefs.setString('voterFrontFile', voterFrontFilePath ?? '');
//     await prefs.setString('voterBackFile', voterBackFilePath ?? '');
//     await prefs.setString('aadhaarFrontFile', aadhaarFrontFilePath ?? '');
//     await prefs.setString('aadhaarBackFile', aadhaarBackFilePath ?? '');
//
//     // Debug prints to verify the saved data
//     print('Saved Voter ID: ${voterIdController.text}');
//     print('Saved Aadhaar Number: ${aadhaarController.text}');
//     print('Saved Voter Front file path: $voterFrontFilePath');
//     print('Saved Voter Back file path: $voterBackFilePath');
//     print('Saved Aadhaar Front file path: $aadhaarFrontFilePath');
//     print('Saved Aadhaar Back file path: $aadhaarBackFilePath');
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Government IDs updated successfully!')),
//     );
//   }
//
//   // Widget _buildGovernmentIdsSection() {
//   //   return Card(
//   //     shape: RoundedRectangleBorder(
//   //       borderRadius: BorderRadius.circular(12.0),
//   //     ),
//   //     elevation: 2.0,
//   //     child: Padding(
//   //       padding: const EdgeInsets.all(16.0),
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: [
//   //           const Text(
//   //             'Government IDs',
//   //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//   //           ),
//   //           const SizedBox(height: 8),
//   //           const Text(
//   //             "Update your Voter ID and Aadhaar number.",
//   //             style: TextStyle(color: Colors.grey),
//   //           ),
//   //           const SizedBox(height: 16),
//   //           _buildTextField(label: 'Voter ID Number', hintText: 'BTC390831'),
//   //           const SizedBox(height: 8),
//   //           ElevatedButton(
//   //             onPressed: () async {
//   //               // Handle Voter Front upload
//   //               final result = await FilePicker.platform.pickFiles(
//   //                 type: FileType.custom,
//   //                 allowedExtensions: ['jpg', 'png', 'pdf'], // File types
//   //               );
//   //               if (result != null) {
//   //                 String filePath = result.files.single.path!;
//   //                 print("Selected Voter Front file: $filePath");
//   //               }
//   //             },
//   //             style: ElevatedButton.styleFrom(
//   //               backgroundColor: Colors.grey,
//   //               shape: RoundedRectangleBorder(
//   //                 borderRadius: BorderRadius.circular(12.0), // Rounded corners
//   //               ),
//   //             ),
//   //             child: const Text(
//   //               'Upload Voter Front',
//   //               style: TextStyle(color: Colors.white),
//   //             ),
//   //           ),
//   //           const SizedBox(height: 8),
//   //           ElevatedButton(
//   //             onPressed: () async {
//   //               // Handle Voter Back upload
//   //               final result = await FilePicker.platform.pickFiles(
//   //                 type: FileType.custom,
//   //                 allowedExtensions: ['jpg', 'png', 'pdf'], // File types
//   //               );
//   //               if (result != null) {
//   //                 String filePath = result.files.single.path!;
//   //                 print("Selected Voter Back file: $filePath");
//   //               }
//   //             },
//   //             style: ElevatedButton.styleFrom(
//   //               backgroundColor: Colors.grey,
//   //               shape: RoundedRectangleBorder(
//   //                 borderRadius: BorderRadius.circular(12.0), // Rounded corners
//   //               ),
//   //             ),
//   //             child: const Text(
//   //               'Upload Voter Back',
//   //               style: TextStyle(color: Colors.white),
//   //             ),
//   //           ),
//   //           const SizedBox(height: 16),
//   //           _buildTextField(
//   //               label: 'Aadhaar Number', hintText: '4980 2961 2316'),
//   //           const SizedBox(height: 8),
//   //           ElevatedButton(
//   //             onPressed: () async {
//   //               // Handle Aadhaar Front upload
//   //               final result = await FilePicker.platform.pickFiles(
//   //                 type: FileType.custom,
//   //                 allowedExtensions: ['jpg', 'png', 'pdf'], // File types
//   //               );
//   //               if (result != null) {
//   //                 String filePath = result.files.single.path!;
//   //                 print("Selected Aadhaar Front file: $filePath");
//   //               }
//   //             },
//   //             style: ElevatedButton.styleFrom(
//   //               backgroundColor: Colors.grey,
//   //               shape: RoundedRectangleBorder(
//   //                 borderRadius: BorderRadius.circular(12.0), // Rounded corners
//   //               ),
//   //             ),
//   //             child: const Text(
//   //               'Upload Aadhaar Front',
//   //               style: TextStyle(color: Colors.white),
//   //             ),
//   //           ),
//   //           const SizedBox(height: 8),
//   //           ElevatedButton(
//   //             onPressed: () async {
//   //               // Handle Aadhaar Back upload
//   //               final result = await FilePicker.platform.pickFiles(
//   //                 type: FileType.custom,
//   //                 allowedExtensions: ['jpg', 'png', 'pdf'], // File types
//   //               );
//   //               if (result != null) {
//   //                 String filePath = result.files.single.path!;
//   //                 print("Selected Aadhaar Back file: $filePath");
//   //               }
//   //             },
//   //             style: ElevatedButton.styleFrom(
//   //               backgroundColor: Colors.grey,
//   //               shape: RoundedRectangleBorder(
//   //                 borderRadius: BorderRadius.circular(12.0), // Rounded corners
//   //               ),
//   //             ),
//   //             child: const Text(
//   //               'Upload Aadhaar Back',
//   //               style: TextStyle(color: Colors.white),
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
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
//             _buildTextField4(
//                 label: 'Voter ID Number',
//                 hintText: 'BTC390831',
//                 controller: voterIdController),
//             const SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: () async {
//                 // Handle Voter Front upload
//                 final result = await FilePicker.platform.pickFiles(
//                   type: FileType.custom,
//                   allowedExtensions: ['jpg', 'png', 'pdf'], // File types
//                 );
//                 if (result != null) {
//                   setState(() {
//                     voterFrontFilePath = result.files.single.path!;
//                   });
//                   print("Selected Voter Front file: $voterFrontFilePath");
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
//                   setState(() {
//                     voterBackFilePath = result.files.single.path!;
//                   });
//                   print("Selected Voter Back file: $voterBackFilePath");
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
//             _buildTextField4(
//                 label: 'Aadhaar Number',
//                 hintText: '4980 2961 2316',
//                 controller: aadhaarController),
//             const SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: () async {
//                 // Handle Aadhaar Front upload
//                 final result = await FilePicker.platform.pickFiles(
//                   type: FileType.custom,
//                   allowedExtensions: ['jpg', 'png', 'pdf'], // File types
//                 );
//                 if (result != null) {
//                   setState(() {
//                     aadhaarFrontFilePath = result.files.single.path!;
//                   });
//                   print("Selected Aadhaar Front file: $aadhaarFrontFilePath");
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
//                   setState(() {
//                     aadhaarBackFilePath = result.files.single.path!;
//                   });
//                   print("Selected Aadhaar Back file: $aadhaarBackFilePath");
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
//   Widget _buildTextField4({
//     required String label,
//     required String hintText,
//     required TextEditingController controller,
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
//                 const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//             // Reduced vertical padding
//             border: OutlineInputBorder(
//               borderSide: BorderSide.none, // No visible border
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// Widget _buildTextField({
//   required String label,
//   required String hintText,
//   int maxLines = 1,
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         label,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 14,
//         ),
//       ),
//       const SizedBox(height: 8),
//       TextField(
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.grey),
//           filled: true,
//           fillColor: Colors.grey.shade400,
//           // Background color for the text field
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//           // Reduced vertical padding
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none, // No visible border
//           ),
//         ),
//       ),
//     ],
//   );
// }
//
// Widget _buildNotificationSwitch({
//   required String title,
//   required String subtitle,
//   required bool value,
//   required ValueChanged<bool> onChanged,
// }) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               subtitle,
//               style: const TextStyle(color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//       Switch(
//         value: value,
//         onChanged: onChanged, // Trigger the state update
//       ),
//     ],
//   );
// }

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _role = ''; // Variable to store the role

  //names
  late TextEditingController firstNameController;
  late TextEditingController middleNameController;
  late TextEditingController lastNameController;
  late TextEditingController dateOfBirthController;
  late TextEditingController ageController;
  late TextEditingController genderController;

  //address
  late TextEditingController addressLine1Controller;
  late TextEditingController addressLine2Controller;
  late TextEditingController cityOrVillageController;
  late TextEditingController stateController;
  late TextEditingController pinCodeController;

  //files
  late TextEditingController voterIdController;
  late TextEditingController aadhaarController;

  String? voterFrontFilePath;
  String? voterBackFilePath;
  String? aadhaarFrontFilePath;
  String? aadhaarBackFilePath;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    _loadAdditionalInfo();
    voterIdController = TextEditingController();
    aadhaarController = TextEditingController();
    _loadGovernment();
    _loadGovernment();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _role = prefs.getString('role') ?? 'Primary Member';
      //names
      firstNameController =
          TextEditingController(text: prefs.getString('firstName') ?? '');
      middleNameController =
          TextEditingController(text: prefs.getString('middleName') ?? '');
      lastNameController =
          TextEditingController(text: prefs.getString('lastName') ?? '');
      dateOfBirthController =
          TextEditingController(text: prefs.getString('dateOfBirth') ?? '');
      ageController = TextEditingController(text: prefs.getString('age') ?? '');

      // Check if gender is available in SharedPreferences
      String gender = prefs.getString('gender') ?? '';
      print("Fetched gender: $gender");
      genderController = TextEditingController(text: gender);
    });
  }

  Future<void> _loadAdditionalInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      addressLine1Controller =
          TextEditingController(text: prefs.getString('addressLine1') ?? '');
      addressLine2Controller =
          TextEditingController(text: prefs.getString('addressLine2') ?? '');
      cityOrVillageController =
          TextEditingController(text: prefs.getString('city') ?? '');
      stateController =
          TextEditingController(text: prefs.getString('state') ?? '');
      pinCodeController =
          TextEditingController(text: prefs.getString('pinCode') ?? '');
    });
  }

  Future<void> _loadGovernment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      voterIdController =
          TextEditingController(text: prefs.getString('voterId') ?? '');
      voterFrontFilePath = prefs.getString('voterFront') ?? '';
      voterBackFilePath = prefs.getString('voterBack') ?? '';
      aadhaarController =
          TextEditingController(text: prefs.getString('aadhaarNumber') ?? '');
      aadhaarFrontFilePath = prefs.getString('aadhaarFront') ?? '';
      aadhaarBackFilePath = prefs.getString('aadhaarBack') ?? '';

      // Debug prints
      print('Loaded Voter ID: ${voterIdController.text}');
      print('Loaded Voter Front: $voterFrontFilePath');
      print('Loaded Voter Back: $voterBackFilePath');
      print('Loaded Aadhaar Number: ${aadhaarController.text}');
      print('Loaded Aadhaar Front: $aadhaarFrontFilePath');
      print('Loaded Aadhaar Back: $aadhaarBackFilePath');
    });
  }

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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text(
  //         'Welcome to Profile',
  //         style: TextStyle(fontSize: 18, color: Colors.white),
  //       ),
  //       backgroundColor: Colors.blue,
  //       centerTitle: true,
  //       leading: GestureDetector(
  //         onTap: () {
  //           // Add your functionality for the arrow button here
  //           Navigator.pop(context);
  //         },
  //         child: Padding(
  //           padding: const EdgeInsets.all(10.0), // Adjust padding as needed
  //           child: SvgPicture.asset(
  //             'assets/images/arrow.svg', // Your SVG file path
  //             color: Colors.white, // Color of the arrow (if necessary)
  //             // height: 10.0, // Size of the arrow
  //             // width: 10.0, // Size of the arrow
  //           ),
  //         ),
  //       ),
  //     ),
  //     body: SingleChildScrollView(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           // Profile Picture Section
  //           Row(
  //             children: [
  //               Stack(
  //                 children: [
  //                   CircleAvatar(
  //                     radius: 40,
  //                     backgroundImage: _imagePath != null
  //                         ? FileImage(File(_imagePath!))
  //                         : const AssetImage('assets/images/s1.png')
  //                             as ImageProvider, // Default image if none is selected
  //                   ),
  //                   Positioned(
  //                     bottom: 0,
  //                     right: 0,
  //                     child: GestureDetector(
  //                       onTap: _pickImage,
  //                       child: Container(
  //                         decoration: const BoxDecoration(
  //                           color: Colors.black,
  //                           shape: BoxShape.circle,
  //                         ),
  //                         padding: const EdgeInsets.all(5),
  //                         child: const Icon(
  //                           Icons.camera_alt,
  //                           color: Colors.white,
  //                           size: 16,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(width: 20),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   // Display the first name and last name dynamically
  //                   Text(
  //                     '${firstNameController.text} ${lastNameController.text}',
  //                     style: const TextStyle(
  //                         fontSize: 20, fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     _role,
  //                     style: TextStyle(
  //                         color: Colors.grey,
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.normal),
  //                   ),
  //                   // Optional: Display additional information
  //                   // Text(
  //                   //   'Primary Member',
  //                   //   style: TextStyle(color: Colors.grey),
  //                   // ),
  //                 ],
  //               ),
  //             ],
  //           ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(240, 240, 240, 240),
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
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture Section
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
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
            ),
            const SizedBox(height: 5),
            // Display the first name and last name
            Text(
              '${firstNameController.text} ${lastNameController.text}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            // Display the role
            Text(
              _role,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            // Profile Information Section in a Card
            _buildProfileInfoSection(),
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

  Widget _buildProfileInfoSection() {
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
              'Profile Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Update your account's profile information.",
              style: TextStyle(),
            ),
            const SizedBox(height: 16),
            _buildTextField2(
                label: 'First Name', controller: firstNameController),
            const SizedBox(height: 16),
            _buildTextField2(
                label: 'Middle Name', controller: middleNameController),
            const SizedBox(height: 16),
            _buildTextField2(
                label: 'Last Name', controller: lastNameController),
            const SizedBox(height: 16),
            _buildTextField2(
                label: 'Date of Birth', controller: dateOfBirthController),
            const SizedBox(height: 16),
            _buildTextField2(label: 'Age', controller: ageController),
            const SizedBox(height: 16),
            _buildTextField2(
              label: 'Gender',
              controller: genderController,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveProfileData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color of the button
                padding: const EdgeInsets.symmetric(
                    horizontal: 13.0), // Custom padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white), // Text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('firstName', firstNameController.text);
    await prefs.setString('middleName', middleNameController.text);
    await prefs.setString('lastName', lastNameController.text);
    await prefs.setString('dateOfBirth', dateOfBirthController.text);
    await prefs.setString('age', ageController.text);
    await prefs.setString(
        'gender', genderController.text); // Save gender properly

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  // Widget _buildTextField2({
  //   required String label,
  //   required TextEditingController controller,
  // }) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         label,
  //         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  //       ),
  //       const SizedBox(height: 8),
  //       TextFormField(
  //         controller: controller,
  //         decoration: const InputDecoration(
  //           border: OutlineInputBorder(),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildTextField2({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    String? hintText,
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
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade400,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none, // No visible border
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField3({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    String? hintText,
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
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade400,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none, // No visible border
            ),
          ),
        ),
      ],
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
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

  // Widget _buildAdditionalInfoSection() {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(12.0),
  //     ),
  //     elevation: 2.0,
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const Text(
  //             'Additional Information',
  //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(height: 5),
  //           const Text(
  //             "Update your current residential address.",
  //             style: TextStyle(
  //               color: Colors.grey,
  //             ),
  //           ),
  //           const SizedBox(height: 16),
  //           _buildTextField3(
  //               label: 'Address Line 1',
  //               hintText: '123 Main Street',
  //               controller: addressLine1Controller),
  //           const SizedBox(height: 16),
  //           _buildTextField3(
  //               label: 'Address Line 2',
  //               hintText: '123 Main Street',
  //               controller: addressLine2Controller),
  //           const SizedBox(height: 16),
  //           Row(
  //             children: [
  //               Expanded(
  //                 child: _buildTextField3(
  //                     label: 'City',
  //                     hintText: 'Mumbai',
  //                     controller: cityOrVillageController),
  //               ),
  //               const SizedBox(width: 16),
  //               Expanded(
  //                 child: _buildTextField3(
  //                     label: 'State',
  //                     hintText: 'Maharashtra',
  //                     controller: stateController),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 16),
  //           Row(
  //             children: [
  //               Expanded(
  //                 child: _buildTextField3(
  //                     label: 'Postal Code',
  //                     hintText: '400001',
  //                     controller: pinCodeController),
  //               ),
  //               const SizedBox(width: 16),
  //               // Expanded(
  //               //   child: _buildTextField3(label: 'Country', hintText: 'India'),
  //               // ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Future<void> _saveAdditionalInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('addressLine1', addressLine1Controller.text);
    await prefs.setString('addressLine2', addressLine2Controller.text);
    await prefs.setString('city', cityOrVillageController.text);
    await prefs.setString('state', stateController.text);
    await prefs.setString('pinCode', pinCodeController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Address updated successfully!')),
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
            _buildTextField3(
                label: 'Address Line 1',
                hintText: '123 Main Street',
                controller: addressLine1Controller),
            const SizedBox(height: 16),
            _buildTextField3(
                label: 'Address Line 2',
                hintText: 'Apt 4B',
                controller: addressLine2Controller),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField3(
                      label: 'City',
                      hintText: 'Mumbai',
                      controller: cityOrVillageController),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField3(
                      label: 'State',
                      hintText: 'Maharashtra',
                      controller: stateController),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField3(
                      label: 'Postal Code',
                      hintText: '400001',
                      controller: pinCodeController),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveAdditionalInfo,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color of the button
                padding: const EdgeInsets.symmetric(
                    horizontal: 13.0), // Custom padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white), // Text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveGovernmentIdsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('voterId', voterIdController.text);
    await prefs.setString('aadhaarNumber', aadhaarController.text);
    await prefs.setString('voterFrontFile', voterFrontFilePath ?? '');
    await prefs.setString('voterBackFile', voterBackFilePath ?? '');
    await prefs.setString('aadhaarFrontFile', aadhaarFrontFilePath ?? '');
    await prefs.setString('aadhaarBackFile', aadhaarBackFilePath ?? '');

    // Debug prints to verify the saved data
    print('Saved Voter ID: ${voterIdController.text}');
    print('Saved Aadhaar Number: ${aadhaarController.text}');
    print('Saved Voter Front file path: $voterFrontFilePath');
    print('Saved Voter Back file path: $voterBackFilePath');
    print('Saved Aadhaar Front file path: $aadhaarFrontFilePath');
    print('Saved Aadhaar Back file path: $aadhaarBackFilePath');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Government IDs updated successfully!')),
    );
  }

  // Widget _buildGovernmentIdsSection() {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(12.0),
  //     ),
  //     elevation: 2.0,
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const Text(
  //             'Government IDs',
  //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(height: 8),
  //           const Text(
  //             "Update your Voter ID and Aadhaar number.",
  //             style: TextStyle(color: Colors.grey),
  //           ),
  //           const SizedBox(height: 16),
  //           _buildTextField(label: 'Voter ID Number', hintText: 'BTC390831'),
  //           const SizedBox(height: 8),
  //           ElevatedButton(
  //             onPressed: () async {
  //               // Handle Voter Front upload
  //               final result = await FilePicker.platform.pickFiles(
  //                 type: FileType.custom,
  //                 allowedExtensions: ['jpg', 'png', 'pdf'], // File types
  //               );
  //               if (result != null) {
  //                 String filePath = result.files.single.path!;
  //                 print("Selected Voter Front file: $filePath");
  //               }
  //             },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.grey,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(12.0), // Rounded corners
  //               ),
  //             ),
  //             child: const Text(
  //               'Upload Voter Front',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //           const SizedBox(height: 8),
  //           ElevatedButton(
  //             onPressed: () async {
  //               // Handle Voter Back upload
  //               final result = await FilePicker.platform.pickFiles(
  //                 type: FileType.custom,
  //                 allowedExtensions: ['jpg', 'png', 'pdf'], // File types
  //               );
  //               if (result != null) {
  //                 String filePath = result.files.single.path!;
  //                 print("Selected Voter Back file: $filePath");
  //               }
  //             },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.grey,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(12.0), // Rounded corners
  //               ),
  //             ),
  //             child: const Text(
  //               'Upload Voter Back',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //           const SizedBox(height: 16),
  //           _buildTextField(
  //               label: 'Aadhaar Number', hintText: '4980 2961 2316'),
  //           const SizedBox(height: 8),
  //           ElevatedButton(
  //             onPressed: () async {
  //               // Handle Aadhaar Front upload
  //               final result = await FilePicker.platform.pickFiles(
  //                 type: FileType.custom,
  //                 allowedExtensions: ['jpg', 'png', 'pdf'], // File types
  //               );
  //               if (result != null) {
  //                 String filePath = result.files.single.path!;
  //                 print("Selected Aadhaar Front file: $filePath");
  //               }
  //             },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.grey,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(12.0), // Rounded corners
  //               ),
  //             ),
  //             child: const Text(
  //               'Upload Aadhaar Front',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //           const SizedBox(height: 8),
  //           ElevatedButton(
  //             onPressed: () async {
  //               // Handle Aadhaar Back upload
  //               final result = await FilePicker.platform.pickFiles(
  //                 type: FileType.custom,
  //                 allowedExtensions: ['jpg', 'png', 'pdf'], // File types
  //               );
  //               if (result != null) {
  //                 String filePath = result.files.single.path!;
  //                 print("Selected Aadhaar Back file: $filePath");
  //               }
  //             },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.grey,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(12.0), // Rounded corners
  //               ),
  //             ),
  //             child: const Text(
  //               'Upload Aadhaar Back',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
            _buildTextField4(
              label: 'Voter ID Number',
              hintText: 'BTC390831',
              controller: voterIdController,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'png', 'pdf'],
                );
                if (result != null) {
                  setState(() {
                    voterFrontFilePath = result.files.single.path!;
                  });
                  print("Selected Voter Front file: $voterFrontFilePath");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              child: const Text(
                'Upload Voter Front',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(voterFrontFilePath != null
                ? path.basename(voterFrontFilePath!)
                : 'No file selected'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'png', 'pdf'],
                );
                if (result != null) {
                  setState(() {
                    voterBackFilePath = result.files.single.path!;
                  });
                  print("Selected Voter Back file: $voterBackFilePath");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              child: const Text(
                'Upload Voter Back',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(
              voterBackFilePath != null
                  ? path.basename(
                      voterBackFilePath!) // Display only the file name
                  : 'No file selected', // Display a message if no file is selected
            ),
            const SizedBox(height: 10),
            _buildTextField4(
              label: 'Aadhaar Number',
              hintText: '4980 2961 2316',
              controller: aadhaarController,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'png', 'pdf'],
                );
                if (result != null) {
                  setState(() {
                    aadhaarFrontFilePath = result.files.single.path!;
                  });
                  print("Selected Aadhaar Front file: $aadhaarFrontFilePath");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              child: const Text(
                'Upload Aadhaar Front',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(aadhaarFrontFilePath != null
                ? path.basename(aadhaarFrontFilePath!)
                : 'No file selected'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'png', 'pdf'],
                );
                if (result != null) {
                  setState(() {
                    aadhaarBackFilePath = result.files.single.path!;
                  });
                  print("Selected Aadhaar Back file: $aadhaarBackFilePath");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              child: const Text(
                'Upload Aadhaar Back',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(aadhaarBackFilePath != null
                ? path.basename(aadhaarBackFilePath!)
                : 'No file selected'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField4({
    required String label,
    required String hintText,
    required TextEditingController controller,
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
          controller: controller,
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
