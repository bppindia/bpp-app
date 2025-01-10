// First, add these imports at the top of your file
import 'package:bpp_frontend/views/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController phoneController =
      TextEditingController(text: ' +91 '); // Default prefix
  final TextEditingController emailController = TextEditingController();

  ResetPasswordScreen({super.key});

  Future<void> sendForgotPasswordRequest(
      String email, String? phone, BuildContext context) async {
    try {
      final Map<String, dynamic> payload = {};

      // Validate email format
      if (email.isNotEmpty &&
          !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
              .hasMatch(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter a valid email address.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Validate phone number format
      if (phone != null && phone.length > 4) {
        phone = phone.replaceAll(' ', ''); // Remove spaces if any
        if (phone.length != 13 || !phone.startsWith('+91')) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Please enter a valid phone number with +91 prefix.'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }
        payload['phone'] = phone;
      }

      // Add email to payload if provided
      if (email.isNotEmpty) {
        payload['email'] = email;
      }

      if (payload.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter a valid email or phone number.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Debugging: Log the payload
      print('Payload: $payload');

      final response = await http.post(
        Uri.parse('https://api.bppindia.com:8443/api/v1/forgot-password'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      // Debugging: Log the response
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Successfully sent OTP
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP sent successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        // Dismiss the loading indicator dialog
        Navigator.pop(context);

        // Navigate to ResetPasswordScreen1
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPasswordScreen1(
              email: email.isNotEmpty ? email : null,
              phone: phone != null && phone.length > 4 ? phone : null,
            ),
          ),
        );
      } else {
        // Handle error response
        final errorData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorData['message'] ??
                'Failed to send OTP. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
        Navigator.pop(context); // Hide loading dialog in case of failure
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
      Navigator.pop(context); // Hide loading dialog in case of error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/images/bpp_logo1.png'),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Bharatiya Popular Party',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Reset Password',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Enter your email or phone number to receive OTP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter email',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'OR',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Phone',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                              ),
                              onChanged: (value) {
                                if (!value.startsWith(' +91 ')) {
                                  phoneController.text = ' +91 ';
                                  phoneController.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: phoneController.text.length));
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                final email = emailController.text.trim();
                                final phone = phoneController.text.trim();

                                if (email.isEmpty && phone.length <= 4) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Please enter a valid email or phone number.'),
                                    ),
                                  );
                                  return;
                                }

                                // Show loading indicator
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                );

                                // Call API
                                await sendForgotPasswordRequest(email,
                                    phone.length > 4 ? phone : null, context);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              child: const Text(
                                'Send OTP',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// First screen remains the same until the ResetPasswordScreen1 class

class ResetPasswordScreen1 extends StatefulWidget {
  final String? email;
  final String? phone;

  ResetPasswordScreen1({this.email, this.phone});

  @override
  State<ResetPasswordScreen1> createState() => _ResetPasswordScreen1State();
}

class _ResetPasswordScreen1State extends State<ResetPasswordScreen1> {
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phone);
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // Function to call the API for password reset
  Future<void> resetPassword() async {
    // Prepare the request payload
    String otp = otpController.text;
    String newPassword = newPasswordController.text;

    String? email = widget.email;
    String? phone = widget.phone;

    // Determine whether to include email or phone in the payload
    final Map<String, String> payload = {
      'otp': otp,
      'newPassword': newPassword,
      // Include email or phone based on what's available
      if (email != null && email.isNotEmpty) 'email': email,
      if (phone != null && phone.isNotEmpty) 'phone': phone,
    };

    // Log the payload to verify what you're sending
    print('Payload: $payload');

    // Call the API
    try {
      final response = await http.post(
        Uri.parse('https://api.bppindia.com:8443/api/v1/reset-password'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(payload),
      );

      // Check if the response is successful
      if (response.statusCode == 200) {
        // If successful, navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LoginScreenView()), // Update to your next screen
        );
      } else {
        // If the response is not successful, check the error message
        var responseData = json.decode(response.body);
        var message = responseData['message'] ?? 'Unknown error';

        if (message.contains('No member found')) {
          // Handle the case where no member is found
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Error"),
              content: Text(
                  "No member found with the provided email or phone number. Please check and try again."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("OK"),
                ),
              ],
            ),
          );
        } else {
          // Handle other errors
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Error"),
              content: Text("Failed to reset password: $message"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("OK"),
                ),
              ],
            ),
          );
        }
      }
    } catch (e) {
      // Handle error and show an alert with more details
      print('Error occurred: $e');
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Error"),
          content: Text(
              "An error occurred. Please check your connection and try again.\nDetails: $e"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/bpp_logo1.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  const Text(
                    "Bharatiya Popular Party",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Enter the OTP and your new password",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),

                  // Show email field if email is provided
                  if (widget.email != null) ...[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: emailController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                        ),
                      ),
                    ),
                  ],

                  // Show phone field if phone is provided
                  if (widget.phone != null) ...[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phone",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: phoneController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ],

                  // OTP and Password Fields
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "OTP",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: otpController,
                      decoration: const InputDecoration(
                        hintText: "Enter 6-digit OTP",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "New Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: newPasswordController,
                      decoration: InputDecoration(
                        hintText: "Enter new password",
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isNewPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isNewPasswordVisible = !isNewPasswordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !isNewPasswordVisible,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: "Confirm new password",
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !isConfirmPasswordVisible,
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: resetPassword,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.black,
                      ),
                      child: const Text(
                        "Reset Password",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
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
