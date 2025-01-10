// import 'package:bpp_frontend/views/component/registration/password_page.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../../controller/screens/screen_dashbaord.dart';
// import 'address_page.dart';
//
// class PersonalPage extends StatefulWidget {
//   const PersonalPage({Key? key}) : super(key: key);
//
//   @override
//   State<PersonalPage> createState() => _PersonalPageState();
// }
//
// class _PersonalPageState extends State<PersonalPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController dateController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//
//   //fields logic
//   String? validateName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'This field is required';
//     }
//     if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
//       return 'Please enter a valid name';
//     }
//     return null;
//   }
//
//   String? validateName1(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'This field is required';
//     }
//     if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
//       return 'Please enter a valid name';
//     }
//     return null;
//   }
//
//   String? validateName2(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'This field is required';
//     }
//     if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
//       return 'Please enter a valid name';
//     }
//     return null;
//   }
//
//   // Validation Methods
//   String? validatePhone(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Phone number is required';
//     }
//     if (value.length != 10 || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//       return 'Please enter a valid phone number';
//     }
//     return null;
//   }
//
//   String? validateDateOfBirth(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Date of Birth is required';
//     }
//     // Check for valid date format (e.g., MM-dd-yyyy)
//     if (!RegExp(r'^\d{2}-\d{2}-\d{4}$').hasMatch(value)) {
//       return 'Please enter a valid date (MM-dd-yyyy)';
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
//   // String? validateAadhar(String? value) {
//   //   if (value == null || value.isEmpty) {
//   //     return 'Aadhar number is required';
//   //   }
//   //   if (value.length != 12 || !RegExp(r'^[0-9]{12}$').hasMatch(value)) {
//   //     return 'Please enter a valid Aadhar number';
//   //   }
//   //   return null;
//   // }
//
//   // String? validateVoterId(String? value) {
//   //   if (value == null || value.isEmpty) {
//   //     return 'Voter ID is required';
//   //   }
//   //   if (value.length != 10 || !RegExp(r'^[A-Za-z0-9]{10}$').hasMatch(value)) {
//   //     return 'Please enter a valid Voter ID';
//   //   }
//   //   return null;
//   // }
//
//   @override
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
//                   children: [
//                     // Logo Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(
//                         height: size.height * 0.02), // Spacing after the title
//                     Text(
//                       '* Enter your details exactly given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red, // Red color
//                         fontWeight: FontWeight.bold,
//                         fontSize:
//                             size.width * 0.03, // Adjust font size as needed
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
//                             _buildResponsiveRow(
//                               constraints,
//                               [
//                                 _buildFormField(
//                                   'Title',
//                                   'Select Title',
//                                   labelFontSize,
//                                   constraints,
//                                   dropdownItems: [
//                                     'Mr',
//                                     'Ms',
//                                     'Mrs',
//                                     'Dr',
//                                     'CA',
//                                     'Cs',
//                                     'Adv'
//                                   ], // List of titles
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please select a title';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                                 _buildFormField(
//                                   'First Name',
//                                   'Enter first name',
//                                   labelFontSize,
//                                   validator: validateName,
//                                   constraints,
//                                 ),
//                                 _buildFormField(
//                                   'Middle Name',
//                                   'Enter middle name',
//                                   labelFontSize,
//                                   constraints,
//                                   validator: validateName1,
//                                 ),
//                               ],
//                             ),
//                             _buildFormField(
//                               'Last Name',
//                               'Enter last name',
//                               labelFontSize,
//                               constraints,
//                               validator: validateName2,
//                               fullWidth: true,
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
//                                   ['Male', 'Female', 'Other'],
//                                 ),
//                                 _buildValidatedFormField(
//                                   'Phone Number',
//                                   'Enter phone number',
//                                   labelFontSize,
//                                   constraints,
//                                   keyboardType: TextInputType.number,
//                                   maxLength: 10,
//                                   validator: validatePhone,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(10),
//                                   ],
//                                 ),
//                               ],
//                             ),
//
//                             // Voter ID and Aadhar Number
//                             _buildResponsiveRow(
//                               constraints,
//                               [
//                                 // _buildValidatedFormField(
//                                 //   'Voter ID',
//                                 //   'Enter Voter ID',
//                                 //   labelFontSize,
//                                 //   constraints,
//                                 //   maxLength: 10,
//                                 //   validator: validateVoterId,
//                                 //   inputFormatters: [
//                                 //     LengthLimitingTextInputFormatter(10),
//                                 //     FilteringTextInputFormatter.allow(
//                                 //         RegExp(r'[A-Za-z0-9]')),
//                                 //   ],
//                                 // ),
//                                 // _buildValidatedFormField(
//                                 //   'Aadhar Number',
//                                 //   'Enter Aadhar Number',
//                                 //   labelFontSize,
//                                 //   constraints,
//                                 //   keyboardType: TextInputType.number,
//                                 //   maxLength: 12,
//                                 //   validator: validateAadhar,
//                                 //   inputFormatters: [
//                                 //     FilteringTextInputFormatter.digitsOnly,
//                                 //     LengthLimitingTextInputFormatter(12),
//                                 //   ],
//                                 // ),
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
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             Get.to(
//                               () => AddressPage(),
//                               transition: Transition.rightToLeft,
//                               duration: const Duration(milliseconds: 300),
//                             );
//                           }
//                         },
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
//                   controller: dateController,
//                   decoration: InputDecoration(
//                     hintText: 'mm-dd-yyyy',
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
//                             dateController.text =
//                                 DateFormat('MM-dd-yyyy').format(picked);
//                             // Calculate and update age
//                             final age = DateTime.now().year - picked.year;
//                             ageController.text = age.toString();
//                           });
//                         }
//                       },
//                     ),
//                   ),
//                   validator: validateDateOfBirth,
//                   onChanged: (value) {
//                     // Validate and parse the manually entered date
//                     try {
//                       final date = DateFormat('MM-dd-yyyy').parse(value);
//                       final age = DateTime.now().year - date.year;
//                       setState(() {
//                         ageController.text = age.toString();
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
//                   controller: ageController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: 'Age',
//                     border: InputBorder.none, // No border
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 16,
//                     ),
//                     suffixIcon: Row(
//                       mainAxisSize: MainAxisSize.min,
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
//
//   Widget _buildResponsiveRow(
//       BoxConstraints constraints, List<Widget> children) {
//     return Container(
//       width: constraints.maxWidth,
//       child: Wrap(
//         spacing: 20,
//         runSpacing: 20,
//         children: children,
//       ),
//     );
//   }
//
//   Widget _buildFormField(
//     String label,
//     String hint,
//     double fontSize,
//     BoxConstraints constraints, {
//     bool fullWidth = false,
//     TextInputType? keyboardType,
//     String? Function(String?)? validator,
//     List<String>? dropdownItems, // Dropdown support
//     Widget? suffix,
//   }) {
//     final fieldWidth = fullWidth
//         ? constraints.maxWidth
//         : (constraints.maxWidth > 600
//             ? (constraints.maxWidth - 20) / 2
//             : constraints.maxWidth);
//
//     return Container(
//       width: fieldWidth,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Background color
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: dropdownItems == null
//                 ? TextFormField(
//                     decoration: InputDecoration(
//                       hintText: hint,
//                       border: InputBorder.none, // No border
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 16,
//                       ),
//                       suffixIcon: suffix,
//                     ),
//                     keyboardType: keyboardType,
//                     validator: validator,
//                   )
//                 : DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       border: InputBorder.none, // No border
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                       ),
//                     ),
//                     hint: Text(hint),
//                     items: dropdownItems
//                         .map((item) => DropdownMenuItem<String>(
//                               value: item,
//                               child: Text(item),
//                             ))
//                         .toList(),
//                     onChanged: (value) {
//                       // Handle dropdown selection
//                     },
//                     validator: validator,
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildValidatedFormField(
//     String label,
//     String hint,
//     double fontSize,
//     BoxConstraints constraints, {
//     TextInputType? keyboardType,
//     int? maxLength,
//     String? Function(String?)? validator,
//     List<TextInputFormatter>? inputFormatters,
//   }) {
//     final fieldWidth = constraints.maxWidth > 600
//         ? (constraints.maxWidth - 20) / 2
//         : constraints.maxWidth;
//
//     return ConstrainedBox(
//       constraints:
//           BoxConstraints(maxWidth: fieldWidth), // Set max width constraint
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Background color
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 hintText: hint,
//                 border: InputBorder.none, // No border
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 16,
//                 ),
//                 counterText: '', // Hides the counter text
//               ),
//               keyboardType: keyboardType,
//               maxLength: maxLength,
//               validator: validator,
//               inputFormatters: inputFormatters,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDropdownField(
//     String label,
//     String hint,
//     double fontSize,
//     BoxConstraints constraints,
//     List<String> items,
//   ) {
//     final fieldWidth = constraints.maxWidth > 600
//         ? (constraints.maxWidth - 20) / 2
//         : constraints.maxWidth;
//
//     return ConstrainedBox(
//       constraints:
//           BoxConstraints(maxWidth: fieldWidth), // Set max width constraint
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Background color
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 hintText: hint,
//                 border: InputBorder.none, // No border
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 16,
//                 ),
//               ),
//               items: items.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 // Handle selection
//               },
//               validator: validateGender,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AddressPage extends StatelessWidget {
//   AddressPage({Key? key}) : super(key: key);
//
//   // Global key for form state
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
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
//                 : 0.25);
//     final titleFontSize = size.width *
//         (isDesktop
//             ? 0.06
//             : isTablet
//                 ? 0.06
//                 : 0.06);
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
//                 key: _formKey, // Assign the global key to the form
//                 child: Column(
//                   children: [
//                     // Logo and Title Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       '          Welcome to' '\n' 'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.04),
//                     // Spacing after the title
//                     Text(
//                       '* Provide Address as given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red, // Red color
//                         fontWeight: FontWeight.bold,
//                         fontSize:
//                             size.width * 0.04, // Adjust font size as needed
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.02),
//
//                     // Address Form Fields
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildTextField('Address Line 1',
//                             'House/Flat No., Building Name, Street', (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 1';
//                           }
//                           return null;
//                         }),
//                         const SizedBox(height: 16),
//                         _buildTextField('Address Line 2', 'Area, Landmark',
//                             (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 2';
//                           }
//                           return null;
//                         }),
//                         const SizedBox(height: 16),
//
//                         // City, Taluka, District Row
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildTextField(
//                                   'City/Village', 'Enter city/village',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter city or village';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField('Taluka', 'Enter taluka',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter taluka';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField(
//                                   'District', 'Enter district', (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter district';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//
//                         // State and Pincode Row
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: _buildTextField('State', 'Enter state',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter state';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField('Pincode', 'Enter pincode',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter pincode';
//                                 }
//                                 if (value.length != 6) {
//                                   return 'Pincode must be 6 digits';
//                                 }
//                                 return null;
//                               },
//                                   keyboardType: TextInputType.number,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(6),
//                                   ]),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: size.height * 0.04),
//
//                     // Next Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState?.validate() == true) {
//                             // Form is valid, navigate to the next screen
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => WelcomeScreen6()),
//                             );
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           'Next',
//                           style: TextStyle(
//                             fontSize: 16,
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
//   Widget _buildTextField(
//     String label,
//     String hint,
//     String? Function(String?)? validator, {
//     TextInputType? keyboardType,
//     List<TextInputFormatter>? inputFormatters,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             keyboardType: keyboardType,
//             inputFormatters: inputFormatters,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]),
//               border: InputBorder.none,
//               // No border, rely on container for border
//               enabledBorder: InputBorder.none,
//               filled: true,
//               fillColor: Colors.transparent,
//               // Transparent fill
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 12,
//               ),
//             ),
//             validator: validator,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class WelcomeScreen6 extends StatefulWidget {
//   @override
//   _WelcomeScreen6State createState() => _WelcomeScreen6State();
// }
//
// class _WelcomeScreen6State extends State<WelcomeScreen6> {
//   bool _isYesSelected = false;
//   bool _isNoSelected = false;
//   String? _uploadedAadharFileName;
//   Uint8List? _uploadedAadharFileBytes;
//   String? _uploadedVoterFileName;
//   Uint8List? _uploadedVoterFileBytes;
//
//   final _voterIdController = TextEditingController();
//   final _aadharNumberController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   _buildTextField(
//                       "Voter ID", "Enter Voter ID", _voterIdController),
//                   SizedBox(height: 16),
//                   _buildTextField("Aadhar Number", "Enter Aadhar number",
//                       _aadharNumberController),
//                   SizedBox(height: 16),
//                   _buildUploadField(
//                     "Upload Aadhar Card",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedAadharFileName = fileName;
//                         _uploadedAadharFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   _buildUploadField(
//                     "Upload Voter ID",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedVoterFileName = fileName;
//                         _uploadedVoterFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   _buildCommunityServiceCheckBox(),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _handleNextButton,
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(), // Hint text color
//               border: InputBorder.none, // Remove default border
//               enabledBorder: InputBorder.none, // Remove enabled border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color is handled by the container
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
//   Widget _buildUploadField(
//       String label, Function(String?, Uint8List?) onFilePicked) {
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
//         ElevatedButton.icon(
//           onPressed: () async {
//             FilePickerResult? result = await FilePicker.platform.pickFiles(
//               type: FileType.custom,
//               allowedExtensions: ['jpg', 'png', 'pdf'],
//             );
//
//             if (result != null) {
//               String? fileName = result.files.single.name;
//               Uint8List? fileBytes = result.files.single.bytes;
//
//               onFilePicked(fileName, fileBytes);
//               print(
//                   "Uploaded file: $fileName (${fileBytes?.length ?? 0} bytes)");
//             } else {
//               print("File upload canceled");
//             }
//           },
//           icon: Icon(Icons.upload_file),
//           label: Text("Choose File"),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.grey.shade200,
//             foregroundColor: Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 90),
//           ),
//         ),
//         if (label == "Upload Aadhar Card" && _uploadedAadharFileName != null)
//           Text("Selected: $_uploadedAadharFileName"),
//         if (label == "Upload Voter ID" && _uploadedVoterFileName != null)
//           Text("Selected: $_uploadedVoterFileName"),
//       ],
//     );
//   }
//
//   Widget _buildCommunityServiceCheckBox() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "If you wish to serve a community as a professional:",
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
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
//             SizedBox(width: 20),
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
//   void _handleNextButton() {
//     if (_formKey.currentState?.validate() ?? false) {
//       if (_uploadedAadharFileName == null || _uploadedVoterFileName == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload both Aadhar and Voter ID")),
//         );
//         return;
//       }
//
//       if (_isYesSelected) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   WelcomeScreen5()), // Replace with actual screen
//         );
//       } else if (_isNoSelected) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   PasswordPage()), // Replace with actual screen
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please select an option to continue.")),
//         );
//       }
//     }
//   }
// }
//
// class WelcomeScreen5 extends StatefulWidget {
//   @override
//   _WelcomeScreen5State createState() => _WelcomeScreen5State();
// }
//
// class _WelcomeScreen5State extends State<WelcomeScreen5> {
//   final List<String> professions = ['Medical', 'Legal', 'Social', 'Other'];
//   String? selectedProfession;
//   final TextEditingController qualificationController = TextEditingController();
//   final TextEditingController positionController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//               key: _formKey, // Attach the form key for validation
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/bpp_logo2.png',
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   _buildTextField("Qualification", "Enter your qualification",
//                       qualificationController),
//                   SizedBox(height: 16),
//                   _buildDropdownField("Profession", professions),
//                   SizedBox(height: 16),
//                   _buildTextField(
//                       "Position", "Enter your position", positionController),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _handleNextButton,
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
//               border: InputBorder.none, // Remove the default border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color handled by the container
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
//   // Dropdown for Profession
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
//         SizedBox(height: 10),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey), // Border color
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
//               contentPadding: EdgeInsets.symmetric(
//                   vertical: 10.0, horizontal: 10.0), // Increased height
//               border: InputBorder.none, // Remove the default border
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
//   void _handleNextButton() {
//     if (_formKey.currentState?.validate() ?? false) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => PasswordPage()),
//       );
//     }
//   }
// }
//
// class PasswordPage extends StatefulWidget {
//   const PasswordPage({Key? key}) : super(key: key);
//
//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }
//
// class _PasswordPageState extends State<PasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final TextEditingController _pinController = TextEditingController();
//   final TextEditingController _confirmPinController = TextEditingController();
//
//   bool isPasswordVisible = false;
//   bool isPinVisible = false;
//
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _pinController.dispose();
//     _confirmPinController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.width > 600 && size.width <= 1200;
//     final isDesktop = size.width > 1200;
//
//     final logoSize = size.width *
//         (isDesktop
//             ? 0.15
//             : isTablet
//                 ? 0.2
//                 : 0.25);
//
//     return Scaffold(
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: screenWidth * 0.07,
//                 vertical: screenHeight * 0.05,
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
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Logo Section
//                       Center(
//                         child: Image.asset(
//                           'assets/images/bpp_logo2.png',
//                           width: logoSize, // Use dynamic logo size
//                           height: logoSize, // Maintain aspect ratio
//                           fit: BoxFit.contain, // Ensure proper scaling
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       FittedBox(
//                         child: Text(
//                           'Bharatiya Popular Party',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: screenWidth * 0.06,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//
//                       // Username Field
//                       // _buildTextField(
//                       //   'Username',
//                       //   'Choose a username',
//                       //   controller: _usernameController,
//                       //   validator: (value) {
//                       //     if (value == null || value.isEmpty) {
//                       //       return 'Username cannot be empty';
//                       //     }
//                       //     return null;
//                       //   },
//                       // ),
//                       // const SizedBox(height: 20),
//
//                       // Password Fields
//                       _buildTextField(
//                         'Password',
//                         'Create a password',
//                         obscureText: !isPasswordVisible,
//                         controller: _passwordController,
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
//                       _buildTextField(
//                         'Confirm Password',
//                         'Confirm your password',
//                         obscureText: !isPasswordVisible,
//                         controller: _confirmPasswordController,
//                         toggleVisibility: () {
//                           setState(() {
//                             isPasswordVisible = !isPasswordVisible;
//                           });
//                         },
//                         showEyeIcon: true,
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
//                       _buildTextField(
//                         'Referral Code  (Optional)',
//                         'Enter a referral',
//                         controller: _usernameController,
//                         validator: (value) {
//                           // Referral is optional, so we don't require validation here
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//
//                       // PIN Fields
//                       Row(
//                         children: [
//                           // Expanded(
//                           //   child: _buildTextField(
//                           //     'PIN',
//                           //     '****',
//                           //     obscureText: !isPinVisible,
//                           //     controller: _pinController,
//                           //     validator: (value) {
//                           //       if (value == null || value.isEmpty) {
//                           //         return 'PIN cannot be empty';
//                           //       }
//                           //       if (value.length != 4) {
//                           //         return 'PIN must be 4 digits';
//                           //       }
//                           //       return null;
//                           //     },
//                           //   ),
//                           // ),
//                           // const SizedBox(width: 10),
//                           // Expanded(
//                           //   child: _buildTextField(
//                           //     'Confirm PIN',
//                           //     '****',
//                           //     obscureText: !isPinVisible,
//                           //     controller: _confirmPinController,
//                           //     toggleVisibility: () {
//                           //       setState(() {
//                           //         isPinVisible = !isPinVisible;
//                           //       });
//                           //     },
//                           //     showEyeIcon: true,
//                           //     validator: (value) {
//                           //       if (value == null || value.isEmpty) {
//                           //         return 'Confirm PIN cannot be empty';
//                           //       }
//                           //       if (value != _pinController.text) {
//                           //         return 'PINs do not match';
//                           //       }
//                           //       return null;
//                           //     },
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                       // const SizedBox(height: 30),
//
//                       // Submit Button
//                       ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             // Navigate to the Dashboard Screen
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ScreenDashbaord()),
//                             );
//                           }
//                         },
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
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
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
//
//   Widget _buildTextField(
//     String label,
//     String hint, {
//     required TextEditingController controller,
//     bool obscureText = false,
//     VoidCallback? toggleVisibility,
//     bool showEyeIcon = false,
//     String? Function(String?)? validator,
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
//         const SizedBox(height: 5),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey.shade300), // Border color
//           ),
//           child: TextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             validator: validator,
//             decoration: InputDecoration(
//               hintText: hint,
//               filled: true,
//               fillColor: Colors.transparent,
//               // Make fill transparent for Container background
//               border: InputBorder.none,
//               // Remove default border
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//               suffixIcon: showEyeIcon
//                   ? IconButton(
//                       icon: Icon(
//                         obscureText ? Icons.visibility_off : Icons.visibility,
//                       ),
//                       onPressed: toggleVisibility,
//                     )
//                   : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

//old code
// import 'package:bpp_frontend/views/component/registration/password_page.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../../controller/screens/screen_dashbaord.dart';
// import 'address_page.dart';
//
// class PersonalPage extends StatefulWidget {
//   const PersonalPage({Key? key}) : super(key: key);
//
//   @override
//   State<PersonalPage> createState() => _PersonalPageState();
// }
//
// class _PersonalPageState extends State<PersonalPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController dateController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//
//   //fields logic
//   String? validateName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'This field is required';
//     }
//     if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
//       return 'Please enter a valid name';
//     }
//     return null;
//   }
//
//   String? validateName1(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'This field is required';
//     }
//     if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
//       return 'Please enter a valid name';
//     }
//     return null;
//   }
//
//   String? validateName2(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'This field is required';
//     }
//     if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
//       return 'Please enter a valid name';
//     }
//     return null;
//   }
//
//   // Validation Methods
//   String? validatePhone(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Phone number is required';
//     }
//     if (value.length != 10 || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//       return 'Please enter a valid phone number';
//     }
//     return null;
//   }
//
//   String? validateDateOfBirth(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Date of Birth is required';
//     }
//     // Check for valid date format (e.g., MM-dd-yyyy)
//     if (!RegExp(r'^\d{2}-\d{2}-\d{4}$').hasMatch(value)) {
//       return 'Please enter a valid date (MM-dd-yyyy)';
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
//   // String? validateAadhar(String? value) {
//   //   if (value == null || value.isEmpty) {
//   //     return 'Aadhar number is required';
//   //   }
//   //   if (value.length != 12 || !RegExp(r'^[0-9]{12}$').hasMatch(value)) {
//   //     return 'Please enter a valid Aadhar number';
//   //   }
//   //   return null;
//   // }
//
//   // String? validateVoterId(String? value) {
//   //   if (value == null || value.isEmpty) {
//   //     return 'Voter ID is required';
//   //   }
//   //   if (value.length != 10 || !RegExp(r'^[A-Za-z0-9]{10}$').hasMatch(value)) {
//   //     return 'Please enter a valid Voter ID';
//   //   }
//   //   return null;
//   // }
//
//   @override
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
//                   children: [
//                     // Logo Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(
//                         height: size.height * 0.02), // Spacing after the title
//                     Text(
//                       '* Enter your details exactly given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red, // Red color
//                         fontWeight: FontWeight.bold,
//                         fontSize:
//                             size.width * 0.03, // Adjust font size as needed
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
//                             _buildResponsiveRow(
//                               constraints,
//                               [
//                                 _buildFormField(
//                                   'Title',
//                                   'Select Title',
//                                   labelFontSize,
//                                   constraints,
//                                   dropdownItems: [
//                                     'Mr',
//                                     'Ms',
//                                     'Mrs',
//                                     'Dr',
//                                     'CA',
//                                     'Cs',
//                                     'Adv'
//                                   ], // List of titles
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please select a title';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                                 _buildFormField(
//                                   'First Name',
//                                   'Enter first name',
//                                   labelFontSize,
//                                   validator: validateName,
//                                   constraints,
//                                 ),
//                                 _buildFormField(
//                                   'Middle Name',
//                                   'Enter middle name',
//                                   labelFontSize,
//                                   constraints,
//                                   validator: validateName1,
//                                 ),
//                               ],
//                             ),
//                             _buildFormField(
//                               'Last Name',
//                               'Enter last name',
//                               labelFontSize,
//                               constraints,
//                               validator: validateName2,
//                               fullWidth: true,
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
//                                   ['Male', 'Female', 'Other'],
//                                 ),
//                                 _buildValidatedFormField(
//                                   'Phone Number',
//                                   'Enter phone number',
//                                   labelFontSize,
//                                   constraints,
//                                   keyboardType: TextInputType.number,
//                                   maxLength: 10,
//                                   validator: validatePhone,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(10),
//                                   ],
//                                 ),
//                               ],
//                             ),
//
//                             // Voter ID and Aadhar Number
//                             _buildResponsiveRow(
//                               constraints,
//                               [
//                                 // _buildValidatedFormField(
//                                 //   'Voter ID',
//                                 //   'Enter Voter ID',
//                                 //   labelFontSize,
//                                 //   constraints,
//                                 //   maxLength: 10,
//                                 //   validator: validateVoterId,
//                                 //   inputFormatters: [
//                                 //     LengthLimitingTextInputFormatter(10),
//                                 //     FilteringTextInputFormatter.allow(
//                                 //         RegExp(r'[A-Za-z0-9]')),
//                                 //   ],
//                                 // ),
//                                 // _buildValidatedFormField(
//                                 //   'Aadhar Number',
//                                 //   'Enter Aadhar Number',
//                                 //   labelFontSize,
//                                 //   constraints,
//                                 //   keyboardType: TextInputType.number,
//                                 //   maxLength: 12,
//                                 //   validator: validateAadhar,
//                                 //   inputFormatters: [
//                                 //     FilteringTextInputFormatter.digitsOnly,
//                                 //     LengthLimitingTextInputFormatter(12),
//                                 //   ],
//                                 // ),
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
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             Get.to(
//                               () => AddressPage(),
//                               transition: Transition.rightToLeft,
//                               duration: const Duration(milliseconds: 300),
//                             );
//                           }
//                         },
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
//                   controller: dateController,
//                   decoration: InputDecoration(
//                     hintText: 'mm-dd-yyyy',
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
//                             dateController.text =
//                                 DateFormat('MM-dd-yyyy').format(picked);
//                             // Calculate and update age
//                             final age = DateTime.now().year - picked.year;
//                             ageController.text = age.toString();
//                           });
//                         }
//                       },
//                     ),
//                   ),
//                   validator: validateDateOfBirth,
//                   onChanged: (value) {
//                     // Validate and parse the manually entered date
//                     try {
//                       final date = DateFormat('MM-dd-yyyy').parse(value);
//                       final age = DateTime.now().year - date.year;
//                       setState(() {
//                         ageController.text = age.toString();
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
//                   controller: ageController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: 'Age',
//                     border: InputBorder.none, // No border
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 16,
//                     ),
//                     suffixIcon: Row(
//                       mainAxisSize: MainAxisSize.min,
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
//
//   Widget _buildResponsiveRow(
//       BoxConstraints constraints, List<Widget> children) {
//     return Container(
//       width: constraints.maxWidth,
//       child: Wrap(
//         spacing: 20,
//         runSpacing: 20,
//         children: children,
//       ),
//     );
//   }
//
//   Widget _buildFormField(
//     String label,
//     String hint,
//     double fontSize,
//     BoxConstraints constraints, {
//     bool fullWidth = false,
//     TextInputType? keyboardType,
//     String? Function(String?)? validator,
//     List<String>? dropdownItems, // Dropdown support
//     Widget? suffix,
//   }) {
//     final fieldWidth = fullWidth
//         ? constraints.maxWidth
//         : (constraints.maxWidth > 600
//             ? (constraints.maxWidth - 20) / 2
//             : constraints.maxWidth);
//
//     return Container(
//       width: fieldWidth,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Background color
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: dropdownItems == null
//                 ? TextFormField(
//                     decoration: InputDecoration(
//                       hintText: hint,
//                       border: InputBorder.none, // No border
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 16,
//                       ),
//                       suffixIcon: suffix,
//                     ),
//                     keyboardType: keyboardType,
//                     validator: validator,
//                   )
//                 : DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       border: InputBorder.none, // No border
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                       ),
//                     ),
//                     hint: Text(hint),
//                     items: dropdownItems
//                         .map((item) => DropdownMenuItem<String>(
//                               value: item,
//                               child: Text(item),
//                             ))
//                         .toList(),
//                     onChanged: (value) {
//                       // Handle dropdown selection
//                     },
//                     validator: validator,
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildValidatedFormField(
//     String label,
//     String hint,
//     double fontSize,
//     BoxConstraints constraints, {
//     TextInputType? keyboardType,
//     int? maxLength,
//     String? Function(String?)? validator,
//     List<TextInputFormatter>? inputFormatters,
//   }) {
//     final fieldWidth = constraints.maxWidth > 600
//         ? (constraints.maxWidth - 20) / 2
//         : constraints.maxWidth;
//
//     return ConstrainedBox(
//       constraints:
//           BoxConstraints(maxWidth: fieldWidth), // Set max width constraint
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Background color
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 hintText: hint,
//                 border: InputBorder.none, // No border
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 16,
//                 ),
//                 counterText: '', // Hides the counter text
//               ),
//               keyboardType: keyboardType,
//               maxLength: maxLength,
//               validator: validator,
//               inputFormatters: inputFormatters,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDropdownField(
//     String label,
//     String hint,
//     double fontSize,
//     BoxConstraints constraints,
//     List<String> items,
//   ) {
//     final fieldWidth = constraints.maxWidth > 600
//         ? (constraints.maxWidth - 20) / 2
//         : constraints.maxWidth;
//
//     return ConstrainedBox(
//       constraints:
//           BoxConstraints(maxWidth: fieldWidth), // Set max width constraint
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Background color
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 hintText: hint,
//                 border: InputBorder.none, // No border
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 16,
//                 ),
//               ),
//               items: items.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 // Handle selection
//               },
//               validator: validateGender,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AddressPage extends StatelessWidget {
//   AddressPage({Key? key}) : super(key: key);
//
//   // Global key for form state
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
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
//                 : 0.25);
//     final titleFontSize = size.width *
//         (isDesktop
//             ? 0.06
//             : isTablet
//                 ? 0.06
//                 : 0.06);
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
//                 key: _formKey, // Assign the global key to the form
//                 child: Column(
//                   children: [
//                     // Logo and Title Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       '          Welcome to' '\n' 'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.04),
//                     // Spacing after the title
//                     Text(
//                       '* Provide Address as given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red, // Red color
//                         fontWeight: FontWeight.bold,
//                         fontSize:
//                             size.width * 0.04, // Adjust font size as needed
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.02),
//
//                     // Address Form Fields
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildTextField('Address Line 1',
//                             'House/Flat No., Building Name, Street', (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 1';
//                           }
//                           return null;
//                         }),
//                         const SizedBox(height: 16),
//                         _buildTextField('Address Line 2', 'Area, Landmark',
//                             (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 2';
//                           }
//                           return null;
//                         }),
//                         const SizedBox(height: 16),
//
//                         // City, Taluka, District Row
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildTextField(
//                                   'City/Village', 'Enter city/village',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter city or village';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField('Taluka', 'Enter taluka',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter taluka';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField(
//                                   'District', 'Enter district', (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter district';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//
//                         // State and Pincode Row
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: _buildTextField('State', 'Enter state',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter state';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField('Pincode', 'Enter pincode',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter pincode';
//                                 }
//                                 if (value.length != 6) {
//                                   return 'Pincode must be 6 digits';
//                                 }
//                                 return null;
//                               },
//                                   keyboardType: TextInputType.number,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(6),
//                                   ]),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: size.height * 0.04),
//
//                     // Next Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState?.validate() == true) {
//                             // Form is valid, navigate to the next screen
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => WelcomeScreen6()),
//                             );
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           'Next',
//                           style: TextStyle(
//                             fontSize: 16,
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
//   Widget _buildTextField(
//     String label,
//     String hint,
//     String? Function(String?)? validator, {
//     TextInputType? keyboardType,
//     List<TextInputFormatter>? inputFormatters,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             keyboardType: keyboardType,
//             inputFormatters: inputFormatters,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]),
//               border: InputBorder.none,
//               // No border, rely on container for border
//               enabledBorder: InputBorder.none,
//               filled: true,
//               fillColor: Colors.transparent,
//               // Transparent fill
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 12,
//               ),
//             ),
//             validator: validator,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class WelcomeScreen6 extends StatefulWidget {
//   @override
//   _WelcomeScreen6State createState() => _WelcomeScreen6State();
// }
//
// class _WelcomeScreen6State extends State<WelcomeScreen6> {
//   bool _isYesSelected = false;
//   bool _isNoSelected = false;
//   String? _uploadedAadharFileName;
//   Uint8List? _uploadedAadharFileBytes;
//   String? _uploadedVoterFileName;
//   Uint8List? _uploadedVoterFileBytes;
//
//   final _voterIdController = TextEditingController();
//   final _aadharNumberController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Aadhar Number TextField
//                   _buildTextField("Aadhar Number", "Enter Aadhar number",
//                       _aadharNumberController),
//                   SizedBox(height: 8),
//                   Text(
//                     "Providing your Aadhar card details is mandatory for completing this process.",
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   // Upload Aadhar Card Button
//                   _buildUploadField(
//                     "Upload Aadhar Card",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedAadharFileName = fileName;
//                         _uploadedAadharFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   // OR Text
//                   _buildOrRow(),
//                   SizedBox(height: 10),
//                   // Voter ID TextField (optional)
//                   _buildTextField(
//                       "Voter ID", "Enter Voter ID", _voterIdController),
//                   SizedBox(height: 8),
//                   Text(
//                     "Providing your Voter ID card details is optional.",
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   // Upload Voter ID Button (optional)
//                   _buildUploadField(
//                     "Upload Voter ID",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedVoterFileName = fileName;
//                         _uploadedVoterFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   _buildCommunityServiceCheckBox(),
//                   SizedBox(height: 16),
//                   // Text above Next button
//                   Text(
//                     "Upload clear image of Aadhar and Voter ID",
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _handleNextButton,
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
//   Widget _buildTextField(
//       String label, String hint, TextEditingController controller,
//       {TextInputType keyboardType = TextInputType.text}) {
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller,
//             keyboardType: keyboardType, // Use the correct keyboard type
//             inputFormatters: keyboardType == TextInputType.text
//                 ? [
//                     // This formatter ensures the text for Voter ID is uppercase
//                     TextInputFormatter.withFunction(
//                       (oldValue, newValue) {
//                         return newValue.copyWith(
//                             text: newValue.text.toUpperCase());
//                       },
//                     ),
//                   ]
//                 : [],
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(), // Hint text color
//               border: InputBorder.none, // Remove default border
//               enabledBorder: InputBorder.none, // Remove enabled border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color is handled by the container
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//             ),
//             // Validation only for Aadhar Number, not for Voter ID
//             validator: label == "Aadhar Number"
//                 ? (value) {
//                     if (value == null || value.isEmpty) {
//                       return '$label is required';
//                     }
//                     return null;
//                   }
//                 : null,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildUploadField(
//       String label, Function(String?, Uint8List?) onFilePicked) {
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
//         ElevatedButton.icon(
//           onPressed: () async {
//             FilePickerResult? result = await FilePicker.platform.pickFiles(
//               type: FileType.custom,
//               allowedExtensions: ['jpg', 'png', 'pdf'],
//             );
//
//             if (result != null) {
//               String? fileName = result.files.single.name;
//               Uint8List? fileBytes = result.files.single.bytes;
//
//               onFilePicked(fileName, fileBytes);
//               print(
//                   "Uploaded file: $fileName (${fileBytes?.length ?? 0} bytes)");
//             } else {
//               print("File upload canceled");
//             }
//           },
//           icon: Icon(Icons.upload_file),
//           label: Text("Choose File"),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.grey.shade200,
//             foregroundColor: Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 90),
//           ),
//         ),
//         if (label == "Upload Aadhar Card" && _uploadedAadharFileName != null)
//           Text("Selected: $_uploadedAadharFileName"),
//         if (label == "Upload Voter ID" && _uploadedVoterFileName != null)
//           Text("Selected: $_uploadedVoterFileName"),
//       ],
//     );
//   }
//
//   Widget _buildOrRow() {
//     return Row(
//       children: [
//         Expanded(
//           child: Divider(
//             color: Colors.black45,
//             thickness: 1,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8.0),
//           child: Text(
//             "OR",
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black45,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Divider(
//             color: Colors.black45,
//             thickness: 1,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildCommunityServiceCheckBox() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "If you wish to serve a community as a professional:",
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
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
//             SizedBox(width: 20),
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
//   void _handleNextButton() {
//     if (_formKey.currentState?.validate() ?? false) {
//       // Check if Aadhar card is uploaded (Voter ID is optional)
//       if (_uploadedAadharFileName == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload your Aadhar card")),
//         );
//         return;
//       }
//
//       if (_isYesSelected) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   WelcomeScreen5()), // Replace with actual screen
//         );
//       } else if (_isNoSelected) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   PasswordPage()), // Replace with actual screen
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please select an option to continue.")),
//         );
//       }
//     }
//   }
// }
//
// class WelcomeScreen5 extends StatefulWidget {
//   @override
//   _WelcomeScreen5State createState() => _WelcomeScreen5State();
// }
//
// class _WelcomeScreen5State extends State<WelcomeScreen5> {
//   final List<String> professions = ['Medical', 'Legal', 'Social', 'Other'];
//   String? selectedProfession;
//   final TextEditingController qualificationController = TextEditingController();
//   final TextEditingController positionController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//               key: _formKey, // Attach the form key for validation
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/bpp_logo2.png',
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   _buildTextField("Qualification", "Enter your qualification",
//                       qualificationController),
//                   SizedBox(height: 16),
//                   _buildDropdownField("Profession", professions),
//                   SizedBox(height: 16),
//                   _buildTextField(
//                       "Position", "Enter your position", positionController),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _handleNextButton,
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
//               border: InputBorder.none, // Remove the default border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color handled by the container
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
//   // Dropdown for Profession
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
//         SizedBox(height: 10),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey), // Border color
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
//               contentPadding: EdgeInsets.symmetric(
//                   vertical: 10.0, horizontal: 10.0), // Increased height
//               border: InputBorder.none, // Remove the default border
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
//   void _handleNextButton() {
//     if (_formKey.currentState?.validate() ?? false) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => PasswordPage()),
//       );
//     }
//   }
// }
//
// class PasswordPage extends StatefulWidget {
//   const PasswordPage({Key? key}) : super(key: key);
//
//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }
//
// class _PasswordPageState extends State<PasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final TextEditingController _pinController = TextEditingController();
//   final TextEditingController _confirmPinController = TextEditingController();
//
//   bool isPasswordVisible = false;
//   bool isPinVisible = false;
//
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _pinController.dispose();
//     _confirmPinController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.width > 600 && size.width <= 1200;
//     final isDesktop = size.width > 1200;
//
//     final logoSize = size.width *
//         (isDesktop
//             ? 0.15
//             : isTablet
//                 ? 0.2
//                 : 0.25);
//
//     return Scaffold(
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: screenWidth * 0.07,
//                 vertical: screenHeight * 0.05,
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
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Logo Section
//                       Center(
//                         child: Image.asset(
//                           'assets/images/bpp_logo2.png',
//                           width: logoSize, // Use dynamic logo size
//                           height: logoSize, // Maintain aspect ratio
//                           fit: BoxFit.contain, // Ensure proper scaling
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       FittedBox(
//                         child: Text(
//                           'Bharatiya Popular Party',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: screenWidth * 0.06,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//
//                       // Username Field
//                       // _buildTextField(
//                       //   'Username',
//                       //   'Choose a username',
//                       //   controller: _usernameController,
//                       //   validator: (value) {
//                       //     if (value == null || value.isEmpty) {
//                       //       return 'Username cannot be empty';
//                       //     }
//                       //     return null;
//                       //   },
//                       // ),
//                       // const SizedBox(height: 20),
//
//                       // Password Fields
//                       _buildTextField(
//                         'Password',
//                         'Create a password',
//                         obscureText: !isPasswordVisible,
//                         controller: _passwordController,
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
//                       _buildTextField(
//                         'Confirm Password',
//                         'Confirm your password',
//                         obscureText: !isPasswordVisible,
//                         controller: _confirmPasswordController,
//                         toggleVisibility: () {
//                           setState(() {
//                             isPasswordVisible = !isPasswordVisible;
//                           });
//                         },
//                         showEyeIcon: true,
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
//                       _buildTextField(
//                         'Referral Code  (Optional)',
//                         'Enter a referral',
//                         controller: _usernameController,
//                         validator: (value) {
//                           // Referral is optional, so we don't require validation here
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//
//                       // PIN Fields
//                       Row(
//                         children: [
//                           // Expanded(
//                           //   child: _buildTextField(
//                           //     'PIN',
//                           //     '****',
//                           //     obscureText: !isPinVisible,
//                           //     controller: _pinController,
//                           //     validator: (value) {
//                           //       if (value == null || value.isEmpty) {
//                           //         return 'PIN cannot be empty';
//                           //       }
//                           //       if (value.length != 4) {
//                           //         return 'PIN must be 4 digits';
//                           //       }
//                           //       return null;
//                           //     },
//                           //   ),
//                           // ),
//                           // const SizedBox(width: 10),
//                           // Expanded(
//                           //   child: _buildTextField(
//                           //     'Confirm PIN',
//                           //     '****',
//                           //     obscureText: !isPinVisible,
//                           //     controller: _confirmPinController,
//                           //     toggleVisibility: () {
//                           //       setState(() {
//                           //         isPinVisible = !isPinVisible;
//                           //       });
//                           //     },
//                           //     showEyeIcon: true,
//                           //     validator: (value) {
//                           //       if (value == null || value.isEmpty) {
//                           //         return 'Confirm PIN cannot be empty';
//                           //       }
//                           //       if (value != _pinController.text) {
//                           //         return 'PINs do not match';
//                           //       }
//                           //       return null;
//                           //     },
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                       // const SizedBox(height: 30),
//
//                       // Submit Button
//                       ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             // Navigate to the Dashboard Screen
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ScreenDashbaord()),
//                             );
//                           }
//                         },
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
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
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
//
//   Widget _buildTextField(
//     String label,
//     String hint, {
//     required TextEditingController controller,
//     bool obscureText = false,
//     VoidCallback? toggleVisibility,
//     bool showEyeIcon = false,
//     String? Function(String?)? validator,
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
//         const SizedBox(height: 5),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey.shade300), // Border color
//           ),
//           child: TextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             validator: validator,
//             decoration: InputDecoration(
//               hintText: hint,
//               filled: true,
//               fillColor: Colors.transparent,
//               // Make fill transparent for Container background
//               border: InputBorder.none,
//               // Remove default border
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//               suffixIcon: showEyeIcon
//                   ? IconButton(
//                       icon: Icon(
//                         obscureText ? Icons.visibility_off : Icons.visibility,
//                       ),
//                       onPressed: toggleVisibility,
//                     )
//                   : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:bpp_frontend/controller/screens/dashbaord_screen.dart';
// import 'package:bpp_frontend/services/signup.dart';
// import 'package:bpp_frontend/views/component/registration/password_page.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class PersonalPage extends StatefulWidget {
//   const PersonalPage({Key? key}) : super(key: key);
//
//   @override
//   State<PersonalPage> createState() => _PersonalPageState();
// }
//
// class _PersonalPageState extends State<PersonalPage> {
//   final _formKey = GlobalKey<FormState>();
//   late final TextEditingController dateController;
//   late final TextEditingController ageController;
//   late final TextEditingController firstNameController;
//   late final TextEditingController middleNameController;
//   late final TextEditingController lastNameController;
//   late final TextEditingController phoneController;
//   String? selectedGender;
//   String? selectedTitle;
//
//   @override
//   void initState() {
//     super.initState();
//     dateController = TextEditingController();
//     ageController = TextEditingController();
//     firstNameController = TextEditingController();
//     middleNameController = TextEditingController();
//     lastNameController = TextEditingController();
//     phoneController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     dateController.dispose();
//     ageController.dispose();
//     firstNameController.dispose();
//     middleNameController.dispose();
//     lastNameController.dispose();
//     phoneController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _submitForm() async {
//     if (_formKey.currentState?.validate() == true) {
//       final formData = {
//         'title': selectedTitle,
//         'firstName': firstNameController.text.trim(),
//         'middleName': middleNameController.text.trim(),
//         'lastName': lastNameController.text.trim(),
//         'phone': phoneController.text.trim(),
//         'dob': dateController.text.trim(),
//         'age': int.tryParse(ageController.text.trim()),
//         'gender': selectedGender,
//       };
//
//       try {
//         final response = await ApiService.postData(formData);
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => AddressPage()),
//         );
//       } catch (e) {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Error'),
//             content: Text('Failed to submit: $e'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final isDesktop = size.width > 1200;
//     final isTablet = size.width > 600;
//     final containerPadding = size.width *
//         (isDesktop
//             ? 0.2
//             : isTablet
//                 ? 0.1
//                 : 0.05);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: containerPadding),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   _buildLogoSection(size, isDesktop, isTablet),
//                   _buildInstructionText(size),
//                   const SizedBox(height: 20),
//                   _buildTitleAndNameFields(size),
//                   const SizedBox(height: 20),
//                   _buildDateAndAgeFields(size),
//                   const SizedBox(height: 20),
//                   _buildGenderAndPhoneFields(size),
//                   const SizedBox(height: 30),
//                   _buildSubmitButton(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLogoSection(Size size, bool isDesktop, bool isTablet) {
//     final logoSize = size.width *
//         (isDesktop
//             ? 0.15
//             : isTablet
//                 ? 0.2
//                 : 0.26);
//     return Column(
//       children: [
//         Container(
//           width: logoSize,
//           height: logoSize,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               image: AssetImage('assets/images/bpp_logo2.png'),
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           'Bharatiya Popular Party',
//           style: TextStyle(
//             fontSize: size.width * 0.06,
//             fontWeight: FontWeight.bold,
//             color: Colors.blue,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildInstructionText(Size size) {
//     return Text(
//       '* Enter your details exactly as given in Aadhaar Card',
//       style: TextStyle(
//         color: Colors.red,
//         fontWeight: FontWeight.bold,
//         fontSize: size.width * 0.03,
//       ),
//       textAlign: TextAlign.center,
//     );
//   }
//
//   Widget _buildTitleAndNameFields(Size size) {
//     return Column(
//       children: [
//         DropdownButtonFormField<String>(
//           value: selectedTitle,
//           decoration: const InputDecoration(labelText: 'Title'),
//           items: ['Mr', 'Ms', 'Mrs', 'Dr', 'CA', 'CS', 'Adv']
//               .map((title) => DropdownMenuItem(
//                     value: title,
//                     child: Text(title),
//                   ))
//               .toList(),
//           onChanged: (value) => setState(() => selectedTitle = value),
//           validator: (value) => value == null ? 'Select title' : null,
//         ),
//         const SizedBox(height: 10),
//         Row(
//           children: [
//             Expanded(
//               child: TextFormField(
//                 controller: firstNameController,
//                 decoration: const InputDecoration(labelText: 'First Name'),
//                 validator: (value) => value == null || value.trim().isEmpty
//                     ? 'Enter first name'
//                     : null,
//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: TextFormField(
//                 controller: middleNameController,
//                 decoration: const InputDecoration(labelText: 'Middle Name'),
//                 validator: (value) => value == null || value.trim().isEmpty
//                     ? 'Enter middle name'
//                     : null,
//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: TextFormField(
//                 controller: lastNameController,
//                 decoration: const InputDecoration(labelText: 'Last Name'),
//                 validator: (value) => value == null || value.trim().isEmpty
//                     ? 'Enter last name'
//                     : null,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDateAndAgeFields(Size size) {
//     return Row(
//       children: [
//         Expanded(
//           child: TextFormField(
//             controller: dateController,
//             decoration: const InputDecoration(labelText: 'Date of Birth'),
//             validator: (value) => value == null || value.trim().isEmpty
//                 ? 'Enter date of birth'
//                 : null,
//           ),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: TextFormField(
//             controller: ageController,
//             decoration: const InputDecoration(labelText: 'Age'),
//             validator: (value) =>
//                 value == null || value.trim().isEmpty ? 'Enter age' : null,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildGenderAndPhoneFields(Size size) {
//     return Row(
//       children: [
//         Expanded(
//           child: DropdownButtonFormField<String>(
//             value: selectedGender,
//             decoration: const InputDecoration(labelText: 'Gender'),
//             items: ['Male', 'Female', 'Other']
//                 .map((gender) => DropdownMenuItem(
//                       value: gender,
//                       child: Text(gender),
//                     ))
//                 .toList(),
//             onChanged: (value) => setState(() => selectedGender = value),
//             validator: (value) => value == null ? 'Select gender' : null,
//           ),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: TextFormField(
//             controller: phoneController,
//             decoration: const InputDecoration(labelText: 'Phone Number'),
//             validator: (value) => value == null || value.trim().isEmpty
//                 ? 'Enter phone number'
//                 : null,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSubmitButton() {
//     return ElevatedButton(
//       onPressed: _submitForm,
//       child: const Text('Submit'),
//     );
//   }
// }
//
// class AddressPage extends StatelessWidget {
//   AddressPage({Key? key}) : super(key: key);
//
//   // Global key for form state
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Controllers for form fields
//   final TextEditingController addressLine1Controller = TextEditingController();
//   final TextEditingController addressLine2Controller = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController talukaController = TextEditingController();
//   final TextEditingController districtController = TextEditingController();
//   final TextEditingController stateController = TextEditingController();
//   final TextEditingController pincodeController = TextEditingController();
//
//   @override
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
//                 : 0.25);
//     final titleFontSize = size.width *
//         (isDesktop
//             ? 0.06
//             : isTablet
//                 ? 0.06
//                 : 0.06);
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
//                 child: Column(
//                   children: [
//                     // Logo and Title Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       '          Welcome to' '\n' 'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.04),
//                     Text(
//                       '* Provide Address as given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontSize: size.width * 0.04,
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.02),
//
//                     // Address Form Fields
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildTextField(
//                             'Address Line 1',
//                             'House/Flat No., Building Name, Street',
//                             addressLine1Controller, (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 1';
//                           }
//                           return null;
//                         }),
//                         const SizedBox(height: 16),
//                         _buildTextField('Address Line 2', 'Area, Landmark',
//                             addressLine2Controller, (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 2';
//                           }
//                           return null;
//                         }),
//                         const SizedBox(height: 16),
//
//                         // City, Taluka, District Row
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildTextField(
//                                   'City/Village',
//                                   'Enter city/village',
//                                   cityController, (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter city or village';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField(
//                                   'Taluka', 'Enter taluka', talukaController,
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter taluka';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField(
//                                   'District',
//                                   'Enter district',
//                                   districtController, (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter district';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//
//                         // State and Pincode Row
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: _buildTextField(
//                                   'State', 'Enter state', stateController,
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter state';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField(
//                                   'Pincode', 'Enter pincode', pincodeController,
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter pincode';
//                                 }
//                                 if (value.length != 6) {
//                                   return 'Pincode must be 6 digits';
//                                 }
//                                 return null;
//                               },
//                                   keyboardType: TextInputType.number,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(6),
//                                   ]),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: size.height * 0.04),
//
//                     // Next Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           if (_formKey.currentState?.validate() == true) {
//                             // Form is valid, submit the data to the API
//                             final success = await submitAddressData();
//                             if (success) {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => WelcomeScreen6()),
//                               );
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text('Failed to submit data.'),
//                                   backgroundColor: Colors.red,
//                                 ),
//                               );
//                             }
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           'Next',
//                           style: TextStyle(
//                             fontSize: 16,
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
//   Widget _buildTextField(
//     String label,
//     String hint,
//     TextEditingController controller,
//     String? Function(String?)? validator, {
//     TextInputType? keyboardType,
//     List<TextInputFormatter>? inputFormatters,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: TextFormField(
//             controller: controller,
//             keyboardType: keyboardType,
//             inputFormatters: inputFormatters,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]),
//               border: InputBorder.none,
//               enabledBorder: InputBorder.none,
//               filled: true,
//               fillColor: Colors.transparent,
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 12,
//               ),
//             ),
//             validator: validator,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Future<bool> submitAddressData() async {
//     final url = Uri.parse(
//         'http://ec2-13-232-238-37.ap-south-1.compute.amazonaws.com:8080/api/v1/signup'); // Replace with your API URL
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({
//           'addressLine1': addressLine1Controller.text,
//           'addressLine2': addressLine2Controller.text,
//           'cityOrVillage': cityController.text,
//           'taluka': talukaController.text,
//           'district': districtController.text,
//           'state': stateController.text,
//           'pincode': pincodeController.text,
//         }),
//       );
//
//       // Check status code and response content
//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         print(responseData); // Log response body to inspect the response
//         return responseData['success'] ==
//             true; // Adjust based on your API response
//       } else {
//         print('Failed to submit. Status Code: ${response.statusCode}');
//         print('Response Body: ${response.body}');
//         return false;
//       }
//     } catch (e) {
//       print('Error submitting data: $e');
//       return false;
//     }
//   }
// }
//
// class WelcomeScreen6 extends StatefulWidget {
//   @override
//   _WelcomeScreen6State createState() => _WelcomeScreen6State();
// }
//
// class _WelcomeScreen6State extends State<WelcomeScreen6> {
//   bool _isYesSelected = false;
//   bool _isNoSelected = false;
//   String? _uploadedAadharFileName;
//   Uint8List? _uploadedAadharFileBytes;
//   String? _uploadedVoterFileName;
//   Uint8List? _uploadedVoterFileBytes;
//
//   final _voterIdController = TextEditingController();
//   final _aadharNumberController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   Future<void> _submitData() async {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }
//
//     // Debugging logs to check if files are uploaded
//     print("Aadhar file bytes: $_uploadedAadharFileBytes");
//     print("Voter file bytes: $_uploadedVoterFileBytes");
//
//     if (_uploadedAadharFileBytes == null || _uploadedVoterFileBytes == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please upload both Aadhar and Voter ID")),
//       );
//       return;
//     }
//
//     try {
//       final uri = Uri.parse(
//           "http://ec2-13-232-238-37.ap-south-1.compute.amazonaws.com:8080/api/v1/signup");
//
//       var request = http.MultipartRequest('POST', uri);
//
//       // Add Authorization header (if needed)
//       request.headers['Authorization'] =
//           'Bearer <your_token>'; // Add the correct token here
//
//       request.fields['voterId'] = _voterIdController.text;
//       request.fields['aadharNumber'] = _aadharNumberController.text;
//       request.fields['communityService'] = _isYesSelected ? 'Yes' : 'No';
//
//       request.files.add(http.MultipartFile.fromBytes(
//         'aadharCard',
//         _uploadedAadharFileBytes!,
//         filename: _uploadedAadharFileName,
//       ));
//
//       request.files.add(http.MultipartFile.fromBytes(
//         'voterCad',
//         _uploadedVoterFileBytes!,
//         filename: _uploadedVoterFileName,
//       ));
//
//       final response = await request.send();
//
//       if (response.statusCode == 200) {
//         final responseBody = await response.stream.bytesToString();
//         final data = json.decode(responseBody);
//
//         if (data['success'] == true) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Submission successful!")),
//           );
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => WelcomeScreen5()),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(data['message'] ?? "Submission failed.")),
//           );
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Server error: ${response.statusCode}")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("An error occurred: $e")),
//       );
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
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   _buildTextField(
//                       "Voter ID", "Enter Voter ID", _voterIdController),
//                   SizedBox(height: 16),
//                   _buildTextField("Aadhar Number", "Enter Aadhar number",
//                       _aadharNumberController),
//                   SizedBox(height: 16),
//                   _buildUploadField(
//                     "Upload Aadhar Card",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedAadharFileName = fileName;
//                         _uploadedAadharFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   _buildUploadField(
//                     "Upload Voter ID",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedVoterFileName = fileName;
//                         _uploadedVoterFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   _buildCommunityServiceCheckBox(),
//                   SizedBox(height: 32),
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
//   Widget _buildTextField(
//       String label, String hint, TextEditingController controller,
//       {TextInputType keyboardType = TextInputType.text}) {
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
//             keyboardType: keyboardType,
//             inputFormatters: keyboardType == TextInputType.text
//                 ? [
//                     TextInputFormatter.withFunction((oldValue, newValue) {
//                       return newValue.copyWith(
//                           text: newValue.text.toUpperCase());
//                     }),
//                   ]
//                 : [],
//             decoration: InputDecoration(
//               hintText: hint,
//               border: InputBorder.none,
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
//   Widget _buildUploadField(
//       String label, Function(String?, Uint8List?) onFilePicked) {
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
//         ElevatedButton.icon(
//           onPressed: () async {
//             FilePickerResult? result = await FilePicker.platform.pickFiles(
//               type: FileType.custom,
//               allowedExtensions: ['jpg', 'png', 'pdf'],
//             );
//
//             if (result != null && result.files.isNotEmpty) {
//               String? fileName = result.files.single.name;
//               String? filePath = result.files.single.path; // Get the file path
//
//               if (filePath != null) {
//                 try {
//                   // Read the file as bytes using dart:io
//                   File file = File(filePath);
//                   Uint8List fileBytes = await file.readAsBytes();
//
//                   // Check if the bytes are being read properly
//                   print("File bytes length: ${fileBytes.length}");
//
//                   if (fileBytes.isNotEmpty) {
//                     onFilePicked(fileName,
//                         fileBytes); // Update the state with the file name and bytes
//                   } else {
//                     print("File bytes are empty.");
//                   }
//                 } catch (e) {
//                   print("Error reading file: $e");
//                 }
//               } else {
//                 print("File path is null.");
//               }
//             } else {
//               print("No file selected or result is empty.");
//             }
//           },
//           icon: Icon(Icons.upload_file),
//           label: Text("Choose File"),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.grey.shade200,
//             foregroundColor: Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 90),
//           ),
//         ),
//         if (label == "Upload Aadhar Card" && _uploadedAadharFileName != null)
//           Text("Selected: $_uploadedAadharFileName"),
//         if (label == "Upload Voter ID" && _uploadedVoterFileName != null)
//           Text("Selected: $_uploadedVoterFileName"),
//       ],
//     );
//   }
//
//   Widget _buildCommunityServiceCheckBox() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "If you wish to serve a community as a professional:",
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
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
//             SizedBox(width: 20),
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
// }
//
// // class WelcomeScreen6 extends StatefulWidget {
// //   @override
// //   _WelcomeScreen6State createState() => _WelcomeScreen6State();
// // }
// //
// // class _WelcomeScreen6State extends State<WelcomeScreen6> {
// //   bool _isYesSelected = false;
// //   bool _isNoSelected = false;
// //   String? _uploadedAadharFileName;
// //   Uint8List? _uploadedAadharFileBytes;
// //   String? _uploadedVoterFileName;
// //   Uint8List? _uploadedVoterFileBytes;
// //
// //   final _voterIdController = TextEditingController();
// //   final _aadharNumberController = TextEditingController();
// //
// //   final _formKey = GlobalKey<FormState>();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[200],
// //       body: Center(
// //         child: SingleChildScrollView(
// //           child: Container(
// //             padding: EdgeInsets.all(20.0),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(20.0),
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.grey.withOpacity(0.5),
// //                   spreadRadius: 5,
// //                   blurRadius: 10,
// //                   offset: Offset(0, 3),
// //                 ),
// //               ],
// //             ),
// //             width: 330,
// //             child: Form(
// //               key: _formKey,
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   Image.asset(
// //                     'assets/images/bpp_logo2.png',
// //                     height: 100,
// //                   ),
// //                   SizedBox(height: 16),
// //                   Text(
// //                     "Welcome to",
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black87,
// //                     ),
// //                   ),
// //                   Text(
// //                     "Bharatiya Popular Party",
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(
// //                       fontSize: 24,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.blueAccent,
// //                     ),
// //                   ),
// //                   SizedBox(height: 32),
// //                   _buildTextField(
// //                       "Voter ID", "Enter Voter ID", _voterIdController),
// //                   SizedBox(height: 16),
// //                   _buildTextField("Aadhar Number", "Enter Aadhar number",
// //                       _aadharNumberController),
// //                   SizedBox(height: 16),
// //                   _buildUploadField(
// //                     "Upload Aadhar Card",
// //                     (fileName, fileBytes) {
// //                       setState(() {
// //                         _uploadedAadharFileName = fileName;
// //                         _uploadedAadharFileBytes = fileBytes;
// //                       });
// //                     },
// //                   ),
// //                   SizedBox(height: 16),
// //                   _buildUploadField(
// //                     "Upload Voter ID",
// //                     (fileName, fileBytes) {
// //                       setState(() {
// //                         _uploadedVoterFileName = fileName;
// //                         _uploadedVoterFileBytes = fileBytes;
// //                       });
// //                     },
// //                   ),
// //                   SizedBox(height: 16),
// //                   _buildCommunityServiceCheckBox(),
// //                   SizedBox(height: 32),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: ElevatedButton(
// //                       onPressed: _handleNextButton,
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
// //   Widget _buildTextField(
// //       String label, String hint, TextEditingController controller,
// //       {TextInputType keyboardType = TextInputType.text}) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         SizedBox(height: 8),
// //         Container(
// //           decoration: BoxDecoration(
// //             color: Colors.grey.shade200, // Background color
// //             borderRadius: BorderRadius.circular(8), // Border radius
// //           ),
// //           child: TextFormField(
// //             controller: controller,
// //             keyboardType: keyboardType, // Use the correct keyboard type
// //             inputFormatters: keyboardType == TextInputType.text
// //                 ? [
// //                     // This formatter ensures the text for Voter ID is uppercase
// //                     TextInputFormatter.withFunction(
// //                       (oldValue, newValue) {
// //                         return newValue.copyWith(
// //                             text: newValue.text.toUpperCase());
// //                       },
// //                     ),
// //                   ]
// //                 : [],
// //             decoration: InputDecoration(
// //               hintText: hint,
// //               hintStyle: TextStyle(), // Hint text color
// //               border: InputBorder.none, // Remove default border
// //               enabledBorder: InputBorder.none, // Remove enabled border
// //               filled: true,
// //               fillColor:
// //                   Colors.transparent, // Fill color is handled by the container
// //               contentPadding: EdgeInsets.symmetric(
// //                 horizontal: 16.0,
// //                 vertical: 12.0,
// //               ),
// //             ),
// //             validator: (value) {
// //               if (value == null || value.isEmpty) {
// //                 return '$label is required';
// //               }
// //               return null;
// //             },
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildUploadField(
// //       String label, Function(String?, Uint8List?) onFilePicked) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         SizedBox(height: 8),
// //         ElevatedButton.icon(
// //           onPressed: () async {
// //             FilePickerResult? result = await FilePicker.platform.pickFiles(
// //               type: FileType.custom,
// //               allowedExtensions: ['jpg', 'png', 'pdf'],
// //             );
// //
// //             if (result != null) {
// //               String? fileName = result.files.single.name;
// //               Uint8List? fileBytes = result.files.single.bytes;
// //
// //               onFilePicked(fileName, fileBytes);
// //               print(
// //                   "Uploaded file: $fileName (${fileBytes?.length ?? 0} bytes)");
// //             } else {
// //               print("File upload canceled");
// //             }
// //           },
// //           icon: Icon(Icons.upload_file),
// //           label: Text("Choose File"),
// //           style: ElevatedButton.styleFrom(
// //             backgroundColor: Colors.grey.shade200,
// //             foregroundColor: Colors.black,
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(8.0),
// //             ),
// //             padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 90),
// //           ),
// //         ),
// //         if (label == "Upload Aadhar Card" && _uploadedAadharFileName != null)
// //           Text("Selected: $_uploadedAadharFileName"),
// //         if (label == "Upload Voter ID" && _uploadedVoterFileName != null)
// //           Text("Selected: $_uploadedVoterFileName"),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildCommunityServiceCheckBox() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           "If you wish to serve a community as a professional:",
// //           style: TextStyle(
// //             fontSize: 17,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         SizedBox(height: 8),
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
// //             SizedBox(width: 20),
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
// //   void _handleNextButton() {
// //     if (_formKey.currentState?.validate() ?? false) {
// //       if (_uploadedAadharFileName == null || _uploadedVoterFileName == null) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text("Please upload both Aadhar and Voter ID")),
// //         );
// //         return;
// //       }
// //
// //       if (_isYesSelected) {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //               builder: (context) =>
// //                   WelcomeScreen5()), // Replace with actual screen
// //         );
// //       } else if (_isNoSelected) {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //               builder: (context) =>
// //                   PasswordPage()), // Replace with actual screen
// //         );
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text("Please select an option to continue.")),
// //         );
// //       }
// //     }
// //   }
// // }
//
// class WelcomeScreen5 extends StatefulWidget {
//   @override
//   _WelcomeScreen5State createState() => _WelcomeScreen5State();
// }
// //
// // class _WelcomeScreen5State extends State<WelcomeScreen5> {
// //   final List<String> professions = ['Medical', 'Legal', 'Social', 'Other'];
// //   String? selectedProfession;
// //   final TextEditingController qualificationController = TextEditingController();
// //   final TextEditingController positionController = TextEditingController();
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[200],
// //       body: Center(
// //         child: SingleChildScrollView(
// //           child: Container(
// //             padding: EdgeInsets.all(20.0),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(20.0),
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.grey.withOpacity(0.5),
// //                   spreadRadius: 5,
// //                   blurRadius: 10,
// //                   offset: Offset(0, 3),
// //                 ),
// //               ],
// //             ),
// //             width: 330,
// //             child: Form(
// //               key: _formKey, // Attach the form key for validation
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   Image.asset(
// //                     'assets/images/bpp_logo2.png',
// //                     height: 100,
// //                   ),
// //                   SizedBox(height: 16),
// //                   Text(
// //                     "Welcome to",
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black87,
// //                     ),
// //                   ),
// //                   Text(
// //                     "Bharatiya Popular Party",
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(
// //                       fontSize: 24,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.blueAccent,
// //                     ),
// //                   ),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       qualificationController),
// //                   SizedBox(height: 16),
// //                   _buildDropdownField("Profession", professions),
// //                   SizedBox(height: 16),
// //                   _buildTextField(
// //                       "Position", "Enter your position", positionController),
// //                   SizedBox(height: 32),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: ElevatedButton(
// //                       onPressed: _handleNextButton,
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
// //   Widget _buildTextField(
// //       String label, String hint, TextEditingController controller) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         SizedBox(height: 8),
// //         Container(
// //           decoration: BoxDecoration(
// //             color: Colors.grey.shade200, // Background color
// //             borderRadius: BorderRadius.circular(8), // Border radius
// //           ),
// //           child: TextFormField(
// //             controller: controller,
// //             decoration: InputDecoration(
// //               hintText: hint,
// //               hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
// //               border: InputBorder.none, // Remove the default border
// //               filled: true,
// //               fillColor:
// //                   Colors.transparent, // Fill color handled by the container
// //               contentPadding: EdgeInsets.symmetric(
// //                 horizontal: 16.0,
// //                 vertical: 12.0,
// //               ),
// //             ),
// //             validator: (value) {
// //               if (value == null || value.isEmpty) {
// //                 return '$label is required';
// //               }
// //               return null;
// //             },
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   // Dropdown for Profession
// //   Widget _buildDropdownField(String label, List<String> items) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         SizedBox(height: 10),
// //         Container(
// //           decoration: BoxDecoration(
// //             color: Colors.grey.shade200, // Background color
// //             borderRadius: BorderRadius.circular(8), // Border radius
// //             border: Border.all(color: Colors.grey), // Border color
// //           ),
// //           child: DropdownButtonFormField<String>(
// //             hint: Text("Select Profession"),
// //             value: selectedProfession,
// //             onChanged: (newValue) {
// //               setState(() {
// //                 selectedProfession = newValue;
// //               });
// //             },
// //             validator: (value) {
// //               if (value == null || value.isEmpty) {
// //                 return 'Please select a profession';
// //               }
// //               return null;
// //             },
// //             isExpanded: true,
// //             decoration: InputDecoration(
// //               contentPadding: EdgeInsets.symmetric(
// //                   vertical: 10.0, horizontal: 10.0), // Increased height
// //               border: InputBorder.none, // Remove the default border
// //             ),
// //             items: items.map<DropdownMenuItem<String>>((String value) {
// //               return DropdownMenuItem<String>(
// //                 value: value,
// //                 child: Text(value),
// //               );
// //             }).toList(),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   void _handleNextButton() {
// //     if (_formKey.currentState?.validate() ?? false) {
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(builder: (context) => PasswordPage()),
// //       );
// //     }
// //   }
// // }
//
// class _WelcomeScreen5State extends State<WelcomeScreen5> {
//   final List<String> professions = ['Medical', 'Legal', 'Social', 'Other'];
//   String? selectedProfession;
//   final TextEditingController qualificationController = TextEditingController();
//   final TextEditingController positionController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//               key: _formKey, // Attach the form key for validation
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/bpp_logo2.png',
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   _buildTextField("Qualification", "Enter your qualification",
//                       qualificationController),
//                   SizedBox(height: 16),
//                   _buildDropdownField("Profession", professions),
//                   SizedBox(height: 16),
//                   _buildTextField(
//                       "Position", "Enter your position", positionController),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _handleNextButton,
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
//               border: InputBorder.none, // Remove the default border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color handled by the container
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
//   // Dropdown for Profession
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
//         SizedBox(height: 10),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey), // Border color
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
//               contentPadding: EdgeInsets.symmetric(
//                   vertical: 10.0, horizontal: 10.0), // Increased height
//               border: InputBorder.none, // Remove the default border
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
//   void _handleNextButton() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       final requestData = {
//         "qualification": qualificationController.text,
//         "profession": selectedProfession,
//         "position": positionController.text,
//       };
//
//       try {
//         final response = await ApiService.postData(requestData);
//         print("Response: $response");
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => WelcomeScreen6()),
//         );
//       } catch (e) {
//         print("Error: $e");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Failed to submit data. Please try again.")),
//         );
//       }
//     }
//   }
// }
//
// class PasswordPage extends StatefulWidget {
//   const PasswordPage({Key? key}) : super(key: key);
//
//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }
//
// class _PasswordPageState extends State<PasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//
//   final TextEditingController _referralController = TextEditingController();
//
//   bool isPasswordVisible = false;
//   bool isPinVisible = false;
//
//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _referralController.dispose();
//     super.dispose();
//   }
//
//   void _handleSubmitPassword() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       final requestData = {
//         "password": _passwordController.text,
//         "confirmPassword": _confirmPasswordController.text,
//         "referral": _referralController.text,
//       };
//
//       try {
//         final response =
//             await ApiService.postData(requestData); // Call your API
//         print("Response: $response");
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => DashboardScreen()),
//         );
//       } catch (e) {
//         print("Error: $e");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Failed to set password. Please try again.")),
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.width > 600 && size.width <= 1200;
//     final isDesktop = size.width > 1200;
//
//     final logoSize = size.width *
//         (isDesktop
//             ? 0.15
//             : isTablet
//                 ? 0.2
//                 : 0.25);
//
//     return Scaffold(
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: screenWidth * 0.07,
//                 vertical: screenHeight * 0.05,
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
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Logo Section
//                       Center(
//                         child: Image.asset(
//                           'assets/images/bpp_logo2.png',
//                           width: logoSize, // Use dynamic logo size
//                           height: logoSize, // Maintain aspect ratio
//                           fit: BoxFit.contain, // Ensure proper scaling
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       FittedBox(
//                         child: Text(
//                           'Bharatiya Popular Party',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: screenWidth * 0.06,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//
//                       // Password Field
//                       _buildTextField(
//                         'Password',
//                         'Create a password',
//                         obscureText: !isPasswordVisible,
//                         controller: _passwordController,
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
//
//                       // Confirm Password Field
//                       _buildTextField(
//                         'Confirm Password',
//                         'Confirm your password',
//                         obscureText: !isPasswordVisible,
//                         controller: _confirmPasswordController,
//                         toggleVisibility: () {
//                           setState(() {
//                             isPasswordVisible = !isPasswordVisible;
//                           });
//                         },
//                         showEyeIcon: true,
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
//
//                       // Referral Code (Optional)
//                       _buildTextField(
//                         'Referral Code (Optional)',
//                         'Enter a referral',
//                         controller: _referralController,
//                         validator: (value) {
//                           return null; // Referral is optional
//                         },
//                       ),
//                       const SizedBox(height: 20),
//
//                       // PIN Fields
//                       // _buildTextField(
//                       //   'PIN',
//                       //   'Create a PIN',
//                       //   obscureText: !isPinVisible,
//                       //   controller: _pinController,
//                       //   validator: (value) {
//                       //     if (value == null || value.isEmpty) {
//                       //       return 'PIN cannot be empty';
//                       //     }
//                       //     if (value.length != 4) {
//                       //       return 'PIN must be 4 digits';
//                       //     }
//                       //     return null;
//                       //   },
//                       // ),
//                       // const SizedBox(height: 20),
//
//                       // _buildTextField(
//                       //   'Confirm PIN',
//                       //   'Confirm your PIN',
//                       //   obscureText: !isPinVisible,
//                       //   controller: _confirmPinController,
//                       //   toggleVisibility: () {
//                       //     setState(() {
//                       //       isPinVisible = !isPinVisible;
//                       //     });
//                       //   },
//                       //   showEyeIcon: true,
//                       //   validator: (value) {
//                       //     if (value == null || value.isEmpty) {
//                       //       return 'Confirm PIN cannot be empty';
//                       //     }
//                       //     if (value != _pinController.text) {
//                       //       return 'PINs do not match';
//                       //     }
//                       //     return null;
//                       //   },
//                       // ),
//                       // const SizedBox(height: 20),
//
//                       // Submit Button
//                       ElevatedButton(
//                         onPressed: _handleSubmitPassword,
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
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
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
//
//   Widget _buildTextField(
//     String label,
//     String hint, {
//     required TextEditingController controller,
//     bool obscureText = false,
//     VoidCallback? toggleVisibility,
//     bool showEyeIcon = false,
//     String? Function(String?)? validator,
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
//         const SizedBox(height: 5),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey.shade300), // Border color
//           ),
//           child: TextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             validator: validator,
//             decoration: InputDecoration(
//               hintText: hint,
//               filled: true,
//               fillColor: Colors.transparent,
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//               suffixIcon: showEyeIcon
//                   ? IconButton(
//                       icon: Icon(
//                         obscureText ? Icons.visibility_off : Icons.visibility,
//                       ),
//                       onPressed: toggleVisibility,
//                     )
//                   : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// Future<void> _submitForm() async {
//   if (_formKey.currentState!.validate()) {
//     final combinedData = {
//       'name': nameController.text,
//       'phone': phoneController.text,
//       // ... other personal details
//       'addressLine1': addressLine1Controller.text,
//       'addressLine2': addressLine2Controller.text,
//       // ... other address details
//       'username': usernameController.text,
//       'password': passwordController.text,
//       // ... other password details
//     };
//
//     try {
//       final response = await ApiService.postCombinedData(combinedData);
//       if (response.statusCode == 201) {
//         // Handle successful registration (e.g., show a success message, navigate to the next page)
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('All details registered successfully!')),
//         );
//         // ... navigate to the next page or other appropriate action
//       } else {
//         // Handle errors (e.g., show an error message)
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//               content: Text('Error registering details. Please try again.')),
//         );
//       }
//     } on Exception catch (e) {
//       // Handle network or other exceptions
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error registering details: $e')),
//       );
//     }
//   }
// }

//correct code

// import 'package:bpp_frontend/services/signup.dart';
// import 'package:bpp_frontend/views/component/registration/password_page.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../../controller/screens/screen_dashbaord.dart';
// import 'address_page.dart';
//
// class PersonalPage extends StatefulWidget {
//   const PersonalPage({Key? key}) : super(key: key);
//
//   @override
//   State<PersonalPage> createState() => _PersonalPageState();
// }
//
// class _PersonalPageState extends State<PersonalPage> {
//   final _formKey = GlobalKey<FormState>();
//   // final TextEditingController _passwordController = TextEditingController();
//   // final TextEditingController _confirmPasswordController =
//   //     TextEditingController();
//   // final TextEditingController _referralController = TextEditingController();
//   // final TextEditingController _qualificationController =
//   //     TextEditingController(); // Example for qualification
//   // final TextEditingController _professionController = TextEditingController();
//   // final TextEditingController _positionController = TextEditingController();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _middleNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _addressLine1Controller = TextEditingController();
//   final TextEditingController _addressLine2Controller = TextEditingController();
//   final TextEditingController _cityOrVillageController =
//       TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   final TextEditingController _stateController = TextEditingController();
//   final TextEditingController _pincodeController = TextEditingController();
//   final TextEditingController _districtController = TextEditingController();
//   final TextEditingController _talukaController = TextEditingController();
//   final TextEditingController _aadhaarNumberController =
//       TextEditingController();
//   final TextEditingController _voterIDController = TextEditingController();
//   final TextEditingController _voterCardController = TextEditingController();
//
//   final TextEditingController dateController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//
//   // Fields logic
//   String? validateName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'This field is required';
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
//     if (value.length != 10 || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//       return 'Please enter a valid phone number';
//     }
//     return null;
//   }
//
//   String? validateDateOfBirth(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Date of Birth is required';
//     }
//     // Check for valid date format (e.g., MM-dd-yyyy)
//     if (!RegExp(r'^\d{2}-\d{2}-\d{4}$').hasMatch(value)) {
//       return 'Please enter a valid date (MM-dd-yyyy)';
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
//   // Submit Function
//   void submitPersonalPageForm() {
//     if (_formKey.currentState!.validate()) {
//       // Form is valid, proceed to next step or submit data
//       // For now, navigate to the AddressPage
//       Get.to(
//         () => AddressPage(),
//         transition: Transition.rightToLeft,
//         duration: const Duration(milliseconds: 300),
//       );
//     } else {
//       // Show a message if form is invalid
//       Get.snackbar(
//         'Error',
//         'Please fill all fields correctly.',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red.withOpacity(0.7),
//         colorText: Colors.white,
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     // _passwordController.dispose();
//     // _confirmPasswordController.dispose();
//     // _referralController.dispose();
//     // _qualificationController.dispose();
//     // _professionController.dispose();
//     // _positionController.dispose();
//     _titleController.dispose();
//     _firstNameController.dispose();
//     _middleNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _dobController.dispose();
//     _genderController.dispose();
//
//     // _addressLine1Controller.dispose();
//     // _addressLine2Controller.dispose();
//     // _cityOrVillageController.dispose();
//     // _stateController.dispose();
//     // _pincodeController.dispose();
//     // _districtController.dispose();
//     // _talukaController.dispose();
//     // _aadhaarNumberController.dispose();
//     // _voterIDController.dispose();
//     // _voterCardController.dispose();
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
//                   children: [
//                     // Logo Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(
//                         height: size.height * 0.02), // Spacing after the title
//                     Text(
//                       '* Enter your details exactly given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red, // Red color
//                         fontWeight: FontWeight.bold,
//                         fontSize:
//                             size.width * 0.03, // Adjust font size as needed
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
//                             _buildResponsiveRow(
//                               constraints,
//                               [
//                                 _buildFormField(
//                                   'Title', 'Select Title',
//                                   labelFontSize,
//                                   constraints,
//                                   dropdownItems: [
//                                     'Mr',
//                                     'Ms',
//                                     'Mrs',
//                                     'Dr',
//                                     'CA',
//                                     'Cs',
//                                     'Adv'
//                                   ],
//
//                                   // List of titles
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please select a title';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                                 _buildFormField(
//                                   'First Name',
//                                   'Enter first name',
//                                   controller: _firstNameController,
//                                   labelFontSize,
//                                   validator: validateName,
//                                   constraints,
//                                 ),
//                                 _buildFormField(
//                                   'Middle Name',
//                                   'Enter middle name',
//                                   controller: _middleNameController,
//                                   labelFontSize,
//                                   constraints,
//                                   validator: validateName,
//                                 ),
//                               ],
//                             ),
//                             _buildFormField(
//                               'Last Name',
//                               'Enter last name',
//                               controller: _lastNameController,
//                               labelFontSize,
//                               constraints,
//                               validator: validateName,
//                               fullWidth: true,
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
//                                   ['Male', 'Female', 'Other'],
//                                 ),
//                                 _buildValidatedFormField(
//                                   'Phone Number',
//                                   'Enter phone number',
//                                   labelFontSize,
//                                   constraints,
//                                   keyboardType: TextInputType.number,
//                                   maxLength: 10,
//                                   validator: validatePhone,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(10),
//                                   ],
//                                 ),
//                               ],
//                             ),
//
//                             // Voter ID and Aadhar Number
//                             _buildResponsiveRow(
//                               constraints,
//                               [],
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
//                         onPressed:
//                             submitPersonalPageForm, // Call submit function here
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
//           DropdownButtonFormField<String>(
//             decoration: InputDecoration(
//               hintText: hintText,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             value: dropdownItems.isNotEmpty ? dropdownItems.first : null,
//             items: dropdownItems.map((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             onChanged: (String? newValue) {
//               // Handle the value change if needed
//             },
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
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: labelFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           TextFormField(
//             controller: controller,
//             keyboardType: keyboardType,
//             maxLength: maxLength,
//             decoration: InputDecoration(
//               hintText: hintText,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             validator: validator,
//             inputFormatters: inputFormatters,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildResponsiveRow(
//     BoxConstraints constraints,
//     List<Widget> children,
//   ) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: children.map((child) {
//         return Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             child: child,
//           ),
//         );
//       }).toList(),
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
//       width: fullWidth ? double.infinity : (constraints.maxWidth - 10) / 2,
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
//           if (dropdownItems == null)
//             TextFormField(
//               controller: controller,
//               keyboardType: keyboardType,
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 16,
//                 ),
//               ),
//               validator: validator,
//               inputFormatters: inputFormatters,
//             )
//           else
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               value: dropdownItems.first,
//               items: dropdownItems.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {},
//             ),
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
//                   controller: dateController,
//                   decoration: InputDecoration(
//                     hintText: 'mm-dd-yyyy',
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
//                             dateController.text =
//                                 DateFormat('MM-dd-yyyy').format(picked);
//                             // Calculate and update age
//                             final age = DateTime.now().year - picked.year;
//                             ageController.text = age.toString();
//                           });
//                         }
//                       },
//                     ),
//                   ),
//                   validator: validateDateOfBirth,
//                   onChanged: (value) {
//                     // Validate and parse the manually entered date
//                     try {
//                       final date = DateFormat('MM-dd-yyyy').parse(value);
//                       final age = DateTime.now().year - date.year;
//                       setState(() {
//                         ageController.text = age.toString();
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
//                   controller: ageController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: 'Age',
//                     border: InputBorder.none, // No border
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 16,
//                     ),
//                     suffixIcon: Row(
//                       mainAxisSize: MainAxisSize.min,
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
// class AddressPage extends StatelessWidget {
//   AddressPage({Key? key}) : super(key: key);
//
//   // Global key for form state
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _addressLine1Controller = TextEditingController();
//   final TextEditingController _addressLine2Controller = TextEditingController();
//   final TextEditingController _cityOrVillageController =
//       TextEditingController();
//   final TextEditingController _stateController = TextEditingController();
//   final TextEditingController _pincodeController = TextEditingController();
//   final TextEditingController _districtController = TextEditingController();
//   final TextEditingController _talukaController = TextEditingController();
//
//   // Method to handle form submission
//   void submitPersonalPageForm(BuildContext context) {
//     if (_formKey.currentState?.validate() == true) {
//       // Form is valid, navigate to the next screen
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => WelcomeScreen6()),
//       );
//     } else {
//       // Handle the case when form is invalid
//       // You can show a Snackbar or other feedback to the user
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please complete the form correctly.')),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     _addressLine1Controller.dispose();
//     _addressLine2Controller.dispose();
//     _cityOrVillageController.dispose();
//     _stateController.dispose();
//     _pincodeController.dispose();
//     _districtController.dispose();
//     _talukaController.dispose();
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
//                 : 0.25);
//     final titleFontSize = size.width *
//         (isDesktop
//             ? 0.06
//             : isTablet
//                 ? 0.06
//                 : 0.06);
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
//                 key: _formKey, // Assign the global key to the form
//                 child: Column(
//                   children: [
//                     // Logo and Title Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       '          Welcome to' '\n' 'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.04),
//                     // Spacing after the title
//                     Text(
//                       '* Provide Address as given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red, // Red color
//                         fontWeight: FontWeight.bold,
//                         fontSize:
//                             size.width * 0.04, // Adjust font size as needed
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.02),
//
//                     // Address Form Fields
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildTextField('Address Line 1',
//                             'House/Flat No., Building Name, Street', (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 1';
//                           }
//                           return null;
//                         }),
//                         const SizedBox(height: 16),
//                         _buildTextField('Address Line 2', 'Area, Landmark',
//                             (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 2';
//                           }
//                           return null;
//                         }),
//                         const SizedBox(height: 16),
//
//                         // City, Taluka, District Row
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildTextField(
//                                   'City/Village', 'Enter city/village',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter city or village';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField('Taluka', 'Enter taluka',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter taluka';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField(
//                                   'District', 'Enter district', (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter district';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//
//                         // State and Pincode Row
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: _buildTextField('State', 'Enter state',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter state';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField('Pincode', 'Enter pincode',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter pincode';
//                                 }
//                                 if (value.length != 6) {
//                                   return 'Pincode must be 6 digits';
//                                 }
//                                 return null;
//                               },
//                                   keyboardType: TextInputType.number,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(6),
//                                   ]),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: size.height * 0.04),
//
//                     // Next Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           submitPersonalPageForm(
//                               context); // Call the form submission method
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           'Next',
//                           style: TextStyle(
//                             fontSize: 16,
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
//   Widget _buildTextField(
//     String label,
//     String hint,
//     String? Function(String?)? validator, {
//     TextInputType? keyboardType,
//     List<TextInputFormatter>? inputFormatters,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             keyboardType: keyboardType,
//             inputFormatters: inputFormatters,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]),
//               border: InputBorder.none,
//               // No border, rely on container for border
//               enabledBorder: InputBorder.none,
//               filled: true,
//               fillColor: Colors.transparent,
//               // Transparent fill
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 12,
//               ),
//             ),
//             validator: validator,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class WelcomeScreen6 extends StatefulWidget {
//   @override
//   _WelcomeScreen6State createState() => _WelcomeScreen6State();
// }
//
// class _WelcomeScreen6State extends State<WelcomeScreen6> {
//   bool _isYesSelected = false;
//   bool _isNoSelected = false;
//   String? _uploadedAadharFileName;
//   Uint8List? _uploadedAadharFileBytes;
//   String? _uploadedVoterFileName;
//   Uint8List? _uploadedVoterFileBytes;
//
//   final _voterIdController = TextEditingController();
//   final _aadharNumberController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   _buildTextField(
//                       "Voter ID", "Enter Voter ID", _voterIdController),
//                   SizedBox(height: 16),
//                   _buildTextField("Aadhar Number", "Enter Aadhar number",
//                       _aadharNumberController),
//                   SizedBox(height: 16),
//                   _buildUploadField(
//                     "Upload Aadhar Card",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedAadharFileName = fileName;
//                         _uploadedAadharFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   _buildUploadField(
//                     "Upload Voter ID",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedVoterFileName = fileName;
//                         _uploadedVoterFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   _buildCommunityServiceCheckBox(),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: submitPersonalPageForm,
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
//   Widget _buildTextField(
//       String label, String hint, TextEditingController controller,
//       {TextInputType keyboardType = TextInputType.text}) {
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller,
//             keyboardType: keyboardType, // Use the correct keyboard type
//             inputFormatters: keyboardType == TextInputType.text
//                 ? [
//                     // This formatter ensures the text for Voter ID is uppercase
//                     TextInputFormatter.withFunction(
//                       (oldValue, newValue) {
//                         return newValue.copyWith(
//                             text: newValue.text.toUpperCase());
//                       },
//                     ),
//                   ]
//                 : [],
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(), // Hint text color
//               border: InputBorder.none, // Remove default border
//               enabledBorder: InputBorder.none, // Remove enabled border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color is handled by the container
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
//   Widget _buildUploadField(
//       String label, Function(String?, Uint8List?) onFilePicked) {
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
//         ElevatedButton.icon(
//           onPressed: () async {
//             FilePickerResult? result = await FilePicker.platform.pickFiles(
//               type: FileType.custom,
//               allowedExtensions: ['jpg', 'png', 'pdf'],
//             );
//
//             if (result != null) {
//               String? fileName = result.files.single.name;
//               Uint8List? fileBytes = result.files.single.bytes;
//
//               onFilePicked(fileName, fileBytes);
//               print(
//                   "Uploaded file: $fileName (${fileBytes?.length ?? 0} bytes)");
//             } else {
//               print("File upload canceled");
//             }
//           },
//           icon: Icon(Icons.upload_file),
//           label: Text("Choose File"),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.grey.shade200,
//             foregroundColor: Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 90),
//           ),
//         ),
//         if (label == "Upload Aadhar Card" && _uploadedAadharFileName != null)
//           Text("Selected: $_uploadedAadharFileName"),
//         if (label == "Upload Voter ID" && _uploadedVoterFileName != null)
//           Text("Selected: $_uploadedVoterFileName"),
//       ],
//     );
//   }
//
//   Widget _buildCommunityServiceCheckBox() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "If you wish to serve a community as a professional:",
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
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
//             SizedBox(width: 20),
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
//   void submitPersonalPageForm() {
//     // Validate form fields
//     if (_formKey.currentState?.validate() ?? false) {
//       // Check if both files are uploaded
//       if (_uploadedAadharFileName == null || _uploadedVoterFileName == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload both Aadhar and Voter ID")),
//         );
//         return;
//       }
//
//       // Ensure user selects either Yes or No
//       if (!_isYesSelected && !_isNoSelected) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text("Please select an option for community service")),
//         );
//         return;
//       }
//
//       // If everything is valid, navigate to the appropriate screen
//       if (_isYesSelected) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   WelcomeScreen5()), // Replace with actual screen
//         );
//       } else if (_isNoSelected) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   PasswordPage()), // Replace with actual screen
//         );
//       }
//     }
//   }
// }
//
// class WelcomeScreen5 extends StatefulWidget {
//   @override
//   _WelcomeScreen5State createState() => _WelcomeScreen5State();
// }
//
// class _WelcomeScreen5State extends State<WelcomeScreen5> {
//   final List<String> professions = ['Medical', 'Legal', 'Social', 'Other'];
//   String? selectedProfession;
//   final TextEditingController qualificationController = TextEditingController();
//   final TextEditingController positionController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//               key: _formKey, // Attach the form key for validation
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/bpp_logo2.png',
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   _buildTextField("Qualification", "Enter your qualification",
//                       qualificationController),
//                   SizedBox(height: 16),
//                   _buildDropdownField("Profession", professions),
//                   SizedBox(height: 16),
//                   _buildTextField(
//                       "Position", "Enter your position", positionController),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: submitPersonalPageForm,
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
//               border: InputBorder.none, // Remove the default border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color handled by the container
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
//   // Dropdown for Profession
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
//         SizedBox(height: 10),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey), // Border color
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
//               contentPadding: EdgeInsets.symmetric(
//                   vertical: 10.0, horizontal: 10.0), // Increased height
//               border: InputBorder.none, // Remove the default border
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
//   void submitPersonalPageForm() {
//     if (_formKey.currentState?.validate() ?? false) {
//       if (selectedProfession == null || selectedProfession!.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please select a profession")),
//         );
//         return;
//       }
//
//       // If everything is valid, navigate to the next screen (PasswordPage in this case)
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => PasswordPage()),
//       );
//     }
//   }
// }
//
// class PasswordPage extends StatefulWidget {
//   const PasswordPage({Key? key}) : super(key: key);
//
//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }
//
// class _PasswordPageState extends State<PasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final TextEditingController _referralController = TextEditingController();
//
//   bool isPasswordVisible = false;
//
//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _referralController.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.width > 600 && size.width <= 1200;
//     final isDesktop = size.width > 1200;
//
//     final logoSize = size.width *
//         (isDesktop
//             ? 0.15
//             : isTablet
//                 ? 0.2
//                 : 0.25);
//
//     return Scaffold(
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: screenWidth * 0.07,
//                 vertical: screenHeight * 0.05,
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
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Logo Section
//                       Center(
//                         child: Image.asset(
//                           'assets/images/bpp_logo2.png',
//                           width: logoSize, // Use dynamic logo size
//                           height: logoSize, // Maintain aspect ratio
//                           fit: BoxFit.contain, // Ensure proper scaling
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       FittedBox(
//                         child: Text(
//                           'Bharatiya Popular Party',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: screenWidth * 0.06,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//
//                       // Password Fields
//                       _buildTextField(
//                         'Password',
//                         'Create a password',
//                         obscureText: !isPasswordVisible,
//                         controller: _passwordController,
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
//                       _buildTextField(
//                         'Confirm Password',
//                         'Confirm your password',
//                         obscureText: !isPasswordVisible,
//                         controller: _confirmPasswordController,
//                         toggleVisibility: () {
//                           setState(() {
//                             isPasswordVisible = !isPasswordVisible;
//                           });
//                         },
//                         showEyeIcon: true,
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
//                       _buildTextField(
//                         'Referral Code  (Optional)',
//                         'Enter a referral',
//                         controller: _referralController,
//                         validator: (value) {
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//
//                       // Submit Button
//                       ElevatedButton(
//                         onPressed: () {
//                           submitPersonalPageForm();
//                         },
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
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
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
//
//   Widget _buildTextField(
//     String label,
//     String hint, {
//     required TextEditingController controller,
//     bool obscureText = false,
//     VoidCallback? toggleVisibility,
//     bool showEyeIcon = false,
//     String? Function(String?)? validator,
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
//         const SizedBox(height: 5),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey.shade300), // Border color
//           ),
//           child: TextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             validator: validator,
//             decoration: InputDecoration(
//               hintText: hint,
//               filled: true,
//               fillColor: Colors.transparent,
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//               suffixIcon: showEyeIcon
//                   ? IconButton(
//                       icon: Icon(
//                         obscureText ? Icons.visibility_off : Icons.visibility,
//                       ),
//                       onPressed: toggleVisibility,
//                     )
//                   : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void submitPersonalPageForm() async {
//     if (_formKey.currentState!.validate()) {
//       // Call the API to submit data
//       try {
//         await ApiService.submitDataFromAllScreens(
//           qualification: '',
//           profession: '',
//           position: '',
//           password: _passwordController.text,
//           username: _usernameController.text,
//           middleName: '',
//           firstName: '',
//           lastName: '',
//           title: '',
//           email: '',
//           phone: '',
//           dob: '',
//           gender: '',
//           addressLine1: '',
//           addressLine2: '',
//           cityOrVillage: '',
//           state: '',
//           pincode: '',
//           district: '',
//           taluka: '',
//           referralCode: '',
//           voterID: '',
//           voterCard: '',
//           aadhaarCard: '',
//           aadhaarNumber: '',
//           // pin: '',
//           //username: '',
//           //  confirmPin: '',
//         );
//         // If the API call is successful, navigate to the Dashboard
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => ScreenDashbaord()),
//         );
//       } catch (e) {
//         // Handle API call failure
//         showDialog(
//           context: context,
//           builder: (BuildContext context) => AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to submit data: $e'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//   }
// }

// import 'package:bpp_frontend/views/component/registration/password_page.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../../controller/screens/screen_dashbaord.dart';
// import 'address_page.dart';
//
// class PersonalPage extends StatefulWidget {
//   const PersonalPage({Key? key}) : super(key: key);
//
//   @override
//   State<PersonalPage> createState() => _PersonalPageState();
// }
//
// class _PersonalPageState extends State<PersonalPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController dateController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//
//   //fields logic
//   String? validateName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'This field is required';
//     }
//     if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
//       return 'Please enter a valid name';
//     }
//     return null;
//   }
//
//   String? validateName1(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'This field is required';
//     }
//     if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
//       return 'Please enter a valid name';
//     }
//     return null;
//   }
//
//   String? validateName2(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'This field is required';
//     }
//     if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
//       return 'Please enter a valid name';
//     }
//     return null;
//   }
//
//   // Validation Methods
//   String? validatePhone(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Phone number is required';
//     }
//     if (value.length != 10 || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//       return 'Please enter a valid phone number';
//     }
//     return null;
//   }
//
//   String? validateDateOfBirth(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Date of Birth is required';
//     }
//     // Check for valid date format (e.g., MM-dd-yyyy)
//     if (!RegExp(r'^\d{2}-\d{2}-\d{4}$').hasMatch(value)) {
//       return 'Please enter a valid date (MM-dd-yyyy)';
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
//   // String? validateAadhar(String? value) {
//   //   if (value == null || value.isEmpty) {
//   //     return 'Aadhar number is required';
//   //   }
//   //   if (value.length != 12 || !RegExp(r'^[0-9]{12}$').hasMatch(value)) {
//   //     return 'Please enter a valid Aadhar number';
//   //   }
//   //   return null;
//   // }
//
//   // String? validateVoterId(String? value) {
//   //   if (value == null || value.isEmpty) {
//   //     return 'Voter ID is required';
//   //   }
//   //   if (value.length != 10 || !RegExp(r'^[A-Za-z0-9]{10}$').hasMatch(value)) {
//   //     return 'Please enter a valid Voter ID';
//   //   }
//   //   return null;
//   // }
//
//   @override
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
//                   children: [
//                     // Logo Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(
//                         height: size.height * 0.02), // Spacing after the title
//                     Text(
//                       '* Enter your details exactly given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red, // Red color
//                         fontWeight: FontWeight.bold,
//                         fontSize:
//                             size.width * 0.03, // Adjust font size as needed
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
//                             _buildResponsiveRow(
//                               constraints,
//                               [
//                                 _buildFormField(
//                                   'Title',
//                                   'Select Title',
//                                   labelFontSize,
//                                   constraints,
//                                   dropdownItems: [
//                                     'Mr',
//                                     'Ms',
//                                     'Mrs',
//                                     'Dr',
//                                     'CA',
//                                     'Cs',
//                                     'Adv'
//                                   ], // List of titles
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please select a title';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                                 _buildFormField(
//                                   'First Name',
//                                   'Enter first name',
//                                   labelFontSize,
//                                   validator: validateName,
//                                   constraints,
//                                 ),
//                                 _buildFormField(
//                                   'Middle Name',
//                                   'Enter middle name',
//                                   labelFontSize,
//                                   constraints,
//                                   validator: validateName1,
//                                 ),
//                               ],
//                             ),
//                             _buildFormField(
//                               'Last Name',
//                               'Enter last name',
//                               labelFontSize,
//                               constraints,
//                               validator: validateName2,
//                               fullWidth: true,
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
//                                   ['Male', 'Female', 'Other'],
//                                 ),
//                                 _buildValidatedFormField(
//                                   'Phone Number',
//                                   'Enter phone number',
//                                   labelFontSize,
//                                   constraints,
//                                   keyboardType: TextInputType.number,
//                                   maxLength: 10,
//                                   validator: validatePhone,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(10),
//                                   ],
//                                 ),
//                               ],
//                             ),
//
//                             // Voter ID and Aadhar Number
//                             _buildResponsiveRow(
//                               constraints,
//                               [
//                                 // _buildValidatedFormField(
//                                 //   'Voter ID',
//                                 //   'Enter Voter ID',
//                                 //   labelFontSize,
//                                 //   constraints,
//                                 //   maxLength: 10,
//                                 //   validator: validateVoterId,
//                                 //   inputFormatters: [
//                                 //     LengthLimitingTextInputFormatter(10),
//                                 //     FilteringTextInputFormatter.allow(
//                                 //         RegExp(r'[A-Za-z0-9]')),
//                                 //   ],
//                                 // ),
//                                 // _buildValidatedFormField(
//                                 //   'Aadhar Number',
//                                 //   'Enter Aadhar Number',
//                                 //   labelFontSize,
//                                 //   constraints,
//                                 //   keyboardType: TextInputType.number,
//                                 //   maxLength: 12,
//                                 //   validator: validateAadhar,
//                                 //   inputFormatters: [
//                                 //     FilteringTextInputFormatter.digitsOnly,
//                                 //     LengthLimitingTextInputFormatter(12),
//                                 //   ],
//                                 // ),
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
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             Get.to(
//                               () => AddressPage(),
//                               transition: Transition.rightToLeft,
//                               duration: const Duration(milliseconds: 300),
//                             );
//                           }
//                         },
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
//                   controller: dateController,
//                   decoration: InputDecoration(
//                     hintText: 'mm-dd-yyyy',
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
//                             dateController.text =
//                                 DateFormat('MM-dd-yyyy').format(picked);
//                             // Calculate and update age
//                             final age = DateTime.now().year - picked.year;
//                             ageController.text = age.toString();
//                           });
//                         }
//                       },
//                     ),
//                   ),
//                   validator: validateDateOfBirth,
//                   onChanged: (value) {
//                     // Validate and parse the manually entered date
//                     try {
//                       final date = DateFormat('MM-dd-yyyy').parse(value);
//                       final age = DateTime.now().year - date.year;
//                       setState(() {
//                         ageController.text = age.toString();
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
//                   controller: ageController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: 'Age',
//                     border: InputBorder.none, // No border
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 16,
//                     ),
//                     suffixIcon: Row(
//                       mainAxisSize: MainAxisSize.min,
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
//
//   Widget _buildResponsiveRow(
//       BoxConstraints constraints, List<Widget> children) {
//     return Container(
//       width: constraints.maxWidth,
//       child: Wrap(
//         spacing: 20,
//         runSpacing: 20,
//         children: children,
//       ),
//     );
//   }
//
//   Widget _buildFormField(
//     String label,
//     String hint,
//     double fontSize,
//     BoxConstraints constraints, {
//     bool fullWidth = false,
//     TextInputType? keyboardType,
//     String? Function(String?)? validator,
//     List<String>? dropdownItems, // Dropdown support
//     Widget? suffix,
//   }) {
//     final fieldWidth = fullWidth
//         ? constraints.maxWidth
//         : (constraints.maxWidth > 600
//             ? (constraints.maxWidth - 20) / 2
//             : constraints.maxWidth);
//
//     return Container(
//       width: fieldWidth,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Background color
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: dropdownItems == null
//                 ? TextFormField(
//                     decoration: InputDecoration(
//                       hintText: hint,
//                       border: InputBorder.none, // No border
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 16,
//                       ),
//                       suffixIcon: suffix,
//                     ),
//                     keyboardType: keyboardType,
//                     validator: validator,
//                   )
//                 : DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       border: InputBorder.none, // No border
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                       ),
//                     ),
//                     hint: Text(hint),
//                     items: dropdownItems
//                         .map((item) => DropdownMenuItem<String>(
//                               value: item,
//                               child: Text(item),
//                             ))
//                         .toList(),
//                     onChanged: (value) {
//                       // Handle dropdown selection
//                     },
//                     validator: validator,
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildValidatedFormField(
//     String label,
//     String hint,
//     double fontSize,
//     BoxConstraints constraints, {
//     TextInputType? keyboardType,
//     int? maxLength,
//     String? Function(String?)? validator,
//     List<TextInputFormatter>? inputFormatters,
//   }) {
//     final fieldWidth = constraints.maxWidth > 600
//         ? (constraints.maxWidth - 20) / 2
//         : constraints.maxWidth;
//
//     return ConstrainedBox(
//       constraints:
//           BoxConstraints(maxWidth: fieldWidth), // Set max width constraint
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Background color
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 hintText: hint,
//                 border: InputBorder.none, // No border
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 16,
//                 ),
//                 counterText: '', // Hides the counter text
//               ),
//               keyboardType: keyboardType,
//               maxLength: maxLength,
//               validator: validator,
//               inputFormatters: inputFormatters,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDropdownField(
//     String label,
//     String hint,
//     double fontSize,
//     BoxConstraints constraints,
//     List<String> items,
//   ) {
//     final fieldWidth = constraints.maxWidth > 600
//         ? (constraints.maxWidth - 20) / 2
//         : constraints.maxWidth;
//
//     return ConstrainedBox(
//       constraints:
//           BoxConstraints(maxWidth: fieldWidth), // Set max width constraint
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200, // Background color
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 hintText: hint,
//                 border: InputBorder.none, // No border
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 16,
//                 ),
//               ),
//               items: items.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 // Handle selection
//               },
//               validator: validateGender,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AddressPage extends StatelessWidget {
//   AddressPage({Key? key}) : super(key: key);
//
//   // Global key for form state
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
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
//                 : 0.25);
//     final titleFontSize = size.width *
//         (isDesktop
//             ? 0.06
//             : isTablet
//                 ? 0.06
//                 : 0.06);
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
//                 key: _formKey, // Assign the global key to the form
//                 child: Column(
//                   children: [
//                     // Logo and Title Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       '          Welcome to' '\n' 'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.04),
//                     // Spacing after the title
//                     Text(
//                       '* Provide Address as given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red, // Red color
//                         fontWeight: FontWeight.bold,
//                         fontSize:
//                             size.width * 0.04, // Adjust font size as needed
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.02),
//
//                     // Address Form Fields
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildTextField('Address Line 1',
//                             'House/Flat No., Building Name, Street', (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 1';
//                           }
//                           return null;
//                         }),
//                         const SizedBox(height: 16),
//                         _buildTextField('Address Line 2', 'Area, Landmark',
//                             (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 2';
//                           }
//                           return null;
//                         }),
//                         const SizedBox(height: 16),
//
//                         // City, Taluka, District Row
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildTextField(
//                                   'City/Village', 'Enter city/village',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter city or village';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField('Taluka', 'Enter taluka',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter taluka';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField(
//                                   'District', 'Enter district', (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter district';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//
//                         // State and Pincode Row
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: _buildTextField('State', 'Enter state',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter state';
//                                 }
//                                 return null;
//                               }),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField('Pincode', 'Enter pincode',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter pincode';
//                                 }
//                                 if (value.length != 6) {
//                                   return 'Pincode must be 6 digits';
//                                 }
//                                 return null;
//                               },
//                                   keyboardType: TextInputType.number,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(6),
//                                   ]),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: size.height * 0.04),
//
//                     // Next Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState?.validate() == true) {
//                             // Form is valid, navigate to the next screen
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => WelcomeScreen6()),
//                             );
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           'Next',
//                           style: TextStyle(
//                             fontSize: 16,
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
//   Widget _buildTextField(
//     String label,
//     String hint,
//     String? Function(String?)? validator, {
//     TextInputType? keyboardType,
//     List<TextInputFormatter>? inputFormatters,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             keyboardType: keyboardType,
//             inputFormatters: inputFormatters,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]),
//               border: InputBorder.none,
//               // No border, rely on container for border
//               enabledBorder: InputBorder.none,
//               filled: true,
//               fillColor: Colors.transparent,
//               // Transparent fill
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 12,
//               ),
//             ),
//             validator: validator,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class WelcomeScreen6 extends StatefulWidget {
//   @override
//   _WelcomeScreen6State createState() => _WelcomeScreen6State();
// }
//
// class _WelcomeScreen6State extends State<WelcomeScreen6> {
//   bool _isYesSelected = false;
//   bool _isNoSelected = false;
//   String? _uploadedAadharFileName;
//   Uint8List? _uploadedAadharFileBytes;
//   String? _uploadedVoterFileName;
//   Uint8List? _uploadedVoterFileBytes;
//
//   final _voterIdController = TextEditingController();
//   final _aadharNumberController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Aadhar Number TextField
//                   _buildTextField("Aadhar Number", "Enter Aadhar number",
//                       _aadharNumberController),
//                   SizedBox(height: 8),
//                   Text(
//                     "Providing your Aadhar card details is mandatory for completing this process.",
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   // Upload Aadhar Card Button
//                   _buildUploadField(
//                     "Upload Aadhar Card",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedAadharFileName = fileName;
//                         _uploadedAadharFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   // OR Text
//                   _buildOrRow(),
//                   SizedBox(height: 10),
//                   // Voter ID TextField (optional)
//                   _buildTextField(
//                       "Voter ID", "Enter Voter ID", _voterIdController),
//                   SizedBox(height: 8),
//                   Text(
//                     "Providing your Voter ID card details is optional.",
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   // Upload Voter ID Button (optional)
//                   _buildUploadField(
//                     "Upload Voter ID",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedVoterFileName = fileName;
//                         _uploadedVoterFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   _buildCommunityServiceCheckBox(),
//                   SizedBox(height: 16),
//                   // Text above Next button
//                   Text(
//                     "Upload clear image of Aadhar and Voter ID",
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _handleNextButton,
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
//   Widget _buildTextField(
//       String label, String hint, TextEditingController controller,
//       {TextInputType keyboardType = TextInputType.text}) {
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller,
//             keyboardType: keyboardType, // Use the correct keyboard type
//             inputFormatters: keyboardType == TextInputType.text
//                 ? [
//                     // This formatter ensures the text for Voter ID is uppercase
//                     TextInputFormatter.withFunction(
//                       (oldValue, newValue) {
//                         return newValue.copyWith(
//                             text: newValue.text.toUpperCase());
//                       },
//                     ),
//                   ]
//                 : [],
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(), // Hint text color
//               border: InputBorder.none, // Remove default border
//               enabledBorder: InputBorder.none, // Remove enabled border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color is handled by the container
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//             ),
//             // Validation only for Aadhar Number, not for Voter ID
//             validator: label == "Aadhar Number"
//                 ? (value) {
//                     if (value == null || value.isEmpty) {
//                       return '$label is required';
//                     }
//                     return null;
//                   }
//                 : null,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildUploadField(
//       String label, Function(String?, Uint8List?) onFilePicked) {
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
//         ElevatedButton.icon(
//           onPressed: () async {
//             FilePickerResult? result = await FilePicker.platform.pickFiles(
//               type: FileType.custom,
//               allowedExtensions: ['jpg', 'png', 'pdf'],
//             );
//
//             if (result != null) {
//               String? fileName = result.files.single.name;
//               Uint8List? fileBytes = result.files.single.bytes;
//
//               onFilePicked(fileName, fileBytes);
//               print(
//                   "Uploaded file: $fileName (${fileBytes?.length ?? 0} bytes)");
//             } else {
//               print("File upload canceled");
//             }
//           },
//           icon: Icon(Icons.upload_file),
//           label: Text("Choose File"),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.grey.shade200,
//             foregroundColor: Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 90),
//           ),
//         ),
//         if (label == "Upload Aadhar Card" && _uploadedAadharFileName != null)
//           Text("Selected: $_uploadedAadharFileName"),
//         if (label == "Upload Voter ID" && _uploadedVoterFileName != null)
//           Text("Selected: $_uploadedVoterFileName"),
//       ],
//     );
//   }
//
//   Widget _buildOrRow() {
//     return Row(
//       children: [
//         Expanded(
//           child: Divider(
//             color: Colors.black45,
//             thickness: 1,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8.0),
//           child: Text(
//             "OR",
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black45,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Divider(
//             color: Colors.black45,
//             thickness: 1,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildCommunityServiceCheckBox() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "If you wish to serve a community as a professional:",
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
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
//             SizedBox(width: 20),
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
//   void _handleNextButton() {
//     if (_formKey.currentState?.validate() ?? false) {
//       // Check if Aadhar card is uploaded (Voter ID is optional)
//       if (_uploadedAadharFileName == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload your Aadhar card")),
//         );
//         return;
//       }
//
//       if (_isYesSelected) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   WelcomeScreen5()), // Replace with actual screen
//         );
//       } else if (_isNoSelected) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   PasswordPage()), // Replace with actual screen
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please select an option to continue.")),
//         );
//       }
//     }
//   }
// }
//
// class WelcomeScreen5 extends StatefulWidget {
//   @override
//   _WelcomeScreen5State createState() => _WelcomeScreen5State();
// }
//
// class _WelcomeScreen5State extends State<WelcomeScreen5> {
//   final List<String> professions = ['Medical', 'Legal', 'Social', 'Other'];
//   String? selectedProfession;
//   final TextEditingController qualificationController = TextEditingController();
//   final TextEditingController positionController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//               key: _formKey, // Attach the form key for validation
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/bpp_logo2.png',
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   _buildTextField("Qualification", "Enter your qualification",
//                       qualificationController),
//                   SizedBox(height: 16),
//                   _buildDropdownField("Profession", professions),
//                   SizedBox(height: 16),
//                   _buildTextField(
//                       "Position", "Enter your position", positionController),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _handleNextButton,
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
//               border: InputBorder.none, // Remove the default border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color handled by the container
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
//   // Dropdown for Profession
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
//         SizedBox(height: 10),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey), // Border color
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
//               contentPadding: EdgeInsets.symmetric(
//                   vertical: 10.0, horizontal: 10.0), // Increased height
//               border: InputBorder.none, // Remove the default border
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
//   void _handleNextButton() {
//     if (_formKey.currentState?.validate() ?? false) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => PasswordPage()),
//       );
//     }
//   }
// }
//
// class PasswordPage extends StatefulWidget {
//   const PasswordPage({Key? key}) : super(key: key);
//
//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }
//
// class _PasswordPageState extends State<PasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final TextEditingController _pinController = TextEditingController();
//   final TextEditingController _confirmPinController = TextEditingController();
//
//   bool isPasswordVisible = false;
//   bool isPinVisible = false;
//
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _pinController.dispose();
//     _confirmPinController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.width > 600 && size.width <= 1200;
//     final isDesktop = size.width > 1200;
//
//     final logoSize = size.width *
//         (isDesktop
//             ? 0.15
//             : isTablet
//                 ? 0.2
//                 : 0.25);
//
//     return Scaffold(
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: screenWidth * 0.07,
//                 vertical: screenHeight * 0.05,
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
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Logo Section
//                       Center(
//                         child: Image.asset(
//                           'assets/images/bpp_logo2.png',
//                           width: logoSize, // Use dynamic logo size
//                           height: logoSize, // Maintain aspect ratio
//                           fit: BoxFit.contain, // Ensure proper scaling
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       FittedBox(
//                         child: Text(
//                           'Bharatiya Popular Party',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: screenWidth * 0.06,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//
//                       // Username Field
//                       // _buildTextField(
//                       //   'Username',
//                       //   'Choose a username',
//                       //   controller: _usernameController,
//                       //   validator: (value) {
//                       //     if (value == null || value.isEmpty) {
//                       //       return 'Username cannot be empty';
//                       //     }
//                       //     return null;
//                       //   },
//                       // ),
//                       // const SizedBox(height: 20),
//
//                       // Password Fields
//                       _buildTextField(
//                         'Password',
//                         'Create a password',
//                         obscureText: !isPasswordVisible,
//                         controller: _passwordController,
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
//                       _buildTextField(
//                         'Confirm Password',
//                         'Confirm your password',
//                         obscureText: !isPasswordVisible,
//                         controller: _confirmPasswordController,
//                         toggleVisibility: () {
//                           setState(() {
//                             isPasswordVisible = !isPasswordVisible;
//                           });
//                         },
//                         showEyeIcon: true,
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
//                       _buildTextField(
//                         'Referral Code  (Optional)',
//                         'Enter a referral',
//                         controller: _usernameController,
//                         validator: (value) {
//                           // Referral is optional, so we don't require validation here
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//
//                       // PIN Fields
//                       Row(
//                         children: [
//                           // Expanded(
//                           //   child: _buildTextField(
//                           //     'PIN',
//                           //     '****',
//                           //     obscureText: !isPinVisible,
//                           //     controller: _pinController,
//                           //     validator: (value) {
//                           //       if (value == null || value.isEmpty) {
//                           //         return 'PIN cannot be empty';
//                           //       }
//                           //       if (value.length != 4) {
//                           //         return 'PIN must be 4 digits';
//                           //       }
//                           //       return null;
//                           //     },
//                           //   ),
//                           // ),
//                           // const SizedBox(width: 10),
//                           // Expanded(
//                           //   child: _buildTextField(
//                           //     'Confirm PIN',
//                           //     '****',
//                           //     obscureText: !isPinVisible,
//                           //     controller: _confirmPinController,
//                           //     toggleVisibility: () {
//                           //       setState(() {
//                           //         isPinVisible = !isPinVisible;
//                           //       });
//                           //     },
//                           //     showEyeIcon: true,
//                           //     validator: (value) {
//                           //       if (value == null || value.isEmpty) {
//                           //         return 'Confirm PIN cannot be empty';
//                           //       }
//                           //       if (value != _pinController.text) {
//                           //         return 'PINs do not match';
//                           //       }
//                           //       return null;
//                           //     },
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                       // const SizedBox(height: 30),
//
//                       // Submit Button
//                       ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             // Navigate to the Dashboard Screen
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ScreenDashbaord()),
//                             );
//                           }
//                         },
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
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
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
//
//   Widget _buildTextField(
//     String label,
//     String hint, {
//     required TextEditingController controller,
//     bool obscureText = false,
//     VoidCallback? toggleVisibility,
//     bool showEyeIcon = false,
//     String? Function(String?)? validator,
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
//         const SizedBox(height: 5),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey.shade300), // Border color
//           ),
//           child: TextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             validator: validator,
//             decoration: InputDecoration(
//               hintText: hint,
//               filled: true,
//               fillColor: Colors.transparent,
//               // Make fill transparent for Container background
//               border: InputBorder.none,
//               // Remove default border
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//               suffixIcon: showEyeIcon
//                   ? IconButton(
//                       icon: Icon(
//                         obscureText ? Icons.visibility_off : Icons.visibility,
//                       ),
//                       onPressed: toggleVisibility,
//                     )
//                   : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

//all corrected codes
// import 'package:bpp_frontend/services/signup.dart';
// import 'package:bpp_frontend/views/component/registration/password_page.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../../controller/screens/screen_dashbaord.dart';
// import 'address_page.dart';
//
// class PersonalPage extends StatefulWidget {
//   const PersonalPage({Key? key}) : super(key: key);
//
//   @override
//   State<PersonalPage> createState() => _PersonalPageState();
// }
//
// class _PersonalPageState extends State<PersonalPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController dateController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//   final TextEditingController firstNameController = TextEditingController();
//
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController middleNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController genderController = TextEditingController();
//
//   // Fields logic
//   String? validateName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'This field is required';
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
//     if (value.length != 10 || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//       return 'Please enter a valid phone number';
//     }
//     return null;
//   }
//
//   String? validateDateOfBirth(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Date of Birth is required';
//     }
//     // Check for valid date format (e.g., MM-dd-yyyy)
//     if (!RegExp(r'^\d{2}-\d{2}-\d{4}$').hasMatch(value)) {
//       return 'Please enter a valid date (MM-dd-yyyy)';
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
//   // Submit Function
//   void submitPersonalPageForm() {
//     if (_formKey.currentState!.validate()) {
//       // Form is valid, proceed to next step or submit data
//       // For now, navigate to the AddressPage
//       Get.to(
//         () => AddressPage(),
//         transition: Transition.rightToLeft,
//         duration: const Duration(milliseconds: 300),
//       );
//     } else {
//       // Show a message if form is invalid
//       Get.snackbar(
//         'Error',
//         'Please fill all fields correctly.',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red.withOpacity(0.7),
//         colorText: Colors.white,
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     titleController.dispose();
//     firstNameController.dispose();
//     middleNameController.dispose();
//     lastNameController.dispose();
//     dateController.dispose();
//     ageController.dispose();
//     phoneController.dispose();
//     genderController.dispose();
//     super.dispose();
//   }
//
//   // _addressLine1Controller.dispose()
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
//                   children: [
//                     // Logo Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(
//                         height: size.height * 0.02), // Spacing after the title
//                     Text(
//                       '* Enter your details exactly given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red, // Red color
//                         fontWeight: FontWeight.bold,
//                         fontSize:
//                             size.width * 0.03, // Adjust font size as needed
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
//                             _buildResponsiveRow(
//                               constraints,
//                               [
//                                 _buildFormField(
//                                   'Title', 'Select Title',
//                                   controller: titleController,
//
//                                   labelFontSize,
//                                   constraints,
//                                   dropdownItems: [
//                                     'Mr',
//                                     'Ms',
//                                     'Mrs',
//                                     'Dr',
//                                     'CA',
//                                     'Cs',
//                                     'Adv'
//                                   ],
//
//                                   // List of titles
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please select a title';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                                 _buildFormField(
//                                   'First Name',
//                                   'Enter first name',
//                                   controller: firstNameController,
//                                   labelFontSize,
//                                   validator: validateName,
//                                   constraints,
//                                 ),
//                                 _buildFormField(
//                                   'Middle Name',
//                                   'Enter middle name',
//                                   controller: middleNameController,
//                                   labelFontSize,
//                                   constraints,
//                                   validator: validateName,
//                                 ),
//                               ],
//                             ),
//                             _buildFormField(
//                               'Last Name',
//                               'Enter last name',
//                               controller: lastNameController,
//                               labelFontSize,
//                               constraints,
//                               validator: validateName,
//                               fullWidth: true,
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
//                                   ['Male', 'Female', 'Other'],
//                                 ),
//                                 _buildValidatedFormField(
//                                   'Phone Number',
//                                   'Enter phone number',
//                                   labelFontSize,
//                                   constraints,
//                                   keyboardType: TextInputType.number,
//                                   maxLength: 10,
//                                   validator: validatePhone,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(10),
//                                   ],
//                                 ),
//                               ],
//                             ),
//
//                             // Voter ID and Aadhar Number
//                             _buildResponsiveRow(
//                               constraints,
//                               [],
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
//                         onPressed:
//                             submitPersonalPageForm, // Call submit function here
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
//           DropdownButtonFormField<String>(
//             decoration: InputDecoration(
//               hintText: hintText,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             value: dropdownItems.isNotEmpty ? dropdownItems.first : null,
//             items: dropdownItems.map((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             onChanged: (String? newValue) {
//               // Handle the value change if needed
//             },
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
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: labelFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           TextFormField(
//             controller: controller,
//             keyboardType: keyboardType,
//             maxLength: maxLength,
//             decoration: InputDecoration(
//               hintText: hintText,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             validator: validator,
//             inputFormatters: inputFormatters,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildResponsiveRow(
//     BoxConstraints constraints,
//     List<Widget> children,
//   ) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: children.map((child) {
//         return Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             child: child,
//           ),
//         );
//       }).toList(),
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
//       width: fullWidth ? double.infinity : (constraints.maxWidth - 10) / 2,
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
//           if (dropdownItems == null)
//             TextFormField(
//               controller: controller,
//               keyboardType: keyboardType,
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 16,
//                 ),
//               ),
//               validator: validator,
//               inputFormatters: inputFormatters,
//             )
//           else
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               value: dropdownItems.first,
//               items: dropdownItems.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {},
//             ),
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
//                   controller: dateController,
//                   decoration: InputDecoration(
//                     hintText: 'mm-dd-yyyy',
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
//                             dateController.text =
//                                 DateFormat('MM-dd-yyyy').format(picked);
//                             // Calculate and update age
//                             final age = DateTime.now().year - picked.year;
//                             ageController.text = age.toString();
//                           });
//                         }
//                       },
//                     ),
//                   ),
//                   validator: validateDateOfBirth,
//                   onChanged: (value) {
//                     // Validate and parse the manually entered date
//                     try {
//                       final date = DateFormat('MM-dd-yyyy').parse(value);
//                       final age = DateTime.now().year - date.year;
//                       setState(() {
//                         ageController.text = age.toString();
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
//                   controller: ageController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: 'Age',
//                     border: InputBorder.none, // No border
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 16,
//                     ),
//                     suffixIcon: Row(
//                       mainAxisSize: MainAxisSize.min,
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
// class AddressPage extends StatelessWidget {
//   AddressPage({Key? key}) : super(key: key);
//
//   // Global key for form state
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _addressLine1Controller = TextEditingController();
//   final TextEditingController _addressLine2Controller = TextEditingController();
//   final TextEditingController _cityOrVillageController =
//       TextEditingController();
//   final TextEditingController _stateController = TextEditingController();
//   final TextEditingController _pincodeController = TextEditingController();
//   final TextEditingController _districtController = TextEditingController();
//   final TextEditingController _talukaController = TextEditingController();
//
//   // Method to handle form submission
//   void submitPersonalPageForm(BuildContext context) {
//     if (_formKey.currentState?.validate() == true) {
//       // Form is valid, navigate to the next screen
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => WelcomeScreen6()),
//       );
//     } else {
//       // Handle the case when form is invalid
//       // You can show a Snackbar or other feedback to the user
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please complete the form correctly.')),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     _addressLine1Controller.dispose();
//     _addressLine2Controller.dispose();
//     _cityOrVillageController.dispose();
//     _stateController.dispose();
//     _pincodeController.dispose();
//     _districtController.dispose();
//     _talukaController.dispose();
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
//                 : 0.25);
//     final titleFontSize = size.width *
//         (isDesktop
//             ? 0.06
//             : isTablet
//                 ? 0.06
//                 : 0.06);
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
//                 key: _formKey, // Assign the global key to the form
//                 child: Column(
//                   children: [
//                     // Logo and Title Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       '          Welcome to' '\n' 'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.04),
//                     // Spacing after the title
//                     Text(
//                       '* Provide Address as given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red, // Red color
//                         fontWeight: FontWeight.bold,
//                         fontSize:
//                             size.width * 0.04, // Adjust font size as needed
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.02),
//
//                     // Address Form Fields
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildTextField('Address Line 1',
//                             'House/Flat No., Building Name, Street', (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 1';
//                           }
//                           return null;
//                         }, _addressLine1Controller),
//                         const SizedBox(height: 16),
//                         _buildTextField('Address Line 2', 'Area, Landmark',
//                             (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 2';
//                           }
//                           return null;
//                         }, _addressLine2Controller),
//                         const SizedBox(height: 16),
//
//                         // City, Taluka, District Row
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildTextField(
//                                   'City/Village', 'Enter city/village',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter city or village';
//                                 }
//                                 return null;
//                               }, _cityOrVillageController),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField('Taluka', 'Enter taluka',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter taluka';
//                                 }
//                                 return null;
//                               }, _talukaController),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField(
//                                   'District', 'Enter district', (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter district';
//                                 }
//                                 return null;
//                               }, _districtController),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//
//                         // State and Pincode Row
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: _buildTextField('State', 'Enter state',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter state';
//                                 }
//                                 return null;
//                               }, _stateController),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField('Pincode', 'Enter pincode',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter pincode';
//                                 }
//                                 if (value.length != 6) {
//                                   return 'Pincode must be 6 digits';
//                                 }
//                                 return null;
//                               }, _pincodeController,
//                                   keyboardType: TextInputType.number,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(6),
//                                   ]),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: size.height * 0.04),
//
//                     // Next Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           submitPersonalPageForm(
//                               context); // Call the form submission method
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           'Next',
//                           style: TextStyle(
//                             fontSize: 16,
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
//   Widget _buildTextField(
//     String label,
//     String hint,
//     String? Function(String?)? validator,
//     TextEditingController controller, {
//     TextInputType? keyboardType,
//     List<TextInputFormatter>? inputFormatters,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller, // Set the controller here
//             keyboardType: keyboardType,
//             inputFormatters: inputFormatters,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]),
//               border: InputBorder.none,
//               // No border, rely on container for border
//               enabledBorder: InputBorder.none,
//               filled: true,
//               fillColor: Colors.transparent,
//               // Transparent fill
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 12,
//               ),
//             ),
//             validator: validator,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class WelcomeScreen6 extends StatefulWidget {
//   @override
//   _WelcomeScreen6State createState() => _WelcomeScreen6State();
// }
//
// class _WelcomeScreen6State extends State<WelcomeScreen6> {
//   bool _isYesSelected = false;
//   bool _isNoSelected = false;
//   String? _uploadedAadharFileName;
//   Uint8List? _uploadedAadharFileBytes;
//   String? _uploadedVoterFileName;
//   Uint8List? _uploadedVoterFileBytes;
//
//   // Controllers for each text field
//   final _voterIdController = TextEditingController();
//   final _aadharNumberController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   _buildTextField(
//                       "Voter ID", "Enter Voter ID", _voterIdController),
//                   SizedBox(height: 16),
//                   _buildTextField("Aadhar Number", "Enter Aadhar number",
//                       _aadharNumberController),
//                   SizedBox(height: 16),
//                   _buildUploadField(
//                     "Upload Aadhar Card",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedAadharFileName = fileName;
//                         _uploadedAadharFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   _buildUploadField(
//                     "Upload Voter ID",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedVoterFileName = fileName;
//                         _uploadedVoterFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   _buildCommunityServiceCheckBox(),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: submitPersonalPageForm,
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
//   // Modified the method to take controller as an argument for each field
//   Widget _buildTextField(
//       String label, String hint, TextEditingController controller,
//       {TextInputType keyboardType = TextInputType.text}) {
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller, // Set the controller for each field
//             keyboardType: keyboardType, // Use the correct keyboard type
//             inputFormatters: keyboardType == TextInputType.text
//                 ? [
//                     // This formatter ensures the text for Voter ID is uppercase
//                     TextInputFormatter.withFunction(
//                       (oldValue, newValue) {
//                         return newValue.copyWith(
//                             text: newValue.text.toUpperCase());
//                       },
//                     ),
//                   ]
//                 : [],
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(), // Hint text color
//               border: InputBorder.none, // Remove default border
//               enabledBorder: InputBorder.none, // Remove enabled border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color is handled by the container
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
//   Widget _buildUploadField(
//       String label, Function(String?, Uint8List?) onFilePicked) {
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
//         ElevatedButton.icon(
//           onPressed: () async {
//             FilePickerResult? result = await FilePicker.platform.pickFiles(
//               type: FileType.custom,
//               allowedExtensions: ['jpg', 'png', 'pdf'],
//             );
//
//             if (result != null) {
//               String? fileName = result.files.single.name;
//               Uint8List? fileBytes = result.files.single.bytes;
//
//               onFilePicked(fileName, fileBytes);
//               print(
//                   "Uploaded file: $fileName (${fileBytes?.length ?? 0} bytes)");
//             } else {
//               print("File upload canceled");
//             }
//           },
//           icon: Icon(Icons.upload_file),
//           label: Text("Choose File"),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.grey.shade200,
//             foregroundColor: Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 90),
//           ),
//         ),
//         if (label == "Upload Aadhar Card" && _uploadedAadharFileName != null)
//           Text("Selected: $_uploadedAadharFileName"),
//         if (label == "Upload Voter ID" && _uploadedVoterFileName != null)
//           Text("Selected: $_uploadedVoterFileName"),
//       ],
//     );
//   }
//
//   Widget _buildCommunityServiceCheckBox() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "If you wish to serve a community as a professional:",
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
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
//             SizedBox(width: 20),
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
//   void submitPersonalPageForm() {
//     // Validate form fields
//     if (_formKey.currentState?.validate() ?? false) {
//       // Check if both files are uploaded
//       if (_uploadedAadharFileName == null || _uploadedVoterFileName == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload both Aadhar and Voter ID")),
//         );
//         return;
//       }
//
//       // Ensure user selects either Yes or No
//       if (!_isYesSelected && !_isNoSelected) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text("Please select an option for community service")),
//         );
//         return;
//       }
//
//       // If everything is valid, navigate to the appropriate screen
//       if (_isYesSelected) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   WelcomeScreen5()), // Replace with actual screen
//         );
//       } else if (_isNoSelected) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => PasswordPage(
//                     qualification: '',
//                     profession: '',
//                     position: '',
//                     firstName: '',
//                     middelName: '',
//                     lastName: '',
//                     addressLine1: '',
//                     addressLine2: '',
//                     taluka: '',
//                     cityOrVillage: '',
//                     district: '',
//                     state: '',
//                     pincode: '',
//                   )), // Replace with actual screen
//         );
//       }
//     }
//   }
// }
//
// class WelcomeScreen5 extends StatefulWidget {
//   @override
//   _WelcomeScreen5State createState() => _WelcomeScreen5State();
// }
//
// class _WelcomeScreen5State extends State<WelcomeScreen5> {
//   final List<String> professions = ['Medical', 'Legal', 'Social', 'Other'];
//   String? selectedProfession;
//
//   final TextEditingController _qualificationController =
//       TextEditingController();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _positionController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     _qualificationController.dispose();
//     _positionController.dispose();
//     _firstNameController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   _buildTextField("Qualification", "Enter your qualification",
//                       _qualificationController),
//                   SizedBox(height: 16),
//                   _buildDropdownField("Profession", professions),
//                   SizedBox(height: 16),
//                   _buildTextField(
//                       "Position", "Enter your position", _positionController),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         submitPersonalPageForm(context);
//                       },
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
//   // TextField builder with validation
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
//               border: InputBorder.none, // Remove the default border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color handled by the container
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
//   // Dropdown for Profession
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
//         SizedBox(height: 10),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey), // Border color
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
//               contentPadding: EdgeInsets.symmetric(
//                   vertical: 10.0, horizontal: 10.0), // Increased height
//               border: InputBorder.none, // Remove the default border
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
//   // Form submission logic
//   void submitPersonalPageForm(BuildContext context) {
//     if (_formKey.currentState?.validate() ?? false) {
//       if (selectedProfession == null || selectedProfession!.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please select a profession")),
//         );
//         return;
//       }
//
//       // Pass data to the PasswordPage
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => PasswordPage(
//             qualification: _qualificationController.text,
//             profession: selectedProfession!,
//             position: _positionController.text,
//             firstName: _firstNameController.text,
//             middelName: '',
//             lastName: '',
//             addressLine1: '',
//             addressLine2: '',
//             cityOrVillage: '',
//             taluka: '',
//             district: '',
//             state: '',
//             pincode: '',
//           ),
//         ),
//       );
//     }
//   }
// }
//
// // class WelcomeScreen55 extends StatefulWidget {
// //   @override
// //   _WelcomeScreen55State createState() => _WelcomeScreen55State();
// // }
// //
// // class _WelcomeScreen55State extends State<WelcomeScreen55> {
// //   // final List<String> professions = ['Medical', 'Legal', 'Social', 'Other'];
// //   // String? selectedProfession;
// //
// //   final TextEditingController _address1Controller = TextEditingController();
// //   final TextEditingController _address2Controller = TextEditingController();
// //   final TextEditingController _cityOrvillageController =
// //       TextEditingController();
// //   final TextEditingController _talukaController = TextEditingController();
// //   final TextEditingController _districtController = TextEditingController();
// //   final TextEditingController _stateController = TextEditingController();
// //   final TextEditingController _pincodeController = TextEditingController();
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //
// //   @override
// //   void dispose() {
// //     _address1Controller.dispose();
// //     _address2Controller.dispose();
// //     _cityOrvillageController.dispose();
// //     _talukaController.dispose();
// //     _districtController.dispose();
// //     _stateController.dispose();
// //     _pincodeController.dispose();
// //
// //     // _qualificationController.dispose();
// //     // _positionController.dispose();
// //
// //     // _firstNameController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[200],
// //       body: Center(
// //         child: SingleChildScrollView(
// //           child: Container(
// //             padding: EdgeInsets.all(20.0),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(20.0),
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.grey.withOpacity(0.5),
// //                   spreadRadius: 5,
// //                   blurRadius: 10,
// //                   offset: Offset(0, 3),
// //                 ),
// //               ],
// //             ),
// //             width: 330,
// //             child: Form(
// //               key: _formKey,
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   Image.asset(
// //                     'assets/images/bpp_logo2.png',
// //                     height: 100,
// //                   ),
// //                   SizedBox(height: 16),
// //                   Text(
// //                     "Welcome to",
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black87,
// //                     ),
// //                   ),
// //                   Text(
// //                     "Bharatiya Popular Party",
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(
// //                       fontSize: 24,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.blueAccent,
// //                     ),
// //                   ),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       _address1Controller),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       _address2Controller),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       _cityOrvillageController),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       _talukaController),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       _districtController),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       _stateController),
// //                   SizedBox(height: 16),
// //                   _buildTextField(
// //                       "Position", "Enter your position", _pincodeController),
// //                   SizedBox(height: 32),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: ElevatedButton(
// //                       onPressed: () {
// //                         submitPersonalPageForm(context);
// //                       },
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
// //   // TextField builder with validation
// //   Widget _buildTextField(
// //       String label, String hint, TextEditingController controller) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         SizedBox(height: 8),
// //         Container(
// //           decoration: BoxDecoration(
// //             color: Colors.grey.shade200, // Background color
// //             borderRadius: BorderRadius.circular(8), // Border radius
// //           ),
// //           child: TextFormField(
// //             controller: controller,
// //             decoration: InputDecoration(
// //               hintText: hint,
// //               hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
// //               border: InputBorder.none, // Remove the default border
// //               filled: true,
// //               fillColor:
// //                   Colors.transparent, // Fill color handled by the container
// //               contentPadding: EdgeInsets.symmetric(
// //                 horizontal: 16.0,
// //                 vertical: 12.0,
// //               ),
// //             ),
// //             validator: (value) {
// //               if (value == null || value.isEmpty) {
// //                 return '$label is required';
// //               }
// //               return null;
// //             },
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   // Dropdown for Profession
// //   Widget _buildDropdownField(String label, List<String> items) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         SizedBox(height: 10),
// //         // Container(
// //         //   decoration: BoxDecoration(
// //         //     color: Colors.grey.shade200, // Background color
// //         //     borderRadius: BorderRadius.circular(8), // Border radius
// //         //     border: Border.all(color: Colors.grey), // Border color
// //         //   ),
// //         //   child: DropdownButtonFormField<String>(
// //         //     hint: Text("Select Profession"),
// //         //     value: selectedProfession,
// //         //     onChanged: (newValue) {
// //         //       setState(() {
// //         //         selectedProfession = newValue;
// //         //       });
// //         //     },
// //         //     validator: (value) {
// //         //       if (value == null || value.isEmpty) {
// //         //         return 'Please select a profession';
// //         //       }
// //         //       return null;
// //         //     },
// //         //     isExpanded: true,
// //         //     decoration: InputDecoration(
// //         //       contentPadding: EdgeInsets.symmetric(
// //         //           vertical: 10.0, horizontal: 10.0), // Increased height
// //         //       border: InputBorder.none, // Remove the default border
// //         //     ),
// //         //     items: items.map<DropdownMenuItem<String>>((String value) {
// //         //       return DropdownMenuItem<String>(
// //         //         value: value,
// //         //         child: Text(value),
// //         //       );
// //         //     }).toList(),
// //         //   ),
// //         // ),
// //       ],
// //     );
// //   }
// //
// //   // Form submission logic
// //   void submitPersonalPageForm(BuildContext context) {
// //     // if (_formKey.currentState?.validate() ?? false) {
// //     //   if ('' == null || ''!.isEmpty) {
// //     //     // ScaffoldMessenger.of(context).showSnackBar(
// //     //     //   SnackBar(content: Text("Please select a profession")),
// //     //     // );
// //     //     return;
// //     //   }
// //
// //     // Pass data to the PasswordPage
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => PasswordPage(
// //           addressLine1: _address1Controller.text,
// //           addressLine2: _address2Controller.text,
// //           cityOrVillage: _cityOrvillageController.text,
// //           taluka: _talukaController.text,
// //           district: _districtController.text,
// //           state: _stateController.text,
// //           pincode: _pincodeController.text,
// //           qualification: '',
// //           profession: '',
// //           position: '',
// //           firstName: '',
// //           middelName: '',
// //           lastName: '',
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class PasswordPage extends StatefulWidget {
//   final String qualification;
//   final String profession;
//   final String position;
//   final String firstName;
//   final String middelName;
//   final String lastName;
//   final String addressLine1;
//   final String addressLine2;
//   final String cityOrVillage;
//   final String taluka;
//   final String district;
//   final String state;
//   final String pincode;
//
//   const PasswordPage({
//     Key? key,
//     required this.qualification,
//     required this.profession,
//     required this.position,
//     required this.firstName,
//     required this.middelName,
//     required this.lastName,
//     required this.addressLine1,
//     required this.addressLine2,
//     required this.cityOrVillage,
//     required this.taluka,
//     required this.district,
//     required this.state,
//     required this.pincode,
//   }) : super(key: key);
//
//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }
//
// class _PasswordPageState extends State<PasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final TextEditingController _referralController = TextEditingController();
//
//   bool isPasswordVisible = false;
//
//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _referralController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.width > 600 && size.width <= 1200;
//     final isDesktop = size.width > 1200;
//
//     final logoSize = size.width *
//         (isDesktop
//             ? 0.15
//             : isTablet
//                 ? 0.2
//                 : 0.25);
//
//     return Scaffold(
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: screenWidth * 0.07,
//                 vertical: screenHeight * 0.05,
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
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Center(
//                         child: Image.asset(
//                           'assets/images/bpp_logo2.png',
//                           width: logoSize,
//                           height: logoSize,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       FittedBox(
//                         child: Text(
//                           'Bharatiya Popular Party',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: screenWidth * 0.06,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       _buildTextField(
//                         'Password',
//                         'Create a password',
//                         obscureText: !isPasswordVisible,
//                         controller: _passwordController,
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
//                       _buildTextField(
//                         'Confirm Password',
//                         'Confirm your password',
//                         obscureText: !isPasswordVisible,
//                         controller: _confirmPasswordController,
//                         toggleVisibility: () {
//                           setState(() {
//                             isPasswordVisible = !isPasswordVisible;
//                           });
//                         },
//                         showEyeIcon: true,
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
//                       _buildTextField(
//                         'Referral Code  (Optional)',
//                         'Enter a referral',
//                         controller: _referralController,
//                         validator: (value) {
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//
//                       // Submit Button
//                       ElevatedButton(
//                         onPressed: () {
//                           submitPersonalPageForm();
//                         },
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
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
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
//
//   Widget _buildTextField(
//     String label,
//     String hint, {
//     required TextEditingController controller,
//     bool obscureText = false,
//     VoidCallback? toggleVisibility,
//     bool showEyeIcon = false,
//     String? Function(String?)? validator,
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
//         const SizedBox(height: 5),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey.shade300), // Border color
//           ),
//           child: TextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             validator: validator,
//             decoration: InputDecoration(
//               hintText: hint,
//               filled: true,
//               fillColor: Colors.transparent,
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//               suffixIcon: showEyeIcon
//                   ? IconButton(
//                       icon: Icon(
//                         obscureText ? Icons.visibility_off : Icons.visibility,
//                       ),
//                       onPressed: toggleVisibility,
//                     )
//                   : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void submitPersonalPageForm() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         // Make the API call
//         await ApiService.submitDataFromAllScreens(
//           qualification: widget.qualification,
//           profession: widget.profession,
//           position: widget.position,
//           password: _passwordController.text,
//           username: _usernameController.text,
//           referralCode: _referralController.text,
//           firstName: widget.firstName,
//           lastName: widget.middelName,
//           title: '',
//           email: '',
//           middleName: '',
//           phone: '',
//           dob: '',
//           gender: '',
//           addressLine1: widget.addressLine1,
//           addressLine2: widget.addressLine2,
//           cityOrVillage: widget.cityOrVillage,
//           state: widget.state,
//           pincode: widget.pincode,
//           district: widget.district,
//           taluka: widget.taluka,
//           voterCard: '',
//           voterID: '',
//           aadhaarCard: '',
//           aadhaarNumber: '',
//         );
//
//         // Navigate to Dashboard
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => ScreenDashbaord()),
//         );
//       } catch (e) {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) => AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to submit data: $e'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//   }
// }

//shubham code
//import 'package:bpp_frontend/services/signup.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../../controller/screens/screen_dashbaord.dart';
// import 'address_page.dart';
//
// class PersonalPage extends StatefulWidget {
//   const PersonalPage({Key? key}) : super(key: key);
//
//   @override
//   State<PersonalPage> createState() => _PersonalPageState();
// }
//
// class _PersonalPageState extends State<PersonalPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _middleNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//
//   String? validateName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'This field is required';
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
//     if (value.length != 10 || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//       return 'Please enter a valid phone number';
//     }
//     return null;
//   }
//
//   String? validateDateOfBirth(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Date of Birth is required';
//     }
//     if (!RegExp(r'^\d{2}-\d{2}-\d{4}$').hasMatch(value)) {
//       return 'Please enter a valid date (MM-dd-yyyy)';
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
//   void submitPersonalPageForm() {
//     if (_formKey.currentState!.validate()) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AddressPage(
//             firstName: _firstNameController.text,
//             middleName: _middleNameController.text,
//             lastName: _lastNameController.text,
//             title: _titleController.text,
//             dob: _dateController.text,
//             age: _ageController.text,
//             gender: _genderController.text,
//             phone: _phoneController.text,
//           ),
//         ),
//       );
//     } else {
//       // Show a message if form is invalid
//       Get.snackbar(
//         'Error',
//         'Please fill all fields correctly.',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red.withOpacity(0.7),
//         colorText: Colors.white,
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
//                   children: [
//                     // Logo Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(
//                         height: size.height * 0.02), // Spacing after the title
//                     Text(
//                       '* Enter your details exactly given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red, // Red color
//                         fontWeight: FontWeight.bold,
//                         fontSize:
//                             size.width * 0.03, // Adjust font size as needed
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
//                             _buildResponsiveRow(
//                               constraints,
//                               [
//                                 _buildFormField(
//                                   'Title', 'Select Title',
//                                   controller: _titleController,
//
//                                   labelFontSize,
//                                   constraints,
//                                   dropdownItems: [
//                                     'Mr',
//                                     'Ms',
//                                     'Mrs',
//                                     'Dr',
//                                     'CA',
//                                     'Cs',
//                                     'Adv'
//                                   ],
//
//                                   // List of titles
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please select a title';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                                 _buildFormField(
//                                   'First Name',
//                                   'Enter first name',
//                                   controller: _firstNameController,
//                                   labelFontSize,
//                                   validator: validateName,
//                                   constraints,
//                                 ),
//                                 _buildFormField(
//                                   'Middle Name',
//                                   'Enter middle name',
//                                   controller: _middleNameController,
//                                   labelFontSize,
//                                   constraints,
//                                   validator: validateName,
//                                 ),
//                               ],
//                             ),
//                             _buildFormField(
//                               'Last Name',
//                               'Enter last name',
//                               controller: _lastNameController,
//                               labelFontSize,
//                               constraints,
//                               validator: validateName,
//                               fullWidth: true,
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
//                                   ['Male', 'Female', 'Other'],
//                                 ),
//                                 _buildValidatedFormField(
//                                   'Phone Number',
//                                   'Enter phone number',
//                                   labelFontSize,
//                                   constraints,
//                                   keyboardType: TextInputType.number,
//                                   maxLength: 10,
//                                   validator: validatePhone,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(10),
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
//                         onPressed:
//                             submitPersonalPageForm, // Call submit function here
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
//           DropdownButtonFormField<String>(
//             decoration: InputDecoration(
//               hintText: hintText,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             value: dropdownItems.isNotEmpty ? dropdownItems.first : null,
//             items: dropdownItems.map((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             onChanged: (String? newValue) {
//               // Handle the value change if needed
//             },
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
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: labelFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           TextFormField(
//             controller: controller,
//             keyboardType: keyboardType,
//             maxLength: maxLength,
//             decoration: InputDecoration(
//               hintText: hintText,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             validator: validator,
//             inputFormatters: inputFormatters,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildResponsiveRow(
//     BoxConstraints constraints,
//     List<Widget> children,
//   ) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: children.map((child) {
//         return Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             child: child,
//           ),
//         );
//       }).toList(),
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
//       width: fullWidth ? double.infinity : (constraints.maxWidth - 10) / 2,
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
//           if (dropdownItems == null)
//             TextFormField(
//               controller: controller,
//               keyboardType: keyboardType,
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 16,
//                 ),
//               ),
//               validator: validator,
//               inputFormatters: inputFormatters,
//             )
//           else
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               value: dropdownItems.first,
//               items: dropdownItems.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {},
//             ),
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
//                     hintText: 'mm-dd-yyyy',
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
//                                 DateFormat('MM-dd-yyyy').format(picked);
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
//                       final date = DateFormat('MM-dd-yyyy').parse(value);
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
//                     suffixIcon: Row(
//                       mainAxisSize: MainAxisSize.min,
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
// class AddressPage extends StatelessWidget {
//   AddressPage(
//       {Key? key,
//       required String firstName,
//       required String lastName,
//       required String title,
//       required String middleName,
//       required String phone,
//       required String gender,
//       required String age,
//       required String dob})
//       : super(key: key);
//
//   // Global key for form state
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _addressLine1Controller = TextEditingController();
//   final TextEditingController _addressLine2Controller = TextEditingController();
//   final TextEditingController _cityOrVillageController =
//       TextEditingController();
//   final TextEditingController _stateController = TextEditingController();
//   final TextEditingController _pincodeController = TextEditingController();
//   final TextEditingController _districtController = TextEditingController();
//   final TextEditingController _talukaController = TextEditingController();
//
//   // Method to handle form submission
//   void submitPersonalPageForm(BuildContext context) {
//     if (_formKey.currentState?.validate() == true) {
//       // Form is valid, navigate to the next screen with collected data
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => WelcomeScreen6(
//             addressLine1: _addressLine1Controller.text,
//             addressLine2: _addressLine2Controller.text,
//             cityOrVillage: _cityOrVillageController.text,
//             state: _stateController.text,
//             pincode: _pincodeController.text,
//             district: _districtController.text,
//             taluka: _talukaController.text,
//             firstName: '',
//             lastName: '',
//             title: '',
//             middleName: '',
//             phone: '',
//             gender: '',
//             age: '',
//             dob: '',
//           ),
//         ),
//       );
//     } else {
//       // Handle the case when form is invalid
//       // You can show a Snackbar or other feedback to the user
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please complete the form correctly.')),
//       );
//     }
//   }
//
//   void dispose() {
//     _addressLine1Controller.dispose();
//     _addressLine2Controller.dispose();
//     _cityOrVillageController.dispose();
//     _stateController.dispose();
//     _pincodeController.dispose();
//     _districtController.dispose();
//     _talukaController.dispose();
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
//                 : 0.25);
//     final titleFontSize = size.width *
//         (isDesktop
//             ? 0.06
//             : isTablet
//                 ? 0.06
//                 : 0.06);
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
//                 key: _formKey, // Assign the global key to the form
//                 child: Column(
//                   children: [
//                     // Logo and Title Section
//                     Container(
//                       width: logoSize,
//                       height: logoSize,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/bpp_logo2.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.01),
//                     Text(
//                       '          Welcome to' '\n' 'Bharatiya Popular Party',
//                       style: TextStyle(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.04),
//                     // Spacing after the title
//                     Text(
//                       '* Provide Address as given in Aadhaar Card',
//                       style: TextStyle(
//                         color: Colors.red, // Red color
//                         fontWeight: FontWeight.bold,
//                         fontSize:
//                             size.width * 0.04, // Adjust font size as needed
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.02),
//
//                     // Address Form Fields
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildTextField('Address Line 1',
//                             'House/Flat No., Building Name, Street', (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 1';
//                           }
//                           return null;
//                         }, _addressLine1Controller),
//                         const SizedBox(height: 16),
//                         _buildTextField('Address Line 2', 'Area, Landmark',
//                             (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Address Line 2';
//                           }
//                           return null;
//                         }, _addressLine2Controller),
//                         const SizedBox(height: 16),
//
//                         // City, Taluka, District Row
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildTextField(
//                                   'City/Village', 'Enter city/village',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter city or village';
//                                 }
//                                 return null;
//                               }, _cityOrVillageController),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField('Taluka', 'Enter taluka',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter taluka';
//                                 }
//                                 return null;
//                               }, _talukaController),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField(
//                                   'District', 'Enter district', (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter district';
//                                 }
//                                 return null;
//                               }, _districtController),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//
//                         // State and Pincode Row
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: _buildTextField('State', 'Enter state',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter state';
//                                 }
//                                 return null;
//                               }, _stateController),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: _buildTextField('Pincode', 'Enter pincode',
//                                   (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter pincode';
//                                 }
//                                 if (value.length != 6) {
//                                   return 'Pincode must be 6 digits';
//                                 }
//                                 return null;
//                               }, _pincodeController,
//                                   keyboardType: TextInputType.number,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly,
//                                     LengthLimitingTextInputFormatter(6),
//                                   ]),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: size.height * 0.04),
//
//                     // Next Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           submitPersonalPageForm(
//                               context); // Call the form submission method
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           'Next',
//                           style: TextStyle(
//                             fontSize: 16,
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
//   Widget _buildTextField(
//     String label,
//     String hint,
//     String? Function(String?)? validator,
//     TextEditingController controller, {
//     TextInputType? keyboardType,
//     List<TextInputFormatter>? inputFormatters,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller, // Set the controller here
//             keyboardType: keyboardType,
//             inputFormatters: inputFormatters,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]),
//               border: InputBorder.none,
//               // No border, rely on container for border
//               enabledBorder: InputBorder.none,
//               filled: true,
//               fillColor: Colors.transparent,
//               // Transparent fill
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 12,
//               ),
//             ),
//             validator: validator,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class WelcomeScreen6 extends StatefulWidget {
//   final String firstName;
//   final String lastName;
//   final String title;
//   final String middleName;
//   final String phone;
//   final String gender;
//   final String age;
//   final String dob;
//   final String addressLine1;
//   final String addressLine2;
//   final String cityOrVillage;
//   final String state;
//   final String pincode;
//   final String district;
//   final String taluka;
//
//   WelcomeScreen6({
//     required this.firstName,
//     required this.lastName,
//     required this.title,
//     required this.middleName,
//     required this.phone,
//     required this.gender,
//     required this.age,
//     required this.dob,
//     required this.addressLine1,
//     required this.addressLine2,
//     required this.cityOrVillage,
//     required this.state,
//     required this.pincode,
//     required this.district,
//     required this.taluka,
//   });
//
//   @override
//   _WelcomeScreen6State createState() => _WelcomeScreen6State();
// }
//
// class _WelcomeScreen6State extends State<WelcomeScreen6> {
//   bool _isYesSelected = false;
//   bool _isNoSelected = false;
//   String? _uploadedAadharFileName;
//   Uint8List? _uploadedAadharFileBytes;
//   String? _uploadedVoterFileName;
//   Uint8List? _uploadedVoterFileBytes;
//
//   // Controllers for each text field
//   final _voterIdController = TextEditingController();
//   final _aadharNumberController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   _buildTextField(
//                       "Voter ID", "Enter Voter ID", _voterIdController),
//                   SizedBox(height: 16),
//                   _buildTextField("Aadhar Number", "Enter Aadhar number",
//                       _aadharNumberController),
//                   SizedBox(height: 16),
//                   _buildUploadField(
//                     "Upload Aadhar Card",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedAadharFileName = fileName;
//                         _uploadedAadharFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   _buildUploadField(
//                     "Upload Voter ID",
//                     (fileName, fileBytes) {
//                       setState(() {
//                         _uploadedVoterFileName = fileName;
//                         _uploadedVoterFileBytes = fileBytes;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   _buildCommunityServiceCheckBox(),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: submitPersonalPageForm,
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
//   // Modified the method to take controller as an argument for each field
//   Widget _buildTextField(
//       String label, String hint, TextEditingController controller,
//       {TextInputType keyboardType = TextInputType.text}) {
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller, // Set the controller for each field
//             keyboardType: keyboardType, // Use the correct keyboard type
//             inputFormatters: keyboardType == TextInputType.text
//                 ? [
//                     // This formatter ensures the text for Voter ID is uppercase
//                     TextInputFormatter.withFunction(
//                       (oldValue, newValue) {
//                         return newValue.copyWith(
//                             text: newValue.text.toUpperCase());
//                       },
//                     ),
//                   ]
//                 : [],
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(), // Hint text color
//               border: InputBorder.none, // Remove default border
//               enabledBorder: InputBorder.none, // Remove enabled border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color is handled by the container
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
//   Widget _buildUploadField(
//       String label, Function(String?, Uint8List?) onFilePicked) {
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
//         ElevatedButton.icon(
//           onPressed: () async {
//             FilePickerResult? result = await FilePicker.platform.pickFiles(
//               type: FileType.custom,
//               allowedExtensions: ['jpg', 'png', 'pdf'],
//             );
//
//             if (result != null) {
//               String? fileName = result.files.single.name;
//               Uint8List? fileBytes = result.files.single.bytes;
//
//               onFilePicked(fileName, fileBytes);
//               print(
//                   "Uploaded file: $fileName (${fileBytes?.length ?? 0} bytes)");
//             } else {
//               print("File upload canceled");
//             }
//           },
//           icon: Icon(Icons.upload_file),
//           label: Text("Choose File"),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.grey.shade200,
//             foregroundColor: Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 90),
//           ),
//         ),
//         if (label == "Upload Aadhar Card" && _uploadedAadharFileName != null)
//           Text("Selected: $_uploadedAadharFileName"),
//         if (label == "Upload Voter ID" && _uploadedVoterFileName != null)
//           Text("Selected: $_uploadedVoterFileName"),
//       ],
//     );
//   }
//
//   Widget _buildCommunityServiceCheckBox() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "If you wish to serve a community as a professional:",
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
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
//             SizedBox(width: 20),
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
//   void submitPersonalPageForm() {
//     // Validate form fields
//     if (_formKey.currentState?.validate() ?? false) {
//       // Check if both files are uploaded
//       if (_uploadedAadharFileName == null || _uploadedVoterFileName == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload both Aadhar and Voter ID")),
//         );
//         return;
//       }
//
//       // Ensure user selects either Yes or No
//       if (!_isYesSelected && !_isNoSelected) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text("Please select an option for community service")),
//         );
//         return;
//       }
//
//       // If everything is valid, navigate to the appropriate screen
//       if (_isYesSelected) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   WelcomeScreen5()), // Replace with actual screen
//         );
//       } else if (_isNoSelected) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => PasswordPage(
//               qualification: '',
//               profession: '',
//               position: '',
//               lastName: widget.lastName,
//               addressLine1: widget.addressLine1,
//               addressLine2: widget.addressLine2,
//               cityOrVillage: widget.cityOrVillage,
//               state: widget.state,
//               pincode: widget.pincode,
//               district: widget.district,
//               taluka: widget.taluka, firstName: widget.firstName,
//               // Add other fields if needed
//             ),
//           ),
//         );
//       }
//     }
//   }
// }
//
// class WelcomeScreen5 extends StatefulWidget {
//   @override
//   _WelcomeScreen5State createState() => _WelcomeScreen5State();
// }
//
// class _WelcomeScreen5State extends State<WelcomeScreen5> {
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
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
//                     height: 100,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome to",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "Bharatiya Popular Party",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   _buildTextField("Qualification", "Enter your qualification",
//                       _qualificationController),
//                   SizedBox(height: 16),
//                   _buildDropdownField("Profession", professions),
//                   SizedBox(height: 16),
//                   _buildTextField(
//                       "Position", "Enter your position", _positionController),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         submitPersonalPageForm(context);
//                       },
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
//   // TextField builder with validation
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
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//           ),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
//               border: InputBorder.none, // Remove the default border
//               filled: true,
//               fillColor:
//                   Colors.transparent, // Fill color handled by the container
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
//   // Dropdown for Profession
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
//         SizedBox(height: 10),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey), // Border color
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
//               contentPadding: EdgeInsets.symmetric(
//                   vertical: 10.0, horizontal: 10.0), // Increased height
//               border: InputBorder.none, // Remove the default border
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
//   // Form submission logic
//   void submitPersonalPageForm(BuildContext context) {
//     if (_formKey.currentState?.validate() ?? false) {
//       if (selectedProfession == null || selectedProfession!.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please select a profession")),
//         );
//         return;
//       }
//
//       // Pass data to the PasswordPage
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => PasswordPage(
//             qualification: _qualificationController.text,
//             profession: selectedProfession!,
//             position: _positionController.text,
//             firstName: '',
//             lastName: '',
//             pincode: '',
//             addressLine1: '',
//             addressLine2: '',
//             cityOrVillage: '',
//             state: '',
//             taluka: '',
//             district: '',
//           ),
//         ),
//       );
//     }
//   }
// }
//
// // class WelcomeScreen55 extends StatefulWidget {
// //   @override
// //   _WelcomeScreen55State createState() => _WelcomeScreen55State();
// // }
// //
// // class _WelcomeScreen55State extends State<WelcomeScreen55> {
// //   // final List<String> professions = ['Medical', 'Legal', 'Social', 'Other'];
// //   // String? selectedProfession;
// //
// //   final TextEditingController _address1Controller = TextEditingController();
// //   final TextEditingController _address2Controller = TextEditingController();
// //   final TextEditingController _cityOrvillageController =
// //       TextEditingController();
// //   final TextEditingController _talukaController = TextEditingController();
// //   final TextEditingController _districtController = TextEditingController();
// //   final TextEditingController _stateController = TextEditingController();
// //   final TextEditingController _pincodeController = TextEditingController();
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //
// //   @override
// //   void dispose() {
// //     _address1Controller.dispose();
// //     _address2Controller.dispose();
// //     _cityOrvillageController.dispose();
// //     _talukaController.dispose();
// //     _districtController.dispose();
// //     _stateController.dispose();
// //     _pincodeController.dispose();
// //
// //     // _qualificationController.dispose();
// //     // _positionController.dispose();
// //
// //     // _firstNameController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[200],
// //       body: Center(
// //         child: SingleChildScrollView(
// //           child: Container(
// //             padding: EdgeInsets.all(20.0),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(20.0),
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.grey.withOpacity(0.5),
// //                   spreadRadius: 5,
// //                   blurRadius: 10,
// //                   offset: Offset(0, 3),
// //                 ),
// //               ],
// //             ),
// //             width: 330,
// //             child: Form(
// //               key: _formKey,
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   Image.asset(
// //                     'assets/images/bpp_logo2.png',
// //                     height: 100,
// //                   ),
// //                   SizedBox(height: 16),
// //                   Text(
// //                     "Welcome to",
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black87,
// //                     ),
// //                   ),
// //                   Text(
// //                     "Bharatiya Popular Party",
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(
// //                       fontSize: 24,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.blueAccent,
// //                     ),
// //                   ),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       _address1Controller),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       _address2Controller),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       _cityOrvillageController),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       _talukaController),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       _districtController),
// //                   SizedBox(height: 32),
// //                   _buildTextField("Qualification", "Enter your qualification",
// //                       _stateController),
// //                   SizedBox(height: 16),
// //                   _buildTextField(
// //                       "Position", "Enter your position", _pincodeController),
// //                   SizedBox(height: 32),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: ElevatedButton(
// //                       onPressed: () {
// //                         submitPersonalPageForm(context);
// //                       },
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
// //   // TextField builder with validation
// //   Widget _buildTextField(
// //       String label, String hint, TextEditingController controller) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         SizedBox(height: 8),
// //         Container(
// //           decoration: BoxDecoration(
// //             color: Colors.grey.shade200, // Background color
// //             borderRadius: BorderRadius.circular(8), // Border radius
// //           ),
// //           child: TextFormField(
// //             controller: controller,
// //             decoration: InputDecoration(
// //               hintText: hint,
// //               hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
// //               border: InputBorder.none, // Remove the default border
// //               filled: true,
// //               fillColor:
// //                   Colors.transparent, // Fill color handled by the container
// //               contentPadding: EdgeInsets.symmetric(
// //                 horizontal: 16.0,
// //                 vertical: 12.0,
// //               ),
// //             ),
// //             validator: (value) {
// //               if (value == null || value.isEmpty) {
// //                 return '$label is required';
// //               }
// //               return null;
// //             },
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   // Dropdown for Profession
// //   Widget _buildDropdownField(String label, List<String> items) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         SizedBox(height: 10),
// //         // Container(
// //         //   decoration: BoxDecoration(
// //         //     color: Colors.grey.shade200, // Background color
// //         //     borderRadius: BorderRadius.circular(8), // Border radius
// //         //     border: Border.all(color: Colors.grey), // Border color
// //         //   ),
// //         //   child: DropdownButtonFormField<String>(
// //         //     hint: Text("Select Profession"),
// //         //     value: selectedProfession,
// //         //     onChanged: (newValue) {
// //         //       setState(() {
// //         //         selectedProfession = newValue;
// //         //       });
// //         //     },
// //         //     validator: (value) {
// //         //       if (value == null || value.isEmpty) {
// //         //         return 'Please select a profession';
// //         //       }
// //         //       return null;
// //         //     },
// //         //     isExpanded: true,
// //         //     decoration: InputDecoration(
// //         //       contentPadding: EdgeInsets.symmetric(
// //         //           vertical: 10.0, horizontal: 10.0), // Increased height
// //         //       border: InputBorder.none, // Remove the default border
// //         //     ),
// //         //     items: items.map<DropdownMenuItem<String>>((String value) {
// //         //       return DropdownMenuItem<String>(
// //         //         value: value,
// //         //         child: Text(value),
// //         //       );
// //         //     }).toList(),
// //         //   ),
// //         // ),
// //       ],
// //     );
// //   }
// //
// //   // Form submission logic
// //   void submitPersonalPageForm(BuildContext context) {
// //     // if (_formKey.currentState?.validate() ?? false) {
// //     //   if ('' == null || ''!.isEmpty) {
// //     //     // ScaffoldMessenger.of(context).showSnackBar(
// //     //     //   SnackBar(content: Text("Please select a profession")),
// //     //     // );
// //     //     return;
// //     //   }
// //
// //     // Pass data to the PasswordPage
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => PasswordPage(
// //           addressLine1: _address1Controller.text,
// //           addressLine2: _address2Controller.text,
// //           cityOrVillage: _cityOrvillageController.text,
// //           taluka: _talukaController.text,
// //           district: _districtController.text,
// //           state: _stateController.text,
// //           pincode: _pincodeController.text,
// //           qualification: '',
// //           profession: '',
// //           position: '',
// //           firstName: '',
// //           middelName: '',
// //           lastName: '',
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class PasswordPage extends StatefulWidget {
//   final String qualification;
//   final String profession;
//   final String position;
//   final String firstName;
//   final String lastName;
//   final String pincode;
//   final String addressLine1;
//   final String addressLine2;
//   final String cityOrVillage;
//   final String state;
//
//   const PasswordPage({
//     Key? key,
//     required this.qualification,
//     required this.profession,
//     required this.position,
//     required this.firstName,
//     required this.lastName,
//     required this.pincode,
//     required this.addressLine1,
//     required this.addressLine2,
//     required this.cityOrVillage,
//     required this.state,
//     required String taluka,
//     required String district,
//   }) : super(key: key);
//
//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }
//
// class _PasswordPageState extends State<PasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final TextEditingController _referralController = TextEditingController();
//
//   bool isPasswordVisible = false;
//
//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _referralController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.width > 600 && size.width <= 1200;
//     final isDesktop = size.width > 1200;
//
//     final logoSize = size.width *
//         (isDesktop
//             ? 0.15
//             : isTablet
//                 ? 0.2
//                 : 0.25);
//
//     return Scaffold(
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: screenWidth * 0.07,
//                 vertical: screenHeight * 0.05,
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
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Center(
//                         child: Image.asset(
//                           'assets/images/bpp_logo2.png',
//                           width: logoSize,
//                           height: logoSize,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       FittedBox(
//                         child: Text(
//                           'Bharatiya Popular Party',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: screenWidth * 0.06,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       _buildTextField(
//                         'Password',
//                         'Create a password',
//                         obscureText: !isPasswordVisible,
//                         controller: _passwordController,
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
//                       _buildTextField(
//                         'Confirm Password',
//                         'Confirm your password',
//                         obscureText: !isPasswordVisible,
//                         controller: _confirmPasswordController,
//                         toggleVisibility: () {
//                           setState(() {
//                             isPasswordVisible = !isPasswordVisible;
//                           });
//                         },
//                         showEyeIcon: true,
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
//                       _buildTextField(
//                         'Referral Code  (Optional)',
//                         'Enter a referral',
//                         controller: _referralController,
//                         validator: (value) {
//                           return null; // No validation required for referral code
//                         },
//                       ),
//                       const SizedBox(height: 20),
//
//                       // Submit Button
//                       ElevatedButton(
//                         onPressed: () {
//                           submitPersonalPageForm();
//                         },
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
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
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
//
//   Widget _buildTextField(
//     String label,
//     String hint, {
//     required TextEditingController controller,
//     bool obscureText = false,
//     VoidCallback? toggleVisibility,
//     bool showEyeIcon = false,
//     String? Function(String?)? validator,
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
//         const SizedBox(height: 5),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200, // Background color
//             borderRadius: BorderRadius.circular(8), // Border radius
//             border: Border.all(color: Colors.grey.shade300), // Border color
//           ),
//           child: TextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             validator: validator,
//             decoration: InputDecoration(
//               hintText: hint,
//               filled: true,
//               fillColor: Colors.transparent,
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//               suffixIcon: showEyeIcon
//                   ? IconButton(
//                       icon: Icon(
//                         obscureText ? Icons.visibility_off : Icons.visibility,
//                       ),
//                       onPressed: toggleVisibility,
//                     )
//                   : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void submitPersonalPageForm() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         // Make the API call
//         await ApiService.submitDataFromAllScreens(
//           qualification: widget.qualification,
//           profession: widget.profession,
//           position: widget.position,
//           password: _passwordController.text,
//           username: _usernameController.text,
//           referralCode: _referralController.text,
//           firstName: widget.firstName,
//           lastName: widget.lastName,
//           addressLine1: widget.addressLine1,
//           addressLine2: widget.addressLine2,
//           cityOrVillage: widget.cityOrVillage,
//           state: widget.state,
//           pincode: widget.pincode,
//           title: '',
//           email: '',
//           middleName: '',
//           phone: '',
//           dob: '',
//           gender: '',
//           district: '',
//           taluka: '',
//           voterCard: '',
//           voterID: '',
//           aadhaarCard: '',
//           aadhaarNumber: '',
//         );
//
//         // Navigate to Dashboard
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => ScreenDashbaord()),
//         );
//       } catch (e) {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) => AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to submit data: $e'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//   }
// }

import 'package:bpp_frontend/views/component/registration/password_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/screens/screen_dashbaord.dart';
import 'address_page.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  //fields logic
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  String? validateName1(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  String? validateName2(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  // Validation Methods
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (value.length != 10 || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validateDateOfBirth(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Date of Birth is required';
    }
    // Check for valid date format (e.g., MM-dd-yyyy)
    if (!RegExp(r'^\d{2}-\d{2}-\d{4}$').hasMatch(value)) {
      return 'Please enter a valid date (MM-dd-yyyy)';
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Age is required';
    }
    final age = int.tryParse(value);
    if (age == null || age <= 0 || age > 120) {
      return 'Please enter a valid age between 1 and 120';
    }
    return null;
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

  // String? validateAadhar(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Aadhar number is required';
  //   }
  //   if (value.length != 12 || !RegExp(r'^[0-9]{12}$').hasMatch(value)) {
  //     return 'Please enter a valid Aadhar number';
  //   }
  //   return null;
  // }

  // String? validateVoterId(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Voter ID is required';
  //   }
  //   if (value.length != 10 || !RegExp(r'^[A-Za-z0-9]{10}$').hasMatch(value)) {
  //     return 'Please enter a valid Voter ID';
  //   }
  //   return null;
  // }

  @override
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
                  children: [
                    // Logo Section
                    Container(
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
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'Bharatiya Popular Party',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                        height: size.height * 0.02), // Spacing after the title
                    Text(
                      '* Enter your details exactly given in Aadhaar Card',
                      style: TextStyle(
                        color: Colors.red, // Red color
                        fontWeight: FontWeight.bold,
                        fontSize:
                            size.width * 0.03, // Adjust font size as needed
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
                            _buildResponsiveRow(
                              constraints,
                              [
                                _buildFormField(
                                  'Title',
                                  'Select Title',
                                  labelFontSize,
                                  constraints,
                                  dropdownItems: [
                                    'Mr',
                                    'Ms',
                                    'Mrs',
                                    'Dr',
                                    'CA',
                                    'Cs',
                                    'Adv'
                                  ], // List of titles
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a title';
                                    }
                                    return null;
                                  },
                                ),
                                _buildFormField(
                                  'First Name',
                                  'Enter first name',
                                  labelFontSize,
                                  validator: validateName,
                                  constraints,
                                ),
                                _buildFormField(
                                  'Middle Name',
                                  'Enter middle name',
                                  labelFontSize,
                                  constraints,
                                  validator: validateName1,
                                ),
                              ],
                            ),
                            _buildFormField(
                              'Last Name',
                              'Enter last name',
                              labelFontSize,
                              constraints,
                              validator: validateName2,
                              fullWidth: true,
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
                                  ['Male', 'Female', 'Other'],
                                ),
                                _buildValidatedFormField(
                                  'Phone Number',
                                  'Enter phone number',
                                  labelFontSize,
                                  constraints,
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  validator: validatePhone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                ),
                              ],
                            ),

                            // Voter ID and Aadhar Number
                            _buildResponsiveRow(
                              constraints,
                              [
                                // _buildValidatedFormField(
                                //   'Voter ID',
                                //   'Enter Voter ID',
                                //   labelFontSize,
                                //   constraints,
                                //   maxLength: 10,
                                //   validator: validateVoterId,
                                //   inputFormatters: [
                                //     LengthLimitingTextInputFormatter(10),
                                //     FilteringTextInputFormatter.allow(
                                //         RegExp(r'[A-Za-z0-9]')),
                                //   ],
                                // ),
                                // _buildValidatedFormField(
                                //   'Aadhar Number',
                                //   'Enter Aadhar Number',
                                //   labelFontSize,
                                //   constraints,
                                //   keyboardType: TextInputType.number,
                                //   maxLength: 12,
                                //   validator: validateAadhar,
                                //   inputFormatters: [
                                //     FilteringTextInputFormatter.digitsOnly,
                                //     LengthLimitingTextInputFormatter(12),
                                //   ],
                                // ),
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(
                              () => AddressPage(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 300),
                            );
                          }
                        },
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

  Widget _buildDateAndAgeFields(
      BoxConstraints constraints, double labelFontSize) {
    return _buildResponsiveRow(
      constraints,
      [
        // Date of Birth field
        Container(
          width: constraints.maxWidth > 600
              ? (constraints.maxWidth - 20) / 2
              : constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date of Birth',
                style: TextStyle(
                  fontSize: labelFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Background color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: 'mm-dd-yyyy',
                    border: InputBorder.none, // No border
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: Get.context!,
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
                            dateController.text =
                                DateFormat('MM-dd-yyyy').format(picked);
                            // Calculate and update age
                            final age = DateTime.now().year - picked.year;
                            ageController.text = age.toString();
                          });
                        }
                      },
                    ),
                  ),
                  validator: validateDateOfBirth,
                  onChanged: (value) {
                    // Validate and parse the manually entered date
                    try {
                      final date = DateFormat('MM-dd-yyyy').parse(value);
                      final age = DateTime.now().year - date.year;
                      setState(() {
                        ageController.text = age.toString();
                      });
                    } catch (e) {
                      // Invalid date format
                    }
                  },
                ),
              ),
            ],
          ),
        ),

        // Age field with increment/decrement buttons
        Container(
          width: constraints.maxWidth > 600
              ? (constraints.maxWidth - 20) / 2
              : constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Age',
                style: TextStyle(
                  fontSize: labelFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Background color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Age',
                    border: InputBorder.none, // No border
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                  validator: validateAge,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResponsiveRow(
      BoxConstraints constraints, List<Widget> children) {
    return Container(
      width: constraints.maxWidth,
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: children,
      ),
    );
  }

  Widget _buildFormField(
    String label,
    String hint,
    double fontSize,
    BoxConstraints constraints, {
    bool fullWidth = false,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    List<String>? dropdownItems, // Dropdown support
    Widget? suffix,
  }) {
    final fieldWidth = fullWidth
        ? constraints.maxWidth
        : (constraints.maxWidth > 600
            ? (constraints.maxWidth - 20) / 2
            : constraints.maxWidth);

    return Container(
      width: fieldWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200, // Background color
              borderRadius: BorderRadius.circular(8),
            ),
            child: dropdownItems == null
                ? TextFormField(
                    decoration: InputDecoration(
                      hintText: hint,
                      border: InputBorder.none, // No border
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      suffixIcon: suffix,
                    ),
                    keyboardType: keyboardType,
                    validator: validator,
                  )
                : DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: InputBorder.none, // No border
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                    ),
                    hint: Text(hint),
                    items: dropdownItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (value) {
                      // Handle dropdown selection
                    },
                    validator: validator,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildValidatedFormField(
    String label,
    String hint,
    double fontSize,
    BoxConstraints constraints, {
    TextInputType? keyboardType,
    int? maxLength,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
  }) {
    final fieldWidth = constraints.maxWidth > 600
        ? (constraints.maxWidth - 20) / 2
        : constraints.maxWidth;

    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: fieldWidth), // Set max width constraint
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200, // Background color
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none, // No border
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                counterText: '', // Hides the counter text
              ),
              keyboardType: keyboardType,
              maxLength: maxLength,
              validator: validator,
              inputFormatters: inputFormatters,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(
    String label,
    String hint,
    double fontSize,
    BoxConstraints constraints,
    List<String> items,
  ) {
    final fieldWidth = constraints.maxWidth > 600
        ? (constraints.maxWidth - 20) / 2
        : constraints.maxWidth;

    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: fieldWidth), // Set max width constraint
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200, // Background color
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none, // No border
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
              ),
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle selection
              },
              validator: validateGender,
            ),
          ),
        ],
      ),
    );
  }
}

class AddressPage extends StatelessWidget {
  AddressPage({Key? key}) : super(key: key);

  // Global key for form state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
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
                : 0.25);
    final titleFontSize = size.width *
        (isDesktop
            ? 0.06
            : isTablet
                ? 0.06
                : 0.06);

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
                key: _formKey, // Assign the global key to the form
                child: Column(
                  children: [
                    // Logo and Title Section
                    Container(
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
                    SizedBox(height: size.height * 0.01),
                    Text(
                      '          Welcome to' '\n' 'Bharatiya Popular Party',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    // Spacing after the title
                    Text(
                      '* Provide Address as given in Aadhaar Card',
                      style: TextStyle(
                        color: Colors.red, // Red color
                        fontWeight: FontWeight.bold,
                        fontSize:
                            size.width * 0.04, // Adjust font size as needed
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),

                    // Address Form Fields
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField('Address Line 1',
                            'House/Flat No., Building Name, Street', (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Address Line 1';
                          }
                          return null;
                        }),
                        const SizedBox(height: 16),
                        _buildTextField('Address Line 2', 'Area, Landmark',
                            (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Address Line 2';
                          }
                          return null;
                        }),
                        const SizedBox(height: 16),

                        // City, Taluka, District Row
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextField(
                                  'City/Village', 'Enter city/village',
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter city or village';
                                }
                                return null;
                              }),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildTextField('Taluka', 'Enter taluka',
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter taluka';
                                }
                                return null;
                              }),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildTextField(
                                  'District', 'Enter district', (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter district';
                                }
                                return null;
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // State and Pincode Row
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: _buildTextField('State', 'Enter state',
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter state';
                                }
                                return null;
                              }),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildTextField('Pincode', 'Enter pincode',
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter pincode';
                                }
                                if (value.length != 6) {
                                  return 'Pincode must be 6 digits';
                                }
                                return null;
                              },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(6),
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.04),

                    // Next Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            // Form is valid, navigate to the next screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen6()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16,
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

  Widget _buildTextField(
    String label,
    String hint,
    String? Function(String?)? validator, {
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200, // Background color
            borderRadius: BorderRadius.circular(8), // Border radius
          ),
          child: TextFormField(
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: InputBorder.none,
              // No border, rely on container for border
              enabledBorder: InputBorder.none,
              filled: true,
              fillColor: Colors.transparent,
              // Transparent fill
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}

class WelcomeScreen6 extends StatefulWidget {
  @override
  _WelcomeScreen6State createState() => _WelcomeScreen6State();
}

class _WelcomeScreen6State extends State<WelcomeScreen6> {
  bool _isYesSelected = false;
  bool _isNoSelected = false;
  String? _uploadedAadharFileName;
  Uint8List? _uploadedAadharFileBytes;
  String? _uploadedVoterFileName;
  Uint8List? _uploadedVoterFileBytes;

  final _voterIdController = TextEditingController();
  final _aadharNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                    height: 100,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Welcome to",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Bharatiya Popular Party",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 32),
                  _buildTextField(
                      "Voter ID", "Enter Voter ID", _voterIdController),
                  SizedBox(height: 16),
                  _buildTextField("Aadhar Number", "Enter Aadhar number",
                      _aadharNumberController),
                  SizedBox(height: 16),
                  _buildUploadField(
                    "Upload Aadhar Card",
                    (fileName, fileBytes) {
                      setState(() {
                        _uploadedAadharFileName = fileName;
                        _uploadedAadharFileBytes = fileBytes;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  _buildUploadField(
                    "Upload Voter ID",
                    (fileName, fileBytes) {
                      setState(() {
                        _uploadedVoterFileName = fileName;
                        _uploadedVoterFileBytes = fileBytes;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  _buildCommunityServiceCheckBox(),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleNextButton,
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
            color: Colors.grey.shade200, // Background color
            borderRadius: BorderRadius.circular(8), // Border radius
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(), // Hint text color
              border: InputBorder.none, // Remove default border
              enabledBorder: InputBorder.none, // Remove enabled border
              filled: true,
              fillColor:
                  Colors.transparent, // Fill color is handled by the container
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

  Widget _buildUploadField(
      String label, Function(String?, Uint8List?) onFilePicked) {
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
        ElevatedButton.icon(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['jpg', 'png', 'pdf'],
            );

            if (result != null) {
              String? fileName = result.files.single.name;
              Uint8List? fileBytes = result.files.single.bytes;

              onFilePicked(fileName, fileBytes);
              print(
                  "Uploaded file: $fileName (${fileBytes?.length ?? 0} bytes)");
            } else {
              print("File upload canceled");
            }
          },
          icon: Icon(Icons.upload_file),
          label: Text("Choose File"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade200,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 90),
          ),
        ),
        if (label == "Upload Aadhar Card" && _uploadedAadharFileName != null)
          Text("Selected: $_uploadedAadharFileName"),
        if (label == "Upload Voter ID" && _uploadedVoterFileName != null)
          Text("Selected: $_uploadedVoterFileName"),
      ],
    );
  }

  Widget _buildCommunityServiceCheckBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "If you wish to serve a community as a professional:",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
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
            SizedBox(width: 20),
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

  void _handleNextButton() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_uploadedAadharFileName == null || _uploadedVoterFileName == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please upload both Aadhar and Voter ID")),
        );
        return;
      }

      if (_isYesSelected) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  WelcomeScreen5()), // Replace with actual screen
        );
      } else if (_isNoSelected) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PasswordPage()), // Replace with actual screen
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select an option to continue.")),
        );
      }
    }
  }
}

class WelcomeScreen5 extends StatefulWidget {
  @override
  _WelcomeScreen5State createState() => _WelcomeScreen5State();
}

class _WelcomeScreen5State extends State<WelcomeScreen5> {
  final List<String> professions = ['Medical', 'Legal', 'Social', 'Other'];
  String? selectedProfession;
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
              key: _formKey, // Attach the form key for validation
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/bpp_logo2.png',
                    height: 100,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Welcome to",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Bharatiya Popular Party",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 32),
                  _buildTextField("Qualification", "Enter your qualification",
                      qualificationController),
                  SizedBox(height: 16),
                  _buildDropdownField("Profession", professions),
                  SizedBox(height: 16),
                  _buildTextField(
                      "Position", "Enter your position", positionController),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleNextButton,
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
            color: Colors.grey.shade200, // Background color
            borderRadius: BorderRadius.circular(8), // Border radius
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
              border: InputBorder.none, // Remove the default border
              filled: true,
              fillColor:
                  Colors.transparent, // Fill color handled by the container
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

  // Dropdown for Profession
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
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200, // Background color
            borderRadius: BorderRadius.circular(8), // Border radius
            border: Border.all(color: Colors.grey), // Border color
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
              contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 10.0), // Increased height
              border: InputBorder.none, // Remove the default border
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

  void _handleNextButton() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PasswordPage()),
      );
    }
  }
}

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();

  bool isPasswordVisible = false;
  bool isPinVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _pinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600 && size.width <= 1200;
    final isDesktop = size.width > 1200;

    final logoSize = size.width *
        (isDesktop
            ? 0.15
            : isTablet
                ? 0.2
                : 0.25);

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.07,
                vertical: screenHeight * 0.05,
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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo Section
                      Center(
                        child: Image.asset(
                          'assets/images/bpp_logo2.png',
                          width: logoSize, // Use dynamic logo size
                          height: logoSize, // Maintain aspect ratio
                          fit: BoxFit.contain, // Ensure proper scaling
                        ),
                      ),
                      const SizedBox(height: 20),
                      FittedBox(
                        child: Text(
                          'Bharatiya Popular Party',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.06,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Username Field
                      // _buildTextField(
                      //   'Username',
                      //   'Choose a username',
                      //   controller: _usernameController,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Username cannot be empty';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // const SizedBox(height: 20),

                      // Password Fields
                      _buildTextField(
                        'Password',
                        'Create a password',
                        obscureText: !isPasswordVisible,
                        controller: _passwordController,
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
                      _buildTextField(
                        'Confirm Password',
                        'Confirm your password',
                        obscureText: !isPasswordVisible,
                        controller: _confirmPasswordController,
                        toggleVisibility: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        showEyeIcon: true,
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
                      _buildTextField(
                        'Referral Code  (Optional)',
                        'Enter a referral',
                        controller: _usernameController,
                        validator: (value) {
                          // Referral is optional, so we don't require validation here
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // PIN Fields
                      Row(
                        children: [
                          // Expanded(
                          //   child: _buildTextField(
                          //     'PIN',
                          //     '****',
                          //     obscureText: !isPinVisible,
                          //     controller: _pinController,
                          //     validator: (value) {
                          //       if (value == null || value.isEmpty) {
                          //         return 'PIN cannot be empty';
                          //       }
                          //       if (value.length != 4) {
                          //         return 'PIN must be 4 digits';
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          // ),
                          // const SizedBox(width: 10),
                          // Expanded(
                          //   child: _buildTextField(
                          //     'Confirm PIN',
                          //     '****',
                          //     obscureText: !isPinVisible,
                          //     controller: _confirmPinController,
                          //     toggleVisibility: () {
                          //       setState(() {
                          //         isPinVisible = !isPinVisible;
                          //       });
                          //     },
                          //     showEyeIcon: true,
                          //     validator: (value) {
                          //       if (value == null || value.isEmpty) {
                          //         return 'Confirm PIN cannot be empty';
                          //       }
                          //       if (value != _pinController.text) {
                          //         return 'PINs do not match';
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                      // const SizedBox(height: 30),

                      // Submit Button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Navigate to the Dashboard Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenDashbaord(
                                        firstName: '',
                                        lastName: '',
                                        referralCode: '',
                                      )),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint, {
    required TextEditingController controller,
    bool obscureText = false,
    VoidCallback? toggleVisibility,
    bool showEyeIcon = false,
    String? Function(String?)? validator,
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
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200, // Background color
            borderRadius: BorderRadius.circular(8), // Border radius
            border: Border.all(color: Colors.grey.shade300), // Border color
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.transparent,
              // Make fill transparent for Container background
              border: InputBorder.none,
              // Remove default border
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
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
