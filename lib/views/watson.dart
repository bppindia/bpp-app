// ///latest/////
// ///
// ///
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;

class SignupPage1 extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dobController = TextEditingController();

  File? _aadhaarFront;
  File? _aadhaarBack;
  File? _voterFront;
  File? _voterBack;

  // Store file types
  String? _aadhaarFrontType;
  String? _aadhaarBackType;
  String? _voterFrontType;
  String? _voterBackType;

  final List<String> _supportedImageTypes = ['jpg', 'jpeg', 'png'];
  final List<String> _supportedDocTypes = ['pdf'];

  Future<void> _pickFile(
      void Function(File?, String?) setFile, bool allowPdf) async {
    try {
      // Show dialog for choosing between camera, gallery, or file
      final choice = await showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Choose upload method'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take Photo'),
                onTap: () => Navigator.pop(context, 'camera'),
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () => Navigator.pop(context, 'gallery'),
              ),
              if (allowPdf)
                ListTile(
                  leading: Icon(Icons.file_present),
                  title: Text('Upload PDF'),
                  onTap: () => Navigator.pop(context, 'file'),
                ),
            ],
          ),
        ),
      );

      if (choice == null) return;

      File? selectedFile;
      String? fileType;

      switch (choice) {
        case 'camera':
          final pickedFile =
              await ImagePicker().pickImage(source: ImageSource.camera);
          if (pickedFile != null) {
            selectedFile = File(pickedFile.path);
            fileType = 'jpg';
          }
          break;

        case 'gallery':
          final pickedFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            selectedFile = File(pickedFile.path);
            fileType = path
                .extension(pickedFile.path)
                .toLowerCase()
                .replaceAll('.', '');
          }
          break;

        case 'file':
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['pdf'],
          );
          if (result != null) {
            selectedFile = File(result.files.single.path!);
            fileType = 'pdf';
          }
          break;
      }

      if (selectedFile != null && fileType != null) {
        if (_supportedImageTypes.contains(fileType) ||
            (allowPdf && _supportedDocTypes.contains(fileType))) {
          setState(() {
            setFile(selectedFile, fileType);
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Unsupported file type. Please use JPG, PNG, or PDF.')),
          );
        }
      }
    } catch (e) {
      print('Error picking file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error selecting file. Please try again.')),
      );
    }
  }

  Future<void> _submitData() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.bppindia.com:8443/api/v1/signup'),
      );

      request.fields['dateOfBirth'] = _dobController.text;

      // Helper function to add file to request
      Future<void> addFileToRequest(
          File? file, String? fileType, String fieldName) async {
        if (file != null) {
          print('Uploading $fieldName: ${file.path}');
          request.files.add(await http.MultipartFile.fromPath(
            fieldName,
            file.path,
            filename:
                '${fieldName}_${DateTime.now().millisecondsSinceEpoch}.$fileType',
          ));
        }
      }

      await addFileToRequest(_aadhaarFront, _aadhaarFrontType, 'aadhaarFront');
      await addFileToRequest(_aadhaarBack, _aadhaarBackType, 'aadhaarBack');
      await addFileToRequest(_voterFront, _voterFrontType, 'voterFront');
      await addFileToRequest(_voterBack, _voterBackType, 'voterBack');

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print('Response status: ${response.statusCode}');
      print('Response body: $responseBody');

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup successful!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup failed: $responseBody')),
        );
      }
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }
  }

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _dobController,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    hintText: 'YYYY-MM-DD',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Text('Upload Documents:'),
                SizedBox(height: 8),
                _buildFileUploadSection(
                  'Aadhaar Front',
                  _aadhaarFront,
                  _aadhaarFrontType,
                  (file, type) {
                    _aadhaarFront = file;
                    _aadhaarFrontType = type;
                  },
                ),
                _buildFileUploadSection(
                  'Aadhaar Back',
                  _aadhaarBack,
                  _aadhaarBackType,
                  (file, type) {
                    _aadhaarBack = file;
                    _aadhaarBackType = type;
                  },
                ),
                _buildFileUploadSection(
                  'Voter Front',
                  _voterFront,
                  _voterFrontType,
                  (file, type) {
                    _voterFront = file;
                    _voterFrontType = type;
                  },
                ),
                _buildFileUploadSection(
                  'Voter Back',
                  _voterBack,
                  _voterBackType,
                  (file, type) {
                    _voterBack = file;
                    _voterBackType = type;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitData,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFileUploadSection(
    String label,
    File? file,
    String? fileType,
    void Function(File?, String?) setFile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => _pickFile((file, type) => setFile(file, type), true),
          child: Text('Upload Document'),
        ),
        if (file != null) ...[
          SizedBox(height: 8),
          Row(
            children: [
              if (fileType == 'pdf')
                Icon(Icons.picture_as_pdf, size: 50)
              else
                Image.file(
                  file,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              SizedBox(width: 8),
              Text('File type: ${fileType?.toUpperCase()}'),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => setState(() => setFile(null, null)),
              ),
            ],
          ),
        ],
        SizedBox(height: 16),
      ],
    );
  }
}

// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart' as path;
// import 'package:http_parser/http_parser.dart';
//
// class ApiService {
//   static const String baseUrl = "https://api.bppindia.com:8443/api/v1/signup";
//
//   static Future<Map<String, dynamic>> postData(
//       Map<String, dynamic> data, List<File> files) async {
//     try {
//       var uri = Uri.parse(baseUrl);
//       var request = http.MultipartRequest('POST', uri);
//
//       data.forEach((key, value) {
//         if (value != null) {
//           request.fields[key] = value.toString();
//         }
//       });
//
//       if (files.isNotEmpty) {
//         for (var file in files) {
//           var fileBytes = await file.readAsBytes();
//           var fileName = file.path.split('/').last;
//           request.files.add(http.MultipartFile.fromBytes(
//             'file',
//             fileBytes,
//             filename: fileName,
//             contentType: MediaType('image', 'jpeg'),
//           ));
//         }
//       }
//
//       var response = await request.send();
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var responseBody = await response.stream.bytesToString();
//         return jsonDecode(responseBody);
//       } else {
//         print("Error Status Code: ${response.statusCode}");
//         var responseBody = await response.stream.bytesToString();
//         print("Error Response Body: $responseBody");
//         throw Exception('Failed to post data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Exception: $e");
//       throw Exception('Error: $e');
//     }
//   }
//
//   static Future<void> submitDataFromAllScreens({
//     required String qualification,
//     required String profession,
//     required String position,
//     required String password,
//     required String firstName,
//     required String lastName,
//     required String title,
//     required String email,
//     required String middleName,
//     required String phone,
//     required String dob,
//     required String gender,
//     required String addressLine1,
//     required String addressLine2,
//     required String cityOrVillage,
//     required String state,
//     required String pincode,
//     required String district,
//     required String taluka,
//     required String referralCode,
//     required String aadhaarNumber,
//     required String voterId,
//     required String age,
//     required List<File> files,
//   }) async {
//     Map<String, dynamic> data = {
//       'qualification': qualification,
//       'profession': profession,
//       'position': position,
//       'password': password,
//       'middleName': middleName.isEmpty ? null : middleName,
//       'firstName': firstName,
//       'lastName': lastName,
//       'title': title,
//       'age': age,
//       'email': email,
//       'gender': gender,
//       'phone': phone,
//       'dateOfBirth': dob,
//       'addressLine1': addressLine1,
//       'addressLine2': addressLine2,
//       'cityOrVillage': cityOrVillage,
//       'state': state,
//       'pincode': pincode,
//       'district': district,
//       'taluka': taluka,
//       'referralCode': referralCode.isEmpty ? null : referralCode,
//       'voterId': voterId,
//       'aadhaarNumber': aadhaarNumber,
//     };
//
//     print('Payload being sent: $data');
//     await postData(data, files);
//   }
// }
//
// class SignupPage extends StatefulWidget {
//   @override
//   _SignupPageState createState() => _SignupPageState();
// }
//
// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _dobController = TextEditingController();
//
//   // Add controllers for all required fields
//   final TextEditingController _qualificationController =
//       TextEditingController();
//   final TextEditingController _professionController = TextEditingController();
//   final TextEditingController _positionController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _middleNameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   final TextEditingController _addressLine1Controller = TextEditingController();
//   final TextEditingController _addressLine2Controller = TextEditingController();
//   final TextEditingController _cityController = TextEditingController();
//   final TextEditingController _stateController = TextEditingController();
//   final TextEditingController _pincodeController = TextEditingController();
//   final TextEditingController _districtController = TextEditingController();
//   final TextEditingController _talukaController = TextEditingController();
//   final TextEditingController _referralCodeController = TextEditingController();
//   final TextEditingController _aadhaarNumberController =
//       TextEditingController();
//   final TextEditingController _voterIdController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//
//   File? _aadhaarFront;
//   File? _aadhaarBack;
//   File? _voterFront;
//   File? _voterBack;
//
//   String? _aadhaarFrontType;
//   String? _aadhaarBackType;
//   String? _voterFrontType;
//   String? _voterBackType;
//
//   final List<String> _supportedImageTypes = ['jpg', 'jpeg', 'png'];
//   final List<String> _supportedDocTypes = ['pdf'];
//
//   Future<void> _pickFile(
//       void Function(File?, String?) setFile, bool allowPdf) async {
//     // ... (keeping the existing _pickFile implementation)
//   }
//
//   Future<void> _submitData() async {
//     if (!_formKey.currentState!.validate()) return;
//
//     try {
//       List<File> files = [];
//       if (_aadhaarFront != null) files.add(_aadhaarFront!);
//       if (_aadhaarBack != null) files.add(_aadhaarBack!);
//       if (_voterFront != null) files.add(_voterFront!);
//       if (_voterBack != null) files.add(_voterBack!);
//
//       await ApiService.submitDataFromAllScreens(
//         qualification: _qualificationController.text,
//         profession: _professionController.text,
//         position: _positionController.text,
//         password: _passwordController.text,
//         firstName: _firstNameController.text,
//         lastName: _lastNameController.text,
//         title: _titleController.text,
//         email: _emailController.text,
//         middleName: _middleNameController.text,
//         phone: _phoneController.text,
//         dob: _dobController.text,
//         gender: _genderController.text,
//         addressLine1: _addressLine1Controller.text,
//         addressLine2: _addressLine2Controller.text,
//         cityOrVillage: _cityController.text,
//         state: _stateController.text,
//         pincode: _pincodeController.text,
//         district: _districtController.text,
//         taluka: _talukaController.text,
//         referralCode: _referralCodeController.text,
//         aadhaarNumber: _aadhaarNumberController.text,
//         voterId: _voterIdController.text,
//         age: _ageController.text,
//         files: files,
//       );
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Signup successful!')),
//       );
//     } catch (error) {
//       print('Error: $error');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred. Please try again.')),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose all controllers
//     _dobController.dispose();
//     _qualificationController.dispose();
//     _professionController.dispose();
//     _positionController.dispose();
//     _passwordController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _titleController.dispose();
//     _emailController.dispose();
//     _middleNameController.dispose();
//     _phoneController.dispose();
//     _genderController.dispose();
//     _addressLine1Controller.dispose();
//     _addressLine2Controller.dispose();
//     _cityController.dispose();
//     _stateController.dispose();
//     _pincodeController.dispose();
//     _districtController.dispose();
//     _talukaController.dispose();
//     _referralCodeController.dispose();
//     _aadhaarNumberController.dispose();
//     _voterIdController.dispose();
//     _ageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Signup'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Add TextFormFields for all the required fields
//                 TextFormField(
//                   controller: _qualificationController,
//                   decoration: InputDecoration(labelText: 'Qualification'),
//                   validator: (value) =>
//                       value?.isEmpty ?? true ? 'Required' : null,
//                 ),
//                 // Add all other TextFormFields similarly...
//
//                 TextFormField(
//                   controller: _dobController,
//                   decoration: InputDecoration(
//                     labelText: 'Date of Birth',
//                     hintText: 'YYYY-MM-DD',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your date of birth';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 Text('Upload Documents:'),
//                 SizedBox(height: 8),
//                 _buildFileUploadSection(
//                   'Aadhaar Front',
//                   _aadhaarFront,
//                   _aadhaarFrontType,
//                   (file, type) {
//                     _aadhaarFront = file;
//                     _aadhaarFrontType = type;
//                   },
//                 ),
//                 _buildFileUploadSection(
//                   'Aadhaar Back',
//                   _aadhaarBack,
//                   _aadhaarBackType,
//                   (file, type) {
//                     _aadhaarBack = file;
//                     _aadhaarBackType = type;
//                   },
//                 ),
//                 _buildFileUploadSection(
//                   'Voter Front',
//                   _voterFront,
//                   _voterFrontType,
//                   (file, type) {
//                     _voterFront = file;
//                     _voterFrontType = type;
//                   },
//                 ),
//                 _buildFileUploadSection(
//                   'Voter Back',
//                   _voterBack,
//                   _voterBackType,
//                   (file, type) {
//                     _voterBack = file;
//                     _voterBackType = type;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: _submitData,
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildFileUploadSection(
//     String label,
//     File? file,
//     String? fileType,
//     void Function(File?, String?) setFile,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label),
//         SizedBox(height: 8),
//         ElevatedButton(
//           onPressed: () => _pickFile((file, type) => setFile(file, type), true),
//           child: Text('Upload Document'),
//         ),
//         if (file != null) ...[
//           SizedBox(height: 8),
//           Row(
//             children: [
//               if (fileType == 'pdf')
//                 Icon(Icons.picture_as_pdf, size: 50)
//               else
//                 Image.file(
//                   file,
//                   height: 100,
//                   width: 100,
//                   fit: BoxFit.cover,
//                 ),
//               SizedBox(width: 8),
//               Text('File type: ${fileType?.toUpperCase()}'),
//               IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () => setState(() => setFile(null, null)),
//               ),
//             ],
//           ),
//         ],
//         SizedBox(height: 16),
//       ],
//     );
//   }
// }
