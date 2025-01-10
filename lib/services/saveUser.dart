import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRegistrationPage extends StatefulWidget {
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String qualification;
  final String profession;
  final String position;
  final String pincode;
  final String dateOfBirth;
  final String age;
  final String gender;
  final String phone;
  final String taluka;
  final String district;
  final String addressLine1;
  final String addressLine2;
  final String cityOrVillage;
  final String state;
  final String aadhaarNumber;
  final String voterId;
  final List<Uint8List?> files;
  final String aadhaarBack;
  final String aadhaarFront;
  final String voterFront;
  final String voterBack;

  UserRegistrationPage({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.addressLine1,
    required this.addressLine2,
    required this.cityOrVillage,
    required this.state,
    required this.gender,
    required this.dateOfBirth,
    required this.aadhaarNumber,
    required this.voterId,
    // required this.middleName,
    required this.qualification,
    required this.profession,
    required this.position,
    required this.pincode,
    required this.age,
    required this.taluka,
    required this.district,
    required this.files,
    required this.aadhaarBack,
    required this.aadhaarFront,
    required this.voterFront,
    required this.voterBack,
  });

  @override
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  bool hasAadhaarDetails = false;
  bool hasVoterDetails = false;

  @override
  void initState() {
    super.initState();
    // Check if Aadhaar or Voter details are available
    hasAadhaarDetails = widget.aadhaarNumber.isNotEmpty;
    hasVoterDetails = widget.voterId.isNotEmpty;
  }

  Future<void> saveUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save basic user details
    prefs.setString('firstName', widget.firstName);
    prefs.setString('lastName', widget.lastName);
    prefs.setString('email', widget.email);
    prefs.setString('phone', widget.phone);
    prefs.setString('addressLine1', widget.addressLine1);
    prefs.setString('addressLine2', widget.addressLine2);
    prefs.setString('cityOrVillage', widget.cityOrVillage);
    prefs.setString('state', widget.state);
    prefs.setString('gender', widget.gender);
    prefs.setString('dateOfBirth', widget.dateOfBirth);
    prefs.setString('middleName', widget.middleName);
    prefs.setString('pincode', widget.pincode);
    prefs.setString('taluka', widget.taluka);
    prefs.setString('aadhaarNumber', widget.aadhaarNumber);
    prefs.setString('aadhaarFront', widget.aadhaarFront);
    prefs.setString('aadhaarBack', widget.aadhaarBack);
    prefs.setString('voterId', widget.voterId);
    prefs.setString('voterFront', widget.voterFront);
    prefs.setString('voterBack', widget.voterBack);
    prefs.setString('qualification', widget.qualification);
    prefs.setString('profession', widget.profession);
    prefs.setString('position', widget.position);

    print("User data saved locally.");
  }

  Future<Map<String, String>> fetchUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return {
      'firstName': prefs.getString('firstName') ?? '',
      'lastName': prefs.getString('lastName') ?? '',
      'email': prefs.getString('email') ?? '',
      'phone': prefs.getString('phone') ?? '',
      'addressLine1': prefs.getString('addressLine1') ?? '',
      'addressLine2': prefs.getString('addressLine2') ?? '',
      'cityOrVillage': prefs.getString('cityOrVillage') ?? '',
      'state': prefs.getString('state') ?? '',
      'taluka': prefs.getString('taluka') ?? '',
      'pincode': prefs.getString('pincode') ?? '',
      'gender': prefs.getString('gender') ?? '',
      'dateOfBirth': prefs.getString('dateOfBirth') ?? '',
      'aadhaarNumber': prefs.getString('aadhaarNumber') ?? '',
      'voterId': prefs.getString('voterId') ?? '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Registration')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await saveUserData(); // Save data locally
            final userData = await fetchUserData(); // Fetch saved data
            print("Fetched User Data: $userData"); // Display fetched data
          },
          child: const Text('Save and Fetch User Data'),
        ),
      ),
    );
  }
}
