

// import 'dart:io';
//
// import 'package:bpp_frontend/services/signup.dart';
// import 'package:bpp_frontend/views/login_screen_view.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import '../../../controller/screens/dashbaord_screen.dart';
// import '../../../controller/screens/screen_dashbaord.dart';
//
// import 'package:path/path.dart' as path;
// import 'package:http/http.dart' as http;
//
// class RegistrationPage extends StatefulWidget {
//   const RegistrationPage({Key? key}) : super(key: key);
//
//   @override
//   State<RegistrationPage> createState() => _RegistrationPageState();
// }
//
// class _RegistrationPageState extends State<RegistrationPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _middleNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//
//   String? validateName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return '*';
//     }
//     if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
//       return 'Please enter a valid name';
//     }
//     return null;
//   }
//
//   String? validatePhone(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Phone number is required';
//     }
//     if (!RegExp(r'^\+91[0-9]{10}$').hasMatch(value)) {
//       return 'Please enter a valid phone number starting with +91';
//     }
//     return null;
//   }
//
//   String? validateDateOfBirth(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Date of Birth is required';
//     }
//     if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
//       return 'Please enter a valid date (yyyy-MM-dd)';
//     }
//     return null;
//   }
//
//   String? validateAge(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Age is required';
//     }
//     final age = int.tryParse(value);
//     if (age == null || age <= 0 || age > 120) {
//       return 'Please enter a valid age between 1 and 120';
//     }
//     return null;
//   }
//
//   String? validateGender(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Gender is required';
//     }
//     if (!['Male', 'Female', 'Other'].contains(value)) {
//       return 'Please select a valid gender';
//     }
//     return null;
//   }
//
//   String? validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter an email address';
//     }
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (!emailRegex.hasMatch(value)) {
//       return 'Please enter a valid email address';
//     }
//     return null;
//   }
//
//   // RegistrationPage mein _submitForm() method mein:
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       final Map<String, String> personalData = {
//         'title': _titleController.text,
//         'firstName': _firstNameController.text,
//         'middleName': _middleNameController.text,
//         'lastName': _lastNameController.text,
//         'dateOfBirth': _dateController.text,
//         'email': _emailController.text,
//         'age': _ageController.text,
//         'gender': _genderController.text,
//         'phoneNumber': _phoneController.text,
//       };
//
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AddressFormScreen(
//             personalData: personalData,
//             addressData: {},
//             qualificationData: {},
//             documentsData: {},
//           ),
//         ),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     _titleController.dispose();
//     _firstNameController.dispose();
//     _middleNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _dateController.dispose();
//     _ageController.dispose();
//     _phoneController.dispose();
//     _genderController.dispose();
//     super.dispose();
//   }
//
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.width > 600;
//     final isDesktop = size.width > 1200;
//
//     final horizontalPadding = size.width *
//         (isDesktop
//             ? 0.2
//             : isTablet
//                 ? 0.1
//                 : 0.05);
//     final containerWidth = isDesktop ? 1000.0 : size.width;
//     final logoSize = size.width *
//         (isDesktop
//             ? 0.15
//             : isTablet
//                 ? 0.2
//                 : 0.26);
//     final titleFontSize = size.width *
//         (isDesktop
//             ? 0.02
//             : isTablet
//                 ? 0.06
//                 : 0.06);
//     final labelFontSize = size.width *
//         (isDesktop
//             ? 0.012
//             : isTablet
//                 ? 0.015
//                 : 0.035);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(
//               horizontal: horizontalPadding,
//               vertical: size.height * 0.02,
//             ),
//             child: Container(
//               width: containerWidth,
//               padding: EdgeInsets.all(size.width * 0.04),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Form(
//                 key: _formKey,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Logo Section
//                     Center(
//                       child: Container(
//                         width: logoSize,
//                         height: logoSize,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                             image: AssetImage('assets/images/bpp_logo2.png'),
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.0),
//                     Center(
//                       child: Text(
//                         'Bharatiya Popular Party',
//                         style: TextStyle(
//                           fontSize: titleFontSize,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       '     * Enter your details exactly as given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontSize: size.width * 0.03,
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.02),
//
//                     // Form Fields
//                     LayoutBuilder(
//                       builder: (context, constraints) {
//                         return Wrap(
//                           spacing: 20,
//                           runSpacing: 20,
//                           alignment: WrapAlignment.center,
//                           children: [
//                             // Name Fields
//                             Column(
//                               children: [
//                                 // Row for Title and First Name
//                                 Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1, // Equal size
//                                       child: _buildFormField(
//                                         'Title',
//                                         'Select Title',
//                                         labelFontSize,
//                                         constraints,
//                                         controller: _titleController,
//                                         dropdownItems: [
//                                           'Mr',
//                                           'Ms',
//                                           'Mrs',
//                                           'Dr',
//                                           'CA',
//                                           'Cs',
//                                           'Adv'
//                                         ],
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Please select a title';
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                         width: 16), // Space between fields
//                                     Flexible(
//                                       flex: 1, // Equal size
//                                       child: _buildFormField(
//                                         'First Name',
//                                         'Enter first name',
//                                         controller: _firstNameController,
//                                         labelFontSize,
//                                         validator: validateName,
//                                         constraints,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                     height: 16), // Space between rows
//
//                                 // Row for Middle Name and Last Name
//                                 Row(
//                                   children: [
//                                     Flexible(
//                                       flex: 1, // Equal size
//                                       child: _buildFormField(
//                                         'Middle Name',
//                                         'Enter middle name',
//                                         controller: _middleNameController,
//                                         labelFontSize,
//                                         constraints,
//                                         validator: validateName,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                         width: 16), // Space between fields
//                                     Flexible(
//                                       flex: 1, // Equal size
//                                       child: _buildFormField(
//                                         'Last Name',
//                                         'Enter last name',
//                                         controller: _lastNameController,
//                                         labelFontSize,
//                                         constraints,
//                                         validator: validateName,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                     height: 16), // Space below the last row
//
//                                 // Email Field (Full Width)
//                                 _buildFormField(
//                                   'Email',
//                                   'Enter email address',
//                                   controller: _emailController,
//                                   labelFontSize,
//                                   constraints,
//                                   validator: validateEmail,
//                                   keyboardType: TextInputType.emailAddress,
//                                   fullWidth: true,
//                                 ),
//                               ],
//                             ),
//
//                             // Date of Birth and Age
//                             _buildDateAndAgeFields(constraints, labelFontSize),
//
//                             // Gender and Phone Number
//                             _buildResponsiveRow(
//                               constraints,
//                               [
//                                 _buildDropdownField(
//                                   'Gender',
//                                   'Select gender',
//                                   labelFontSize,
//                                   constraints,
//                                   _genderController,
//                                   ['Male', 'Female', 'Other'],
//                                 ),
//                                 _buildValidatedFormField(
//                                   'Phone Number',
//                                   'Enter phone number',
//                                   labelFontSize,
//                                   constraints,
//                                   controller: _phoneController,
//                                   keyboardType: TextInputType.phone,
//                                   validator: validatePhone,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.allow(RegExp(
//                                         r'[0-9\+]')), // Allows numbers and +
//                                     LengthLimitingTextInputFormatter(
//                                         13), // Limits to +91 and 10 digits
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//
//                     SizedBox(height: size.height * 0.01),
//
//                     // Next Button
//                     SizedBox(
//                       width: isDesktop ? containerWidth * 0.3 : double.infinity,
//                       height: size.height * 0.06,
//                       child: ElevatedButton(
//                         onPressed: _submitForm,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: Text(
//                           'Next',
//                           style: TextStyle(
//                             fontSize: labelFontSize * 1.2,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDropdownField(
//     String label,
//     String hintText,
//     double labelFontSize,
//     BoxConstraints constraints,
//     TextEditingController? controller,
//     List<String> dropdownItems,
//   ) {
//     return Container(
//       width: constraints.maxWidth > 600
//           ? (constraints.maxWidth - 20) / 2
//           : constraints.maxWidth,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: labelFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Light grey background
//               borderRadius: BorderRadius.circular(8), // Rounded corners
//             ),
//             child: DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               value: dropdownItems.contains(controller?.text) &&
//                       controller!.text.isNotEmpty
//                   ? controller.text
//                   : dropdownItems.first, // Default to the first item
//               items: dropdownItems.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 if (newValue != null && controller != null) {
//                   controller.text =
//                       newValue; // Update the controller with the selected value
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildValidatedFormField(
//     String label,
//     String hintText,
//     double labelFontSize,
//     BoxConstraints constraints, {
//     TextInputType? keyboardType,
//     int? maxLength,
//     String? Function(String?)? validator,
//     List<TextInputFormatter>? inputFormatters,
//     TextEditingController? controller,
//   }) {
//     return Container(
//       width: constraints.maxWidth > 400
//           ? (constraints.maxWidth - 20) / 2
//           : constraints.maxWidth,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 10),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: labelFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Light grey background
//               borderRadius: BorderRadius.circular(8), // Rounded corners
//             ),
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 12), // Internal padding
//             child: TextFormField(
//               controller: controller,
//               keyboardType: keyboardType,
//               maxLength: maxLength,
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 border: InputBorder.none, // Remove default border
//                 counterText: '', // Remove counter for character limit
//               ),
//               validator: validator,
//               inputFormatters: inputFormatters,
//               onChanged: (value) {
//                 // Automatically add '+91' if it's not present at the start
//                 if (!value.startsWith('+91')) {
//                   controller?.text =
//                       '+91' + value.replaceFirst(RegExp(r'^\+91'), '');
//                   controller?.selection =
//                       TextSelection.collapsed(offset: controller!.text.length);
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   _buildResponsiveRow(
//     BoxConstraints constraints,
//     List<Widget> children,
//   ) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: constraints.maxWidth > 600
//           ? children // Show fields side by side on larger screens
//           : [
//               // Stack fields vertically on small screens (e.g., mobile devices)
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: children,
//                 ),
//               ),
//             ],
//     );
//   }
//
//   Widget _buildFormField(
//     String label,
//     String hintText,
//     double labelFontSize,
//     BoxConstraints constraints, {
//     bool fullWidth = false,
//     TextInputType keyboardType = TextInputType.text,
//     List<TextInputFormatter>? inputFormatters,
//     String? Function(String?)? validator,
//     TextEditingController? controller,
//     List<String>? dropdownItems,
//   }) {
//     return Container(
//       width: fullWidth
//           ? constraints.maxWidth
//           : constraints.maxWidth > 600
//               ? (constraints.maxWidth - 20) / 2
//               : constraints.maxWidth,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: labelFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Light background color
//               borderRadius: BorderRadius.circular(8),
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//             child: dropdownItems != null
//                 ? DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       hintText: hintText,
//                       border: InputBorder.none, // Removes the default border
//                     ),
//                     value: controller?.text.isNotEmpty == true
//                         ? controller!.text
//                         : (dropdownItems.isNotEmpty
//                             ? dropdownItems.first
//                             : null),
//                     items: dropdownItems.map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (String? newValue) {
//                       if (newValue != null && controller != null) {
//                         controller.text = newValue;
//                       }
//                     },
//                     validator: validator,
//                   )
//                 : TextFormField(
//                     controller: controller,
//                     keyboardType: keyboardType,
//                     inputFormatters: inputFormatters,
//                     validator: validator,
//                     decoration: InputDecoration(
//                       hintText: hintText,
//                       border: InputBorder.none, // Removes the default border
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDateAndAgeFields(
//       BoxConstraints constraints, double labelFontSize) {
//     return _buildResponsiveRow(
//       constraints,
//       [
//         // Date of Birth field
//         Container(
//           width: constraints.maxWidth > 600
//               ? (constraints.maxWidth - 20) / 2
//               : constraints.maxWidth,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Date of Birth',
//                 style: TextStyle(
//                   fontSize: labelFontSize,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade200, // Background color
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: TextFormField(
//                   controller: _dateController,
//                   decoration: InputDecoration(
//                     hintText: 'yyyy-MM-dd',
//                     border: InputBorder.none, // No border
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 16,
//                     ),
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.calendar_today),
//                       onPressed: () async {
//                         final DateTime? picked = await showDatePicker(
//                           context: Get.context!,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(1900),
//                           lastDate: DateTime.now(),
//                           builder: (context, child) {
//                             return Theme(
//                               data: Theme.of(context).copyWith(
//                                 colorScheme: ColorScheme.light(
//                                   primary: Colors.blue,
//                                   onPrimary: Colors.white,
//                                   onSurface: Colors.black,
//                                 ),
//                               ),
//                               child: child!,
//                             );
//                           },
//                         );
//
//                         if (picked != null) {
//                           setState(() {
//                             _dateController.text =
//                                 DateFormat('yyyy-MM-dd').format(picked);
//                             // Calculate and update age
//                             final age = DateTime.now().year - picked.year;
//                             _ageController.text = age.toString();
//                           });
//                         }
//                       },
//                     ),
//                   ),
//                   validator: validateDateOfBirth,
//                   onChanged: (value) {
//                     // Validate and parse the manually entered date
//                     try {
//                       final date = DateFormat('yyyy-MM-dd').parse(value);
//                       final age = DateTime.now().year - date.year;
//                       setState(() {
//                         _ageController.text = age.toString();
//                       });
//                     } catch (e) {
//                       // Invalid date format
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//         // Age field with increment/decrement buttons
//         Container(
//           width: constraints.maxWidth > 600
//               ? (constraints.maxWidth - 20) / 2
//               : constraints.maxWidth,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Age',
//                 style: TextStyle(
//                   fontSize: labelFontSize,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade200, // Background color
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: TextFormField(
//                   controller: _ageController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: 'Age',
//                     border: InputBorder.none, // No border
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 16,
//                     ),
//                   ),
//                   validator: validateAge,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class AddressFormScreen extends StatefulWidget {
//   final Map<String, String> personalData;
//   final Map<String, String> addressData;
//   final Map<String, String> qualificationData;
//   final Map<String, String> documentsData;
//
//   const AddressFormScreen({
//     Key? key,
//     required this.personalData,
//     required this.addressData,
//     required this.qualificationData,
//     required this.documentsData,
//   }) : super(key: key);
//
//   @override
//   _AddressFormScreen createState() => _AddressFormScreen();
// }
//
// class _AddressFormScreen extends State<AddressFormScreen> {
//   final TextEditingController _address1Controller = TextEditingController();
//   final TextEditingController _address2Controller = TextEditingController();
//   final TextEditingController _cityOrvillageController =
//       TextEditingController();
//   final TextEditingController _talukaController = TextEditingController();
//   final TextEditingController _districtController = TextEditingController();
//   final TextEditingController _stateController = TextEditingController();
//   final TextEditingController _pincodeController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // In _AddressFormScreen's submitRegistrationPageForm method:
//   // AddressFormScreen mein submitRegistrationPageForm method mein:
//   void submitRegistrationPageForm(BuildContext context) {
//     if (_formKey.currentState!.validate()) {
//       Map<String, String> updatedAddressData = {
//         'addressLine1': _address1Controller.text,
//         'addressLine2': _address2Controller.text,
//         'cityVillage': _cityOrvillageController.text,
//         'taluka': _talukaController.text,
//         'district': _districtController.text,
//         'state': _stateController.text,
//         'pincode': _pincodeController.text,
//       };
//
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => SignupPage(
//             personalData:
//                 widget.personalData, // Previous screen se aaya hua data
//             addressData: updatedAddressData, qualificationData: {},
//             documentsData: {},
//             // Current screen ka data
//             // qualificationData: widget.qualificationData,
//             // documentsData: widget.documentsData,
//           ),
//         ),
//       );
//     }
//   }
//
//   // Form field validation
//   String? validateRequired(String? value, String fieldName) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your $fieldName';
//     }
//     return null;
//   }
//
//   // Custom text field builder with validation
//   Widget _buildFormField(
//     String label,
//     String hint,
//     TextEditingController controller,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               filled: true,
//               fillColor: Colors
//                   .transparent, // Set to transparent as the background color is set in Container
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) => validateRequired(value, label),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     _address1Controller.dispose();
//     _address2Controller.dispose();
//     _cityOrvillageController.dispose();
//     _talukaController.dispose();
//     _districtController.dispose();
//     _stateController.dispose();
//     _pincodeController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(20.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 10,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             width: 330,
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 40),
//                   Center(
//                     child: Image.asset(
//                       'assets/images/bpp_logo2.png',
//                       height: 80,
//                     ),
//                   ),
//                   // SizedBox(height: 5),
//                   Center(
//                     child: Text(
//                       "Bharatiya Popular Party",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     "* Provide Address as given in Aadhaar Card",
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontSize: 14,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildFormField(
//                         "Address Line 1",
//                         "House/Flat No.",
//                         _address1Controller,
//                       ),
//                       SizedBox(height: 16),
//                       _buildFormField(
//                         "Address Line 2",
//                         "Area, Landmark",
//                         _address2Controller,
//                       ),
//                       SizedBox(height: 16),
//                       _buildFormField(
//                         "City/Village",
//                         "Enter city/village",
//                         _cityOrvillageController,
//                       ),
//                       SizedBox(height: 16),
//                       _buildFormField(
//                         "Taluka",
//                         "Enter taluka",
//                         _talukaController,
//                       ),
//                       SizedBox(height: 16),
//                       _buildFormField(
//                         "District",
//                         "Enter district",
//                         _districtController,
//                       ),
//                       SizedBox(height: 16),
//                       _buildFormField(
//                         "State",
//                         "Enter state",
//                         _stateController,
//                       ),
//                       SizedBox(height: 16),
//                       _buildFormField(
//                         "Pincode",
//                         "Enter pincode",
//                         _pincodeController,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () => submitRegistrationPageForm(context),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                       child: Text(
//                         "Next",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SignupPage extends StatefulWidget {
//   final Map<String, String> personalData;
//   final Map<String, String> addressData;
//   final Map<String, String> qualificationData;
//   final Map<String, String> documentsData;
//
//   const SignupPage({
//     Key? key,
//     required this.personalData,
//     required this.addressData,
//     required this.qualificationData,
//     required this.documentsData,
//   }) : super(key: key);
//
//   @override
//   _SignupPageState createState() => _SignupPageState();
// }
//
// // class _SignupPageState extends State<SignupPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final TextEditingController _voterIDController = TextEditingController();
// //   final TextEditingController _aadhaarIDController = TextEditingController();
// //
// //   File? _aadhaarBack;
// //   File? _aadhaarFront;
// //   File? _voterFront;
// //   File? _voterBack;
// //
// //   String? _aadhaarBackType;
// //   String? _aadhaarFrontType;
// //   String? _voterFrontType;
// //   String? _voterBackType;
// //
// //   bool _isYesSelected = false;
// //   bool _isNoSelected = false;
// //
// //   final List<String> _supportedImageTypes = ['jpg', 'jpeg', 'png'];
// //   final List<String> _supportedDocTypes = ['pdf'];
// //
// //   // Method to pick files
// //   Future<void> _pickFile(
// //     void Function(File?, String?) setFile,
// //     bool allowPdf,
// //   ) async {
// //     try {
// //       final ImagePicker picker = ImagePicker();
// //       final XFile? pickedFile = await picker.pickImage(
// //         source: ImageSource.gallery,
// //         maxHeight: 800,
// //         maxWidth: 800,
// //       );
// //
// //       if (pickedFile != null) {
// //         final file = File(pickedFile.path);
// //         final fileType = pickedFile.name.split('.').last.toLowerCase();
// //
// //         if (_supportedImageTypes.contains(fileType) ||
// //             (allowPdf && _supportedDocTypes.contains(fileType))) {
// //           setFile(file, fileType);
// //         } else {
// //           _showErrorSnackBar('Invalid file type. Please select a valid file.');
// //         }
// //       }
// //     } catch (e) {
// //       _showErrorSnackBar('Error picking file: $e');
// //     }
// //   }
// //
// //   // Helper function to show an error snackbar
// //   void _showErrorSnackBar(String message) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text(message)),
// //     );
// //   }
// //
// //   void _submitData() {
// //     if (!_formKey.currentState!.validate()) return;
// //
// //     final hasAadhaarDetails = _aadhaarIDController.text.isNotEmpty &&
// //         _aadhaarBack != null &&
// //         _aadhaarFront != null;
// //
// //     final hasVoterDetails = _voterIDController.text.isNotEmpty &&
// //         _voterFront != null &&
// //         _voterBack != null;
// //
// //     if (!(hasAadhaarDetails || hasVoterDetails)) {
// //       _showErrorSnackBar(
// //           'Please provide either Aadhaar details or Voter ID details.');
// //       return;
// //     }
// //
// //     if (hasAadhaarDetails && hasVoterDetails) {
// //       _showErrorSnackBar(
// //           'You can only upload one set of documents: Aadhaar or Voter ID.');
// //       return;
// //     }
// //
// //     final documentsData = <String, String>{};
// //
// //     if (hasAadhaarDetails) {
// //       documentsData['aadhaarNumber'] = _aadhaarIDController.text;
// //       documentsData['aadhaarBackFile'] = _aadhaarBack?.path ?? '';
// //       documentsData['aadhaarFrontFile'] = _aadhaarFront?.path ?? '';
// //     } else if (hasVoterDetails) {
// //       documentsData['voterId'] = _voterIDController.text;
// //       documentsData['voterFrontFile'] = _voterFront?.path ?? '';
// //       documentsData['voterBackFile'] = _voterBack?.path ?? '';
// //     }
// //
// //     if (_isYesSelected) {
// //       // If Yes is selected, proceed to QualificationScreen to collect qualification data
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => QualificationScreen(
// //             personalData: widget.personalData,
// //             addressData: widget.addressData,
// //             qualificationData: widget.qualificationData,
// //             documentsData: documentsData,
// //             files: [],
// //           ),
// //         ),
// //       );
// //     } else if (_isNoSelected) {
// //       // If No is selected, skip QualificationScreen and go directly to PasswordPage
// //       // with empty strings for qualification data
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => PasswordPage(
// //             title: widget.personalData['title'] ?? '',
// //             firstName: widget.personalData['firstName'] ?? '',
// //             middleName: widget.personalData['middleName'] ?? '',
// //             lastName: widget.personalData['lastName'] ?? '',
// //             age: widget.personalData['age'] ?? '',
// //             gender: widget.personalData['gender'] ?? '',
// //             phone: widget.personalData['phoneNumber'] ?? '',
// //             dateOfBirth: widget.personalData['dateOfBirth'] ?? '',
// //             email: widget.personalData['email'] ?? '',
// //             addressLine1: widget.addressData['addressLine1'] ?? '',
// //             addressLine2: widget.addressData['addressLine2'] ?? '',
// //             cityOrVillage: widget.addressData['cityVillage'] ?? '',
// //             taluka: widget.addressData['taluka'] ?? '',
// //             district: widget.addressData['district'] ?? '',
// //             state: widget.addressData['state'] ?? '',
// //             pincode: widget.addressData['pincode'] ?? '',
// //             // Use empty strings instead of null for qualification data
// //             profession: '',
// //             qualification: '',
// //             position: '',
// //             // Document data
// //             aadhaarNumber: documentsData['aadhaarNumber'] ?? '',
// //             voterId: documentsData['voterId'] ?? '',
// //             aadhaarBack: documentsData['aadhaarBackFile'] ?? '',
// //             aadhaarFront: documentsData['aadhaarFrontFile'] ?? '',
// //             voterFront: documentsData['voterFrontFile'] ?? '',
// //             voterBack: documentsData['voterBackFile'] ?? '',
// //             files: [],
// //           ),
// //         ),
// //       );
// //     } else {
// //       _showErrorSnackBar('Please select Yes or No for community service.');
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[200],
// //       body: Center(
// //         child: SingleChildScrollView(
// //           child: Container(
// //             padding: const EdgeInsets.all(20.0),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(20.0),
// //             ),
// //             width: 330,
// //             child: Form(
// //               key: _formKey,
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   const SizedBox(height: 50),
// //                   Center(
// //                     child: Image.asset(
// //                       'assets/images/bpp_logo2.png',
// //                       height: 80,
// //                     ),
// //                   ),
// //                   SizedBox(height: 6),
// //                   const Text(
// //                     "Bharatiya Popular Party",
// //                     style: TextStyle(
// //                       fontSize: 22,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.blueAccent,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 16),
// //                   _buildTextField("Aadhaar Number", "Enter Aadhaar Number",
// //                       _aadhaarIDController),
// //                   const SizedBox(height: 10),
// //                   _buildFileUploadSection(
// //                     "Aadhaar Front",
// //                     _aadhaarFront,
// //                     _aadhaarFrontType,
// //                     (file, type) => setState(() {
// //                       _aadhaarFront = file;
// //                       _aadhaarFrontType = type;
// //                     }),
// //                   ),
// //                   SizedBox(height: 10),
// //                   _buildFileUploadSection(
// //                     "Aadhaar Back",
// //                     _aadhaarBack,
// //                     _aadhaarBackType,
// //                     (file, type) => setState(() {
// //                       _aadhaarBack = file;
// //                       _aadhaarBackType = type;
// //                     }),
// //                   ),
// //                   const SizedBox(height: 10),
// //                   Row(
// //                     children: [
// //                       Expanded(
// //                         child: Divider(
// //                           color: Colors.black,
// //                           thickness: 1,
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 3.0),
// //                         child: Text(
// //                           "OR",
// //                           textAlign: TextAlign.center,
// //                           style: TextStyle(
// //                             fontSize: 14,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       ),
// //                       Expanded(
// //                         child: Divider(
// //                           color: Colors.black,
// //                           thickness: 1,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 10),
// //                   _buildTextField(
// //                       "Voter ID", "Enter Voter ID", _voterIDController),
// //                   const SizedBox(height: 10),
// //                   _buildFileUploadSection(
// //                     "Voter Front",
// //                     _voterFront,
// //                     _voterFrontType,
// //                     (file, type) => setState(() {
// //                       _voterFront = file;
// //                       _voterFrontType = type;
// //                     }),
// //                   ),
// //                   _buildFileUploadSection(
// //                     "Voter Back",
// //                     _voterBack,
// //                     _voterBackType,
// //                     (file, type) => setState(() {
// //                       _voterBack = file;
// //                       _voterBackType = type;
// //                     }),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   _buildCommunityServiceCheckBox(),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: ElevatedButton(
// //                       onPressed: _submitData,
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: Colors.blue,
// //                         padding: EdgeInsets.symmetric(vertical: 10),
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(8.0),
// //                         ),
// //                       ),
// //                       child: Text(
// //                         "Next",
// //                         style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 18,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildCommunityServiceCheckBox() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           "Do you want to serve the community as a professional? *",
// //           style: TextStyle(
// //             fontSize: 17,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         SizedBox(height: 8),
// //         Text(
// //           "Serving the community as a professional member can help winning the confidence and increase your chances of being nominated as block head.",
// //           style: TextStyle(
// //             fontSize: 14,
// //             fontWeight: FontWeight.normal,
// //           ),
// //         ),
// //         SizedBox(height: 5),
// //         Row(
// //           children: [
// //             Checkbox(
// //               value: _isYesSelected,
// //               onChanged: (bool? value) {
// //                 setState(() {
// //                   _isYesSelected = value!;
// //                   _isNoSelected = false;
// //                 });
// //               },
// //             ),
// //             Text('Yes'),
// //             SizedBox(width: 10),
// //             Checkbox(
// //               value: _isNoSelected,
// //               onChanged: (bool? value) {
// //                 setState(() {
// //                   _isNoSelected = value!;
// //                   _isYesSelected = false;
// //                 });
// //               },
// //             ),
// //             Text('No'),
// //           ],
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildTextField(
// //     String label,
// //     String hint,
// //     TextEditingController controller,
// //   ) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           label,
// //           style: const TextStyle(
// //             fontSize: 14,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         const SizedBox(height: 4),
// //         Container(
// //           decoration: BoxDecoration(
// //             color: Colors.grey.shade200,
// //             borderRadius: BorderRadius.circular(8.0),
// //           ),
// //           child: TextFormField(
// //             controller: controller,
// //             decoration: InputDecoration(
// //               hintText: hint,
// //               border: InputBorder.none,
// //               contentPadding: const EdgeInsets.all(12.0),
// //             ),
// //             keyboardType: TextInputType.number,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildFileUploadSection(
// //     String label,
// //     File? file,
// //     String? fileType,
// //     void Function(File?, String?) setFile, {
// //     TextEditingController? controller,
// //     String? hint,
// //   }) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           label,
// //           style: const TextStyle(
// //             fontSize: 14,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         const SizedBox(height: 4), // Consistent spacing
// //         Container(
// //           decoration: BoxDecoration(
// //             color: Colors.grey.shade200,
// //             borderRadius: BorderRadius.circular(8.0),
// //           ),
// //           child: SizedBox(
// //             width: double.infinity, // Stretch across available space
// //             child: TextButton.icon(
// //               onPressed: () =>
// //                   _pickFile((file, type) => setFile(file, type), true),
// //               icon: const Icon(Icons.upload_file, color: Colors.black),
// //               label: const Text(
// //                 "Choose File",
// //                 style: TextStyle(color: Colors.black),
// //               ),
// //               style: TextButton.styleFrom(
// //                 padding: const EdgeInsets.all(12.0),
// //                 alignment: Alignment.centerLeft, // Align content to the left
// //               ),
// //             ),
// //           ),
// //         ),
// //         if (file != null)
// //           Padding(
// //             padding: const EdgeInsets.only(top: 8.0),
// //             child: Text(
// //               "File Uploaded: ${file.path.split('/').last}",
// //               style: const TextStyle(fontSize: 12),
// //             ),
// //           ),
// //         if (controller != null && hint != null)
// //           Container(
// //             margin: const EdgeInsets.only(top: 12),
// //             decoration: BoxDecoration(
// //               color: Colors.grey.shade200,
// //               borderRadius: BorderRadius.circular(8.0),
// //             ),
// //             child: SizedBox(
// //               width: double.infinity,
// //               child: TextFormField(
// //                 controller: controller,
// //                 decoration: InputDecoration(
// //                   hintText: hint,
// //                   border: InputBorder.none,
// //                   contentPadding: const EdgeInsets.all(12.0),
// //                 ),
// //                 keyboardType: TextInputType.number,
// //               ),
// //             ),
// //           ),
// //       ],
// //     );
// //   }
// // }
//
// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _voterIDController = TextEditingController();
//   final TextEditingController _aadhaarIDController = TextEditingController();
//
//   File? _aadhaarBack;
//   File? _aadhaarFront;
//   File? _voterFront;
//   File? _voterBack;
//
//   String? _aadhaarBackType;
//   String? _aadhaarFrontType;
//   String? _voterFrontType;
//   String? _voterBackType;
//
//   bool _isYesSelected = false;
//   bool _isNoSelected = false;
//
//   final List<String> _supportedImageTypes = ['jpg', 'jpeg', 'png'];
//   final List<String> _supportedDocTypes = ['pdf'];
//
//   // Method to pick files
//   Future<void> _pickFile(
//     void Function(File?, String?) setFile,
//     bool allowPdf,
//   ) async {
//     try {
//       final ImagePicker picker = ImagePicker();
//       final XFile? pickedFile = await picker.pickImage(
//         source: ImageSource.gallery,
//         maxHeight: 800,
//         maxWidth: 800,
//       );
//
//       if (pickedFile != null) {
//         final file = File(pickedFile.path);
//         final fileType = pickedFile.name.split('.').last.toLowerCase();
//
//         if (_supportedImageTypes.contains(fileType) ||
//             (allowPdf && _supportedDocTypes.contains(fileType))) {
//           setFile(file, fileType);
//         } else {
//           _showErrorSnackBar('Invalid file type. Please select a valid file.');
//         }
//       }
//     } catch (e) {
//       _showErrorSnackBar('Error picking file: $e');
//     }
//   }
//
//   // Helper function to show an error snackbar
//   void _showErrorSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
//
//   void _submitData() {
//     if (!_formKey.currentState!.validate()) return;
//
//     final hasAadhaarDetails = _aadhaarIDController.text.isNotEmpty &&
//         _aadhaarBack != null &&
//         _aadhaarFront != null;
//
//     final hasVoterDetails = _voterIDController.text.isNotEmpty &&
//         _voterFront != null &&
//         _voterBack != null;
//
//     if (!(hasAadhaarDetails || hasVoterDetails)) {
//       _showErrorSnackBar(
//           'Please provide either Aadhaar details or Voter ID details.');
//       return;
//     }
//
//     if (hasAadhaarDetails && hasVoterDetails) {
//       _showErrorSnackBar(
//           'You can only upload one set of documents: Aadhaar or Voter ID.');
//       return;
//     }
//
//     final documentsData = <String, String>{};
//
//     if (hasAadhaarDetails) {
//       documentsData['aadhaarNumber'] = _aadhaarIDController.text;
//       documentsData['aadhaarBackFile'] = _aadhaarBack?.path ?? '';
//       documentsData['aadhaarFrontFile'] = _aadhaarFront?.path ?? '';
//     } else if (hasVoterDetails) {
//       documentsData['voterId'] = _voterIDController.text;
//       documentsData['voterFrontFile'] = _voterFront?.path ?? '';
//       documentsData['voterBackFile'] = _voterBack?.path ?? '';
//     }
//
//     if (_isYesSelected) {
//       // If Yes is selected, proceed to QualificationScreen to collect qualification data
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => QualificationScreen(
//             personalData: widget.personalData,
//             addressData: widget.addressData,
//             qualificationData: widget.qualificationData,
//             documentsData: documentsData,
//             files: [],
//           ),
//         ),
//       );
//     } else if (_isNoSelected) {
//       // If No is selected, skip QualificationScreen and go directly to PasswordPage
//       // with empty strings for qualification data
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => PasswordPage(
//             title: widget.personalData['title'] ?? '',
//             firstName: widget.personalData['firstName'] ?? '',
//             middleName: widget.personalData['middleName'] ?? '',
//             lastName: widget.personalData['lastName'] ?? '',
//             age: widget.personalData['age'] ?? '',
//             gender: widget.personalData['gender'] ?? '',
//             phone: widget.personalData['phoneNumber'] ?? '',
//             dateOfBirth: widget.personalData['dateOfBirth'] ?? '',
//             email: widget.personalData['email'] ?? '',
//             addressLine1: widget.addressData['addressLine1'] ?? '',
//             addressLine2: widget.addressData['addressLine2'] ?? '',
//             cityOrVillage: widget.addressData['cityVillage'] ?? '',
//             taluka: widget.addressData['taluka'] ?? '',
//             district: widget.addressData['district'] ?? '',
//             state: widget.addressData['state'] ?? '',
//             pincode: widget.addressData['pincode'] ?? '',
//             // Use empty strings instead of null for qualification data
//             profession: '',
//             qualification: '',
//             position: '',
//             // Document data
//             aadhaarNumber: documentsData['aadhaarNumber'] ?? '',
//             voterId: documentsData['voterId'] ?? '',
//             aadhaarBack: documentsData['aadhaarBackFile'] ?? '',
//             aadhaarFront: documentsData['aadhaarFrontFile'] ?? '',
//             voterFront: documentsData['voterFrontFile'] ?? '',
//             voterBack: documentsData['voterBackFile'] ?? '',
//             files: [], referralCode: '',
//           ),
//         ),
//       );
//     } else {
//       _showErrorSnackBar('Please select Yes or No for community service.');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(20.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             width: 330,
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 50),
//                   Center(
//                     child: Image.asset(
//                       'assets/images/bpp_logo2.png',
//                       height: 80,
//                     ),
//                   ),
//                   SizedBox(height: 6),
//                   const Text(
//                     "Bharatiya Popular Party",
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   _buildTextField("Aadhaar Number", "Enter Aadhaar Number",
//                       _aadhaarIDController),
//                   const SizedBox(height: 10),
//                   _buildFileUploadSection(
//                     "Aadhaar Front",
//                     _aadhaarFront,
//                     _aadhaarFrontType,
//                     (file, type) => setState(() {
//                       _aadhaarFront = file;
//                       _aadhaarFrontType = type;
//                     }),
//                   ),
//                   SizedBox(height: 10),
//                   _buildFileUploadSection(
//                     "Aadhaar Back",
//                     _aadhaarBack,
//                     _aadhaarBackType,
//                     (file, type) => setState(() {
//                       _aadhaarBack = file;
//                       _aadhaarBackType = type;
//                     }),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: Colors.black,
//                           thickness: 1,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 3.0),
//                         child: Text(
//                           "OR",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           color: Colors.black,
//                           thickness: 1,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   _buildTextField(
//                       "Voter ID", "Enter Voter ID", _voterIDController),
//                   const SizedBox(height: 10),
//                   _buildFileUploadSection(
//                     "Voter Front",
//                     _voterFront,
//                     _voterFrontType,
//                     (file, type) => setState(() {
//                       _voterFront = file;
//                       _voterFrontType = type;
//                     }),
//                   ),
//                   _buildFileUploadSection(
//                     "Voter Back",
//                     _voterBack,
//                     _voterBackType,
//                     (file, type) => setState(() {
//                       _voterBack = file;
//                       _voterBackType = type;
//                     }),
//                   ),
//                   const SizedBox(height: 20),
//                   _buildCommunityServiceCheckBox(),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _submitData,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                       child: Text(
//                         "Next",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCommunityServiceCheckBox() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Do you want to serve the community as a professional? *",
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           "Serving the community as a professional member can help winning the confidence and increase your chances of being nominated as block head.",
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//         SizedBox(height: 5),
//         Row(
//           children: [
//             Checkbox(
//               value: _isYesSelected,
//               onChanged: (bool? value) {
//                 setState(() {
//                   _isYesSelected = value!;
//                   _isNoSelected = false;
//                 });
//               },
//             ),
//             Text('Yes'),
//             SizedBox(width: 10),
//             Checkbox(
//               value: _isNoSelected,
//               onChanged: (bool? value) {
//                 setState(() {
//                   _isNoSelected = value!;
//                   _isYesSelected = false;
//                 });
//               },
//             ),
//             Text('No'),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTextField(
//     String label,
//     String hint,
//     TextEditingController controller,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.all(12.0),
//             ),
//             keyboardType: TextInputType.number,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildFileUploadSection(
//     String label,
//     File? file,
//     String? fileType,
//     void Function(File?, String?) setFile, {
//     TextEditingController? controller,
//     String? hint,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 4), // Consistent spacing
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: SizedBox(
//             width: double.infinity, // Stretch across available space
//             child: TextButton.icon(
//               onPressed: () =>
//                   _pickFile((file, type) => setFile(file, type), true),
//               icon: const Icon(Icons.upload_file, color: Colors.black),
//               label: const Text(
//                 "Choose File",
//                 style: TextStyle(color: Colors.black),
//               ),
//               style: TextButton.styleFrom(
//                 padding: const EdgeInsets.all(12.0),
//                 alignment: Alignment.centerLeft, // Align content to the left
//               ),
//             ),
//           ),
//         ),
//         if (file != null)
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Text(
//               "File Uploaded: ${file.path.split('/').last}",
//               style: const TextStyle(fontSize: 12),
//             ),
//           ),
//         if (controller != null && hint != null)
//           Container(
//             margin: const EdgeInsets.only(top: 12),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200,
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: SizedBox(
//               width: double.infinity,
//               child: TextFormField(
//                 controller: controller,
//                 decoration: InputDecoration(
//                   hintText: hint,
//                   border: InputBorder.none,
//                   contentPadding: const EdgeInsets.all(12.0),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
//
// class QualificationScreen extends StatefulWidget {
//   final Map<String, String> addressData;
//   final Map<String, String> personalData; // Added personal data
//   final Map<String, String> qualificationData;
//   final Map<String, String> documentsData;
//   final List<Uint8List?> files;
//
//   const QualificationScreen({
//     Key? key,
//     required this.addressData,
//     required this.personalData, // Added this parameter
//     required this.qualificationData,
//     required this.documentsData,
//     required this.files,
//   }) : super(key: key);
//
//   @override
//   _QualificationScreenState createState() => _QualificationScreenState();
// }
//
// class _QualificationScreenState extends State<QualificationScreen> {
//   final List<String> professions = ['Medical', 'Legal', 'Social', 'Other'];
//   String? selectedProfession;
//
//   final TextEditingController _qualificationController =
//       TextEditingController();
//   final TextEditingController _positionController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     _qualificationController.dispose();
//     _positionController.dispose();
//     super.dispose();
//   }
//
//   // TextField builder with validation (keeping existing implementation)
//   Widget _buildTextField(
//       String label, String hint, TextEditingController controller) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]),
//               border: InputBorder.none,
//               filled: true,
//               fillColor: Colors.transparent,
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return '$label is required';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Dropdown builder (keeping existing implementation)
//   Widget _buildDropdownField(String label, List<String> items) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: DropdownButtonFormField<String>(
//             hint: Text("Select Profession"),
//             value: selectedProfession,
//             onChanged: (newValue) {
//               setState(() {
//                 selectedProfession = newValue;
//               });
//             },
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please select a profession';
//               }
//               return null;
//             },
//             isExpanded: true,
//             decoration: InputDecoration(
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//               border: InputBorder.none,
//             ),
//             items: items.map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Modified form submission logic
//   // Modified form submission logic for qualification screen
//   void submitRegistrationPageForm(BuildContext context) {
//     if (_formKey.currentState?.validate() ?? false) {
//       // Collect qualification and position data
//       final qualificationData = {
//         'qualification': _qualificationController.text,
//         'profession': selectedProfession ?? '',
//         'position': _positionController.text,
//       };
//
//       // Combine data from all screens
//       final personalData = widget.personalData;
//       final addressData = widget.addressData;
//       final documentsData = widget.documentsData;
//
//       // Pass data to the next screen or handle final submission
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => PasswordPage(
//             // Personal Data
//             firstName: personalData['firstName'] ?? '',
//             lastName: personalData['lastName'] ?? '',
//             email: personalData['email'] ?? '',
//             middleName: personalData['middleName'] ?? '',
//             title: personalData['title'] ?? '',
//             age: personalData['age'] ?? '',
//             dateOfBirth: personalData['dateOfBirth'] ?? '',
//             gender: personalData['gender'] ?? '',
//             phone: personalData['phoneNumber'] ?? '',
//
//             // Address Data
//             addressLine1: addressData['addressLine1'] ?? '',
//             addressLine2: addressData['addressLine2'] ?? '',
//             cityOrVillage: addressData['cityVillage'] ?? '',
//             taluka: addressData['taluka'] ?? '',
//             district: addressData['district'] ?? '',
//             state: addressData['state'] ?? '',
//             pincode: addressData['pincode'] ?? '',
//
//             // Documents Data
//             aadhaarNumber: documentsData['aadhaarNumber'] ?? '',
//
//             aadhaarBack: documentsData['aadhaarBackFile'] ?? '',
//             aadhaarFront: documentsData['aadhaarFrontFile'] ?? '',
//             voterId: documentsData['voterId'] ?? '',
//             voterFront: documentsData['voterFrontFile'] ?? '',
//             voterBack: documentsData['voterBackFile'] ?? '',
//
//             // Qualification Data
//             qualification: qualificationData['qualification'] ?? '',
//             profession: qualificationData['profession'] ?? '',
//             position: qualificationData['position'] ?? '',
//             files: widget.files, referralCode: '',
//           ),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(20.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 10,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             width: 330,
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/bpp_logo2.png',
//                     height: 90,
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 25),
//                   _buildTextField(
//                     "Qualification",
//                     "Enter your qualification",
//                     _qualificationController,
//                   ),
//                   SizedBox(height: 16),
//                   _buildDropdownField("Profession", professions),
//                   SizedBox(height: 16),
//                   _buildTextField(
//                     "Position",
//                     "Enter your position",
//                     _positionController,
//                   ),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () => submitRegistrationPageForm(context),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                       child: Text(
//                         "Next",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class PasswordPage extends StatefulWidget {
//   final String title;
//   final String email;
//   final String firstName;
//   final String middleName;
//   final String lastName;
//   final String qualification;
//   final String profession;
//   final String position;
//   final String pincode;
//   final String dateOfBirth;
//   final String age;
//   final String gender;
//   final String phone;
//   final String taluka;
//   final String district;
//   final String addressLine1;
//   final String addressLine2;
//   final String cityOrVillage;
//   final String state;
//   final String aadhaarNumber;
//   final String voterId;
//   final List<Uint8List?> files;
//   final String aadhaarBack;
//   final String aadhaarFront;
//   final String voterFront;
//   final String voterBack;
//   final String referralCode;
//
//   const PasswordPage({
//     Key? key,
//     required this.title,
//     required this.firstName,
//     required this.middleName,
//     required this.lastName,
//     required this.age,
//     required this.dateOfBirth,
//     required this.gender,
//     required this.phone,
//     required this.qualification,
//     required this.profession,
//     required this.position,
//     required this.pincode,
//     required this.addressLine1,
//     required this.addressLine2,
//     required this.cityOrVillage,
//     required this.state,
//     required this.aadhaarNumber,
//     required this.aadhaarBack,
//     required this.aadhaarFront,
//     required this.voterId,
//     required this.voterFront,
//     required this.voterBack,
//     required this.taluka,
//     required this.district,
//     required this.email,
//     required this.files, required this.referralCode,
//   }) : super(key: key);
//
//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }
//
// class _PasswordPageState extends State<PasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final TextEditingController _referralController = TextEditingController();
//
//   bool isPasswordVisible = false;
//
//   bool get hasAadhaarDetails =>
//       widget.aadhaarNumber.isNotEmpty &&
//       widget.aadhaarFront.isNotEmpty &&
//       widget.aadhaarBack.isNotEmpty;
//
//   bool get hasVoterDetails =>
//       widget.voterId.isNotEmpty &&
//       widget.voterFront.isNotEmpty &&
//       widget.voterBack.isNotEmpty;
//
//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _referralController.dispose();
//     super.dispose();
//   }
//
//   void showErrorDialog(BuildContext context, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> submitRegistrationPageForm() async {
//     if (!hasAadhaarDetails && !hasVoterDetails) {
//       showErrorDialog(
//           context, 'Please provide either Aadhaar or Voter ID details');
//       return;
//     }
//
//     if (_formKey.currentState!.validate()) {
//       try {
//         // Initialize empty map for files
//         final Map<String, String> filesMap = {};
//
//         // Add Aadhaar files if Aadhaar details are present
//         if (hasAadhaarDetails) {
//           filesMap['aadhaarBack'] = widget.aadhaarBack;
//           filesMap['aadhaarFront'] = widget.aadhaarFront;
//         }
//
//         // Add Voter ID files if Voter details are present
//         if (hasVoterDetails) {
//           filesMap['voterFront'] = widget.voterFront;
//           filesMap['voterBack'] = widget.voterBack;
//         }
//
//         final request = http.MultipartRequest(
//           'POST',
//           Uri.parse('https://api.bppindia.com:8443/api/v1/signup'),
//         );
//
//         // Add basic fields that are always required
//         final Map<String, String> basicFields = {
//           'firstName': widget.firstName,
//           'lastName': widget.lastName,
//           'email': widget.email,
//           'password': _passwordController.text,
//           'qualification': widget.qualification,
//           'profession': widget.profession,
//           'position': widget.position,
//           'addressLine1': widget.addressLine1,
//           'addressLine2': widget.addressLine2,
//           'cityOrVillage': widget.cityOrVillage,
//           'taluka': widget.taluka,
//           'district': widget.district,
//           'state': widget.state,
//           'phone': widget.phone,
//           'title': widget.title,
//           'middleName': widget.middleName,
//           'dateOfBirth': widget.dateOfBirth,
//           'age': widget.age,
//           'pincode': widget.pincode,
//           'gender': widget.gender,
//         };
//
//         // Add ID-specific fields based on what's provided
//         if (hasAadhaarDetails) {
//           basicFields['aadhaarNumber'] = widget.aadhaarNumber;
//         }
//         if (hasVoterDetails) {
//           basicFields['voterId'] = widget.voterId;
//         }
//
//         request.fields.addAll(basicFields);
//         print('Fields: ${request.fields}');
//
//         // Add files to the request
//         for (var entry in filesMap.entries) {
//           if (entry.value.isNotEmpty) {
//             final fileExists = File(entry.value).existsSync();
//             print('${entry.key}: ${entry.value}, Exists: $fileExists');
//             if (fileExists) {
//               request.files.add(
//                 await http.MultipartFile.fromPath(entry.key, entry.value),
//               );
//             } else {
//               print('File does not exist: ${entry.value}');
//             }
//           }
//         }
//
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (context) =>
//               const Center(child: CircularProgressIndicator()),
//         );
//
//         final response = await request.send();
//         final responseBody = await response.stream.bytesToString();
//         Navigator.pop(context);
//
//         print('Response: ${response.statusCode}, Body: $responseBody');
//
//         if (response.statusCode == 201) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ScreenDashbaord(
//                 firstName: widget.firstName,
//                 lastName: widget.lastName,
//                 referralCode: widget.referralCode,
//               ),
//             ),
//           );
//         } else {
//           showErrorDialog(context, 'Registration failed: $responseBody');
//         }
//       } catch (error) {
//         showErrorDialog(context, 'An error occurred: $error');
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//
//     return Scaffold(
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: size.width * 0.07,
//                 vertical: size.height * 0.05,
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: isDarkMode ? Colors.grey[900] : Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         blurRadius: 15,
//                         spreadRadius: 5,
//                         offset: const Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                   child: Column(
//                     children: [
//                       Image.asset(
//                         'assets/images/bpp_logo2.png',
//                         //  width: size.width * 0.2,
//                         height: 80,
//                         //  fit: BoxFit.contain,
//                       ),
//                       // const SizedBox(height: 20),
//                       const Text(
//                         'Bharatiya Popular Party',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.blue),
//                       ),
//                       const SizedBox(height: 20),
//                       CustomTextField(
//                         label: 'Password',
//                         hint: 'Create a password',
//                         controller: _passwordController,
//                         obscureText: !isPasswordVisible,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Password cannot be empty';
//                           }
//                           if (value.length < 6) {
//                             return 'Password must be at least 6 characters';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       CustomTextField(
//                         label: 'Confirm Password',
//                         hint: 'Confirm your password',
//                         controller: _confirmPasswordController,
//                         obscureText: !isPasswordVisible,
//                         showEyeIcon: true,
//                         toggleVisibility: () {
//                           setState(() {
//                             isPasswordVisible = !isPasswordVisible;
//                           });
//                         },
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Confirm Password cannot be empty';
//                           }
//                           if (value != _passwordController.text) {
//                             return 'Passwords do not match';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       CustomTextField(
//                         label: 'Referral Code (Optional)',
//                         hint: 'Enter a referral code',
//                         controller: _referralController,
//                       ),
//                       const SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: submitRegistrationPageForm,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black,
//                           minimumSize: const Size(double.infinity, 50),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           'Submit',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CustomTextField extends StatelessWidget {
//   final String label;
//   final String hint;
//   final TextEditingController controller;
//   final bool obscureText;
//   final bool showEyeIcon;
//   final VoidCallback? toggleVisibility;
//   final String? Function(String?)? validator;
//
//   const CustomTextField({
//     required this.label,
//     required this.hint,
//     required this.controller,
//     this.obscureText = false,
//     this.showEyeIcon = false,
//     this.toggleVisibility,
//     this.validator,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 5),
//         TextFormField(
//           controller: controller,
//           obscureText: obscureText,
//           validator: validator,
//           decoration: InputDecoration(
//             hintText: hint,
//             suffixIcon: showEyeIcon
//                 ? IconButton(
//                     icon: Icon(
//                         obscureText ? Icons.visibility_off : Icons.visibility),
//                     onPressed: toggleVisibility,
//                   )
//                 : null,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:bpp_frontend/services/signup.dart';
import 'package:bpp_frontend/views/login_screen_view.dart';
import 'package:bpp_frontend/views/widgets/dashbaord/summary_section.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controller/screens/dashbaord_screen.dart';
import '../../../controller/screens/screen_dashbaord.dart';

import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _showErrors = false;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '*';
    }
    if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^\+91[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validateDateOfBirth(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Date of Birth is required';
    }
    if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
      return 'Please enter a valid date (yyyy-MM-dd)';
    }
    final DateTime? parsedDate = _parseDate(value);
    if (parsedDate == null) {
      return 'Please enter a valid date (yyyy-MM-dd)';
    }
    return null;
  }

  DateTime? _parseDate(String value) {
    try {
      return DateFormat('yyyy-MM-dd').parseStrict(value);
    } catch (e) {
      return null;
    }
  }

  String _formatDate(String input) {
    input =
        input.replaceAll(RegExp(r'[^\d]'), ''); // Remove non-numeric characters
    if (input.length > 4)
      input = input.substring(0, 4) + '-' + input.substring(4);
    if (input.length > 7)
      input = input.substring(0, 7) + '-' + input.substring(7);
    if (input.length > 10) input = input.substring(0, 10);
    return input;
  }

  String? validateGender(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Gender is required';
    }
    if (!['Male', 'Female', 'Other'].contains(value)) {
      return 'Please select a valid gender';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // RegistrationPage mein _submitForm() method mein:
  void _submitForm() {
    setState(() {
      _showErrors = true;
    });
    if (_formKey.currentState!.validate()) {
      final Map<String, String> personalData = {
        'title': _titleController.text,
        'firstName': _firstNameController.text,
        'middleName': _middleNameController.text,
        'lastName': _lastNameController.text,
        'dateOfBirth': _dateController.text,
        'email': _emailController.text,
        'age': _ageController.text,
        'gender': _genderController.text,
        'phoneNumber': _phoneController.text,
      };

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddressFormScreen(
            personalData: personalData,
            addressData: {},
            qualificationData: {},
            documentsData: {},
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final isDesktop = size.width > 1200;

    final horizontalPadding = size.width *
        (isDesktop
            ? 0.2
            : isTablet
            ? 0.1
            : 0.05);
    final containerWidth = isDesktop ? 1000.0 : size.width;
    final logoSize = size.width *
        (isDesktop
            ? 0.15
            : isTablet
            ? 0.2
            : 0.26);
    final titleFontSize = size.width *
        (isDesktop
            ? 0.02
            : isTablet
            ? 0.06
            : 0.06);
    final labelFontSize = size.width *
        (isDesktop
            ? 0.012
            : isTablet
            ? 0.015
            : 0.035);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: size.height * 0.02,
            ),
            child: Container(
              width: containerWidth,
              padding: EdgeInsets.all(size.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo Section
                    Center(
                      child: Container(
                        width: logoSize,
                        height: logoSize,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/bpp_logo2.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.0),
                    Center(
                      child: Text(
                        'Bharatiya Popular Party',
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      '     * Enter your details exactly as given in Aadhaar Card',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.03,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),

                    // Form Fields
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          children: [
                            // Name Fields
                            Column(
                              children: [
                                // Row for Title and First Name
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 1, // Equal size
                                      child: _buildFormField(
                                        'Title',
                                        'Select Title',
                                        labelFontSize,
                                        constraints,
                                        controller: _titleController,
                                        dropdownItems: [
                                          'Mr',
                                          'Ms',
                                          'Mrs',
                                          'Dr',
                                          'CA',
                                          'Cs',
                                          'Adv'
                                        ],
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please select a title';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                        width: 16), // Space between fields
                                    Flexible(
                                      flex: 1, // Equal size
                                      child: _buildFormField(
                                        'First Name',
                                        'Enter first name',
                                        controller: _firstNameController,
                                        labelFontSize,
                                        validator: validateName,
                                        constraints,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                    height: 16), // Space between rows

                                // Row for Middle Name and Last Name
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 1, // Equal size
                                      child: _buildFormField(
                                        'Middle Name',
                                        'Enter middle name',
                                        controller: _middleNameController,
                                        labelFontSize,
                                        constraints,
                                        validator: validateName,
                                      ),
                                    ),
                                    const SizedBox(
                                        width: 16), // Space between fields
                                    Flexible(
                                      flex: 1, // Equal size
                                      child: _buildFormField(
                                        'Last Name',
                                        'Enter last name',
                                        controller: _lastNameController,
                                        labelFontSize,
                                        constraints,
                                        validator: validateName,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                    height: 16), // Space below the last row

                                // Email Field (Full Width)
                                // Email Field (Full Width and Optional)
                                _buildFormField(
                                  'Email',
                                  'Enter email address',
                                  controller: _emailController,
                                  labelFontSize,
                                  constraints,
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      final emailRegex = RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                      if (!emailRegex.hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                    }
                                    return null; // Optional, no error if left empty
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  fullWidth: true,
                                  suffixText:
                                  'Optional', // Display "Optional" next to the label
                                ),
                              ],
                            ),

                            // Date of Birth and Age
                            _buildDateAndAgeFields(constraints, labelFontSize),

                            // Gender and Phone Number
                            _buildResponsiveRow(
                              constraints,
                              [
                                _buildDropdownField(
                                  'Gender',
                                  'Select gender',
                                  labelFontSize,
                                  constraints,
                                  _genderController,
                                  ['Male', 'Female', 'Other'],
                                ),
                                _buildValidatedFormField(
                                  'Phone Number',
                                  'Enter phone number',
                                  labelFontSize,
                                  constraints,
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                  validator: validatePhone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(
                                        r'[0-9\+]')), // Allows numbers and +
                                    LengthLimitingTextInputFormatter(
                                        13), // Limits to +91 and 10 digits
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),

                    SizedBox(height: size.height * 0.01),

                    // Next Button
                    SizedBox(
                      width: isDesktop ? containerWidth * 0.3 : double.infinity,
                      height: size.height * 0.06,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: labelFontSize * 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(
      String label,
      String hintText,
      double labelFontSize,
      BoxConstraints constraints,
      TextEditingController? controller,
      List<String> dropdownItems,
      ) {
    return Container(
      width: constraints.maxWidth > 600
          ? (constraints.maxWidth - 20) / 2
          : constraints.maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: labelFontSize, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _showErrors && (controller?.text.isEmpty ?? true)
                    ? Colors.red
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding:
                EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                border: InputBorder.none,
                errorStyle: const TextStyle(height: 0),
              ),
              value: dropdownItems.contains(controller?.text) &&
                  controller!.text.isNotEmpty
                  ? controller.text
                  : null,
              items: dropdownItems.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null && controller != null) {
                  controller.text = newValue;
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValidatedFormField(
      String label,
      String hintText,
      double labelFontSize,
      BoxConstraints constraints, {
        TextInputType? keyboardType,
        int? maxLength,
        String? Function(String?)? validator,
        List<TextInputFormatter>? inputFormatters,
        TextEditingController? controller,
      }) {
    return FormField<String>(
      validator: validator,
      autovalidateMode:
      AutovalidateMode.disabled, // Disable auto-validation during input
      builder: (FormFieldState<String> state) {
        return Container(
          width: constraints.maxWidth > 400
              ? (constraints.maxWidth - 20) / 2
              : constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: labelFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                  // border: Border.all(
                  //   color: state.hasError ? Colors.red : Colors.transparent,
                  //   width: 2,
                  // ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  maxLength: maxLength,
                  inputFormatters: inputFormatters,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    counterText: '',
                    errorStyle: const TextStyle(
                        height: 0), // Hide error message under the field
                  ),
                  onChanged: (value) {
                    state.didChange(value);

                    // Auto-prefix "+91" for phone numbers
                    if (label == 'Phone Number' && !value.startsWith('+91')) {
                      controller?.text =
                          '+91' + value.replaceFirst(RegExp(r'^\+91'), '');
                      controller?.selection = TextSelection.collapsed(
                          offset: controller!.text.length);
                    }
                  },
                  onEditingComplete: () {
                    // Trigger validation when the user finishes editing
                    state.validate();
                  },
                ),
              ),
              if (state.hasError) // Show error message dynamically
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    state.errorText ?? '',
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  _buildResponsiveRow(
      BoxConstraints constraints,
      List<Widget> children,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: constraints.maxWidth > 600
          ? children // Show fields side by side on larger screens
          : [
        // Stack fields vertically on small screens (e.g., mobile devices)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildFormField(
      String label,
      String hintText,
      double labelFontSize,
      BoxConstraints constraints, {
        bool fullWidth = false,
        TextInputType keyboardType = TextInputType.text,
        List<TextInputFormatter>? inputFormatters,
        String? Function(String?)? validator,
        TextEditingController? controller,
        List<String>? dropdownItems,
        String? suffixText, // Optional
      }) {
    return Container(
      width: fullWidth
          ? constraints.maxWidth
          : constraints.maxWidth > 400
          ? (constraints.maxWidth - 20) / 2
          : constraints.maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: labelFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          FormField<String>(
            validator: validator,
            autovalidateMode: _showErrors
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            builder: (FormFieldState<String> state) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: state.hasError && _showErrors
                        ? Colors.red
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 12),
                child: dropdownItems != null
                    ? DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    errorStyle: const TextStyle(height: 0),
                    suffixText: suffixText, // Optional
                  ),
                  value: controller?.text.isNotEmpty == true
                      ? controller!.text
                      : null,
                  items: dropdownItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null && controller != null) {
                      controller.text = newValue;
                      state.didChange(newValue);
                    }
                  },
                )
                    : TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    errorStyle: const TextStyle(height: 0),
                    suffixText: suffixText, // Optional
                  ),
                  onChanged: (value) {
                    state.didChange(value);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDateAndAgeFields(
      BoxConstraints constraints, double labelFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date of Birth Field
        Text('Date of Birth',
            style: TextStyle(
                fontSize: labelFontSize, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _showErrors &&
                  validateDateOfBirth(_dateController.text) != null
                  ? Colors.red
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: TextFormField(
            controller: _dateController,
            decoration: InputDecoration(
              hintText: 'yyyy-MM-dd',
              border: InputBorder.none,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            onSurface: Colors.black,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (picked != null) {
                    setState(() {
                      _dateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                      _ageController.text = (DateTime.now().year -
                          picked.year -
                          ((DateTime.now().month < picked.month ||
                              (DateTime.now().month == picked.month &&
                                  DateTime.now().day < picked.day))
                              ? 1
                              : 0))
                          .toString();
                    });
                  }
                },
              ),
            ),
            keyboardType: TextInputType.datetime,
            inputFormatters: [
              TextInputFormatter.withFunction(
                    (oldValue, newValue) {
                  final formatted = _formatDate(newValue.text);
                  return TextEditingValue(
                    text: formatted,
                    selection:
                    TextSelection.collapsed(offset: formatted.length),
                  );
                },
              ),
            ],
            onChanged: (value) {
              if (validateDateOfBirth(value) == null) {
                final DateTime? dob = _parseDate(value);
                if (dob != null) {
                  setState(() {
                    _ageController.text = (DateTime.now().year -
                        dob.year -
                        ((DateTime.now().month < dob.month ||
                            (DateTime.now().month == dob.month &&
                                DateTime.now().day < dob.day))
                            ? 1
                            : 0))
                        .toString();
                  });
                }
              }
            },
          ),
        ),
        const SizedBox(height: 16),

        // Age Field (Read-only)
        Text('Age',
            style: TextStyle(
                fontSize: labelFontSize, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.transparent,
              width: 2,
            ),
          ),
          child: TextFormField(
            controller: _ageController,
            enabled: false, // Disable editing
            decoration: InputDecoration(
              hintText: 'Age',
              border: InputBorder.none,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class AddressFormScreen extends StatefulWidget {
  final Map<String, String> personalData;
  final Map<String, String> addressData;
  final Map<String, String> qualificationData;
  final Map<String, String> documentsData;

  const AddressFormScreen({
    Key? key,
    required this.personalData,
    required this.addressData,
    required this.qualificationData,
    required this.documentsData,
  }) : super(key: key);

  @override
  _AddressFormScreen createState() => _AddressFormScreen();
}

class _AddressFormScreen extends State<AddressFormScreen> {
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _cityOrvillageController =
  TextEditingController();
  final TextEditingController _talukaController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // In _AddressFormScreen's submitRegistrationPageForm method:
  // AddressFormScreen mein submitRegistrationPageForm method mein:
  void submitRegistrationPageForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Map<String, String> updatedAddressData = {
        'addressLine1': _address1Controller.text,
        'addressLine2': _address2Controller.text,
        'cityVillage': _cityOrvillageController.text,
        'taluka': _talukaController.text,
        'district': _districtController.text,
        'state': _stateController.text,
        'pincode': _pincodeController.text,
      };

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignupPage(
            personalData:
            widget.personalData, // Previous screen se aaya hua data
            addressData: updatedAddressData, qualificationData: {},
            documentsData: {},
            // Current screen ka data
            // qualificationData: widget.qualificationData,
            // documentsData: widget.documentsData,
          ),
        ),
      );
    }
  }

  // Form field validation
  String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $fieldName';
    }
    return null;
  }

  // Custom text field builder with validation
  Widget _buildFormField(
      String label,
      String hint,
      TextEditingController controller, {
        TextInputType keyboardType = TextInputType.text,
        List<TextInputFormatter>? inputFormatters,
        String? Function(String?)? validator,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200, // Background color
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors
                  .transparent, // Set to transparent as the background color is set in Container
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              // Automatically trim and allow only 6 digits
              if (value.length > 6) {
                controller.text = value.substring(0, 6);
                controller.selection =
                    TextSelection.fromPosition(TextPosition(offset: 6));
              }
            },
            validator: validator,
          ),
        ),
      ],
    );
  }

// Pincode Validation for exactly 6 digits
  String? validatePincode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pincode is required';
    }
    if (value.length != 6) {
      return 'Please enter exactly 6 digits';
    }
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'Please enter a valid 6-digit pincode';
    }
    return null;
  }

  @override
  void dispose() {
    _address1Controller.dispose();
    _address2Controller.dispose();
    _cityOrvillageController.dispose();
    _talukaController.dispose();
    _districtController.dispose();
    _stateController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            width: 380,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Center(
                    child: Image.asset(
                      'assets/images/bpp_logo2.png',
                      height: 80,
                    ),
                  ),
                  // SizedBox(height: 5),
                  Center(
                    child: Text(
                      "Bharatiya Popular Party",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "* Provide Address as given in Aadhaar Card",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormField(
                        "Address Line 1",
                        "House/Flat No.",
                        _address1Controller,
                      ),
                      SizedBox(height: 16),
                      _buildFormField(
                        "Address Line 2",
                        "Area, Landmark",
                        _address2Controller,
                      ),
                      SizedBox(height: 16),
                      _buildFormField(
                        "City/Village",
                        "Enter city/village",
                        _cityOrvillageController,
                      ),
                      SizedBox(height: 16),
                      _buildFormField(
                        "Taluka",
                        "Enter taluka",
                        _talukaController,
                      ),
                      SizedBox(height: 16),
                      _buildFormField(
                        "District",
                        "Enter district",
                        _districtController,
                      ),
                      SizedBox(height: 16),
                      _buildFormField(
                        "State",
                        "Enter state",
                        _stateController,
                      ),
                      SizedBox(height: 16),
                      _buildFormField(
                        "Pincode",
                        "Enter pincode",
                        _pincodeController,
                        keyboardType: TextInputType
                            .number, // Ensures numeric keyboard only
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only digits allowed
                        validator:
                        validatePincode, // Custom validation for 6-digit pincode
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => submitRegistrationPageForm(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class SignupPage extends StatefulWidget {
  final Map<String, String> personalData;
  final Map<String, String> addressData;
  final Map<String, String> qualificationData;
  final Map<String, String> documentsData;

  const SignupPage({
    Key? key,
    required this.personalData,
    required this.addressData,
    required this.qualificationData,
    required this.documentsData,
  }) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _voterIDController = TextEditingController();
//   final TextEditingController _aadhaarIDController = TextEditingController();
//
//   File? _aadhaarBack;
//   File? _aadhaarFront;
//   File? _voterFront;
//   File? _voterBack;
//
//   String? _aadhaarBackType;
//   String? _aadhaarFrontType;
//   String? _voterFrontType;
//   String? _voterBackType;
//
//   bool _isYesSelected = false;
//   bool _isNoSelected = false;
//
//   final List<String> _supportedImageTypes = ['jpg', 'jpeg', 'png'];
//   final List<String> _supportedDocTypes = ['pdf'];
//
//   // Method to pick files
//   Future<void> _pickFile(
//     void Function(File?, String?) setFile,
//     bool allowPdf,
//   ) async {
//     try {
//       final ImagePicker picker = ImagePicker();
//       final XFile? pickedFile = await picker.pickImage(
//         source: ImageSource.gallery,
//         maxHeight: 800,
//         maxWidth: 800,
//       );
//
//       if (pickedFile != null) {
//         final file = File(pickedFile.path);
//         final fileType = pickedFile.name.split('.').last.toLowerCase();
//
//         if (_supportedImageTypes.contains(fileType) ||
//             (allowPdf && _supportedDocTypes.contains(fileType))) {
//           setFile(file, fileType);
//         } else {
//           _showErrorSnackBar('Invalid file type. Please select a valid file.');
//         }
//       }
//     } catch (e) {
//       _showErrorSnackBar('Error picking file: $e');
//     }
//   }
//
//   // Helper function to show an error snackbar
//   void _showErrorSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
//
//   void _submitData() {
//     if (!_formKey.currentState!.validate()) return;
//
//     final hasAadhaarDetails = _aadhaarIDController.text.isNotEmpty &&
//         _aadhaarBack != null &&
//         _aadhaarFront != null;
//
//     final hasVoterDetails = _voterIDController.text.isNotEmpty &&
//         _voterFront != null &&
//         _voterBack != null;
//
//     if (!(hasAadhaarDetails || hasVoterDetails)) {
//       _showErrorSnackBar(
//           'Please provide either Aadhaar details or Voter ID details.');
//       return;
//     }
//
//     if (hasAadhaarDetails && hasVoterDetails) {
//       _showErrorSnackBar(
//           'You can only upload one set of documents: Aadhaar or Voter ID.');
//       return;
//     }
//
//     final documentsData = <String, String>{};
//
//     if (hasAadhaarDetails) {
//       documentsData['aadhaarNumber'] = _aadhaarIDController.text;
//       documentsData['aadhaarBackFile'] = _aadhaarBack?.path ?? '';
//       documentsData['aadhaarFrontFile'] = _aadhaarFront?.path ?? '';
//     } else if (hasVoterDetails) {
//       documentsData['voterId'] = _voterIDController.text;
//       documentsData['voterFrontFile'] = _voterFront?.path ?? '';
//       documentsData['voterBackFile'] = _voterBack?.path ?? '';
//     }
//
//     if (_isYesSelected) {
//       // If Yes is selected, proceed to QualificationScreen to collect qualification data
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => QualificationScreen(
//             personalData: widget.personalData,
//             addressData: widget.addressData,
//             qualificationData: widget.qualificationData,
//             documentsData: documentsData,
//             files: [],
//           ),
//         ),
//       );
//     } else if (_isNoSelected) {
//       // If No is selected, skip QualificationScreen and go directly to PasswordPage
//       // with empty strings for qualification data
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => PasswordPage(
//             title: widget.personalData['title'] ?? '',
//             firstName: widget.personalData['firstName'] ?? '',
//             middleName: widget.personalData['middleName'] ?? '',
//             lastName: widget.personalData['lastName'] ?? '',
//             age: widget.personalData['age'] ?? '',
//             gender: widget.personalData['gender'] ?? '',
//             phone: widget.personalData['phoneNumber'] ?? '',
//             dateOfBirth: widget.personalData['dateOfBirth'] ?? '',
//             email: widget.personalData['email'] ?? '',
//             addressLine1: widget.addressData['addressLine1'] ?? '',
//             addressLine2: widget.addressData['addressLine2'] ?? '',
//             cityOrVillage: widget.addressData['cityVillage'] ?? '',
//             taluka: widget.addressData['taluka'] ?? '',
//             district: widget.addressData['district'] ?? '',
//             state: widget.addressData['state'] ?? '',
//             pincode: widget.addressData['pincode'] ?? '',
//             // Use empty strings instead of null for qualification data
//             profession: '',
//             qualification: '',
//             position: '',
//             // Document data
//             aadhaarNumber: documentsData['aadhaarNumber'] ?? '',
//             voterId: documentsData['voterId'] ?? '',
//             aadhaarBack: documentsData['aadhaarBackFile'] ?? '',
//             aadhaarFront: documentsData['aadhaarFrontFile'] ?? '',
//             voterFront: documentsData['voterFrontFile'] ?? '',
//             voterBack: documentsData['voterBackFile'] ?? '',
//             files: [],
//           ),
//         ),
//       );
//     } else {
//       _showErrorSnackBar('Please select Yes or No for community service.');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(20.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             width: 330,
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 50),
//                   Center(
//                     child: Image.asset(
//                       'assets/images/bpp_logo2.png',
//                       height: 80,
//                     ),
//                   ),
//                   SizedBox(height: 6),
//                   const Text(
//                     "Bharatiya Popular Party",
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   _buildTextField("Aadhaar Number", "Enter Aadhaar Number",
//                       _aadhaarIDController),
//                   const SizedBox(height: 10),
//                   _buildFileUploadSection(
//                     "Aadhaar Front",
//                     _aadhaarFront,
//                     _aadhaarFrontType,
//                     (file, type) => setState(() {
//                       _aadhaarFront = file;
//                       _aadhaarFrontType = type;
//                     }),
//                   ),
//                   SizedBox(height: 10),
//                   _buildFileUploadSection(
//                     "Aadhaar Back",
//                     _aadhaarBack,
//                     _aadhaarBackType,
//                     (file, type) => setState(() {
//                       _aadhaarBack = file;
//                       _aadhaarBackType = type;
//                     }),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: Colors.black,
//                           thickness: 1,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 3.0),
//                         child: Text(
//                           "OR",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           color: Colors.black,
//                           thickness: 1,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   _buildTextField(
//                       "Voter ID", "Enter Voter ID", _voterIDController),
//                   const SizedBox(height: 10),
//                   _buildFileUploadSection(
//                     "Voter Front",
//                     _voterFront,
//                     _voterFrontType,
//                     (file, type) => setState(() {
//                       _voterFront = file;
//                       _voterFrontType = type;
//                     }),
//                   ),
//                   _buildFileUploadSection(
//                     "Voter Back",
//                     _voterBack,
//                     _voterBackType,
//                     (file, type) => setState(() {
//                       _voterBack = file;
//                       _voterBackType = type;
//                     }),
//                   ),
//                   const SizedBox(height: 20),
//                   _buildCommunityServiceCheckBox(),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _submitData,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                       child: Text(
//                         "Next",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCommunityServiceCheckBox() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Do you want to serve the community as a professional? *",
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           "Serving the community as a professional member can help winning the confidence and increase your chances of being nominated as block head.",
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//         SizedBox(height: 5),
//         Row(
//           children: [
//             Checkbox(
//               value: _isYesSelected,
//               onChanged: (bool? value) {
//                 setState(() {
//                   _isYesSelected = value!;
//                   _isNoSelected = false;
//                 });
//               },
//             ),
//             Text('Yes'),
//             SizedBox(width: 10),
//             Checkbox(
//               value: _isNoSelected,
//               onChanged: (bool? value) {
//                 setState(() {
//                   _isNoSelected = value!;
//                   _isYesSelected = false;
//                 });
//               },
//             ),
//             Text('No'),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTextField(
//     String label,
//     String hint,
//     TextEditingController controller,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.all(12.0),
//             ),
//             keyboardType: TextInputType.number,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildFileUploadSection(
//     String label,
//     File? file,
//     String? fileType,
//     void Function(File?, String?) setFile, {
//     TextEditingController? controller,
//     String? hint,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 4), // Consistent spacing
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: SizedBox(
//             width: double.infinity, // Stretch across available space
//             child: TextButton.icon(
//               onPressed: () =>
//                   _pickFile((file, type) => setFile(file, type), true),
//               icon: const Icon(Icons.upload_file, color: Colors.black),
//               label: const Text(
//                 "Choose File",
//                 style: TextStyle(color: Colors.black),
//               ),
//               style: TextButton.styleFrom(
//                 padding: const EdgeInsets.all(12.0),
//                 alignment: Alignment.centerLeft, // Align content to the left
//               ),
//             ),
//           ),
//         ),
//         if (file != null)
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Text(
//               "File Uploaded: ${file.path.split('/').last}",
//               style: const TextStyle(fontSize: 12),
//             ),
//           ),
//         if (controller != null && hint != null)
//           Container(
//             margin: const EdgeInsets.only(top: 12),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200,
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: SizedBox(
//               width: double.infinity,
//               child: TextFormField(
//                 controller: controller,
//                 decoration: InputDecoration(
//                   hintText: hint,
//                   border: InputBorder.none,
//                   contentPadding: const EdgeInsets.all(12.0),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _voterIDController = TextEditingController();
  final TextEditingController _aadhaarIDController = TextEditingController();

  File? _aadhaarBack;
  File? _aadhaarFront;
  File? _voterFront;
  File? _voterBack;

  String? _aadhaarBackType;
  String? _aadhaarFrontType;
  String? _voterFrontType;
  String? _voterBackType;

  bool _isYesSelected = false;
  bool _isNoSelected = false;

  final List<String> _supportedImageTypes = ['jpg', 'jpeg', 'png'];
  final List<String> _supportedDocTypes = ['pdf'];

  Future<void> _pickFile(
      void Function(File?, String?) setFile,
      bool allowPdf,
      ) async {
    try {
      // Use file_picker for all file types (images and PDFs)
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: allowPdf ? FileType.custom : FileType.image,
        allowedExtensions:
        allowPdf ? ['jpg', 'jpeg', 'png', 'pdf'] : ['jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        // Get the file and its extension
        File file = File(result.files.single.path!);
        String fileType = result.files.single.extension!.toLowerCase();

        // Validate file type
        if (_supportedImageTypes.contains(fileType) ||
            (allowPdf && _supportedDocTypes.contains(fileType))) {
          setFile(file, fileType);
        } else {
          _showErrorSnackBar('Invalid file type. Please select a valid file.');
        }
      }
    } catch (e) {
      _showErrorSnackBar('Error picking file: $e');
    }
  }

  // Helper function to show an error snackbar
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _submitData() {
    if (!_formKey.currentState!.validate()) return;

    final hasAadhaarDetails = _aadhaarIDController.text.isNotEmpty &&
        _aadhaarBack != null &&
        _aadhaarFront != null;

    final hasVoterDetails = _voterIDController.text.isNotEmpty &&
        _voterFront != null &&
        _voterBack != null;

    if (!hasAadhaarDetails && !hasVoterDetails) {
      _showErrorSnackBar(
          'Please provide at least one set of documents: Aadhaar or Voter ID.');
      return;
    }

    final documentsData = <String, String>{};

    if (hasAadhaarDetails) {
      documentsData['aadhaarNumber'] = _aadhaarIDController.text;
      documentsData['aadhaarBackFile'] = _aadhaarBack?.path ?? '';
      documentsData['aadhaarFrontFile'] = _aadhaarFront?.path ?? '';
    }

    if (hasVoterDetails) {
      documentsData['voterId'] = _voterIDController.text;
      documentsData['voterFrontFile'] = _voterFront?.path ?? '';
      documentsData['voterBackFile'] = _voterBack?.path ?? '';
    }

    if (_isYesSelected) {
      // If Yes is selected, proceed to QualificationScreen to collect qualification data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QualificationScreen(
            personalData: widget.personalData,
            addressData: widget.addressData,
            qualificationData: widget.qualificationData,
            documentsData: documentsData,
            files: [],
          ),
        ),
      );
    } else if (_isNoSelected) {
      // If No is selected, skip QualificationScreen and go directly to PasswordPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordPage(
            title: widget.personalData['title'] ?? '',
            firstName: widget.personalData['firstName'] ?? '',
            middleName: widget.personalData['middleName'] ?? '',
            lastName: widget.personalData['lastName'] ?? '',
            age: widget.personalData['age'] ?? '',
            gender: widget.personalData['gender'] ?? '',
            phone: widget.personalData['phoneNumber'] ?? '',
            dateOfBirth: widget.personalData['dateOfBirth'] ?? '',
            email: widget.personalData['email'] ?? '',
            addressLine1: widget.addressData['addressLine1'] ?? '',
            addressLine2: widget.addressData['addressLine2'] ?? '',
            cityOrVillage: widget.addressData['cityVillage'] ?? '',
            taluka: widget.addressData['taluka'] ?? '',
            district: widget.addressData['district'] ?? '',
            state: widget.addressData['state'] ?? '',
            pincode: widget.addressData['pincode'] ?? '',
            // Qualification data as empty strings
            profession: '',
            qualification: '',
            position: '',
            // Document data
            aadhaarNumber: documentsData['aadhaarNumber'] ?? '',
            voterId: documentsData['voterId'] ?? '',
            aadhaarBack: documentsData['aadhaarBackFile'] ?? '',
            aadhaarFront: documentsData['aadhaarFrontFile'] ?? '',
            voterFront: documentsData['voterFrontFile'] ?? '',
            voterBack: documentsData['voterBackFile'] ?? '',
            files: [], referralCode: '',
          ),
        ),
      );
    } else {
      _showErrorSnackBar('Please select Yes or No for community service.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            width: 330,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Image.asset(
                      'assets/images/bpp_logo2.png',
                      height: 80,
                    ),
                  ),
                  SizedBox(height: 6),
                  const Text(
                    "Bharatiya Popular Party",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                      "Aadhaar Number",
                      "Enter Aadhaar Number",
                      _aadhaarIDController,
                      TextInputType
                          .number, // Numeric keyboard for Aadhaar Number
                      12,
                      true),
                  const SizedBox(height: 10),
                  _buildFileUploadSection(
                    "Aadhaar Front",
                    _aadhaarFront,
                    _aadhaarFrontType,
                        (file, type) => setState(() {
                      _aadhaarFront = file;
                      _aadhaarFrontType = type;
                    }),
                  ),
                  SizedBox(height: 10),
                  _buildFileUploadSection(
                    "Aadhaar Back",
                    _aadhaarBack,
                    _aadhaarBackType,
                        (file, type) => setState(() {
                      _aadhaarBack = file;
                      _aadhaarBackType = type;
                    }),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Text(
                          "OR",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildTextField(
                    "Voter ID",
                    "Enter Voter ID",
                    _voterIDController,
                    TextInputType.text, // Text keyboard for Voter ID
                    10, // Limit to 10 digits
                    false, // Allow letters and digits
                  ),
                  const SizedBox(height: 10),
                  _buildFileUploadSection(
                    "Voter Front",
                    _voterFront,
                    _voterFrontType,
                        (file, type) => setState(() {
                      _voterFront = file;
                      _voterFrontType = type;
                    }),
                  ),
                  _buildFileUploadSection(
                    "Voter Back",
                    _voterBack,
                    _voterBackType,
                        (file, type) => setState(() {
                      _voterBack = file;
                      _voterBackType = type;
                    }),
                  ),
                  const SizedBox(height: 20),
                  _buildCommunityServiceCheckBox(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCommunityServiceCheckBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Do you want to serve the community as a professional? *",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Serving the community as a professional member can help winning the confidence and increase your chances of being nominated as block head.",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Checkbox(
              value: _isYesSelected,
              onChanged: (bool? value) {
                setState(() {
                  _isYesSelected = value!;
                  _isNoSelected = false;
                });
              },
            ),
            Text('Yes'),
            SizedBox(width: 10),
            Checkbox(
              value: _isNoSelected,
              onChanged: (bool? value) {
                setState(() {
                  _isNoSelected = value!;
                  _isYesSelected = false;
                });
              },
            ),
            Text('No'),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(
      String label,
      String hint,
      TextEditingController controller,
      TextInputType keyboardType,
      int maxLength,
      bool allowOnlyDigits, // Allow only digits if true
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(12.0),
            ),
            keyboardType: keyboardType,
            inputFormatters: [
              LengthLimitingTextInputFormatter(
                  maxLength), // Limit input to specified digits
              if (allowOnlyDigits)
                FilteringTextInputFormatter
                    .digitsOnly, // Allow only digits if specified
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFileUploadSection(
      String label,
      File? file,
      String? fileType,
      void Function(File?, String?) setFile, {
        TextEditingController? controller,
        String? hint,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4), // Consistent spacing
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: SizedBox(
            width: double.infinity, // Stretch across available space
            child: TextButton.icon(
              onPressed: () =>
                  _pickFile((file, type) => setFile(file, type), true),
              icon: const Icon(Icons.upload_file, color: Colors.black),
              label: const Text(
                "Choose File",
                style: TextStyle(color: Colors.black),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(12.0),
                alignment: Alignment.centerLeft, // Align content to the left
              ),
            ),
          ),
        ),
        if (file != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "File Uploaded: ${file.path.split('/').last}",
              style: const TextStyle(fontSize: 12),
            ),
          ),
        if (controller != null && hint != null)
          Container(
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(12.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
      ],
    );
  }
}

class QualificationScreen extends StatefulWidget {
  final Map<String, String> addressData;
  final Map<String, String> personalData; // Added personal data
  final Map<String, String> qualificationData;
  final Map<String, String> documentsData;
  final List<Uint8List?> files;

  const QualificationScreen({
    Key? key,
    required this.addressData,
    required this.personalData, // Added this parameter
    required this.qualificationData,
    required this.documentsData,
    required this.files,
  }) : super(key: key);

  @override
  _QualificationScreenState createState() => _QualificationScreenState();
}

class _QualificationScreenState extends State<QualificationScreen> {
  final List<String> professions = ['Medical', 'Legal', 'Social', 'Other'];
  String? selectedProfession;

  final TextEditingController _qualificationController =
  TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _qualificationController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  // TextField builder with validation (keeping existing implementation)
  Widget _buildTextField(
      String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$label is required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  // Dropdown builder (keeping existing implementation)
  Widget _buildDropdownField(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            hint: Text("Select Profession"),
            value: selectedProfession,
            onChanged: (newValue) {
              setState(() {
                selectedProfession = newValue;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a profession';
              }
              return null;
            },
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              border: InputBorder.none,
            ),
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // Modified form submission logic
  // Modified form submission logic for qualification screen
  void submitRegistrationPageForm(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      // Collect qualification and position data
      final qualificationData = {
        'qualification': _qualificationController.text,
        'profession': selectedProfession ?? '',
        'position': _positionController.text,
      };

      // Combine data from all screens
      final personalData = widget.personalData;
      final addressData = widget.addressData;
      final documentsData = widget.documentsData;

      // Pass data to the next screen or handle final submission
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordPage(
            // Personal Data
            firstName: personalData['firstName'] ?? '',
            lastName: personalData['lastName'] ?? '',
            email: personalData['email'] ?? '',
            middleName: personalData['middleName'] ?? '',
            title: personalData['title'] ?? '',
            age: personalData['age'] ?? '',
            dateOfBirth: personalData['dateOfBirth'] ?? '',
            gender: personalData['gender'] ?? '',
            phone: personalData['phoneNumber'] ?? '',

            // Address Data
            addressLine1: addressData['addressLine1'] ?? '',
            addressLine2: addressData['addressLine2'] ?? '',
            cityOrVillage: addressData['cityVillage'] ?? '',
            taluka: addressData['taluka'] ?? '',
            district: addressData['district'] ?? '',
            state: addressData['state'] ?? '',
            pincode: addressData['pincode'] ?? '',

            // Documents Data
            aadhaarNumber: documentsData['aadhaarNumber'] ?? '',

            aadhaarBack: documentsData['aadhaarBackFile'] ?? '',
            aadhaarFront: documentsData['aadhaarFrontFile'] ?? '',
            voterId: documentsData['voterId'] ?? '',
            voterFront: documentsData['voterFrontFile'] ?? '',
            voterBack: documentsData['voterBackFile'] ?? '',

            // Qualification Data
            qualification: qualificationData['qualification'] ?? '',
            profession: qualificationData['profession'] ?? '',
            position: qualificationData['position'] ?? '',
            files: widget.files, referralCode: '',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            width: 330,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/bpp_logo2.png',
                    height: 90,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Bharatiya Popular Party",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 25),
                  _buildTextField(
                    "Qualification",
                    "Enter your qualification",
                    _qualificationController,
                  ),
                  SizedBox(height: 16),
                  _buildDropdownField("Profession", professions),
                  SizedBox(height: 16),
                  _buildTextField(
                    "Position",
                    "Enter your position",
                    _positionController,
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => submitRegistrationPageForm(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordPage extends StatefulWidget {
  final String title;
   final String email;
  final String firstName;
  final String middleName;
  final String lastName;
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
  final String referralCode;

  const PasswordPage({
    Key? key,
    required this.title,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.age,
    required this.dateOfBirth,
    required this.gender,
    required this.phone,
    required this.qualification,
    required this.profession,
    required this.position,
    required this.pincode,
    required this.addressLine1,
    required this.addressLine2,
    required this.cityOrVillage,
    required this.state,
    required this.aadhaarNumber,
    required this.aadhaarBack,
    required this.aadhaarFront,
    required this.voterId,
    required this.voterFront,
    required this.voterBack,
    required this.taluka,
    required this.district,
    required this.email,
    required this.files,
    required this.referralCode,
  }) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}



class _PasswordPageState extends State<PasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final TextEditingController _referralController = TextEditingController();

  bool isPasswordVisible = false;

  bool get hasAadhaarDetails =>
      widget.aadhaarNumber.isNotEmpty &&
          widget.aadhaarFront.isNotEmpty &&
          widget.aadhaarBack.isNotEmpty;

  bool get hasVoterDetails =>
      widget.voterId.isNotEmpty &&
          widget.voterFront.isNotEmpty &&
          widget.voterBack.isNotEmpty;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _referralController.dispose();
    super.dispose();
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }



  Future<bool> validateReferralCode(String referralCode) async {
    final String url = 'https://api.bppindia.com:8443/api/v1/validateReferralCode';

    try {
      // Define headers
      final headers = {
        'Content-Type': 'application/json',
      };

      // Prepare the body with proper JSON encoding
      final body = jsonEncode({'referralCode': referralCode.trim()});

      // Make the POST request
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      // Log response for debugging
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      // Parse and return the validity of the referral code
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        return responseBody['isValid'] ?? false; // Return 'isValid' or false if missing
      } else {
        print('Error: Unexpected status code ${response.statusCode}');
        return false;
      }
    } catch (error) {
      // Log the error for debugging
      print('Error occurred: $error');
      return false;
    }
  }

  Future<void> submitRegistrationPageForm(BuildContext context) async {
    if (!hasAadhaarDetails && !hasVoterDetails) {
      showErrorDialog(context, 'Please provide either Aadhaar or Voter ID details');
      return;
    }

    if (_formKey.currentState!.validate()) {
      final referralCode = _referralController.text.trim();

      // Validate referral code if provided
      if (referralCode.isNotEmpty) {
        final isReferralValid = await validateReferralCode(referralCode);
        if (!isReferralValid) {
          showErrorDialog(context, 'Invalid referral code');
          return;
        }
      }

      try {
        // Show loading indicator
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(child: CircularProgressIndicator()),
        );

        // Prepare fields for registration
        final Map<String, String> basicFields = {
          if (referralCode.isNotEmpty) 'referralCode': referralCode,
          'firstName': widget.firstName,
          'lastName': widget.lastName,
          'password': _passwordController.text,
          'qualification': widget.qualification,
          'profession': widget.profession,
          'position': widget.position,
          'addressLine1': widget.addressLine1,
          'addressLine2': widget.addressLine2,
          'cityOrVillage': widget.cityOrVillage,
          'taluka': widget.taluka,
          'district': widget.district,
          'state': widget.state,
          'phone': widget.phone,
          'title': widget.title,
          'middleName': widget.middleName,
          'dateOfBirth': widget.dateOfBirth,
          'age': widget.age,
          'pincode': widget.pincode,
          'gender': widget.gender,
          if (hasAadhaarDetails) 'aadhaarNumber': widget.aadhaarNumber,
          if (hasVoterDetails) 'voterId': widget.voterId,
        };

        // Prepare the request
        final request = http.MultipartRequest(
          'POST',
          Uri.parse('https://api.bppindia.com:8443/api/v1/signup'),
        );
        request.fields.addAll(basicFields);

        // Handle file attachments
        final Map<String, String> filesMap = {};
        if (hasAadhaarDetails) {
          filesMap['aadhaarBack'] = widget.aadhaarBack;
          filesMap['aadhaarFront'] = widget.aadhaarFront;
        }
        if (hasVoterDetails) {
          filesMap['voterFront'] = widget.voterFront;
          filesMap['voterBack'] = widget.voterBack;
        }

        for (var entry in filesMap.entries) {
          if (entry.value.isNotEmpty) {
            final file = File(entry.value);
            if (await file.exists()) {
              request.files.add(
                await http.MultipartFile.fromPath(entry.key, entry.value),
              );
            } else {
              print('File not found: ${entry.value}');
            }
          }
        }

        // Send the request
        final response = await request.send();
        final responseBody = await response.stream.bytesToString();
        Navigator.pop(context); // Close the loading indicator

        if (response.statusCode == 201) {
          // Registration success
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreenView()),
          );
        } else {
          print('Registration failed: $responseBody');
          showErrorDialog(context, 'Registration failed: $responseBody');
        }
      } catch (error) {
        print('Error occurred during registration: $error');
        showErrorDialog(context, 'An error occurred: $error');
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07,
                vertical: size.height * 0.05,
              ),
              child: Form(
                key: _formKey,
                child: Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[900] : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/bpp_logo2.png',
                        //  width: size.width * 0.2,
                        height: 80,
                        //  fit: BoxFit.contain,
                      ),
                      // const SizedBox(height: 20),
                      const Text(
                        'Bharatiya Popular Party',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: ' Password',
                        hint: 'Create a password',
                        controller: _passwordController,
                        obscureText: !isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),
                      CustomTextField(
                        label: ' Confirm Password',
                        hint: 'Confirm your password',
                        controller: _confirmPasswordController,
                        obscureText: !isPasswordVisible,
                        showEyeIcon: true,
                        toggleVisibility: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm Password cannot be empty';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: ' Referral Code (Optional)',
                        hint: 'Enter a referral code',
                        controller: _referralController,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => submitRegistrationPageForm(context),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final bool showEyeIcon;
  final VoidCallback? toggleVisibility;
  final String? Function(String?)? validator;

  const CustomTextField({
    required this.label,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.showEyeIcon = false,
    this.toggleVisibility,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(12.0),
              suffixIcon: showEyeIcon
                  ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: toggleVisibility,
              )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
