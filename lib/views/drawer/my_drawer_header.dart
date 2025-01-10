// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class MyHeaderDrawer extends StatefulWidget {
//   @override
//   _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
// }
//
// class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
//   // Variable to hold the selected image
//   late ImagePicker _picker;
//   XFile? _imageFile; // Store the picked image file
//
//   @override
//   void initState() {
//     super.initState();
//     _picker = ImagePicker();
//   }
//
//   // Method to pick an image
//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = pickedFile; // Store the selected image file
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       width: double.infinity,
//       height: 200,
//       padding: EdgeInsets.only(top: 20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Stack(
//             alignment:
//                 Alignment.bottomRight, // Align the icon at the bottom right
//             children: [
//               // Profile image
//               CircleAvatar(
//                 radius: 43,
//                 backgroundImage: _imageFile != null
//                     ? FileImage(
//                         File(_imageFile!.path)) // Use the path from _imageFile
//                     : const AssetImage('assets/images/s1.png')
//                         as ImageProvider, // Default image if none is selected
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: GestureDetector(
//                   onTap: _pickImage, // Pick image on tap
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                     ),
//                     padding: const EdgeInsets.all(5),
//                     child: const Icon(
//                       Icons.camera_alt,
//                       color: Colors.white,
//                       size: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             "Shubham Gupta",
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//           Text(
//             "shubham@gmail.com",
//             style: TextStyle(
//               color: Colors.grey[200],
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';
import 'dart:convert'; // For JSON decoding
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  late TextEditingController firstNameController;
  // late TextEditingController middleNameController;
  late TextEditingController lastNameController;

  // Variable to hold the selected image
  late ImagePicker _picker;
  XFile? _imageFile; // Store the picked image file

  // Variable to hold the email
  String email = '';

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
    _loadProfileData(); // Load profile data from shared preferences
  }

  // Method to load profile data from SharedPreferences
  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      firstNameController =
          TextEditingController(text: prefs.getString('firstName') ?? '');
      // middleNameController =
      //     TextEditingController(text: prefs.getString('middleName') ?? '');
      lastNameController =
          TextEditingController(text: prefs.getString('lastName') ?? '');
      email = prefs.getString('email') ?? ''; // Fetch the email if it exists
    });
  }

  // Method to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile; // Store the selected image file
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment:
                Alignment.bottomRight, // Align the icon at the bottom right
            children: [
              // Profile image
              CircleAvatar(
                radius: 43,
                backgroundImage: _imageFile != null
                    ? FileImage(
                        File(_imageFile!.path)) // Use the path from _imageFile
                    : const AssetImage('assets/images/s1.png')
                        as ImageProvider, // Default image if none is selected
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _pickImage, // Pick image on tap
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
          SizedBox(height: 5),
          // Display the dynamically loaded name (firstName, middleName, lastName)
          Text(
            '${firstNameController.text}  ${lastNameController.text}',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          // Display email dynamically
          // Text(
          //   email,
          //   style: TextStyle(
          //     color: Colors.grey[200],
          //     fontSize: 14,
          //   ),
          // ),
        ],
      ),
    );
  }
}
