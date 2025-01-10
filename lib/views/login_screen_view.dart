import 'package:bpp_frontend/controller/screens/screen_dashbaord.dart';
import 'package:bpp_frontend/views/widgets/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'sign_up_screen_view.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  // User Information
  String title = '';
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String gender = '';
  String email = '';
  String phone = '';
  String dateOfBirth = '';
  String age = '';

  // Address Information
  String addressLine1 = '';
  String addressLine2 = '';
  String cityOrVillage = '';
  String district = '';
  String state = '';
  String pinCode = '';

  // Document Information
  String voterId = '';
  String voterFront = '';
  String voterBack = '';
  String aadhaarNumber = '';
  String aadhaarFront = '';
  String aadhaarBack = '';

  // Professional Information
  String qualification = '';
  String profession = '';
  String position = '';
  String referralCode = '';
  int referralCount = 0;
  String role = '';
  String status = '';

  // UI State
  bool isPasswordVisible = false;
  bool isLoading = false;

  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      // Load User Information
      title = prefs.getString('title') ?? '';
      firstName = prefs.getString('firstName') ?? '';
      middleName = prefs.getString('middleName') ?? '';
      lastName = prefs.getString('lastName') ?? '';
      gender = prefs.getString('gender') ?? '';
      email = prefs.getString('email') ?? '';
      phone = prefs.getString('phone') ?? '';
      dateOfBirth = prefs.getString('dateOfBirth') ?? '';
      age = prefs.getString('age') ?? '';

      // Load Address Information
      addressLine1 = prefs.getString('addressLine1') ?? '';
      addressLine2 = prefs.getString('addressLine2') ?? '';
      cityOrVillage = prefs.getString('cityOrVillage') ?? '';
      district = prefs.getString('district') ?? '';
      state = prefs.getString('state') ?? '';
      pinCode = prefs.getString('pinCode') ?? '';

      // Load Document Information
      voterId = prefs.getString('voterId') ?? '';
      voterFront = prefs.getString('voterFront') ?? '';
      voterBack = prefs.getString('voterBack') ?? '';
      aadhaarNumber = prefs.getString('aadhaarNumber') ?? '';
      aadhaarFront = prefs.getString('aadhaarFront') ?? '';
      aadhaarBack = prefs.getString('aadhaarBack') ?? '';

      // Load Professional Information
      qualification = prefs.getString('qualification') ?? '';
      profession = prefs.getString('profession') ?? '';
      position = prefs.getString('position') ?? '';
      referralCode = prefs.getString('referralCode') ?? '';
      referralCount = prefs.getInt('referralCount') ?? 0;
      role = prefs.getString('role') ?? '';
      status = prefs.getString('status') ?? '';
    });

    // Debug logs
    debugPrint('Loaded Profile Data:');
    debugPrint('Title: $title');
    debugPrint('First Name: $firstName');
    debugPrint('Middle Name: $middleName');
    debugPrint('Last Name: $lastName');
    debugPrint('Gender: $gender');
    debugPrint('Email: $email');
    debugPrint('Phone: $phone');
    debugPrint('Date of Birth: $dateOfBirth');
    debugPrint('Age: $age');
    debugPrint('Address Line 1: $addressLine1');
    debugPrint('Address Line 2: $addressLine2');
    debugPrint('City/Village: $cityOrVillage');
    debugPrint('District: $district');
    debugPrint('State: $state');
    debugPrint('Pin Code: $pinCode');
    debugPrint('Voter ID: $voterId');
    debugPrint('Aadhaar Number: $aadhaarNumber');
    debugPrint('Qualification: $qualification');
    debugPrint('Profession: $profession');
    debugPrint('Position: $position');
    debugPrint('Referral Code: $referralCode');
    debugPrint('Role: $role');
    debugPrint('Status: $status');
  }

  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save User Information
    await prefs.setString('title', userData['title'] ?? '');
    await prefs.setString('firstName', userData['firstName'] ?? '');
    await prefs.setString('middleName', userData['middleName'] ?? '');
    await prefs.setString('lastName', userData['lastName'] ?? '');
    await prefs.setString('gender', userData['gender'] ?? '');
    await prefs.setString('email', userData['email'] ?? '');
    await prefs.setString('phone', userData['phone'] ?? '');
    await prefs.setString('dateOfBirth', userData['dateOfBirth'] ?? '');
    await prefs.setString('age', userData['age']?.toString() ?? '');

    // Save Address Information
    await prefs.setString('addressLine1', userData['addressLine1'] ?? '');
    await prefs.setString('addressLine2', userData['addressLine2'] ?? '');
    await prefs.setString('cityOrVillage', userData['cityOrVillage'] ?? '');
    await prefs.setString('district', userData['district'] ?? '');
    await prefs.setString('state', userData['state'] ?? '');
    await prefs.setString('pinCode', userData['pincode'] ?? '');

    // Save Document Information
    await prefs.setString('aadhaarNumber', userData['aadhaarNumber'] ?? '');
    await prefs.setString('aadhaarFront', userData['aadhaarFront'] ?? '');
    await prefs.setString('aadhaarBack', userData['aadhaarBack'] ?? '');
    await prefs.setString('voterId', userData['voterId'] ?? '');
    await prefs.setString('voterFront', userData['voterFront'] ?? '');
    await prefs.setString('voterBack', userData['voterBack'] ?? '');

    // Save Professional Information
    await prefs.setString('qualification', userData['qualification'] ?? '');
    await prefs.setString('profession', userData['profession'] ?? '');
    await prefs.setString('position', userData['position'] ?? '');
    await prefs.setString('referralCode', userData['referralCode'] ?? '');
    await prefs.setInt('referralCount', userData['referralCount'] ?? 0);
    await prefs.setString('role', userData['role'] ?? '');
    await prefs.setString('status', userData['status'] ?? '');

    // Save Authentication Token
    await prefs.setString('token', userData['token'] ?? '');
  }

  Future<void> login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://api.bppindia.com:8443/api/v1/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final userData = responseData['data'];
        final token = responseData['token'];

        // Add token to userData for storage
        userData['token'] = token;

        // Save all user data
        await _saveUserData(userData);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Login successful!",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenDashbaord(
              firstName: userData['firstName'] ?? '',
              lastName: userData['lastName'] ?? '',
              referralCode: userData['referralCode'] ?? '',
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid email or password")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(240, 240, 240, 240),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/bpp_logo2.png',
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text(
                          "Welcome to",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "Bharatiya Popular Party",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Log in with your email & phone",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 24),

                        // Email/Phone Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              " Email/Phone number",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter email/phone number',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Password Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "  Password",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                controller: passwordController,
                                obscureText: !isPasswordVisible,
                                decoration: InputDecoration(
                                  hintText: 'Enter password',
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 10),
                                  suffixIcon: IconButton(
                                    icon: Icon(isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Forgot Password Button
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ResetPasswordScreen()),
                              );
                            },
                            child: const Text(
                              "Forgot your password?",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),

                        // Login Button
                        ElevatedButton(
                          onPressed: isLoading ? null : login,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 40),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : const Text("Login",
                                  style: TextStyle(color: Colors.white)),
                        ),

                        // Sign Up Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account yet?",
                              style: TextStyle(fontSize: 14),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreenView()),
                                );
                              },
                              child: const Text(
                                'Sign up',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
