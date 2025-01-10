// import 'package:flutter/material.dart';
//
// import '../../../controller/screens1/screen_dashbaord.dart';
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
//   final TextEditingController _confirmPasswordController = TextEditingController();
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
//     final logoSize = size.width * (isDesktop ? 0.15 : isTablet ? 0.2 : 0.25);
//
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
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
//                       _buildTextField(
//                         'Username',
//                         'Choose a username',
//                         controller: _usernameController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Username cannot be empty';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),
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
//
//                       // PIN Fields
//                       Row(
//                         children: [
//                           Expanded(
//                             child: _buildTextField(
//                               'PIN',
//                               '****',
//                               obscureText: !isPinVisible,
//                               controller: _pinController,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'PIN cannot be empty';
//                                 }
//                                 if (value.length != 4) {
//                                   return 'PIN must be 4 digits';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: _buildTextField(
//                               'Confirm PIN',
//                               '****',
//                               obscureText: !isPinVisible,
//                               controller: _confirmPinController,
//                               toggleVisibility: () {
//                                 setState(() {
//                                   isPinVisible = !isPinVisible;
//                                 });
//                               },
//                               showEyeIcon: true,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Confirm PIN cannot be empty';
//                                 }
//                                 if (value != _pinController.text) {
//                                   return 'PINs do not match';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 30),
//
//                       // Submit Button
//                       ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             // Navigate to the Dashboard Screen
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => ScreenDashbaord()),
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
//
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
//       String label,
//       String hint, {
//         required TextEditingController controller,
//         bool obscureText = false,
//         VoidCallback? toggleVisibility,
//         bool showEyeIcon = false,
//         String? Function(String?)? validator,
//       }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),
//         TextFormField(
//           controller: controller,
//           obscureText: obscureText,
//           validator: validator,
//           decoration: InputDecoration(
//             hintText: hint,
//             filled: true,
//             fillColor: Colors.grey[200],
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey[300]!),
//             ),
//             suffixIcon: showEyeIcon
//                 ? IconButton(
//               icon: Icon(
//                 obscureText ? Icons.visibility_off : Icons.visibility,
//               ),
//               onPressed: toggleVisibility,
//             )
//                 : null,
//           ),
//         ),
//       ],
//     );
//   }
// }
