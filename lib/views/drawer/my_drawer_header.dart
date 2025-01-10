import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  // Variable to hold the selected image
  late ImagePicker _picker;
  XFile? _imageFile; // Store the picked image file

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
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
      padding: EdgeInsets.only(top: 20.0),
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
          Text(
            "Shubham Gupta",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "shubham@gmail.com",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
